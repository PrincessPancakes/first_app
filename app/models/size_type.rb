class SizeType < ActiveRecord::Base
  serialize :preferences

  attr_accessible :name, :options
end
