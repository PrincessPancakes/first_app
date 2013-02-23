require 'active_record'

class Category < ActiveRecord::Base
  attr_accessible :gender, :name

  validates_presence_of :name, :gender
  validates_uniqueness_of :name
  validates_inclusion_of :gender, in: %w( men women both )
end
#class Category
#  def measurement_class
#    raise "measurement class must be implemented by subclass"
#  end
#end