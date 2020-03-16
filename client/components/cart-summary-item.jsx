import React from 'react';

export default class cartSummaryItem extends React.Component {

  render() {
    if (this.props.cart === []) {
      return (
        <div>There are no items in your cart.</div>
      );
    } else {
      return (

        this.props.cart.map((cartItem, index) =>
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
  }
}
