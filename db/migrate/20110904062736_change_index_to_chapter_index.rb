class ChangeIndexToChapterIndex < ActiveRecord::Migration
  def self.up
    rename_column :chapters, :index, :chapter_index
  end

  def self.down
    rename_column :chapters, :chapter_index, :index
  end
end
