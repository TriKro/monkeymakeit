class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all.paginate(:page => params[:page], :per_page => 20)
  end

  def create
    Activity.create :url => params[:url], :activity_type => params[:activity_type], :target_model => params[:target_model], :target => params[:target], :subtarget_model => params[:subtarget_model]
    render :text => 'ok'
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to(activities_url, :alert => 'You\'ve destroyed the activity. I concur. Logging is for losers.')
  end

end
