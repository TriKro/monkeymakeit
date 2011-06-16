class ScriptsController < ApplicationController
  def collaborate
    log_activity(request.request_uri, "Viewed", "Collaborate Button")
  end
end