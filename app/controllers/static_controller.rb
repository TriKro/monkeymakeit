class StaticController < ApplicationController

  before_filter lambda {
    log_page_view('static') if request.get?
  }

end
