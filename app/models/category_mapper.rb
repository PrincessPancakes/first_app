class CategoryMapper
  MAP = {
      "denim" => "jeans",
      "short sleeve" => "t-shirts",
      "cashmere" => "sweaters",
      "v-neck" => "sweaters",
      "crewneck" => "sweaters",
      "cardigan" => "sweaters",
      "tanks" => "sleeveless",
      "slim fit" => "dress shirts",
      "classic fit" => "casual shirts",
      "made in the usa" => "casual shirts",
      "tanks & camis" => "sleeveless",
      "cardigans & wraps" => "cardigans"
  }

  def self.map_category(category)
    category = category.to_s.downcase
    name = MAP[category] || category
    result = Category.find_by_name(name)
    unless result
      puts "#{category} - #{name} not found"
    end
    result
  end
end