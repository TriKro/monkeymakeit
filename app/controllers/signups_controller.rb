class SignupsController < ApplicationController

  def new
    @signup = User.new
    @invitation = Invitation.find(params[ :invitation_id ])
    log_activity(request.request_uri, "Clicked Button", 'Invitation', @invitation)
    log_activity(request.request_uri, "Began Creating", "User")
    render :layout => 'modal'
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
