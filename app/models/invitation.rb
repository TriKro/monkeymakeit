class Invitation < ActiveRecord::Base
  belongs_to :widget
  validates :button_name, :presence => true, :uniqueness => true
end
