class Item < ActiveRecord::Base
  belongs_to :measurement
  belongs_to :style
  has_many :closet_items
  # attr_accessible :title, :body
end
