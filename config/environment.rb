# Load the rails application
require File.expand_path('../application', __FILE__)

CONFIG = Suggestedit::Application.config

Suggestedit::Application.configure do
  config.allow_heroku_commands = false
end

# Initialize the rails application
Suggestedit::Application.initialize!

# Sendgrid email settings
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :domain               => "suggestedit.org",
  :user_name            => "no-reply@TooManyNinjas.com",
  :password             => "4rgfdBVC.,m",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

# Constants
COMPANY_NAME = "Rapid Software Development LLC"
SITE_NAME = "MonkeyMake.it"
SITE_TITLE = "MonkeyMakeIt"