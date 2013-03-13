class CategoryMapper
  MAP = {
      "denim" => "jeans"
  }

  def self.map_category(category)
    category = category.to_s.downcase
    name = MAP[category] || category
    Category.find_by_name(name)
  end
end