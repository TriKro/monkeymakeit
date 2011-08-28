class User < ActiveRecord::Base
  has_many :authentications
  has_many :stories

  belongs_to :inviter, :class_name => 'User'

  after_create :update_invite_code

  validates_uniqueness_of :email
  validates_presence_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i

  def first_name
    full_name.sub(/ .*/, '') rescue ''
  end

  def email_header
    "\"#{full_name}\" <#{email}>"
  end

  def identifier
    full_name.blank? ? email : full_name
  end

  def self.create_from_hash!(hash)
    info = hash['user_info']
    users_name = info['name']
    image = info['image'] if !info['image'].blank?
    user = new( :full_name => users_name, :avatar_remote_url => image )
    user.save( false )
    user
  end

  def update_invite_code
    return if invite_code.present?
    self.update_attribute(:invite_code, (read_attribute(:id)+100).to_s(36))
  end
end
