class Chapter < ActiveRecord::Base
  belongs_to :story
  has_many :creatives, :dependent => :destroy
  has_friendly_id :chapter_index
  #XXX: Recreated every single deploy. Fix that if you need new associations.

  default_scope :order => "chapter_index ASC"
  scope :published, lambda { {:conditions => ["publishing_date <= ?", Time.now]} }

  def identifier
    return title if !title.blank?
    "Chapter " + chapter_index.to_s
  end

  def next_chapter
    chapters = Chapter.where(:story_id => story_id)
    chapters[chapters.index(self) + 1]
  end

  def prev_chapter
    chapters = Chapter.where(:story_id => story_id)
    chapters[chapters.index(self) - 1] if chapters.index(self) > 0
  end

end
