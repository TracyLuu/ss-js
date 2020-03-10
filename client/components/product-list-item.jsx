import React from 'react';

export default class ProductListItem extends React.Component {
  render() {
    return (
      this.props.products.map((product, index) =>
        <div className="col-4" key={index}>
          <div className="alignment card mt-2">
            <div className="h-50">
              <div>
                <img className="card-img-top" src={product.image}></img>
              </div>
              <div className="card-body">
                <div className="product">{product.name}</div>
                <div className="price">${product.price / Math.pow(10, 2)}</div>
                <div className="description">{product.shortDescription}</div>
              </div>
            </div>
          </div>
        </div>
      )
    );
  }
}
