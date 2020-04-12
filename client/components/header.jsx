import React from 'react';

export default class Header extends React.Component {

  render() {
    return (
      <div className="bg-dark p-2 col-12 m-0">
        <div className="row m-0">
          <div className="left-side pl-5 col-10">
            <div className="text-white title"> <i className="fas fa-dollar-sign left"></i> Wicked Sales</div>
            <div className="text-white logo">
            </div>
          </div>

          <div className="row">
            <span className="d-block p-2 text-white">
              <div className="text-white item" onClick={(name, params) => this.props.setView('cart',
                {})}>
                {this.props.cart.length} Items
              </div>
            </span>
            <span className="d-block p-2 bg-dark text-white">
              <i className="text-white fas fa-shopping-cart">
              </i>
            </span>
          </div>

        </div>
      </div>
    );
  }
}
