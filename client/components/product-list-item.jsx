import React from 'react';

export default class ProductListItem extends React.Component {

  render() {
    if (this.props.view.name === 'catalog') {
      return (
        this.props.products.map((product, index) =>
          <div className="col-4" key={index}>
            <div className="alignment card mt-2" onClick={(name, params) => this.props.setView(
              'details',
              { productId: product.productId })}>
              <div className="h-50">
                <div>
                  <img className="smallImg card-img-top" src={product.image}></img>
                </div>
                <div className="card-body">
                  <div className="product">{product.name}</div>
                  <div className="price">${parseFloat(product.price / Math.pow(10, 2)).toFixed(2)}</div>
                  <div className="description">{product.shortDescription}</div>
                </div>
              </div>
            </div>
          </div>
        )
      );
    }
  }
}
