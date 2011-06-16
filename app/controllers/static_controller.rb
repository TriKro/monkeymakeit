class StaticController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def home
    render :layout => "landing_page"
  end

end
