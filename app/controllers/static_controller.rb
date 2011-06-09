class StaticController < ApplicationController
  def home
    Activity.add(current_actor, request.request_uri, "Viewed", "Page") # log the Activity
  end
end