class AdminController < ApplicationController

  def index
    session[:admin] = true
    @scott = User.find(4)
  end

end
