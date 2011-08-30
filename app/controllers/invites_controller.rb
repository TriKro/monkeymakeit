class InvitesController < ApplicationController

  def show
    @invite = Invite.find(params[:id])
  end

  def send_invites
    @invite = Invite.find(params[:id])

    @invite_message = InviteMessage.new(params[:email])
    if @invite_message.valid?
      params[:email][:recipients].split(',').each do |recipient|
        UserMailer.deliver_email(params[:email][:from],
                                 recipient.strip,
                                 'First look at "' + @invite.story.title + '" on MonkeyMake.it',
                                 params[:email][:content])
        # TODO: Move logging to sweeper if possible.
        km.record('referral', { 'method' => 'email', 'to' => recipient, 'from' => params[:email][:from] })
      end
      redirect_to @invite, :notice => 'Email sent. Thanks for spreading the word!'
    else
      render :action => "show", :notice => 'Fail!'
    end
  end
end
