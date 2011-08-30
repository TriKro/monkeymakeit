class Story < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  belongs_to :author, :class_name => "User"
  has_many :subscriptions
  has_many :subscribers, :through => :subscriptions, :source => :user
  has_many :invites

  has_friendly_id :title, :use_slug => true

end
