import React from 'react';

export default class CartSummaryItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      cartItemId: null
    };
    this.deleteCartById = this.deleteCartById.bind(this);
  }

  deleteCartById() {
    const cartItemId = this.state.cartItemId;
    this.props.deleteCart(cartItemId);
  }

  createCartItems() {

    return (this.props.cart.map((cartItem, index) =>
      <div className="pl-2 pr-2" key={index}>
        <div className="card mb-3 p-3 cart">
          <div className="row pl-3">
            <i className="fas fa-times" onClick={this.deleteCartById}></i>
          </div>
          <div className="centered">
            <img className="smallImg card-img-top col-12 col-md-4" src={cartItem.image}></img>
          </div>
          <div className="p-2 d-flex row">
            <div className="product col-12">{cartItem.name}</div>
            <div className="text-muted col-12">${parseFloat(cartItem.price / Math.pow(10, 2)).toFixed(2)}</div>
            <div className="description col-12">{cartItem.shortDescription}</div>
          </div>
        </div>
      </div>
    )
    );
  }

  render() {
    if (this.props.cart.length === 0) {
      return (
        <div className="container p-5 justify-content-center">
          <h2 className="p-1 text-center">There are no items in your bag.</h2>
          <div className="text-center">
            <div className="back-to-catalog p-1" onClick={(name, params) => this.props.setView(
              'catalog',
              {})}>
              <button className="btn btn-info">Back to Products</button>
            </div>
          </div>
        </div>
      );
    } else {
      return (
        <>
          <div className="p-2 container justify-content-center">
            <div className="p-2">
              <div className="back-to-catalog pb-1" onClick={(name, params) => this.props.setView(
                'catalog',
                {})}>
                <button className="btn btn-outline-info">
                  Back to Products
                </button>
              </div>
              <h2>My Bag</h2>
            </div>
            <div className="text-center">
              {this.createCartItems()}
            </div>
            <div className="m-0 p-2 d-flex">
              <div className="pt-3">
                Item Total: ${this.props.getTotalCost()}
              </div>
              <div className="ml-auto pt-2">
                <button className="btn btn-info" onClick={(name, params) => this.props.setView(
                  'checkout',
                  {})}>
                  Checkout
                </button>
              </div>
            </div>
          </div>
        </>
      );
    }
  }
}
