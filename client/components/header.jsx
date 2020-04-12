import React from 'react';

export default class Header extends React.Component {

  render() {
    return (
      <div className="bg-dark m-0 clearfix">
        <div className="row m-0 p-2 float-left ">
          <div className="text-white title"> <i className="fas fa-dollar-sign left"></i> Wicked Sales</div>
          <div className="text-white logo">
          </div>
        </div>
        <div className="float-right pl-5">
          <span className="d-block p-2 text-white">
            <div className="text-white item" onClick={(name, params) => this.props.setView('cart',
              {})}>
              {this.props.cart.length} Items { }
              <i className="text-white fas fa-shopping-cart">
              </i>
            </div>
          </span>
        </div>
      </div>
    );
  }
}
