# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Suggestedit::Application.initialize!

# Sendgrid email settings
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :domain               => "SuggestEdit.com",
  :user_name            => "no-reply@TooManyNinjas.com",
  :password             => "4rgfdBVC.,m",
  :authentication       => "plain",
  :enable_starttls_auto => true
}