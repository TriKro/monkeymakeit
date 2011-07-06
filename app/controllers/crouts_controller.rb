class CroutsController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def doris
    render 'crout'
  end

  def hiccup
    render 'crout'
  end

end