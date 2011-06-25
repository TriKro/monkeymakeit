class InvitationsController < ApplicationController

  def new
    @invite = User.new
    session[:user].reload
    @friends = User.where( :inviter_id => session[:user].id ).count
    log_activity(request.request_uri, "Began Creating", "Invitation")
    render :layout => 'modal'
  end

  def create
    @invite = User.find_by_email(params[:user][:email]) || User.create(params[:user])
    @invite.inviter = session[:user] rescue nil
    if @invite.save
      log_activity(request.request_uri, "Created", "User", @invite)
      UserMailer.invite(session[:user], @invite, 'RE: "Doris", by Scott Lambridis', cookies[:url]).deliver
      log_activity(request.request_uri, "Sent", "Invitation", User.find_by_email(params[:user][:email]))
      if @invite.full_name.blank?
        flash[:success] = "Invite sent to "+ @invite.email + "."
      else
        flash[:success] = "Invite sent to "+ @invite.full_name + "."
      end
    end
    redirect_to new_invitation_path # Ignore all errors for this form
  end

end
