class ChangeSuggestionsContentToTextType < ActiveRecord::Migration
  def self.up
    change_column :suggestions, :content, :text, :limit => nil
  end

  def self.down
    change_column :suggestions, :content, :string
  end
end
