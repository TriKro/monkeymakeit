require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Monkeymakeit
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
      g.fallbacks[:haml] = :erb
      g.stylesheets     false
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    config.active_record.observers = :subscription_observer
  end
end
