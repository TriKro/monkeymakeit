class Suggestion < ActiveRecord::Base

  validates :content, :presence => true
  validates :email, :presence => true

  default_scope :order => "created_at DESC"

end
