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
  if (!req.session.cartId) {
    res.status(200).json([]);
  } else {
    const sql = `select "c"."cartItemId",
    "c"."price",
    "p"."productId",
    "p"."image",
    "p"."name",
    "p"."shortDescription"
    from "cartItems" as "c"
    join "products" as "p" using("productId")
    where "c"."cartId" = $1`;
    const cartId = req.session.cartId;
    db.query(sql, [cartId])
      .then(shoppingCart => {
        const someObject = Object.assign(shoppingCart, cartId);
        return res.json(someObject.rows);
      })
      .catch(err => next(err));
  }
});

app.post('/api/cart', (req, res, next) => {
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
      if (req.session.cartId) {
        const cookie = { cartId: req.session.cartId, price: price.rows[0].price };
        return cookie;
      } else {
        const sql = `insert into "carts"("cartId", "createdAt")
        values(default, default )
        returning "cartId"`;
        return db.query(sql)
          .then(cartId => {
            return Object.assign(price.rows[0], cartId.rows[0]);
          });
      }
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
    .then(cartItems => {
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
      const cartItemId = cartItems.rows[0].cartItemId;
      return db.query(sql, [cartItemId])
        .then(fields => {
          const oneObject = Object.assign(fields.rows[0], cartItemId);
          return res.status(201).json(oneObject);
        });
    })
    .catch(err => next(err));
});

// I think this is how you do patch but i didnt test it yet...
// Gonna make sure I can delete before I patch
// app.patch('/api/cart', (req, res, next) => {

//   const sql = `
//   update "cartItems"
//   set "productId" = $3,
//       "price" = $4
//   where "cartItemId" = $1 AND "cartId" = $2
//   returning *
//   `;

//   const productId = req.body.productId;
//   const price = req.body.price;
//   const quantity = req.body.quantity;
//   const cartItemId = req.session.cartItemId;
//   const cartId = req.body.cartId;

//   const params = [productId, price, quantity, cartItemId, cartId];

//   db.query(sql, params)
//     .then(result => {
//       const updateCart = result.rows[0];
//       return res.status(200).json(updateCart);
//     })
//     .catch(err => next(err));
// });

app.delete('/api/cart/:cartItemId', (req, res, next) => {

  const cartItemId = req.params.cartItemId;

  const sql = `
  delete from "cartItems"
  where "cartItemId" = $1
  returning *
  `;

  db.query(sql, [cartItemId])
    .then(result => {
      const [deletedObj] = result.rows;
      return res.status(200).json(deletedObj);
    })
    .catch(err => next(err));
});

app.post('/api/orders', (req, res, next) => {
  const { cartId } = req.session;

  if (!(Number(cartId))) {
    return res.status(400).json({ err: 'There is no cartId' });
  }
  const name = req.body.name;
  const creditCard = req.body.creditCard;
  const shippingAddress = req.body.shippingAddress;

  const sql = `
    insert into "orders"
    ("cartId", "name", "creditCard", "shippingAddress")
    values($1, $2, $3, $4)
    returning *
    `;

  const order = [cartId, name, creditCard, shippingAddress];

  db.query(sql, order)
    .then(result => {
      delete req.session.cartId;
      res.status(201).json(result.rows[0]);
    })
    .catch(err => {
      console.error(err);
      res.status(400).json({ err: 'Error' });
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
