import React from 'react';

export default class ProductListItem extends React.Component {
  render() {
    return (
      <div>
        <div className="img-container">
          <img className="constrained-img" src="/images/shake-weight.jpg"></img>
        </div>
        <div className="product">Shake Weight</div>
        <div className="price">2999</div>
        <div className="description">Dynamic Inertia technology ignites muscles in arms, shoulders, and chest.</div>
      </div>
    );
  }
}
