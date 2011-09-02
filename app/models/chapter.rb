class Chapter < ActiveRecord::Base
  belongs_to :story
  has_many :creatives, :dependent => :destroy
end