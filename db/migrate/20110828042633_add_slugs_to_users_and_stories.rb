class AddSlugsToUsersAndStories < ActiveRecord::Migration
  def self.up
    add_column :users, :cached_slug, :string
    add_index  :users, :cached_slug, :unique => true
    add_column :stories, :cached_slug, :string
    add_index  :stories, :cached_slug, :unique => true
  end

  def self.down
    remove_index  :users, :cached_slug, :unique => true
    remove_column :users, :cached_slug
    remove_index  :stories, :cached_slug, :unique => true
    remove_column :stories, :cached_slug
  end
end
