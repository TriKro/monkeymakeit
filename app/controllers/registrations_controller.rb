class RegistrationsController < ApplicationController

  cache_sweeper :user_sweeper

  def new
    session[:invite_code] = params[:invite_code]
    @user = User.find_by_invite_code(params[:invite_code])
    if !@user.email.nil?
      km.record('referral arrival', { 'from' => @user.email })
    elsif
      km.record('referral arrival', { 'from' => @user.full_name })
    else
      km.record('referral arrival')
    end
    redirect_to story_path(Invite.find_by_code(params[:invite_code]).story)
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    unless @user
      @user = User.new(params[:user])
      if session[:invite_code] and !User.where(:invite_code => session[:invite_code]).empty?
        Invite.find_by_code(session[:invite_code]).user.invitees << @user
      end
      if @user.save
        @user.subscriptions << Story.find_by_id(params[:story_id])
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver
        return render 'registration_thanks'
      else
        return redirect_to new_registration_path(:user => params[:user]), :alert => @user.errors.full_messages.first
      end
    end
    @user.subscriptions << Story.find_by_id(params[:story_id])
    session[:user_id] = @user.id
    render 'registration_thanks'
  end

  def invite_email
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
      km.record('referral', { 'method' => 'email', 'to' => to, 'from' => params[:email][:from] })
    end
    flash[:notice] = "Email sent. Thanks for spreading the word!"

    render "registration_thanks"
  end

end
