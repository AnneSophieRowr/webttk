$(document).ready(function(){

  if ($('.has-error').length != 0) {
    _.each($('.has-error'), function(error) {
      $(error).parent().parent().prev().addClass('red');
      $(error).parent().parent().collapse();
    });
  }
  else {
    $('#required').collapse();
  }

});
