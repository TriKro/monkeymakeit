class CreateInvites < ActiveRecord::Migration
  def self.up
    unless table_exists?(:invites)
      create_table :invites do |t|
        t.integer :user_id
        t.integer :story_id
        t.string :code

        t.timestamps
      end
    end

    Invite.destroy_all
    add_index :invites, :code, :unique => true rescue nil

    User.all.each do |user|
      next if user.invite_code.blank?
      invite = Invite.create(:code => user.invite_code)
      user.invites << invite
      Story.find_by_title("Oh, Mighty Hiccup!").invites << invite
    end

    remove_index :users, :invite_code
    remove_column :users, :invited_by
    remove_column :users, :invite_code
  end

  def self.down
    add_column :users, :invited_by, :string
    add_column :users, :invite_code, :string
    add_index :users, :invite_code, :unique => true

    User.all.each do |user|
      user.invite_code = user.invites.find_by_story_id(Story.find_by_title("Oh, Mighty Hiccup!").id).code
      user.save
    end

    remove_index :invites, :code
    drop_table :invites
  end
end
