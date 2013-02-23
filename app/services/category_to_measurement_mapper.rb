class CategoryToMeasurementMapper
  CATEGORY_TO_MEASUREMENT = {
      "t-shirts" => "TShirts",
      "long sleeve" => "LongSleeve",
      "jeans" => "Pants",
      "sleeveless" => "Sleeveless"
  }


  def self.get_measurement_class(category)
    "#{CATEGORY_TO_MEASUREMENT[category.to_s.downcase]}Measurement"
  end

end