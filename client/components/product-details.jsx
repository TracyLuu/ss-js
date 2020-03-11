import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }

  componentDidMount() {
    fetch('/api/products/1')
      .then(response => {
        return response.json();
      })
      .then(data => this.setState({
        product: data
      })
      );
  }

  render() {
    return (
      <div>
        <div>Back to Catalog</div>
        <div>Hellooo!</div>
      </div>
    );

  }
}
