# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!


Time::DATE_FORMATS[:my_default_time] = "%d %b %y"
