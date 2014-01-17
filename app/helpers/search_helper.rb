module SearchHelper

  def search_input(resource)
    content_tag :div, class: 'col-xs-3' do
      content_tag :input, nil, { type: :text, placeholder: t("#{resource}.search"), autocomplete: :off, class: 'form-control searchbar', 'data-provide' => 'typeahead', url: send("search_#{resource.pluralize}_path")}
    end
  end

  def filter_input(resource, attribute, value = 0)
    content_tag :div, class: 'form-group' do
      [content_tag(:label, t("#{resource}.#{attribute}")), 
      content_tag(:select, options_for_select(send(attribute.pluralize), value), name: attribute, class: 'form-control filter', url: send("filter_#{resource.pluralize}_path"))].join(' ').html_safe
    end
  end

  def filter_checkbox(resource, attribute, value)
    content_tag :div, class: 'form-group' do
      [content_tag(:label, t("#{resource}.#{attribute}")), 
      content_tag(:input, nil, { name: attribute, type: :checkbox, class: 'filter', url: send("filter_#{resource.pluralize}_path"), value: value } )].join(' ').html_safe
    end
  end

end

