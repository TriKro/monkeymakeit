class Activity < ActiveRecord::Base

  belongs_to :user # the user that causes the activity

  belongs_to :target, :polymorphic => true # the activity target(e.g. if you vote an answer, the target can be the answer )
  belongs_to :subtarget, :polymorphic => true # the  we added this later since we feel the need for a secondary target, e.g if you rate an answer, target is your answer, secondary target is your rating.

  default_scope :order => "created_at DESC"

end
