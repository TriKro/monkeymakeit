class AddPublishingDateToChapter < ActiveRecord::Migration
  def self.up
    add_column :chapters, :publishing_date, :datetime
  end

  def self.down
    remove_column :chapters, :publishing_date
  end
end
