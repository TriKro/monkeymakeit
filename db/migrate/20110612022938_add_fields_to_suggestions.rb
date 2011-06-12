class AddFieldsToSuggestions < ActiveRecord::Migration
  def self.up
    remove_column :suggestions, :content
    add_column :suggestions, :before_text, :text
    add_column :suggestions, :after_text, :text
    add_column :suggestions, :before_html, :text
    add_column :suggestions, :url, :string
  end

  def self.down
    add_column :suggestions, :content, :text
    remove_column :suggestions, :url
    remove_column :suggestions, :before_html
    remove_column :suggestions, :after_text
    remove_column :suggestions, :before_text
  end
end
