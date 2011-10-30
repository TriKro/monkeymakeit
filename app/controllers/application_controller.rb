class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  before_filter :check_for_email, :mailer_set_url_options, :set_experiments
  after_filter :store_location

  if Rails.env.production?
    rescue_from ActiveRecord::RecordNotFound do |e|
      flash[:alert] = "That record does not exist!"
      redirect_to_back_or_default
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to_back_or_default
  end

  private

  def redirect_to_back_or_default
    redirect_to :back and return if !request.env["HTTP_REFERER"].nil?
    redirect_to session[:return_to] and return if !session[:return_to].nil?
    redirect_to root_url
  end

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
    km.record('page view', { 'page type' => type, 'url' => request.url.split("?")[0] })
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def set_experiments
    session[:experiments] ||= {}

    # Set experiments example:
    # session[:experiments]['sign up method'] = 'email'
    sign_up_method = ['twitter, facebook, and email', 'facebook, twitter, and email', 'facebook and email', 'twitter and email']
    unless session[:experiments]['sign up method']
      session[:experiments]['sign up method'] = sign_up_method[rand(sign_up_method.length)]
      km.set('sign up method', session[:experiments]['sign up method'])
    end

    chapter_layout = ['right column','no right column']
    unless session[:experiments]['chapter layout']
      session[:experiments]['chapter layout'] = chapter_layout[rand(chapter_layout.length)]
      km.set('chapter layout', session[:experiments]['chapter layout'])
    end

  end

end