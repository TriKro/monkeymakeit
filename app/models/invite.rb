class Invite < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :story_id

  belongs_to :user
  belongs_to :story
  has_friendly_id :slug_name, :use_slug => true

  after_create :update_code

  def update_code
    return if code.present?
    self.update_attribute(:code, (read_attribute(:id)+100).to_s(36))
  end

  def slug_name
    'invite friends with your code ' + code
  end

end
