class Activity < ActiveRecord::Base

  belongs_to :user # the user that causes the activity

  belongs_to :target, :polymorphic => true # the activity target(e.g. if you vote an answer, the target can be the answer )
  belongs_to :subtarget, :polymorphic => true # the  we added this later since we feel the need for a secondary target, e.g if you rate an answer, target is your answer, secondary target is your rating.

  default_scope :order => "created_at DESC"

  def self.add(actor, url, activity_type, target_model = nil, target = nil, subtarget_model = nil, subtarget = nil)
    activity = Activity.new(:session_id => actor, :url => url, :activity_type => activity_type, :target_model => target_model, :target => target, :subtarget_model => subtarget_model, :subtarget => subtarget)
    activity.save!
    activity
  end

end
