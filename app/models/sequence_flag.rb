class SequenceFlag < ActiveRecord::Base
  belongs_to :measurement_group
  belongs_to :size
  attr_accessible :point, :measurement_group_id, :size_id

  validates_presence_of :point, :measurement_group_id, :size_id
end
