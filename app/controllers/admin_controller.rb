class AdminController < ApplicationController

  before_filter lambda {
    session[:admin] = true
  }

  def scott
    @scott = User.find(4)
  end

end
