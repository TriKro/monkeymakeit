class User < ActiveRecord::Base

  validates_presence_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i

  belongs_to :inviter, :class_name => 'User'

  before_save :create_code_from_email

  def create_code_from_email
    self.code = email.md5
  end

end
