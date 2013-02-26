require_relative "../spec_helper_lite"

class ScrapeError < Exception

end

class BrandScraper
  def initialize(brand, driver=CasperJS, product_klass=Product)
    @brand = brand
    @product_klass = product_klass
    @driver = driver
  end

  def scrape_product_by_identifier(identifier)
    product = get_product identifier
    scrape_product_by_url(product.url)
  end

  def scrape_product_by_url(url)
    begin
      @response = get_response(url)
      update_product
    rescue ScrapeError
      #add logging
    end
  end

  def scrape_all
    get_links.each do |link|
      scrape_product_by_url link
    end
  end

  private

  def get_links

  end

  def get_product(identifier)
    @product_klass.find_by_identifier(identifier)
  end


  def get_response(url)
    @driver.new(@brand).scrape_url(url)
  end

  def update_product
    @product_klass.create_or_update(@response)
  end
end

describe BrandScraper do
  subject do
    driver = OpenStruct.new
    product = OpenStruct.new(url: 'url')
    product_klass = OpenStruct.new(find_by_identifier: product)
    BrandScraper.new("Gap", driver, product_klass).tap do |s|
      stub(s).get_product("identifier"){product}
    end
  end


  describe "#scrape_all" do
  end

  describe "#scrape_category" do

  end

  describe "#scrape_product" do
    let(:response){'{"name":"Slim-Fit Vintage Stripe Oxford","identifier":"17264126","category":"Casual Shirts","styles":[{"name":"Blue Ground Orange Stripe","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629635_standard_dt.jpg"},{"name":"Blue Print","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629630_standard_dt.jpg"},{"name":"Blue W/ Multi Stripe","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629615_standard_dt.jpg"},{"name":"Orange Stripe","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629620_standard_dt.jpg"},{"name":"Pink With Green Stripe","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629625_standard_dt.jpg"}],"groups":["Regular"],"sizes":["XS","S","M","L","XL","XXS"],"materials":"","brand":"Club Monaco"}'}

    it "scrapes the product specified by the identifier" do
      stub(subject).get_response("url"){response}
      mock(subject).update_product{}
      subject.scrape_product_by_identifier("identifier")
    end
  end

  describe "scrape error" do
    let(:response){raise ScrapeError}

    it "scrapes the product specified by the identifier" do
      stub(subject).get_response("url"){response}
      subject.scrape_product_by_identifier("identifier")
      dont_allow(subject).update_product
    end

  end

end