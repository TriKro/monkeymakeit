# Load the rails application
require File.expand_path('../application', __FILE__)

CONFIG = Suggestedit::Application.config

Suggestedit::Application.configure do
  config.allow_heroku_commands = false
end

# Initialize the rails application
Suggestedit::Application.initialize!
