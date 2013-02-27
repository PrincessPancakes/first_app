require_relative '../models/product'

class ProductCreator
  def self.create_or_update(attrs)
    puts attrs


    product = self.find_product(attrs["identifier"])
    result = get_gender_and_category(attrs["category"])
    brand = Brand.find_by_name(attrs["brand"])

    product.update_attributes({
                                  name: attrs["name"],
                                  category: result[:category],
                                  gender: result[:gender],
                                  brand: brand,
                                  url: attrs["url"],
                                  status: "incomplete",
                                  size_type: "SizeType::Alpha"#SizeType::Base.get_from_options(@output["sizes"]).to_s                               }
                              })


    product.save!



    attrs["groups"].each do |group|
      m = product.measurement_groups.find_or_create_by_description(group)
    end

    attrs["styles"].each do |style|
      s = product.styles.find_or_initialize_by_content(style["name"])
      s.image_url = style["url"]
      s.save!
    end

    puts product

    product
  end

  def self.get_gender_and_category(cid)
    map = {
        "251" => build_hash("long sleeve", "men"),
        "248" => build_hash("long sleeve", "men"),
        "276" => build_hash("t-shirts", "men"),
        "260" => build_hash("t-shirts", "men"),
        "247" => build_hash("dress shirts", "men"),
        "259" => build_hash("dress shirts", "men"),
        "257" => build_hash("casual shirts", "men"),
        "252" => build_hash("polos", "men"),
        "273" => build_hash("sweaters", "men"),
        "245" => build_hash("jackets", "men"),
        "235" => build_hash("blazers", "men"),
        "268" => build_hash("suit jackets", "men"),
        "269" => build_hash("suit pants", "men"),
        "279" => build_hash("vests", "men"),

        "260" => build_hash("t-shirts", "men"),


        "343" => build_hash("blouses", "women"),
        "384" => build_hash("sleeveless", "women"),
        "379" => build_hash("t-shirts", "women"),
        "396" => build_hash("sweaters", "women"),
    }
    map[cid.to_s] || build_hash(Category.unknown, "unisex")

  end

  def self.build_hash(category, gender)
    {category: build_category(category), gender: gender}
  end

  def self.build_category(name)
    Category.find_by_name(name) || Category.unknown
  end


  def self.find_product(identifier)
    Product.find_or_initialize_by_identifier(identifier)
  end
end
