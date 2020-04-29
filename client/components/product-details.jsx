import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null,
      modalProduct: false
    };
    this.modalDirection = this.modalDirection.bind(this);
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

  modalDirection() {
    const product = this.state.product;
    this.props.addToCart(product);
    this.setState({ modalProduct: true });
  }

  componentDidMount() {
    this.getOne();
  }

  render() {
    if (this.state.product === null) {
      return (
        <div className="spinner-grow text-info" role="status">
          <span className="sr-only">Loading...</span>
        </div>
      );
    }

    if (this.state.modalProduct === true) {
      return (
        <>
          <div className="modal-container justify-content-center p-3">
            <div className="modal-background">
              <div className="modal-title text-center p-1">
                Item added to bag
              </div>
              <div className="d-flex justify-content-center">
                <div className="p-2">
                  <button className="btn btn-secondary p-2" onClick={(name, params) => this.props.setView('catalog', {})}>
                    Continue Shopping
                  </button>
                </div>
                <div className="p-2">
                  <button className="btn btn-danger p-2" onClick={(name, params) => this.props.setView('cart', {})}>
                    Checkout
                  </button>
                </div>
              </div>
            </div>
          </div>

          <div className="p-2">
            <div className="card p-3">
              <div className="back-to-catalog pb-2" onClick={(name, params) => this.props.setView(
                'catalog',
                {})}><button className="btn btn-outline-info">Back to Products</button></div>
              <div className="row">
                <img className="image-description col-6" src={this.state.product.image}></img>
                <div className="col-6">
                  <div className="title-description">{this.state.product.name}</div>
                  <div className="price-description">${parseFloat(this.state.product.price / Math.pow(10, 2)).toFixed(2)}</div>
                  <div className="pb-3 short-description">{this.state.product.shortDescription}</div>
                  <div><button type="button" className="btn btn-info" onClick={this.modalDirection}>Add to Cart</button></div>
                </div>
              </div>
              <div className="long-description col-12 p-3">{this.state.product.longDescription}</div>
            </div>
          </div>
        </>
      );
    } else {
      return (
        <div className="p-2">
          <div className="card p-3">
            <div className="back-to-catalog pb-2" onClick={(name, params) => this.props.setView(
              'catalog',
              {})}><button className="btn btn-outline-info">Back to Products</button></div>
            <div className="row">
              <img className="image-description col-6" src={this.state.product.image}></img>
              <div className="col-6">
                <div className="title-description">{this.state.product.name}</div>
                <div className="price-description">${parseFloat(this.state.product.price / Math.pow(10, 2)).toFixed(2)}</div>
                <div className="pb-3 short-description">{this.state.product.shortDescription}</div>
                <div><button type="button" className="btn btn-info" onClick={this.modalDirection}>Add to Bag</button></div>
              </div>
            </div>
            <div className="long-description col-12 p-3">{this.state.product.longDescription}</div>
          </div>
        </div>
      );
    }
  }
}
