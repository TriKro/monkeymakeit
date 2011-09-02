Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '6zSg0vRGrNIYVmBmgewogA', 'Y9hhuIGBtZ5EEynaP0VZV83ljMgeeTuVja1xLynJA'
  if Rails.env.development?
    provider :facebook, '202810259783506', '6b5257cf836f53c7e4ad51692c571013'
  elsif Rails.env.staging?
    provider :facebook, '278738435485349', '1b9e52f3b4cbe9fc30496275ef51b8bc'
  else
    provider :facebook, '169349883130377', '21afbece24f2d35bb9f123055cf073af'
  end
end