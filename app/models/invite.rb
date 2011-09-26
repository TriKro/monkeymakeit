require 'digest'

class Invite < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :story_id
  validates_presence_of :code
  validates_uniqueness_of :code

  belongs_to :user
  belongs_to :story
  has_many :referrals, :dependent => :delete_all
  has_many :invite_acceptors, :through => :referrals, :source => :user
  has_friendly_id :slug_name, :use_slug => true

  before_validation :update_code

  def update_code
    return if code.present?
    self.code = Digest::MD5.hexdigest(self.to_s)[0..5]
  end

  def slug_name
    'invite friends with your code ' + code
  end

end
