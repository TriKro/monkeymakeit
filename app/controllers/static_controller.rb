class StaticController < ApplicationController

  def home
    Activity.add(current_actor, request.request_uri, "Viewed", "Page") # log the Activity
  end

  def about
    Activity.add(current_actor, request.request_uri, "Viewed", "Page") # log the Activity
   end

  def privacy_policy
    Activity.add(current_actor, request.request_uri, "Viewed", "Page") # log the Activity
  end

  def terms_of_service
    Activity.add(current_actor, request.request_uri, "Viewed", "Page") # log the Activity
  end

end