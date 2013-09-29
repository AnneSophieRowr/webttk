// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require bootstrap
//= require_tree .
//= require_tree ./charts

$(document).ready(function(){

	if ($("#chart") != []) {
		load_chart();
	}

	$(".date_picker").datepicker( $.datepicker.regional['fr'] );

	$(document).on({
	 click: function(){ 
			window.location = $(this).parent().attr("href");
		},  
	},'#issues td');

	$(document).on({
	 click: function(){ 
			window.location = $(this).parent().attr("href");
		},  
	},'#users td');

  //searchbars
  $(".searchbar").attr("autocomplete", "off");

  $(".searchbar").typeahead({
    source: function(query, process) {
      search_klass = this.$element.attr('klass');
      nested = this.$element.attr('nested');
      $.getJSON(
        'generic/search.json',
        {q: query, klass: search_klass, nested: nested},
        function (data) {
          items = []; 
          map = {}; 
          $.each(data, function (i, item) {
            map[item.label] = item;
            items.push(item.label);
          }); 
          return process(items);
        }   
      );  
      $.get(
        'generic/search',
        {q: query, klass: search_klass, nested: nested},
        function (data) {
          console.log();
          $('.partial')[0].innerHTML = data;
        }   
      );  
    },  
    updater: function (item) {
      if (map[item].url != 'none') { window.location = map[item].url; }
    }   
  });

	//filters
	$('.filter').on('change click', function() {
		filters = $('.filter')
		klass = filters.attr('klass')
		params = {}
		for (var i = 0 ; i < filters.length; i++)
		{ 
			field = filters[i].name;
			if (filters[i].type == 'checkbox' && !filters[i].checked) {
				value = 0; 
			}
			else {
				value = filters[i].value;
			}
			params[field] = value;
		}
		$.get(
			'generic/filter',
			{filters: params, klass: klass},
			function (data) {
				$('#' + klass)[0].innerHTML = data;
			}
		);
	});

});

function load_chart()
{
	options = {scaleOverride: true, scaleSteps: 15, scaleStepWidth: 0.1, scaleStartValue: 56} 
	var ctx = $("#chart").get(0).getContext("2d");
	var myNewChart = new Chart(ctx);
	var url_parts = window.location.href.split('/')
	var id = url_parts[url_parts.length - 1]
	$.getJSON(
		'/statistics/chart_data',
		{id: id}, 
		function(data) {
			new myNewChart.Bar(data, options);
		}   
	);  
}

