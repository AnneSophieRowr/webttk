# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Webttk::Application.initialize!

my_date_formats = { :default => '%d/%m/%Y' } 
Date::DATE_FORMATS.merge!(my_date_formats)
my_datetime_formats = { :default => '%d/%m/%Y %H:%M', :short => '%H:%M' }
Time::DATE_FORMATS.merge!(my_datetime_formats) 

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
