class DowncaseEmails < ActiveRecord::Migration
  def self.up
    User.all.each do |user|
      if !user.email.nil?
        user.email = user.email.downcase
        user.save
      end
    end
  end

  def self.down
  end
end
