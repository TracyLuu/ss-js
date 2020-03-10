import React from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
    this.getProducts = this.getProducts.bind(this);
  }

  getProducts() {
    fetch('/api/products')
      .then(response => {
        return response.json();
      });
    // .then(users => this.setState({
    // users,
    // isLoading: false
    // })
    // );
  }

  componentDidMount() {
    this.getProducts();
  }

  render() {
    return (
      <div>
        <div className="container">
          <div className="row">
            <div className="col-4">
              <ProductListItem />
            </div>
            <div className="col-4">
            </div>
            <div className="col-4">
            </div>
          </div>
        </div>
      </div>
    );
  }
}
