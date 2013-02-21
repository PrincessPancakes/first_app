class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  belongs_to :size_type

  has_many :styles
  has_many :measurement_groups
  has_many :measurements, through: :measurement_groups

  attr_accessible :gender, :identifier, :material, :name, :sizes, :status, :url, :brand_id, :category_id

  validates_presence_of :brand_id, :category_id, :gender, :identifier, :name, :url, :status, :size_type

  validates_inclusion_of :gender, in: %w( men women unisex )
  validates_inclusion_of :status, in: %w(flagged active incomplete)

  #accepts_nested_attributes_for :sizes

  scope :incomplete, where(status: "incomplete")
  scope :active, where(status: "active")
  scope :flagged, where(status: "flagged")
  scope :unverified, where(status: "unverified")

  before_validation { status ||= "incomplete" }


  def measurement_class
    CategoryToMeasurementMapper.get_measurement_class(category.name)
  end

  def points
    measurement_class.constantize.points
  end

  def active?
    status == "active"
  end

  def activate!
    self.status = "active"
    self.save!
  end

  def flag!
    self.status = "flagged"
    self.save!
  end

  def flagged?
    status == "flagged"
  end
end
