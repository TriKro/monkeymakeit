class DropFunnelsAndStepsIfExist < ActiveRecord::Migration
  def self.up
    drop_table :funnels if table_exists?("funnels")
    drop_table :steps if table_exists?("steps")
  end

  def self.down
  end
end
