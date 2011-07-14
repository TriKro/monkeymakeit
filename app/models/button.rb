class Button < ActiveRecord::Base

  # TODO: Delete this? We're not using it.

  belongs_to :widget
  has_many :activities, :as => :target
  has_many :activities, :as => :subtarget
  validates :button_name, :presence => true, :uniqueness => true
end
