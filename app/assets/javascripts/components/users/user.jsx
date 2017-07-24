var User = React.createClass({
  handleDeletedUser: function(user) {
    this.props.handleDeletedUser(user);
  },

  getMessage: function(message, type) {
    this.props.getMessage(message, type);
  },

  handleSetAdmin: function(user) {
    this.props.handleSetAdmin(user);
  },

  render: function() {
    var date = this.props.user.created_at;
    return (
      <tr>
        <td>{this.props.user.username}</td>
        <td>{this.props.user.full_name}</td>
        <td>{moment(date).format('MMMM Do YYYY')}</td>
        <td>{this.props.user.role}</td>
        <td><ActionButtons user={this.props.user} key={'user_button' + this.props.user.id}
          handleDeletedUser={this.handleDeletedUser} getMessage={this.getMessage}
          handleSetAdmin={this.handleSetAdmin}/></td>
      </tr>
    )
  }
});
