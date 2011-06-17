class StaticController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def home
    @user = User.new
    render :layout => "landing_page"
  end

  def code
    user = User.where( "email = ?", params[:user][:email] ) || User.create!( params[:user][:email] )
  end
end
