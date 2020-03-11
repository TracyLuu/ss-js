import React from 'react';
import ProductDetails from './product-details';

export default class ProductListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      clicked: false
    };
    this.toggleCard = this.toggleCard.bind(this);
  }

  toggleCard() {
    this.setState({ clicked: !this.state.clicked });
  }

  render() {
    // if (this.state.clicked === false) {
    //   return (
    //     this.props.products.map((product, index) =>
    //       <div className="col-4" key={index}>
    //         <div className="alignment card mt-2" onClick={() => this.toggleCard()}>
    //           <div className="h-50">
    //             <div>
    //               <img className="smallImg card-img-top" src={product.image}></img>
    //             </div>
    //             <div className="card-body">
    //               <div className="product">{product.name}</div>
    //               <div className="price">${product.price / Math.pow(10, 2)}</div>
    //               <div className="description">{product.shortDescription}</div>
    //             </div>
    //           </div>
    //         </div>
    //       </div>
    //     )
    //   );
    // } else {
    return (
      <div>
        <div>
          <ProductDetails />
        </div>
      </div>
    );
    // }
  }
}
