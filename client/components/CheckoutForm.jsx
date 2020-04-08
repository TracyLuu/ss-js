import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: null,
      shippingAddress: null
    };
    this.handleName = this.handleName.bind(this);
    this.handleCC = this.handleCC.bind(this);
    this.handleShipping = this.handleShipping.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleName(event) {
    this.setState({
      name: event.target.value
    });
  }

  handleCC(event) {
    this.setState({
      creditCard: event.target.value
    });
  }

  handleShipping(event) {
    this.setState({
      shippingAddress: event.target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.placeOrder(this.state);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
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
        <div className="row">
          <div className="back-to-catalog col-9" onClick={(name, params) => this.props.setView(
            'catalog',
            {})}>
            {'< Continue Shopping'}
          </div>
          <div className="col-3">
            <button type="submit" className="btn btn-primary" onClick={(name, creditCard, shippingAddress) => this.props.placeOrder(
              'catalog',
              {})}>Place Order</button>
          </div>
        </div>
      </form>
    );
  }
}
