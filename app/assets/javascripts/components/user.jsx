var User = React.createClass({
  render: function() {
    return (
      <tr>
        <td>{this.props.user.username}</td>
        <td>{this.props.user.full_name}</td>
        <td>{this.props.user.created_at}</td>
        <td>Status</td>
        <td>Actions</td>
      </tr>
    )
  }
});
