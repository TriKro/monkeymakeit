class Step < ActiveRecord::Base

  belongs_to :funnel
  has_many :activities, :as => :target
  has_many :activities, :as => :subtarget

  validates_presence_of :sequence

end