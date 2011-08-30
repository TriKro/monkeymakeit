class ChangeSubscribersSubscriptionsToSubscriptions < ActiveRecord::Migration
  def self.up
    rename_table :subscribers_subscriptions, :subscriptions
    add_column :subscriptions, :id, :primary_key
  end

  def self.down
    remove_column :subscriptions, :id
    rename_table :subscriptions, :subscribers_subscriptions
  end
end
