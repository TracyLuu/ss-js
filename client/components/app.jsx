import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummaryItem from './cart-summary-item';

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
        </div>
      );
    }
  }
}
