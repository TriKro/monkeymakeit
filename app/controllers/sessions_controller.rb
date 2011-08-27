class SessionsController < ApplicationController

  cache_sweeper :user_sweeper

  def new
    login_url = "/auth/#{params[:provider]}"
    redirect_to login_url
  end

  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authentication.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authentication.create_from_hash(auth, current_user)
    end

    # Log the authorizing user in.
    session[:user_id] = @auth.user.id
    flash[:notice] = "Logged in as #{current_user.full_name}"
    redirect_to registration_thanks_url
  end

  def destroy
    session[:user_id] = nil
    flash[:success => "You've signed out!"]
    redirect_to root_url
  end

  def failure
    if current_user
      redirect_to root_url, :info => "You've signed in."
    end
    redirect_to root_url, :alert => "Uh oh...something weird just happened. We'll look into it. Please try to sign in again."
  end

end