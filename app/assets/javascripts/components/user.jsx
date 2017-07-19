var User = React.createClass({
  render: function() {
    var date = this.props.user.created_at;
    return (
      <tr>
        <td>{this.props.user.username}</td>
        <td>{this.props.user.full_name}</td>
        <td>{moment(date).format('MMMM Do YYYY')}</td>
        <td>{this.props.user.role}</td>
        <td><ActionButtons user={this.props.user} key={this.props.user.id} /></td>
      </tr>
    )
  }
});
