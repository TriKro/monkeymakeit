class Story < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  belongs_to :user
end
