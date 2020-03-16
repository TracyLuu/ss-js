import React from 'react';

export default class Header extends React.Component {

  render() {
    return (
      <div className="container top-border p-2 col-12">
        <div className="row">
          <div className="left-side pl-5 col-10">
            <div className="asset title"> <i className="fas fa-dollar-sign"></i> Wicked Sales</div>
            <div className="asset logo">

            </div>
          </div>
          <div className="col-2 row pl-5">
            <div className="asset number"></div>
            <div className="asset item" onClick={(name, params) => this.props.setView('cart',
              {})}>
              {this.props.cart.length} Items
              <i className="asset fas fa-shopping-cart">
              </i>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
