class Chapter < ActiveRecord::Base
  belongs_to :story
  has_many :creatives, :dependent => :destroy
  has_friendly_id :index
  #XXX: Recreated every single deploy. Fix that if you need new associations.

  named_scope :published, lambda { {:conditions => ["publishing_date <= ?", Time.now]} }

  def identifier
    return title if !title.blank?
    "Chapter " + index.to_s
  end
end
