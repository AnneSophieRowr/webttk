class DatepickerInput < SimpleForm::Inputs::Base
  def input
		template.content_tag :div, :class => 'input-append' do
			value = object.send(attribute_name)
			date_field = template.content_tag :input, nil, :type => 'text', :class => 'span8 date_picker', :value => value.try(:to_date), :name => attribute_name
			date_field += template.content_tag :i, '', :class => 'add-on icon-calendar'
			date_field += @builder.text_field(attribute_name, input_html_options.merge(:class => 'span2', :value => value.try(:to_s, :short)))
		end
  end
end
