class RegistrationsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    unless @user
      @user = User.new (params[:user])
      if @user.save
        log_activity(request.request_uri, "Created", "User", @user)
        current_user = @user
        p 111, @current_user  # sanity check
        return redirect_to root_path, :notice => 'Thanks, we are working hard and will let you know when more awesomeness is ready for you.'
      else
        return redirect_to new_registration_path(:user => params[:user]), :alert => @user.errors.full_messages.first
      end
    end

#    log_activity(request.request_uri, "Registered", "User", @signup)
#    redirect_to(registration_thanks_url)

  end

  def thanks
  end

end
