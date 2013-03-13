require_relative '../models/product'

class ProductCreator
  def self.create_or_update(attrs)
    product = self.find_product(attrs["identifier"])
    brand = Brand.find_by_name(attrs["brand"])
    category = CategoryMapper.map_category(attrs["category"]) || Category.unknown



    product.update_attributes({
                                  name: attrs["name"],
                                  category: category,
                                  gender: attrs["gender"],
                                  brand: brand,
                                  url: attrs["url"],
                                  status: "incomplete",
                                  size_type: SizeType::Base.get_from_options(attrs["sizes"]).to_s
                              })
    product.save!

    update_measurement_groups(attrs["groups"], product)
    update_styles(attrs["styles"], product)
    product
  end


  private

  def self.update_styles(styles, product)
    styles.each do |style|
      s           = product.styles.find_or_initialize_by_content(style["name"])
      s.image_url = style["url"]
      s.save!
    end
  end

  def self.update_measurement_groups(groups, product)
    groups.each do |group|
      m = product.measurement_groups.find_or_create_by_description(group)
    end
  end

  def self.find_product(identifier)
    Product.find_or_initialize_by_identifier(identifier)
  end
end
