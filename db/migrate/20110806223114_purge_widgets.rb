class PurgeWidgets < ActiveRecord::Migration
  def self.up
    remove_column :users, :random_key
    #drop_table :buttons
    #drop_table :suggestions
    #drop_table :widgets
  end

  def self.down
    add_column :users, :random_key, :string
  end
end
