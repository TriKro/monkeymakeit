require File.expand_path('../application', __FILE__)

Suggestedit::Application.initialize!

COMPANY_NAME = "Rapid Software Development LLC"
SITE_NAME = "MonkeyMake.it"

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :domain               => "monkeymake.it",
  :user_name            => "no-reply@TooManyNinjas.com",
  :password             => "4rgfdBVC.,m",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

# views/*/*.sass => public/stylesheets/*.css
view_dirs = Dir[Rails.root.join('app/views/*')]
Sass::Plugin.options[:template_location] = view_dirs.inject({}) do |mapping, view_dir|
  mapping.merge!(view_dir => "#{Rails.root}/public/stylesheets")
end
