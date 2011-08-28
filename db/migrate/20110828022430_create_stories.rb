class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string   :title
      t.string   :subtitle
      t.text   :summary
      t.user_id  :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
