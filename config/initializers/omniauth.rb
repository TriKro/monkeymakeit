Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '6zSg0vRGrNIYVmBmgewogA', 'Y9hhuIGBtZ5EEynaP0VZV83ljMgeeTuVja1xLynJA'
  #provider :facebook, 'APP_ID', 'APP_SECRET'
end