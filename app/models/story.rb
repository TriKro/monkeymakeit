class Story < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  belongs_to :user
  has_many :subscriptions, :dependent => :delete_all
  has_many :subscribers, :through => :subscriptions, :source => :user
  has_many :referrals, :through => :invites
  has_many :invites, :dependent => :destroy
  has_many :chapters, :dependent => :destroy

  has_friendly_id :title, :use_slug => true
end
