import React from 'react';

export default class Note extends React.Component {

  render() {
    return (
      <div className="container pt-5">
        <div className="text-center pt-5">
          <h4 className="p-2">
            Please note that this shop is for demonstration purposes only.
            Please do not provide real information when checking out.
            Thank you and enjoy browsing!
          </h4>
          <div>
            <button type="button" className="btn btn-secondary" data-dismiss="modal" onClick={this.props.toCatalog}>Understood</button>
          </div>
        </div>
      </div>

    );
  }
}
