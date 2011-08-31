class RootController < ApplicationController

  before_filter lambda {
    log_page_view('landing_page')
  }

  def index
  end

end
