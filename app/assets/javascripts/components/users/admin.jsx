var Admin = React.createClass ({
  render: function() {
    var date = this.props.admin.created_at;
    return (
      <tr>
        <td>{this.props.admin.username}</td>
        <td>{this.props.admin.full_name}</td>
        <td>{moment(date).format('MMMM Do YYYY')}</td>
        <td>{this.props.admin.role}</td>
      </tr>
    )
  }
});
