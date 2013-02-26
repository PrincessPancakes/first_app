class CategoryToMeasurementMapper
  CATEGORY_TO_MEASUREMENT = {
      "t-shirts" => "TShirts",
      "long sleeve" => "LongSleeve",
      "jeans" => "Pants",
      "sleeveless" => "Sleeveless",
      "dress shirts" => "LongSleeve",
      "casual shirts" => "LongSleeve",
      "polos" => "TShirts",
      "sweaters" => "LongSleeve",
      "jackets" => "LongSleeve",
      "blazers" => "LongSleeve",
      "suit jackets" => "LongSleeve",
      "suit pants" => "Pants",
      "vests" => "Sleeveless",
      "blouses" => "LongSleeve"
  }


  def self.get_measurement_class(category)
    "#{CATEGORY_TO_MEASUREMENT[category.to_s.downcase]}Measurement"
  end

end
