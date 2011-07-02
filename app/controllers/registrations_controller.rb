class RegistrationsController < ApplicationController

  def create
    @user = User.find_by_email(params[:user][:email]) || User.create(params[:user])
    return redirect_to(root_path) if @user.new_record? # error
    log_activity(request.request_uri, "Created", "User", @signup)

    session[:user] = @signup
    log_activity(request.request_uri, "Registered", "User", @signup)
    redirect_to(registration_thanks_url)
  end

  def thanks
  end

end
