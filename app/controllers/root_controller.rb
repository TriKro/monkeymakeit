class RootController < ApplicationController

  before_filter lambda {
    log_page_view('landing_page') if request.get?
  }

  def index
  end

end
