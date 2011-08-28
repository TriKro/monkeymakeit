class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  after_create :update_code

  def update_code
    return if code.present?
    self.update_attribute(:code, (read_attribute(:id)+100).to_s(36))
  end

end
