require_dependency File.dirname(__FILE__) + '/../../lib/random_key'

class Widget < ActiveRecord::Base

  include RandomKey

  belongs_to :user
  has_many :invitations

end
