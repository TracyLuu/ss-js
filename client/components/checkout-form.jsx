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
    let button;
    if (this.state.name && this.state.creditCard && this.state.shippingAddress) {
      button = <div className="col my-4 mb-5">
        <button type="submit" className="btn btn-primary float-right mr-5"
          onClick={this.handleSubmit}>
          Order
        </button>
      </div>;
    } else {
      button = <div className="col my-4 mb-5">
        <button type="submit" className="btn btn-primary float-right mr-5 disabled" disabled={true}>
          Order
        </button>
      </div>;
    }
    return (
      <div className="container">
        <h2 className="pt-5">My Bag</h2>
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
              <button className="btn btn-outline-info">Continue Shopping</button>
            </div>
            <div className="ml-auto">
              <div className="d-block p-3">
                {button}
              </div>
            </div>
          </div>
        </form>
      </div>
    );
  }
}
