class CreateCreatives < ActiveRecord::Migration
  def self.up
    if !table_exists?("creatives")
      create_table :creatives do |t|
        t.string :creative_type
        t.string :filename
        t.string :title
        t.string :creator
        t.integer :chapter_id

        t.timestamps
      end
    end
  end

  def self.down
    drop_table :creatives
  end
end
