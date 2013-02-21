class CategoryToMeasurementMapper
  CATEGORY_TO_MEASUREMENT = {
      "t-shirts" => "TShirts",
      "hoodies" => "LongSleeve",
      "jeans" => "Pants"
  }


  def self.get_measurement_class(category)
    "#{CATEGORY_TO_MEASUREMENT[category.to_s.downcase]}Measurement"
  end

end