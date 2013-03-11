#require 'active_record'
#
#class SizeType < ActiveRecord::Base
#  serialize :preferences
#
#  attr_accessible :name, :options
#end

module SizeType
  OPTIONS = %w(SizeType::Alpha, SizeType::WomenNumeric)

end