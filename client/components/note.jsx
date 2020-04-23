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
        <div className="alert alert-info text-center" role="alert">
          <div className="p-2">
            Please note that this shop is for demonstration purposes only.
            No real purchases will be made.
            Thank you and enjoy browsing!
          </div>
          <button type="button" className="btn btn-danger" onClick={this.modalNote}>Accept</button>
        </div>
      );
    } else {
      return (
        <div></div>
      );
    }
  }
}
