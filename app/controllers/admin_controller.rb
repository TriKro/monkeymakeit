class AdminController < ApplicationController
  load_and_authorize_resource :class => AdminController

  before_filter lambda {
    session[:admin] = true
  }

  def index
  end

  def set_experiment
    session[:experiments] ||= {}
    session[:experiments][params[:name]] = params[:version] if params[:name].present?
  end

  def clear_experiments
    session[:experiments] = nil
    render :action => 'set_experiment'
  end

end
