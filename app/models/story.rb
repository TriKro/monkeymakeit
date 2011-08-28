class Story < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  belongs_to :author, :class_name => "User"
  has_and_belongs_to_many :subscribers, :class_name => "User", :join_table => "subscribers_subscriptions"
  has_many :invites

  has_friendly_id :title, :use_slug => true

end
