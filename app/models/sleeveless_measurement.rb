class SleevelessMeasurement < Measurement
  validates :waist, :opening, :hps_length, :cb_length, :chest,
             presence: true

  def self.points
    [ :chest, :waist, :opening, :cb_length, :hps_length,
      :shoulder, :arm_hole, :collar ]
  end
end
