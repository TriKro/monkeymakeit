class Story < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  belongs_to :user

  has_friendly_id :title, :use_slug => true

  def author
    user
  end
end
