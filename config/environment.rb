require File.expand_path('../application', __FILE__)

Monkeymakeit::Application.initialize!

COMPANY_NAME = "Rapid Software Development LLC"
SITE_NAME = "MonkeyMake.it"

# views/*/*.sass => public/stylesheets/*.css
view_dirs = Dir[Rails.root.join('app/views/*')]
Sass::Plugin.options[:template_location] = view_dirs.inject({}) do |mapping, view_dir|
  mapping.merge!(view_dir => "#{Rails.root}/public/stylesheets")
end
