var FlashMessage = React.createClass({
  alertClass: function(type) {
    let classes= {
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info',
      success: 'alert-success'
    };
    return classes[type] || classes.success
  },

  setDisplay: function(display) {
    display = 'none';
  },

  render: function() {
    var display = this.props.display;
    var message = this.props.message;
    var type = this.props.type;
    var alertClassName = 'alert ' + this.alertClass(type) + ' fade in';

    return(
      <div id="flash" className={ alertClassName } style={{display: display}}>
        <button className='close' data-hide="alert"
          onClick={this.props.onClose}> &times; </button>
        { message }
      </div>
    )
  }
});

FlashMessage.propTypes = {
  onClose: React.PropTypes.func
};
