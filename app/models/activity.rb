class Activity < ActiveRecord::Base

  belongs_to :user # the user that causes the activity

  belongs_to :target, :polymorphic => true # the activity target(e.g. if you vote an answer, the target can be the answer )
  belongs_to :subtarget, :polymorphic => true # the  we added this later since we feel the need for a secondary target, e.g if you rate an answer, target is your answer, secondary target is your rating.

  default_scope :order => "created_at DESC"

  def self.add(actor, url, activity_type, target_model = nil, target = nil, subtarget_model = nil, subtarget = nil)
    activity = Activity.new(:url => url, :activity_type => activity_type, :target_model => target_model, :target => target, :subtarget_model => subtarget_model, :subtarget => subtarget)
    if actor.is_a? User
      activity.user = actor
    else
      activity.session_id = actor
    end
    activity.save!
    activity
  end

  def self.recent_reviews
    results = []
    Activity.where(:target_model => "Review", :activity_type => "Created").each do |activity|
      if !activity.user.nil? && !activity.target.nil?
        if !activity.target.body.nil?
          results += [activity]
        end
      end
    end
    results
  end

end
