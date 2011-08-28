class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i

  has_many :authentications
  has_many :stories
  has_and_belongs_to_many :subscriptions, :class_name => "Story", :join_table => "subscribers_subscriptions"
  has_many :invites
  has_many :invitees, :class_name => "User", :foreign_key => "inviter_id"
  belongs_to :inviter, :class_name => "User"
  has_friendly_id :slug_name, :use_slug => true

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
    user = new( :full_name => users_name, :image => image )
    user.save( false )
    user
  end

  def slug_name
    if full_name.blank?
      return 'Anonymous'
    end
    full_name
  end

end
