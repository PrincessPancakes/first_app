class Style < ActiveRecord::Base
  belongs_to :product
  attr_accessible :content
end
