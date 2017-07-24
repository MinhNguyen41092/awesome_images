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

  setAdmin: function(e) {
    var message = '';
    e.preventDefault();
    $.ajax({
      method: 'PATCH',
      url: '/users/' + this.props.user.id,
      data: {role: 'admin'},

      success: function(data){
        this.props.handleDeletedUser(this.props.user);
        this.props.handleSetAdmin(this.props.user);
        message = 'User has been set to admin role';
        type = 'success';
        this.props.getMessage(message, type);
      }.bind(this),

      error: function(xhr, status, error){
        message = 'Could not set this user to admin role';
        type = 'error';
        this.props.getMessage(message, type);
      }
    });
  },

  render: function() {
    return (
      <div className="actions">
        <button className="btn btn-danger" id={this.props.user.username} onClick={this.deleteUser}
          title="Delete this user" data-toggle="tooltip" data-placement="top">
          <i className="fa fa-trash-o fa-lg"></i>
        </button>

        <button className="btn btn-primary set-admin" id={"user-" + this.props.user.id}
          title="Set Admin" data-toggle="tooltip" data-placement="top" onClick={this.setAdmin}>
          <i className="fa fa-user-secret fa-lg"></i>
        </button>
      </div>
    )
  }
});
