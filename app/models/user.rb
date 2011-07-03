require_dependency File.dirname(__FILE__) + '/../../lib/random_key'

require 'cgi'

class User < ActiveRecord::Base

  include RandomKey

  has_many :widgets
  has_many :activities, :as => :target
  has_many :activities, :as => :subtarget

  belongs_to :inviter, :class_name => 'User'

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

  def self.owning(url)
    return "DEMO" if url.include?("demo=true")
    CGI.parse(url.split('?')[1])['code'][0] rescue url
  end

end
