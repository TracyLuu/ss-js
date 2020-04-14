import React from 'react';

export default class Header extends React.Component {

  render() {
    return (
      <div className="bg-dark m-0 d-flex">
        <div className="row m-0 p-2">
          <div className="text-white">
            <i className="fas fa-sun pr-2">
            </i>Sunscreen Store
          </div>
        </div>
        <div className="ml-auto">
          <span className="d-block p-2 text-white click">
            <div className="text-white" onClick={(name, params) => this.props.setView('cart',
              {})}>
              {this.props.cart.length} Items
              <i className="text-white fas fa-shopping-cart pl-2">
              </i>
            </div>
          </span>
        </div>
      </div>
    );
  }
}
