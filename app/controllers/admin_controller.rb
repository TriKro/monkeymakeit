class AdminController < ApplicationController
  #load_and_authorize_resource :class => AdminController

  before_filter lambda {
    session[:admin] = true
  }

  def index
  end

  def scott
    # TODO: Clean Up, record results, then erase.
    @scott = User.find(4)
  end

  def select_experiment
    @experiment = 10
  end

  def set_experiment
    session[:monkey_experiment_id] = params[:experiment]
    redirect_to select_experiment_path
  end

end
