require 'rubygems'
require 'json'
#require_relative '../models/category/category_factory'
require_relative '../models/category'
require_relative '../models/product'
require_relative '../models/brand'

class Scraper
  attr_accessor :output, :response

  def initialize(url)
    @url = url
    @escaped_url = url.gsub("&","STYLEKICK")
    #puts @url
  end

  def scrape
    file = Rails.root.join "app/scrapers/gap.coffee"
    @response = `casperjs "#{file}" "#{@escaped_url}"`

    parse
  end

  def parse_json
    @output ||= JSON.parse @response
  end

  def parse
    parse_json


    #puts result.inspect

    @product = Product.find_or_initialize_by_identifier(@output["identifier"])

    #@product.name = @output["name"]




    result = get_gender_and_category(@output["category"])
    @product = Product.update_attributes({
        name: @output["name"],
        identifier: @output["identifier"],
        brand: Brand.find_by_name(@output["brand"]),
        url: @url,
        category: result[:category],
        gender: result[:gender],
        status: "incomplete",
        size_type: "SizeType::Alpha"#SizeType::Base.get_from_options(@output["sizes"]).to_s
    })

    @product.save!

    @output["groups"].each do |group|
      @product.measurement_groups.create!(description: group)
    end

    @output["styles"].each do |style|
      @product.styles.create!(content: style["name"], image_url: style["url"])
    end


  end

  def get_gender_and_category(cid)
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
    map[cid.to_s] || raise("new category that isn't implemented'")

  end

  def build_hash(category, gender)
    {category: build_category(category), gender: gender}
  end

  def build_category(name)
    Category.find_by_name!(name) || "long sleeve"
  end




end