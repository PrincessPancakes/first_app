class SleevelessMeasurement < Measurement
  validates :waist, :opening, :hps_length, :cb_length, :chest,
            :shoulder, :arm_hole, presence: true

  def self.points
    [ :waist, :opening, :hps_length, :cb_length, :chest,
      :shoulder, :arm_hole ]
  end
end
