class Invite < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :story_id
  validates_presence_of :code
  validates_uniqueness_of :code

  belongs_to :user
  belongs_to :story
  has_friendly_id :slug_name, :use_slug => true

  before_validation :update_code

  def update_code
    return if code.present?
    # TODO: Hack...something better?
    self.code = (Invite.last.id+101).to_s(36)
  end

  def slug_name
    'invite friends with your code ' + code
  end

end
