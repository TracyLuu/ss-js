import React from 'react';

export default class CheckoutForm extends React.Component {

  render() {
    return (
      <form className="container">
        <label className="container">
          <div className="row">
            Name:
          </div>
          <div className="row">
            <input type="text" name="name">
            </input>
          </div>
        </label>
        <label className="container">
          <div className="row">
            Credit Card:
          </div>
          <div className="row">
            <input type="text" name="credit-card">
            </input>
          </div>
        </label>
        <label className="container">
          <div className="row">
            Shipping Address:
          </div>
          <div className="row">
            <input type="text" name="shipping-address">
            </input>
          </div>
        </label>
        <div>
          <button type="submit" className="btn btn-primary">Place Order</button>
        </div>
      </form>
    );
  }
}
