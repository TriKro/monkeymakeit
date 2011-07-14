class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:error] = "That record does not exist!"
    log_activity(request.request_uri, "Record not Found")
    redirect_to :back
  end

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def log_activity(url, activity_type, target_model = nil, target = nil, subtarget_model = nil, subtarget = nil)
    session[:monkey_id] ||= SecureRandom.hex(6)
    unless session[:admin]
      Activity.create(:url => url, :activity_type => activity_type, :target_model => target_model, :target => target, :subtarget_model => subtarget_model, :subtarget => subtarget, :session_id => session[:monkey_id])
    end
  end

end
