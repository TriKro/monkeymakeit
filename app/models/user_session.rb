class UserSession < ActiveRecord::Base

  belongs_to :user
  has_many :activities

  validates_uniqueness_of :session_id
  validates_presence_of :session_id

end