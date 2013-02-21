class MeasurementGroup < ActiveRecord::Base
  belongs_to :product
  has_many :measurements
  has_many :sequence_flags

  attr_accessible :description


  def point_flagged?(point)
    SequenceFlag.where(measurement_group_id: self.id, point: point).any?
  end

  def new_measurement
    product.measurement_class.constantize.new(measurement_group_id: self.id)
  end
end
