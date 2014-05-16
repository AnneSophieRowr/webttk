$(document).ready(function(){

  $('.searchbar').typeahead({
    valueKey: 'label',
    remote: $('.searchbar').attr('url') + '?q=%QUERY',
    template: '<p><a href={{url}} class="typeahead-link">{{label}}</a></p>',
    engine: Hogan
  });

  $('.searchbar').on('keypress', function() {
    $.get(
      $(this).attr('url'),
      {q: $(this).val()},
      function (data) {
        $('.partial')[0].innerHTML = data;
      }
    );
  });

  $('.searchbar').on('typeahead:selected', function (object, datum) {
    window.location = datum.url
  }); 

  $('.filter').on('change click', function() {
    params = {}
    _.each($('.filter'), function(filter) {
      params[filter.name] = (filter.type == 'checkbox' && !filter.checked) ? 0 : filter.value
    });

    $.get(
      $(this).attr('url'),
      {filters: params},
      function (data) {
        $('.partial')[0].innerHTML = data;
      }
    );
  });

});
