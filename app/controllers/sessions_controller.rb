class SessionsController < ApplicationController
  skip_filter :store_location
  cache_sweeper :user_sweeper, :subscription_sweeper, :referral_sweeper

  before_filter lambda {
    log_page_view('sign up') if request.get?
  }, :only => :new

  def new
    @user = User.new if current_user.nil?
  end

  def create
    hash = request.env['omniauth.auth']
    if params[:story_id]
      @story = Story.find_by_id(params[:story_id])
    elsif session[:story_id_cache]
      @story = Story.find_by_id(session[:story_id_cache])
      session[:story_id_cache] = nil
    end

    # If there's a hash, you came from omniauth.
    if !hash.nil?
      @user = Authentication.find_or_create_from_hash(hash, current_user)

    # if not and there are user params, find or create.
    # TODO: Would be nice to move this junk to the Authentication model and combine with the find_or_create_from_hash method
    elsif !params[:user].nil? && current_user.nil?
      @user = User.find_or_create_from_email_and_attributes(params[:user][:email].strip.downcase, { :name => params[:user][:name].strip })
      redirect_to :action => "new", :flash => { :alert => "When signing in as an author or admin you must use Twitter or Facebook connect." } and return if @user.access == "author" || @user.access == "admin"
      render "new" and return if @user.errors.any?

    # Otherwise, something is wrong.
    else
      redirect_to :action => failure and return
    end

    #log the user in
    session[:user_id] = @user.id # Log the user in
    flash[:notice] = "Logged in as #{current_user.name_or_email}"

    # add referrer if any
    @referral_invite = Invite.find_by_code(session[:referral_code]) and session[:referral_code] = nil if session[:referral_code]
    @referral_invite.referrals << Referral.new(:user_id => @user.id) if @referral_invite

    # Subscribe the user to the story if there is one and go to invite page.
    if !@story.nil? && @user.subscribed_stories.find_by_id(@story.id).nil?
      @user.subscribed_stories << @story
      @invite = @user.invites.find_or_create_by_story_id(@story.id)
      redirect_to invite_path(@invite) and return
    end

    # Done! Go back.
    redirect_to session[:return_to] || '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :alert => "You've signed out!"
  end

  def failure
    if session[:return_to]
      redirect_to session[:return_to], :alert => "Uh oh...something weird just happened. We'll look into it. Please try to sign in again."
    else
      redirect_to root_url, :alert => "Uh oh...something weird just happened. We'll look into it. Please try to sign in again."
    end
  end

  def social_signin
    session[:story_id_cache] = params[:story_id]
    redirect_to "/auth/" + params[:provider]
  end

end
