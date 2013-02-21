class Size < ActiveRecord::Base
  belongs_to :size_type
  attr_accessible :position, :value
end
