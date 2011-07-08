class SignupsController < ApplicationController

  def new
    @user = User.new
    log_activity(request.request_uri, "Clicked Button", 'Invitation',
                 Invitation.find(params[:invitation_id])) rescue nil
    log_activity(request.request_uri, "Began Creating", "User")
    render :layout => 'modal'
  end

  def create
    @user = User.find_by_email(params[:user][:email]) || User.create(params[:user])
    return redirect_to(:action => 'new', :layout => 'modal') if @user.new_record? # error
    log_activity(request.request_uri, "Created", "User", @user)

    session[:user] = @user
    redirect_to(new_invitation_url)
  end

end
