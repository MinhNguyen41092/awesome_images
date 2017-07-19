var Users = React.createClass ({
  render: function() {
    return(
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
        <UsersList users={this.props.users} />
      </table>
    )
  }
});
