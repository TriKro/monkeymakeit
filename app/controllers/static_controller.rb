class StaticController < ApplicationController

  before_filter lambda {
    km_log_page_view('static')
  }

end
