import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummaryItem from './cart-summary-item';
import CheckoutForm from './CheckoutForm';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'catalog', params: {} },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.getCartItems = this.getCartItems.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
    this.getTotalCost = this.getTotalCost.bind(this);
  }

  componentDidMount() {
    this.getCartItems();
  }

  addToCart(product) {
    fetch('/api/cart', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(product)
    })
      .then(response => {
        return response.json();
      })
      .then(data => {
        this.setState({
          cart: this.state.cart.concat(data)
        });
      })
      .catch(err => console.error(err));
  }

  getCartItems() {
    fetch('/api/cart')
      .then(response => {
        return response.json();
      })
      .then(data => {
        this.setState({ cart: data });
      });
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });
  }

  placeOrder({ name, creditCard, shippingAddress }) {
    fetch('/api/orders', {
      method: 'POST',
      headders: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name, creditCard, shippingAddress })
    })
      .then(result => {
        this.setState({
          view: {
            name: 'catalog',
            params: {}
          },
          cart: []
        });
      });
  }

  getTotalCost() {
    const cost = this.state.cart.map(info => info.price);
    const total = cost.reduce((total, num) => total + num);
    const totalCost = (total / Math.pow(10, 2));
    return totalCost;
  }

  render() {
    if (this.state.view.name === 'catalog') {
      return (
        <div>
          <Header cart={this.state.cart} setView={this.setView} view={this.state.view}/>
          <ProductList setView={this.setView} view={this.state.view}/>
        </div>
      );
    } else if (this.state.view.name === 'details') {
      return (
        <div>
          <Header cart={this.state.cart} setView={this.setView} view={this.state.view}/>
          <ProductDetails addToCart={this.addToCart} setView={this.setView} view={this.state.view}/>
        </div>
      );
    } else if (this.state.view.name === 'cart') {
      return (
        <div>
          <Header cart={this.state.cart} setView={this.setView} view={this.state.view} />
          <div className="container">
            <div className="back-to-catalog" onClick={(name, params) => this.setView(
              'catalog',
              {})}>
              {'< Back to Catalog'}
            </div>
            <h2>My Cart</h2>
            <CartSummaryItem cart={this.state.cart} />
          </div>
          <div className="container">
            <div className="row">
              <div className="col-10">
                Item Total: ${this.getTotalCost()}
              </div>
              <div className="col-2">
                <button className="btn btn-primary" onClick={(name, params) => this.setView(
                  'checkout',
                  {})}>
                  Checkout
                </button>
              </div>
            </div>
          </div>
        </div>
      );
    } else if (this.state.view.name === 'checkout') {
      return (
        <div>
          <Header cart={this.state.cart} setView={this.setView} view={this.state.view} />
          <div className="container">
            <h2 className="pt-5">My Cart</h2>
            <div className="price-description pt-2 pb-3">Order Total: ${this.getTotalCost()}</div>
            <CheckoutForm cart={this.state.cart} placeOrder={this.state.placeOrder} setView={this.setView} />
          </div>
        </div>
      );
    }
  }
}
