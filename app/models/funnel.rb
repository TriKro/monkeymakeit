class Funnel < ActiveRecord::Base

  has_many :steps
  has_many :activities, :as => :target
  has_many :activities, :as => :subtarget

  validates_uniqueness_of :name
  validates_presence_of :name

end