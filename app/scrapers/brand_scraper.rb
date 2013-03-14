require_relative 'scrape_error'
require_relative '../services/product_creator'

class BrandScraper
  def initialize(brand, driver=CasperJS, product_klass=Product, creator=ProductCreator)
    @brand = brand
    @product_klass = product_klass
    @driver = driver
    @creator = creator
  end

  def scrape_product_by_identifier(identifier)
    product = get_product identifier
    scrape_product_by_url(product.url)
  end

  def scrape_product_by_url(url)
    begin
      product = scrape_product(url)
      update_product product
    rescue ScrapeError
      #add logging
    end
  end

  def scrape_all
    begin
      products = scrape_all_products
      products.each do |product|
        update_product(product)
      end
    rescue ScrapeError
      #add logging
    end
  end

  def update_unknown
    unknown_category_products.each do |product|
      begin
        update_product(scrape_product(product.url))
      rescue ScrapeError
        #add logging
      end
    end
  end


  private

  def get_links

  end

  def get_product(identifier)
    @product_klass.find_by_identifier(identifier)
  end


  def scrape_product(url)
    puts "Begin scraping"
    @driver.new(@brand).scrape_url(url)
  end

  def scrape_all_products
    @driver.new(@brand).scrape_all
  end

  def update_product(product)
    unless product["identifier"].nil? || product["name"].nil?
      @creator.create_or_update(product)
    end
  end

  def unknown_category_products
    Category.unknown.products
  end
end

