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
        type = 'success';
        this.props.getMessage(message, type);
      }.bind(this),
      error: function(xhr, status, error){
        message = 'Could not delete user';
        type = 'error';
        this.props.getMessage(message, type);
      }
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
