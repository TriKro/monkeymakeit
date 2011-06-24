class InvitationsController < ApplicationController

  def new
    @invite = User.new
    session[:user].reload
    @friends = User.where( :inviter_id => session[:user].id ).count
    render :layout => 'modal'
    log_activity(request.request_uri, "Began Creating", "Invitation")
  end

  def create
    @invite = User.where( params[:user] ).first || User.new( params[:user] )
    @invite.inviter = session[:user] rescue nil
    @invite.save
    log_activity(request.request_uri, "Created", "User", @invite)
    UserMailer.invite(session[:user], @invite, 'RE: "Doris", by Scott Lambridis', cookies[:url]).deliver
    log_activity(request.request_uri, "Sent", "Invitation", User.find_by_email(params[:user][:email]))
    redirect_to new_invitation_path, :html => {:flash => "Invite sent to #{@invite.full_name}."}
  end

end
