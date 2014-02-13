//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.ui.effect
//= require_tree .
//= require_tree ./libs

$(document).ready(function(){

  $('.timepicker').datetimepicker({
    language: 'fr',
    pickDate: false
  });

  $('.datepicker').datetimepicker({
    language: 'fr',
    pickTime: false
  });
});

