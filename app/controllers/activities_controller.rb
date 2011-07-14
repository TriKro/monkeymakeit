class ActivitiesController < ApplicationController
  load_and_authorize_resource :class => ActivitiesController

  def index
    # TODO: Fetch in batches. Takes too long to load now.
    @activities = Activity.all.paginate(:page => params[:page], :per_page => 20)
  end

  def create
    # TODO: Clean up? Using this action?
    log_activity(params[:url], params[:activity_type], params[:target_model], params[:target], params[:subtarget_model], params[:subtarget])
    render :text => 'ok'
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to(activities_url, :alert => 'You\'ve destroyed the activity. I concur. Logging is for losers.')
  end

end
