//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.ui.effect
//= require_tree .
//= require_tree ./libs

$(document).ready(function(){

  $(".date_picker").datepicker( $.datepicker.regional['fr'] );

});

