class RegistrationsController < ApplicationController

  cache_sweeper :user_sweeper

  def new
    # TODO: Move to more sensical place.
    session[:referral_code] = params[:referral_code]
    @user = User.find_by_invite_code(params[:referral_code])
    if !@user.email.nil?
      km.record('referral arrival', { 'from' => @user.email })
    elsif
      km.record('referral arrival', { 'from' => @user.full_name })
    else
      km.record('referral arrival')
    end
    redirect_to story_path(Invite.find_by_code(params[:referral_code]).story)
  end

  def create
    @user = current_user || User.find_by_email(params[:user][:email])
    @story = Story.find_by_id(params[:story_id])
    @referral_code = Invite.find_by_code(session[:referral_code]) if session[:referral_code]
    unless @user
      @user = User.new(params[:user])
      if @user.save
        # TODO: Move emailing to observer.
        UserMailer.welcome_email(@user, @story).deliver
      else
        return redirect_to new_registration_path(:user => params[:user]), :alert => @user.errors.full_messages.first
      end
    end
    @invite_code = @user.invites.find_or_create_by_story_id(@story.id).code
    @referral_code.user.invitees << @user if @referral_code
    @user.subscriptions << @story
    # TODO: Move logging to sweeper.
    km.record('activity', { 'type' => 'subscribed', 'story' => @story.title, 'author' => @story.author.full_name, 'url' => request.referer.split("?")[0] })
    session[:user_id] = @user.id if !(@user.access == "admin") # Hack to prevent users signing in as admin.
    render 'registration_thanks'
  end

  def invite_email
    # TODO: Move validations to model.
    @user = User.find_by_id(session[:user_id])
    unless params[:email]
      flash[:error] = "Must provide email details."
      render "registration_thanks" and return
    end
    if params[:email][:to].blank?
      flash[:error] = "Must email someone."
      render "registration_thanks" and return
    end
    if params[:email][:from].blank?
      flash[:error] = "Must provide your email."
      render "registration_thanks" and return
    end
    if params[:email][:message].blank?
      flash[:error] = "Must provide a message."
      render "registration_thanks" and return
    end
    if params[:email][:invite_link].blank?
      flash[:error] = "Must provide your invite link."
      render "registration_thanks" and return
    end
    unless params[:email][:message].include? params[:email][:invite_link]
      flash[:error] = "Must include your invite link in your message."
      render "registration_thanks" and return
    end

    params[:email][:to].split(',').each do |to|
      UserMailer.invite_email(params[:email][:from], to,
                            'First look at "Oh, Mighty Hiccup!" on MonkeyMake.it',
                            params[:email][:message]).deliver
      # TODO: Move logging to sweeper if possible.
      km.record('referral', { 'method' => 'email', 'to' => to, 'from' => params[:email][:from] })
    end
    flash[:notice] = "Email sent. Thanks for spreading the word!"

    render "registration_thanks"
  end

end
