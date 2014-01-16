$(document).ready(function(){

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
        $('.partial')[0].innerHTML = data;
      }   
    );  
    },  
    updater: function (item) {
      if (map[item].url != 'none') { window.location = map[item].url; }
    }   
  });

  $('.filter').on('change click', function() {
    filters = $('.filter')
    klass = filters.attr('klass')
    params = {}
    for (var i = 0 ; i < filters.length; i++) { 
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
