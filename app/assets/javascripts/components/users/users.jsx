var Users = React.createClass ({
  getInitialState: function() {
    return {
      users: this.props.users,
      message: '',
      type: '',
      display: 'none'
    }
  },

  handleDeletedUser: function(user) {
    var users = this.state.users.slice();
    var index = users.indexOf(user);
    // remove 1 user at array[index]
    users.splice(index, 1);
    this.setState({ users: users });
  },

  getMessage: function(message, type) {
    this.setState({
      message: message,
      type: type,
      display: 'block'
    });
  },

  removeMessage: function() {
    this.setState({
      message: '',
      display: 'none'
    });
  },

  displayMessage: function(message, display, type) {
    return (<FlashMessage message={message} display={display} type={type} onClose={this.removeMessage}/>)
  },

  render: function() {
    var users = [];
    this.state.users.forEach(function(user) {
      users.push(<User user={user}
        key={'user' + user.id} handleDeletedUser={this.handleDeletedUser} getMessage={this.getMessage}/>);
    }.bind(this));

    var flashMessage = this.displayMessage(this.state.message, this.state.display, this.state.type);

    return(
      <div className="container">
        {flashMessage}
        <h4 className="text-center">All Users</h4>
        <div className="row user-table">
          <table className="table table-striped">
            <thead>
              <tr>
                <th className="col-xs-3">Username</th>
                <th className="col-xs-3">Fullname</th>
                <th className="col-xs-2">Created at</th>
                <th className="col-xs-2">Status</th>
                <th className="col-xs-2">Actions</th>
              </tr>
            </thead>
            <tbody>
              {users}
            </tbody>
          </table>
        </div>
      </div>
    )
  }
});
