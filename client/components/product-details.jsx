import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }

  getOne() {
    fetch('/api/products/1')
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
    if (this.state.product === null) {
      return (
        <div>
          Something
        </div>
      );
    } else {
      return (
        <div className="card">
          <div className="container">
            <div className="row">
              <img className="col-8" src={this.state.product.image}></img>
            </div>
            <div className="col-4">
              <div>{this.state.product.name}</div>
              <div>${this.state.product.price / Math.pow(10, 2)}</div>
            </div>
          </div>
          <div className="col-12">{this.state.product.longDescription}</div>
        </div>
      );
    }
  }
}
