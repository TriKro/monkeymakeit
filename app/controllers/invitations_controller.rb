class InvitationsController < ApplicationController

  def new
    @invite = User.new
    log_activity(request.request_uri, "Began Creating", "Invitation")
  end

  def create
    @user = User.where( params[:user] ).first || User.new( params[:user] )
    @user.inviter = session[:user] rescue nil
    @user.save
    log_activity(request.request_uri, "Created", "User", @user)
    UserMailer.invite(session[:user].email, params[:user][:email], cookies[:url]).deliver
    log_activity(request.request_uri, "Sent", "Invitation")
    redirect_to new_invitation_path
  end

end
