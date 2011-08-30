ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :domain               => "monkeymake.it",
  :user_name            => "no-reply@TooManyNinjas.com",
  :password             => "4rgfdBVC.,m",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

require 'development_mail_interceptor'
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if  Rails.env.development? || Rails.env.staging?
