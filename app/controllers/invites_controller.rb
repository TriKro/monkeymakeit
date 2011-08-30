class InvitesController < ApplicationController

  def show
    @invite = Invite.find(params[:id])
  end

  def send_invites
    @invite = Invite.find(params[:id])

    # TODO: Move validations to model.
    unless params[:email]
      flash[:error] = "Must provide email details."
      render "show" and return
    end
    if params[:email][:to] == "Your friend's email address"
      flash[:error] = "Must email someone."
      render "show" and return
    end
    if params[:email][:to].blank?
      flash[:error] = "Must email someone."
      render "show" and return
    end
    if params[:email][:from].blank?
      flash[:error] = "Must provide your email."
      render "show" and return
    end
    if params[:email][:message].blank?
      flash[:error] = "Must provide a message."
      render "show" and return
    end
    if params[:email][:invite_link].blank?
      flash[:error] = "Must provide your invite link."
      render "show" and return
    end
    unless params[:email][:message].include? params[:email][:invite_link]
      flash[:error] = "Must include your invite link in your message."
      render "show" and return
    end

    params[:email][:to].split(',').each do |to|
      UserMailer.deliver_email(params[:email][:from], to,
          'First look at "' + @invite.story.title + '" on MonkeyMake.it',
          params[:email][:message])
      # TODO: Move logging to sweeper if possible.
      km.record('referral', { 'method' => 'email', 'to' => to, 'from' => params[:email][:from] })
    end
    redirect_to(@invite, :notice => 'Email sent. Thanks for spreading the word!')
  end
end
