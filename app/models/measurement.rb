class Measurement < ActiveRecord::Base
  belongs_to :measurement_group
  belongs_to :admin_user
  belongs_to :size

  has_many :verification_flags, :autosave => true
  has_many :sequence_flags, :autosave => true

  attr_accessible :product_id, :admin_user_id, :size_id, :status, :position,
                  :waist, :hips, :front_rise, :back_rise, :thigh,
                  :inseam, :outseam, :opening, :hps_length, :cb_length, :chest, :sleeve_width,
                  :shoulder, :arm_hole, :sleeve_length, :cuff, :collar, :knee, :measurement_group_id, :type
  validates :size_id, presence: true
  validates_inclusion_of :status, in: %w(flagged verified unverified)

  before_validation { status ||= "unverified" }
  before_save :set_status

  after_save :update_product

  def product
    measurement_group.product
  end

  def position
    size.position
  end

  def corresponding_entry
    Measurement.where("measurement_group_id = ? AND size_id = ? AND id != ?", self.measurement_group_id, self.size_id, get_id).first
  end

  def self.points
    raise "Subclass needs to implement points class method"
  end

  def points
    self.class.points
  end

  def point_flagged?(point)
    VerificationFlag.where(measurement_id: self.id, point: point).any?
  end

  def to_s
    "#{product.name} - #{size}"
  end


  def unverified?
    status == "unverified"
  end

  def verified?
    status == "verified"
  end

  def flagged?
    status ==  "flagged"
  end

  def verify!
    self.status = "verified"
    self.save
  end

  def flag_point(point)
    verification_flags.new(point: point)
  end

  def flag_point!(point)
    verification_flags.create!(point: point)
  end

  def flag_sequence(point)
    puts "flag sequence called"
    sequence_flags.new(point: point, measurement_group_id: self.measurement_group_id, size_id: self.size_id)
  end


  protected

  def set_status
    other = self.corresponding_entry

    sequence = valid_sequence?

    if other.blank?
      if sequence
        self.status = "unverified"
      else
        self.status = "flagged"
        self.product.flag!
      end

    else
      comparison = compare(other)
      if comparison
        self.status = "verified"
        other.update_column("status", "verified")
      else
        self.status = "flagged"
        other.update_column("status", "flagged")
        self.product.flag!
      end

    end
  end



  def valid_sequence?
    #find all measurements in lower position
    puts "Valid sequence called"

    all = Measurement.where(measurement_group_id: measurement_group_id)
    measurements = []

    all.each do |m|
      if m.position < self.position
        measurements << m
      end
    end

    puts measurements.inspect

    #for each measurement, compare each point
    measurements.each do |m|
      points.each do |point|
        #if smaller size has larger measure, flag the point
        if self.send(point) < m.send(point)
          flag_sequence(point)
        end
      end
    end


  end

  def update_product
    unless product.sizes.nil?
      measurements = Measurement.where(measurement_group_id: self.measurement_group_id)
      measurements.each do |m|
        if m.unverified?
          return
        end
      end
      if measurements.length == product.sizes*2
        product.activate!
      end
    end
  end

  def get_id
    self.id || -1
  end


  def compare(other)
    match = true
    self.points.each do |point|
      if point_difference(self, other, point) > 0.5
        puts "Point to flag #{point}"
        self.flag_point(point)
        other.flag_point!(point)
        #self.send("#{point}=", self.send(point) * -1)
        #other.update_column(point, other.send(point) * -1)

        #flag_point(measurement, point)
        #flag_point(other, point)
        match = false
      end
    end
    match
  end

  def point_difference(measurement, other, point)
    (measurement.send(point) - other.send(point)).abs
  end

end
