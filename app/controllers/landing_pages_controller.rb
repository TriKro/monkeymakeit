class LandingPagesController < ApplicationController
  skip_authorization_check

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def home
    render 'landing_page_1'
  end

end
