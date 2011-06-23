class RenameUserCodeToRandomKey < ActiveRecord::Migration
  def self.up
    rename_column :users, :code, :random_key
  end

  def self.down
    rename_column :users, :random_key, :code
  end
end
