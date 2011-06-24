class CreateWidgets < ActiveRecord::Migration
  def self.up
    create_table :widgets do |t|
      t.integer  :user_id
      t.string   :random_key
      t.timestamps
    end
  end

  def self.down
  end
end
