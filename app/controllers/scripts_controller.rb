require_dependency File.dirname(__FILE__) + '/../../lib/random_key'

class ScriptsController < ApplicationController
  include RandomKey

  def collaborate
    @invitation =  Invitation.all[ rand Invitation.count ]
    log_activity(request.request_uri, "Viewed Button", 'Invitation', @invitation)
    @unique_code = short_key
  end
end