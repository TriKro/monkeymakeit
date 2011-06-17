class AddSubscribedToSuggestions < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :subscribed, :boolean
  end

  def self.down
    remove_column :suggestions, :subscribed
  end
end
