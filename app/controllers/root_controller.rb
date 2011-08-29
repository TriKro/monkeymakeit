class RootController < ApplicationController

  before_filter lambda {
    km_log_page_view('landing_page')
  }

  def index
  end

end
