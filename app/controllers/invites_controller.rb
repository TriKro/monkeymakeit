class InvitesController < ApplicationController
  load_and_authorize_resource

  def show
    @invite = Invite.find(params[:id])
    @invite_message = InviteMessage.new
  end

  def send_invites
    @invite = Invite.find(params[:id])

    @invite_message = InviteMessage.new(params[:invite_message])
    if @invite_message.valid?
      params[:invite_message][:recipients].split(',').each do |recipient|
        UserMailer.deliver_email(params[:invite_message][:from],
                                 recipient.strip,
                                 'First look at "' + @invite.story.title + '" on MonkeyMake.it',
                                 params[:invite_message][:content])
        # TODO: Move logging to sweeper if possible.
        km.record('referral', { 'method' => 'email', 'to' => recipient, 'from' => params[:invite_message][:from] })
      end
      redirect_to @invite, :notice => 'Email sent. Thanks for spreading the word!'
    else
      render :action => "show"
    end
  end
end