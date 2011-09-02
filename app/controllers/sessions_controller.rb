class SessionsController < ApplicationController
  skip_filter :store_location
  cache_sweeper :user_sweeper

  before_filter lambda {
    log_page_view('sign up') if request.get?
  }, :only => :new

  def new
    @user = User.new if current_user.nil?
  end

  def create
    hash = request.env['omniauth.auth']
    if !hash.nil?
      @user = Authentication.find_or_create_from_hash(hash, current_user)
    elsif !params[:user].nil? && current_user.nil?
      @user = User.find_or_create_from_email_and_attributes(params[:user][:email], { :full_name => params[:user][:full_name] })
      redirect_to :action => "new", :flash => { :alert => "When signing in as an author or admin you must use Twitter or Facebook connect." } and return if @user.access == "author" || @user.access == "admin"
      render "new" and return if @user.errors.any?
    else
      redirect_to :action => failure and return
    end

    session[:user_id] = @user.id # Log the user in
    @referral_invite = Invite.find_by_code(session[:referral_code]) and session[:referral_code] = nil if session[:referral_code]
    @referral_invite.user.invitees << @user if @referral_invite
    flash[:notice] = "Logged in as #{current_user.full_name}"
    redirect_to session[:return_to]
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :alert => "You've signed out!"
  end

  def failure
    redirect_to session[:return_to], :alert => "Uh oh...something weird just happened. We'll look into it. Please try to sign in again."
  end

end