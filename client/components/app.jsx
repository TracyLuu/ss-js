import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummaryItem from './cart-summary-item';
import CheckoutForm from './checkout-form';
import Note from './note';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'modal', params: {} },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.setCart = this.setCart.bind(this);
    this.getCartItems = this.getCartItems.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
    this.getTotalCost = this.getTotalCost.bind(this);
    this.toCatalog = this.toCatalog.bind(this);
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

  placeOrder({ name, creditCard, shippingAddress }) {
    fetch('/api/orders', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name, creditCard, shippingAddress })
    })
      .then(response => {
        return response.json();
      })
      .catch(err => console.error(err));
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });
  }

  setCart(cart) {
    this.setState({
      cart: cart
    });
  }

  getTotalCost() {
    const cost = this.state.cart.map(info => info.price);
    const total = cost.reduce((total, num) => total + num);
    const totalCost = parseFloat(total / Math.pow(10, 2)).toFixed(2);
    return totalCost;
  }

  toCatalog() {
    this.setState({
      view: { name: 'catalog', params: {} }
    });
  }

  render() {
    if (this.state.view.name === 'modal') {
      return (
        <Note toCatalog={this.toCatalog} />
      );
    } else if (this.state.view.name === 'catalog') {
      return (
        <>
          <Header cart={this.state.cart} setView={this.setView} view={this.state.view} />
          <ProductList setView={this.setView} view={this.state.view} />
        </>
      );
    } else if (this.state.view.name === 'details') {
      return (
        <>
          <Header cart={this.state.cart} setView={this.setView} view={this.state.view}/>
          <ProductDetails addToCart={this.addToCart} setView={this.setView} view={this.state.view}/>
        </>
      );
    } else if (this.state.view.name === 'cart') {
      return (
        <>
          <Header cart={this.state.cart} setView={this.setView} view={this.state.view} />
          <CartSummaryItem cart={this.state.cart} setView={this.setView} getTotalCost={this.getTotalCost} />
        </>
      );
    } else if (this.state.view.name === 'checkout') {
      return (
        <>
          <Header cart={this.state.cart} setView={this.setView} view={this.state.view} />
          <CheckoutForm cart={this.setCart} setView={this.setView} getTotalCost={this.getTotalCost} placeOrder={this.placeOrder}/>
        </>
      );
    }
  }
}
