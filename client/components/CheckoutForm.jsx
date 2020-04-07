import React from 'react';

export default class CheckoutForm extends React.Component {

  render() {
    return (
      <form>
        <label className="container">
          <div className="row">
            Name:
          </div>
          <div className="row">
            <input type="text" className="form-control" name="name">
            </input>
          </div>
        </label>
        <label className="container">
          <div className="row">
            Credit Card:
          </div>
          <div className="row">
            <input type="text" className="form-control" name="credit-card">
            </input>
          </div>
        </label>
        <label className="container">
          <div className="row">
            Shipping Address:
          </div>
          <div className="row">
            <input type="textarea" className="form-control" rows="3" name="shipping-address">
            </input>
          </div>
        </label>
      </form>
    );
  }
}
