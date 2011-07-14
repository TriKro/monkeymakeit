require_dependency File.dirname(__FILE__) + '/../../lib/random_key'

class Widget < ActiveRecord::Base

  # TODO: Delete this? Not using it.

  include RandomKey

  belongs_to :user
  has_many :buttons
  has_many :activities, :as => :target
  has_many :activities, :as => :subtarget

end
