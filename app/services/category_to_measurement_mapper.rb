class CategoryToMeasurementMapper
  CATEGORY_TO_MEASUREMENT = {
      "t-shirts" => "TShirts",
      "polos" => "TShirts",
      "jeans" => "Pants",
      "casual pants" => "Pants",
      "suit pants" => "Pants",
      "sleeveless" => "Sleeveless",
      "vests" => "Sleeveless",
      "dress shirts" => "LongSleeve",
      "casual shirts" => "LongSleeve",
      "sweaters" => "LongSleeve",
      "jackets" => "LongSleeve",
      "blazers" => "LongSleeve",
      "suit jackets" => "LongSleeve",
      "long sleeve" => "LongSleeve",
      "blouses" => "LongSleeve"
  }


  def self.get_measurement_class(category)
    "#{CATEGORY_TO_MEASUREMENT[category.to_s.downcase]}Measurement"
  end

end
