class StaticController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def home
    @user = User.new
    render :layout => "landing_page"
  end

  def code
    @user = User.where( params[:user] ).first || User.new( params[:user] )
    if !@user.save
      render :home, :layout => "landing_page"
    end
  end
end
