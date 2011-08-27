class LandingPagesController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
    km_log_page_view('landing_page')
  }

  def home
    render 'landing_page_1'
  end

end
