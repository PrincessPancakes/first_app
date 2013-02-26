class LongSleeveMeasurement < Measurement

  validates :waist, :opening, :hps_length, :cb_length, :chest, :sleeve_width,
            :shoulder, :arm_hole, presence: true

  validates :waist, :opening, :hps_length, :cb_length, :chest, :sleeve_width,
            :shoulder, :arm_hole, presence: true
  validates :waist, numericality: { greater_than_or_equal_to: 15, less_than_or_equal_to: 25 }
  validates :opening, numericality: { greater_than_or_equal_to: 15, less_than_or_equal_to: 25 }
  validates :chest, numericality: { greater_than_or_equal_to: 15, less_than_or_equal_to: 25 }
  #validates :hps_length, numericality: { greater_than_or_equal_to: 22, less_than_or_equal_to: 35 }
  #validates :cb_length, numericality: { greater_than_or_equal_to: 22, less_than_or_equal_to: 35 }
  validates :shoulder, numericality: { greater_than_or_equal_to: 12, less_than_or_equal_to: 25 }
  validates :arm_hole, numericality: { greater_than_or_equal_to: 6, less_than_or_equal_to: 12 }
  validates :sleeve_width, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 13 }
  #validates :sleeve_length, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 37 }
  validates :collar, numericality: { greater_than_or_equal_to: 14, less_than_or_equal_to: 40 }


  def self.points
    [:chest, :waist, :opening, :cb_length, :hps_length, :shoulder, :sleeve_length,
    :arm_hole, :sleeve_width,  :cuff, :collar]
  end

end
