class Chapter < ActiveRecord::Base
  belongs_to :story
  has_many :creatives, :dependent => :destroy
  #XXX: Recreated every single deploy. Fix that if you need new associations.
end
