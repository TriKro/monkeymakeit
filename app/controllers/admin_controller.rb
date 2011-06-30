class AdminController < ApplicationController

  def index
    session[:admin] = true

  end

end