class SignupsController < ApplicationController

  def new
    @signup = User.new
    log_activity(request.request_uri, "Clicked Button", 'Invitation',
                 Invitation.find(params[:invitation_id])) rescue nil
    log_activity(request.request_uri, "Began Creating", "User")
    render :layout => 'modal'
  end

  def create
    @signup = User.find_by_email(params[:user][:email]) || User.create(params[:user])
    return render(:action => 'new', :layout => 'modal') if @signup.new_record? # error
    session[:user] = @signup
    log_activity(request.request_uri, "Signed Up", "User", @signup)
    log_activity(request.request_uri, "Created", "User", @signup)
    redirect_to(new_invitation_url)
  end

end
