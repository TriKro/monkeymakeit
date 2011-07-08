Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '6zSg0vRGrNIYVmBmgewogA', 'Y9hhuIGBtZ5EEynaP0VZV83ljMgeeTuVja1xLynJA'
  provider :facebook, '169349883130377', '21afbece24f2d35bb9f123055cf073af'
end