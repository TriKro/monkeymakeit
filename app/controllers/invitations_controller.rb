class InvitationsController < ApplicationController

  def new
    @invite = User.new
    session[:user].reload
    @friends = User.where( :inviter_id => session[:user].id ).count
    log_activity(request.request_uri, "Began Creating", "Invitation")
    render :layout => 'modal'
  end

  def create
    params[:user].update :inviter_id => (session[:user].id rescue nil)
    invitee = User.find_by_email(params[:user][:email]) || User.create(params[:user])
    return redirect_to(new_invitation_path) if invitee.new_record? # Ignore all errors for this form
    log_activity(request.request_uri, "Created", "User", invitee)

    log_activity(request.request_uri, "Sent", "Invitation", User.find_by_email(params[:user][:email]))
    flash[:success] = "Invite sent to #{invitee.full_name.blank? ? invitee.email : invitee.full_name}."
    UserMailer.invite(session[:user], invitee, 'RE: "Doris," by Scott Lambridis', cookies[:url]).deliver
    redirect_to(new_invitation_path)
  end

end
