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

$(document).ready(function(){

	$(".date_picker").datepicker( $.datepicker.regional['fr'] );

	$(document).on({
	 click: function(){ 
			window.location = $(this).parent().attr("href");
		},  
	},'#issues td');

  //searchbars
  $(".searchbar").attr("autocomplete", "off");

  $(".searchbar").typeahead({
    source: function(query, process) {
      search_klass = this.$element.attr('klass');
      nested = this.$element.attr('nested');
      $.getJSON(
        'home/search.json',
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
        'home/search',
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

});
