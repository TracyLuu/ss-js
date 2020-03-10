import React from 'react';

export default class ProductListItem extends React.Component {
  render() {
    return (
      this.props.products.map((product, index) =>
        <div className="col-4" key={index}>
          <div className="img-container">
            <img className="constrained-img" src={product.image}></img>
          </div>
          <div className="card">
            <div className="product">{product.name}</div>
            <div className="price">{product.price}</div>
            <div className="description">{product.shortDescription}</div>
          </div>
        </div>
      )
    );
  }
}
