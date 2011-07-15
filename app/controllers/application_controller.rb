class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:error] = "That record does not exist!"
    log_activity(request.request_uri, "Record not Found")
    redirect_to :back
  end

  rescue_from CanCan::AccessDenied do |exception|
    logger.debug('CanCan:: AccessDenied : ' + exception.message)

    flash[:alert] = exception.message.chop + ': "' + request.fullpath + '"'
    log_activity(request.request_uri, "Access Denied")

    # TODO: Should redirect back, not home.
    redirect_to root_path( :accessdenied => flash[:alert])
  end

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def access_denied
    log_activity(request.request_uri, "Access Denied")
    redirect_to :back, :notice => "Please log in to continue" and return false
  end

  def log_activity(url, activity_type, target_model = nil, target = nil, subtarget_model = nil, subtarget = nil)
    session[:monkey_id] ||= SecureRandom.hex(6)

    unless session[:admin]
      # TODO: Can cleanup. No need to log session_id in activities table. Now associated with UserSession.
      logged_activity = Activity.create(:url => url, :activity_type => activity_type, :target_model => target_model, :target => target, :subtarget_model => subtarget_model, :subtarget => subtarget, :session_id => session[:monkey_id])

      # Associate activity with existing UserSession or create a new one.
      # TODO: Move to new method in model?
      if !(user_session = UserSession.find_by_session_id(session[:monkey_id]) )
        user_session = UserSession.create( :session_id => session[:monkey_id])
      end
      user_session.activities << logged_activity
    end

  end

end
