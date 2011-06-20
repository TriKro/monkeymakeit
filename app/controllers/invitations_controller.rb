class InvitationsController < ApplicationController
  def create
    @user = User.where( params[:user] ).first || User.new( params[:user] )
    @user.inviter = session[:user] rescue nil
    @user.save
    UserMailer.invite(session[:user].email, params[:user][:email], cookies[:url]).deliver
    render :text => 'OK'
  end
end
