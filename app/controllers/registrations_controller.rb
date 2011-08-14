class RegistrationsController < ApplicationController

  def new
    session[:invite_code] = params[:invite_code]
    @User = User.find_by_invite_code(params[:invite_code])
    log_activity(request.request_uri, "Invited by", "User", @user)
    redirect_to '/hiccup'
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    unless @user
      @user = User.new (params[:user])
      if session[:invite_code] and !User.where(:invite_code => session[:invite_code]).empty?
        @user.invited_by = session[:invite_code]
      end
      if @user.save
        log_activity(request.request_uri, "Created", "User", @user)
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver
        return render 'registration_thanks'
      else
        log_activity(request.request_uri, "Error Creating", "User")
        return redirect_to new_registration_path(:user => params[:user]), :alert => @user.errors.full_messages.first
      end
    end
    session[:user_id] = @user.id
    @user.update_invite_code # in case an old, invite_code-less user returns
    log_activity(request.request_uri, "Error Creating", "User", @user)
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

    UserMailer.invite_email(params[:email][:from], params[:email][:to],
                            'First look at "Oh, Mighty Hiccup!" on MonkeyMake.it',
                            params[:email][:message]).deliver
    flash[:notice] = "Email sent. Thanks for spreading the word!"

    render "registration_thanks"
  end

end
