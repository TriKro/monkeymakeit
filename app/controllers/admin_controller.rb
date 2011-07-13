class AdminController < ApplicationController
  load_and_authorize_resource :class => AdminController

  before_filter lambda {
    session[:admin] = true
  }

  def index
  end

  def scott
    @scott = User.find(4)
  end

end
