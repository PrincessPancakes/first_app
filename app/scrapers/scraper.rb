require 'rubygems'
require 'json'
#require_relative '../models/category/category_factory'
require_relative '../models/category'
require_relative '../models/product'
require_relative '../models/brand'

class Scraper
  attr_accessor :output, :response

  def initialize(url)
    @url = url.gsub("&","STYLEKICK")
    #puts @url
  end

  def scrape
    file = Rails.root.join "app/scrapers/gap.coffee"
    @response = `casperjs "#{file}" "#{@url}"`

    parse
  end

  def parse_json
    @output ||= JSON.parse @response
  end

  def parse
    parse_json

    result = get_gender_and_category(@output["category"])
    puts result.inspect


    @product = Product.create!(
        name: @output["name"],
        identifier: @output["identifier"],
        brand: Brand.find_by_name("Banana Republic"),
        url: @url,
        category: result[:category],
        gender: result[:gender],
        status: "incomplete",
        size_type: SizeType::Base.get_from_options(@output["sizes"]).to_s
    )

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
        "343" => build_hash("long sleeve", "women"),
        "384" => build_hash("sleeveless", "women"),
        "379" => build_hash("t-shirts", "women"),
        "276" => build_hash("t-shirts", "men"),
        "260" => build_hash("t-shirts", "men")
    }
    map[cid.to_s]

  end

  def build_hash(category, gender)
    {category: build_category(category), gender: gender}
  end

  def build_category(name)
    Category.find_by_name!(name)
  end




end