class InvitesController < ApplicationController
  load_and_authorize_resource

  before_filter lambda {
    log_page_view('invite') if request.get?
  }, :only => :show

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
        km.record('referral sent', { 'method' => 'email', 'to' => recipient, 'from' => params[:invite_message][:from] })
      end
      redirect_to @invite, :notice => 'Email sent. Thanks for spreading the word!'
    else
      render :action => "show"
    end
  end
end
