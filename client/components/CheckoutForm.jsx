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
      [event.target.name]: event.target.value
    });
  }

  handleCC(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  handleShipping(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.placeOrder(this.state);
    this.props.setView('catalog', {});
    this.props.cart([]);
  }

  render() {
    return (
      <div className="container">
        <h2 className="pt-5">My Cart</h2>
        <div className="price-description pt-2 pb-3">Order Total: ${this.props.getTotalCost()}
        </div>
        <form>
          <label className="container">
            <div className="row">
            Name:
            </div>
            <div className="row">
              <input type="text" className="form-control" name="name" onChange={this.handleName}>
              </input>
            </div>
          </label>
          <label className="container">
            <div className="row">
            Credit Card:
            </div>
            <div className="row">
              <input type="text" className="form-control" name="creditCard" onChange={this.handleCC}>
              </input>
            </div>
          </label>
          <label className="container">
            <div className="row">
            Shipping Address:
            </div>
            <div className="row">
              <textarea className="form-control" name="shippingAddress" onChange={this.handleShipping}>
              </textarea>
            </div>
          </label>
          <div className="row">
            <div className="back-to-catalog col-9" onClick={(name, params) => this.props.setView(
              'catalog',
              {})}>
              {'< Continue Shopping'}
            </div>
            <div className="col-3">
              <button type="submit" className="btn btn-primary" onClick={this.handleSubmit}>Place Order</button>
            </div>
          </div>
        </form>
      </div>
    );
  }
}
