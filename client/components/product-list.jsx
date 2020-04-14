import React from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
    this.getProducts = this.getProducts.bind(this);
  }

  getProducts() {
    fetch('/api/products')
      .then(response => {
        return response.json();
      })
      .then(data => this.setState({
        products: data
      })
      );
  }

  componentDidMount() {
    this.getProducts();
  }

  render() {
    return (
      <div className="centered">
        <div>
          <img src="/images/sunscreens.jpg" className="mb-2 fade-in animationFrames landing shadow contain" alt="6 sunscreens from the list and text that says to protect your skin"></img>
        </div>
        <ProductListItem setView={this.props.setView} view={this.props.view} products={this.state.products} />
      </div>
    );
  }
}
