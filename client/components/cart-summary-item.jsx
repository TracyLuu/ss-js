import React from 'react';

export default class CartSummaryItem extends React.Component {

  createCartItems() {
    return (this.props.cart.map((cartItem, index) =>
      <div key={index}>
        <div className="card row mb-3 p-3 flex-row">
          <div className="col-3">
            <img className="smallImg card-img-top" src={cartItem.image}></img>
          </div>
          <div className="col-9">
            <div className="product">{cartItem.name}</div>
            <div className="price">${cartItem.price / Math.pow(10, 2)}</div>
            <div className="description">{cartItem.shortDescription}</div>
          </div>
        </div>
      </div>
    )
    );
  }

  render() {
    if (this.props.cart.length === 0) {
      return (
        <div className="container">
          <div className="back-to-catalog" onClick={(name, params) => this.props.setView(
            'catalog',
            {})}>
            {'< Back to Catalog'}
          </div>
          <h2>My Cart</h2>
          <div>There are no items in your cart.</div>
        </div>
      );
    } else {
      return (
        <>
          <div className="container">
            <div className="back-to-catalog" onClick={(name, params) => this.props.setView(
              'catalog',
              {})}>
              {'< Back to Catalog'}
            </div>
            <h2>My Cart</h2>
          </div>
          <div>
            {this.createCartItems()}
          </div>
          <div className="container">
            <div className="row">
              <div className="col-10">
                Item Total: ${this.props.getTotalCost()}
              </div>
              <div className="col-2">
                <button className="btn btn-primary" onClick={(name, params) => this.props.setView(
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
