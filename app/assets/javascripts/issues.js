$(document).ready(function(){

  $('#issue_status_id').on('change', function() {
    if ($(this).val() == 4) {
      $('#issue_closure_date').val(moment().format('Do/MM/YYYY'));
      $('#issue_closure_date').prop('readonly', true);
      $('#issue_closure_time').val(moment().format('HH:mm'));
      $('#issue_closure_time').prop('readonly', true);
    }
  });

});
