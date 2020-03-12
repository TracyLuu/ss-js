require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

app.get('/api/products', (req, res, next) => {
  const sql = `
  select "productId", "name", "price", "image", "shortDescription"
  from "products"
  `;
  db.query(sql)
    .then(result => res.json(result.rows))
    .catch(err => next(err));
});

app.get('/api/products/:productId', (req, res, next) => {
  const { productId } = req.params;
  const sql = `
    select *
    from "products"
    where "productId" = $1
  `;
  const params = [productId];
  if (!Number(productId)) {
    return next(new ClientError('Invalid product', 400));
  }
  db.query(sql, params)
    .then(result => {
      if (!result.rows[0]) {
        res.status(404).json({ error: 'This ID does not exist' });
      } else {
        return res.json(result.rows[0]);
      }
    })
    .catch(err => next(err));
});

app.get('/api/cart', (req, res, next) => {
  res.status(200).json([]);
});

app.post('/api/cart', (req, res) => {
  const { productId } = req.body;
  if (!(Number(productId)) || productId <= 0) {
    res.status(400).json({ err: 'ProductID should be positive number' });
  }
  const sql = `
  select "price"
  from "products"
  where "productId" = $1
  `;

  const body = [productId];

  db.query(sql, body)
    .then(price => {
      const sql = `insert into "carts"("cartId", "createdAt")
      values(default, default )
      returning "cartId"`;
      return db.query(sql)
        .then(cartId => {
          return Object.assign(price.rows[0], cartId.rows[0]);
        });
    })
    .then(combinedObj => {
      req.session.cartId = combinedObj.cartId;
      const sql = `insert into "cartItems" ("cartId", "productId", "price")
    values ($1, $2, $3)
    returning "cartItemId"`;

      return db.query(sql, [combinedObj.cartId, productId, combinedObj.price])
        .then(cartItemId => {
          return Object.assign(cartItemId, combinedObj.cartId, productId, combinedObj.price);
        });
    })
    .then(result => {
      const sql = `
      select "c"."cartItemId",
      "c"."price",
      "p"."productId",
      "p"."image",
      "p"."name",
      "p"."shortDescription"
      from "cartItems" as "c"
      join "products" as "p" using ("productId")
      where "c"."cartItemId" = $1`;

      const cartItemId = result.rows[0].cartItemId;

      return db.query(sql, [cartItemId])
        .then(result2 => {
          return Object.assign(result2, cartItemId);
        });
      // .then(result3 =>)
    });
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
