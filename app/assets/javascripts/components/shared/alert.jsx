var Alert = React.createClass({
  alertClass: function(type) {
    let classes= {
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info',
      success: 'alert-success'
    };
    return classes[type] || classes.success
  },

  setDisplay: function() {

  },

  render: function() {
    var display = this.props.display;
    var message = this.props.message;
    var alertClassName = 'alert ' + this.alertClass('success') + ' fade in';

    return(
      <div id="flash" className={ alertClassName } style={{display: display}}>
        <button className='close'
          data-dismiss='alert' onClick={this.setDisplay}> &times; </button>
        { message }
      </div>
    )
  }
});
