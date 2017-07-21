var FlashMessage = React.createClass({

  render: function() {
    return (
      <Alert message={this.props.message} display={this.props.display} />
    )
  }
});
