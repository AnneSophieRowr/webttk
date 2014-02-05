$(document).ready(function(){

  $('.searchbar').typeahead({
    valueKey: 'label',
    remote: $('.searchbar').attr('url') + '?q=%QUERY',
    template: '<p><a href={{url}} class="typeahead-link">{{label}}</a></p>',
    engine: Hogan
  });

  $('.searchbar').on('typeahead:selected', function (object, datum) {
    window.location = datum.url
  }); 

  $('.filter').on('change click', function() {
    params = {}
    _.each($('.filter'), function(filter) {
      params[filter.name] = (filter.type == 'checkbox' && !filter.checked) ? 0 : filter.value
    });
    console.log(params);

    $.get(
      $(this).attr('url'),
      {filters: params},
      function (data) {
        $('.partial')[0].innerHTML = data;
      }
    );
  });

});
