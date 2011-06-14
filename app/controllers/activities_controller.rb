class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all.paginate(:page => params[:page], :per_page => 20)
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to(activities_url, :alert => 'You\'ve destroyed the activity. I concur. Logging is for losers.')
  end

end
