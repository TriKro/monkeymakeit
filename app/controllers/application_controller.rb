class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:error] = "That record does not exist!"
    redirect_to :back
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def km_log_page_view(type)
    km.record('viewed page', { 'page type' => type, 'url' => request.url.split("?")[0] })
  end

end
