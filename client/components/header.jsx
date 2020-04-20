import React from 'react';

export default class Header extends React.Component {

  render() {
    return (
      <div className="bg-info m-0 d-flex">
        <div className="row m-0 p-2">
          <div className="text-white">
            <i className="fas fa-sun pr-2">
            </i>Sunscreen Store
          </div>
        </div>
        <div className="ml-auto">
          <div className="text-white" onClick={(name, params) => this.props.setView('cart',
            {})}>
            <div id="bag">
              <span className="p1 fa-stack fa-2x has-badge" data-count={this.props.cart.length}>
                <i className="p1 fas fa-shopping-bag fa-stack-1x xfa-inverse" data-count={this.props.cart.length}></i>
              </span>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
