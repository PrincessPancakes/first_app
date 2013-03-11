class ClosetItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  attr_accessible :item
end
