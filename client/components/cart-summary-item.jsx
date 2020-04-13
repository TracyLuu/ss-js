import React from 'react';

export default class CartSummaryItem extends React.Component {

  createCartItems() {
    return (this.props.cart.map((cartItem, index) =>
      <div className="pl-2 pr-2" key={index}>
        <div className="card mb-3 p-3">
          <div className="centered">
            <img className="smallImg card-img-top" src={cartItem.image}></img>
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
        <div className="m-0">
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
          <div className="m-0 p-2">
            <div className="p-2">
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
            <div className="m-0 p-2 d-flex">
              <div className="pt-3">
                Item Total: ${this.props.getTotalCost()}
              </div>
              <div className="ml-auto pt-2">
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
