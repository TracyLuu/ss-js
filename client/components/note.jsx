import React from 'react';

export default class Note extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      modal: true
    };
    this.modalNote = this.modalNote.bind(this);
  }

  modalNote() {
    return (this.setState({ modal: false }));
  }

  render() {
    if (this.state.modal === true) {
      return (
        <div className="modal-dialog" role="document">
          <div className="modal-content">
            <div className="modal-body">
              <p>Modal body text goes here.</p>
            </div>
            <button type="button" className="btn btn-secondary" data-dismiss="modal" onClick={this.modalNote}>Close</button>
          </div>
        </div>
      );
    } else {
      return (
        <div></div>
      );
    }

    // <div className="container pt-5">
    //   <div className="text-center pt-5">
    //     <h4 className="p-2">
    //       Please note that this shop is for demonstration purposes only.
    //       Please do not provide real information when checking out.
    //       Thank you and enjoy browsing!
    //     </h4>
    //     <div className="p-2">
    //       <button type="button" className="btn btn-info" data-dismiss="modal" onClick={this.props.toCatalog}>Understood</button>
    //     </div>
    //   </div>
    // </div>
  }
}
