class CreateChapters < ActiveRecord::Migration
  def self.up
    if !table_exists?("chapters")
      create_table :chapters do |t|
        t.integer :index
        t.integer :story_id

        t.timestamps
      end
    end
  end

  def self.down
    drop_table :chapters
  end
end
