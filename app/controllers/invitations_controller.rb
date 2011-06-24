class InvitationsController < ApplicationController

  def new
    @invite = User.new
  end

  def create
    @user = User.where( params[:user] ).first || User.new( params[:user] )
    @user.inviter = session[:user] rescue nil
    @user.save
    UserMailer.invite(session[:user].email, params[:user][:email], cookies[:url]).deliver
    redirect_to new_invitation_path
  end

end
