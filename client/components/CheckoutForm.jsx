import React from 'react';

export default class CheckoutForm extends React.Component {

  render() {
    return (
      <form className="container">
        <label>
          <div>
            Name:
          </div>
          <div>
            <input type="text" name="name">
            </input>
          </div>
        </label>
        <label className="row">
          Credit Card:
          <input type="text" name="credit-card">
          </input>
        </label>
        <label className="row">
          Shipping Address:
          <input type="text" name="shipping-address">
          </input>
        </label>
        <div>
          <button type="submit" className="btn btn-primary">Place Order</button>
        </div>
      </form>
    );
  }
}
