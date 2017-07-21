var ActionButtons = React.createClass({
  deleteUser: function(e) {
    var message = '';
    e.preventDefault();
    $.ajax({
      method: 'DELETE',
      url: '/admin_delete/users/' + this.props.user.id,

      success: function(data){
        this.props.handleDeletedUser(this.props.user);
        message = 'User has been deleted';
        this.props.getMessage(message);
      }.bind(this),
    });
  },

  render: function() {
    return (
      <button className="btn btn-danger" id={this.props.user.username} onClick={this.deleteUser}>
          <i className="fa fa-trash-o fa-lg"></i>
      </button>
    )
  }
});
