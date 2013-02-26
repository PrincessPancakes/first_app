require 'active_record'

class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  #belongs_to :size_type

  has_many :styles, dependent: :destroy
  has_many :measurement_groups, dependent: :destroy
  has_many :measurements, through: :measurement_groups

  attr_accessible :gender, :identifier, :material, :name, :sizes, :status, :url, :brand_id, :category_id, :brand, :category, :size_type, :tags

  validates_presence_of :brand_id, :category_id, :gender, :identifier, :name, :url, :status, :size_type

  GENDER_OPTIONS = %w( men women unisex )
  STATUS_OPTIONS = %w(flagged active incomplete)

  validates_inclusion_of :gender, in: GENDER_OPTIONS
  validates_inclusion_of :status, in: STATUS_OPTIONS

  #accepts_nested_attributes_for :sizes

  scope :incomplete, where(status: "incomplete")
  scope :active, where(status: "active")
  scope :flagged, where(status: "flagged")
  scope :unverified, where(status: "unverified")

  before_validation { status ||= "incomplete" }


  def measurement_class
    CategoryToMeasurementMapper.get_measurement_class(category.name)
  end

  def first_group
    measurement_groups.first || measurement_groups.create!(description: "Regular")
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
