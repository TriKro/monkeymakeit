class AddSlugsToInvites < ActiveRecord::Migration
  def self.up
    add_column :invites, :cached_slug, :string
    add_index  :invites, :cached_slug, :unique => true
  end

  def self.down
    remove_index  :invites, :cached_slug, :unique => true
    remove_column :invites, :cached_slug
  end
end
