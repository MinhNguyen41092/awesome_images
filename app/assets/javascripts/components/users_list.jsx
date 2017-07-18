var UsersList = React.createClass({
  render: function() {
    return (
      <tbody>
        {this.props.users.map(function(user) {
          return (
            <User user={user} key = {user.id} />
          )
        })}
      </tbody>
    )
  }
});
