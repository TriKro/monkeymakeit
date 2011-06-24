class SignupsController < ApplicationController

  def new
    @signup = User.new
    render :layout => 'modal'
    log_activity(request.request_uri, "Began Creating", "User")
  end

  def create
    @signup = User.new(params[:user])
    if @signup.save
      session[:user] = @signup
      log_activity(request.request_uri, "Created", "User", @signup)
      redirect_to(new_invitation_url)
    else
      render :action => "new"
    end
  end

end
