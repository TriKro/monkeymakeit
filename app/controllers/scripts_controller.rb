require_dependency File.dirname(__FILE__) + '/../../lib/random_key'

class ScriptsController < ApplicationController
  include RandomKey

  def collaborate
    @button =  Button.all[ rand Button.count ]
    log_activity(request.request_uri, 'Viewed', 'Button', @button)
    @unique_code = short_key
  end
end
