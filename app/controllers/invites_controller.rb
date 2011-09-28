class InvitesController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => :referral_redirect

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

  def referral_redirect
    code = params[:referral_code]
    invite = Invite.find_by_code(code)
    return redirect_to root_url if invite.nil?
    session[:referral_code] = code
    @inviter = invite.user
    if !@inviter.nil? && !@inviter.email_or_name.blank?
      km.record('referral arrival', { 'from' => @inviter.email_or_name })
    else
      km.record('referral arrival')
    end
    flash[:info] = "#{@inviter.name} thought you might like this story." if !@inviter.nil? && !@inviter.name.blank?
    redirect_to story_path(invite.story)
  end

end
