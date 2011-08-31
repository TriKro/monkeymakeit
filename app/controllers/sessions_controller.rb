class SessionsController < ApplicationController
  cache_sweeper :user_sweeper

  def new
    @registration = User.new
  end

  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authentication.find_from_hash(auth)
      @auth = Authentication.create_from_hash(auth, current_user)
    end
    @user = @auth.user
    session[:user_id] = @user.id # Log the user in
    flash[:notice] = "Logged in as #{current_user.full_name}"
    redirect_to subscriptions_path({ :story_id => params[:story_id] }) and return if params[:story_id]
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