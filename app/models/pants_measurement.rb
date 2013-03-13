class PantsMeasurement < Measurement
  attr_accessible :waist, :hips, :front_rise, :back_rise, :thigh, :knee, :cuff, :inseam, :outseam
  validates_presence_of:waist, :hips, :front_rise, :back_rise, :thigh, :knee, :cuff, :inseam, :outseam

  def self.points
    [ :waist, :hips, :front_rise, :back_rise, :thigh, :knee, :cuff, :inseam, :outseam ]
  end
end
