$(document).ready(function(){

  if ($("#chart").length != 0) {
    load_chart();
  }

});

function load_chart()
{
  var ctx = $("#chart").get(0).getContext("2d");
  var myNewChart = new Chart(ctx);
  var url_parts = window.location.href.split('/')
  var id = url_parts[url_parts.length - 1]
  $.getJSON( '/statistics/chart_data',
    {id: id},
      function(chart_data) {
        new myNewChart.Bar(chart_data.data, chart_data.options);
      }   
  );  
}

