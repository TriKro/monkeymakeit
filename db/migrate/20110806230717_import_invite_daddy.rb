class ImportInviteDaddy < ActiveRecord::Migration
  def self.up
    User.destroy_all(:email => 'accounts@tristankromer.com')
    User.destroy_all(:email => 'H@rlan.me')
    add_column :users, :invite_code, :string
    add_column :users, :invited_by, :string
    add_index :users, :email, :unique => true
    add_index :users, :invite_code, :unique => true
  end

  def self.down
    remove_index :users, :column => :invite_code
    remove_index :users, :column => :email
    remove_column :users, :invited_by
    remove_column :users, :invite_code
  end
end
