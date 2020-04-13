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

    if (this.state.name.length < 3) {
      alert('Please use proper name');
    } else if (this.state.creditCard.length < 16) {
      alert('Please enter 16-digit for credit card');
    } else if (this.state.shippingAddress.length < 12) {
      alert('Please enter a valid address');
    } else {
      this.props.placeOrder(this.state);
      this.props.setView('catalog', {});
      this.props.cart([]);
    }
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
          <div className="row pt-5">
            <div className="back-to-catalog p-3" onClick={(name, params) => this.props.setView(
              'catalog',
              {})}>
              {'< Continue Shopping'}
            </div>
            <div className="ml-auto">
              <div className="d-block p-3">
                <button type="submit" className="btn btn-primary" onClick={this.handleSubmit}>
                  Order
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>
    );
  }
}
