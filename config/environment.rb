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

# Set Sass to compile from Views folder to "public/stylesheets"
# TODO: Write a routine to automatically create this array. Otherwise has to be updated manually.
Sass::Plugin.options[:template_location] = {
    "./app/views/activities" => "./public/stylesheets",
    "./app/views/admin" => "./public/stylesheets",
    "./app/views/invitations" => "./public/stylesheets",
    "./app/views/layouts" => "./public/stylesheets",
    "./app/views/landing_pages" => "./public/stylesheets",
    "./app/views/registrations" => "./public/stylesheets",
    "./app/views/signups" => "./public/stylesheets",
    "./app/views/static" => "./public/stylesheets",
    "./app/views/crouts" => "./public/stylesheets"
}