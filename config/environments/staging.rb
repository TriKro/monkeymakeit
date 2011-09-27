Monkeymakeit::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = true # error reports
  config.action_controller.perform_caching = true
  config.action_dispatch.x_sendfile_header = "X-Sendfile"
  config.serve_static_assets = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  Sass::Plugin.options[:style] = :compressed
end
