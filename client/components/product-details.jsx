import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }

  getOne() {
    fetch(`/api/products/${this.props.view.params.productId}`)
      .then(response => {
        return response.json();
      })
      .then(product => {
        this.setState({ product });
      });
  }

  componentDidMount() {
    this.getOne();
  }

  render() {
    const product = this.state.product;
    if (this.state.product === null) {
      return (
        <div>
          Loading...
        </div>
      );
    } else {
      return (
        <div className="card">
          <div className="container">
            <div className="back-to-catalog" onClick={(name, params) => this.props.setView(
              'catalog',
              {})}>{'< Back to Catalog'}</div>
            <div className="row">
              <img className="image-description col-6" src={this.state.product.image}></img>
              <div className="col-6">
                <div className="title-description">{this.state.product.name}</div>
                <div className="price-description">${this.state.product.price / Math.pow(10, 2)}</div>
                <div className="pb-3 short-description">{this.state.product.shortDescription}</div>
                <div><button type="button" className="btn btn-primary" onClick={() => this.props.addToCart(product)}>Add to Cart</button></div>
              </div>
            </div>
          </div>
          <div className="long-description col-12">{this.state.product.longDescription}</div>
        </div>
      );
    }
  }
}
