class SessionsController < ApplicationController

  cache_sweeper :user_sweeper

  def new
    login_url = "/auth/#{params[:provider]}"
    redirect_to login_url
  end

  def create
    #render :text => request.env["rack.auth"].to_yaml
    auth = request.env['omniauth.auth']
    unless @auth = Authentication.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authentication.create_from_hash(auth, current_user)
    end

    # Log the authorizing user in.
    self.current_user = @auth.user
    flash[:notice] = "Logged in as #{current_user.full_name}"
    redirect_to registration_thanks_url
  end

  def destroy
    session[:user_id] = nil
    flash[:success => "You've signed out!"]
    redirect_to root_url
  end

end
