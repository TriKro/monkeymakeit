require_dependency File.dirname(__FILE__) + '/../../lib/random_key'

class ScriptsController < ApplicationController
  include RandomKey

  def collaborate
    log_activity(request.request_uri, "Viewed", "Collaborate Button")
    @unique_code = short_key
    @invitation =  Invitation.all[ rand Invitation.count ]
  end
end