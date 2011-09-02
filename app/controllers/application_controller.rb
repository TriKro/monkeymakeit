class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  after_filter :store_location
  before_filter :check_for_email

  if Rails.env.production?
    rescue_from ActiveRecord::RecordNotFound do |e|
      flash[:error] = "That record does not exist!"
      redirect_to :back and return if !request.env["HTTP_REFERER"].nil?
      redirect_to session[:return_to] and return if !session[:return_to].nil?
      redirect_to root_url
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def check_for_email
    if !current_user.nil? &&
        current_user.email.blank? &&
        request.get? &&
        controller_name != "sessions" &&
        (controller_name != "users" && action_name != "add_email")
      redirect_to add_email_path
    end
  end


  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def log_page_view(type)
    km.record('viewed page', { 'page type' => type, 'url' => request.url.split("?")[0] })
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

end
