require_relative "../spec_helper_lite"

stub_class "CasperJS"
stub_class "ProductCreator"
stub_class "Product"

require_relative '../../app/scrapers/brand_scraper'


describe BrandScraper do
  let(:response){'{"name":"Slim-Fit Vintage Stripe Oxford","identifier":"17264126","category":"Casual Shirts","styles":[{"name":"Blue Ground Orange Stripe","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629635_standard_dt.jpg"},{"name":"Blue Print","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629630_standard_dt.jpg"},{"name":"Blue W/ Multi Stripe","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629615_standard_dt.jpg"},{"name":"Orange Stripe","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629620_standard_dt.jpg"},{"name":"Pink With Green Stripe","url":"http://www.clubmonaco.com/graphics/product_images/pCMUS1-14629625_standard_dt.jpg"}],"groups":["Regular"],"sizes":["XS","S","M","L","XL","XXS"],"materials":"","brand":"Club Monaco"}'}


  subject do

    #driver = OpenStruct.new
    #product = OpenStruct.new(url: 'url')
    #product_klass = OpenStruct.new(find_by_identifier: product)
    #creator = OpenStruct.new(create_or_update: stub!)


    product = MiniTest::Mock.new
    product.expect :url, "url"

    driver = MiniTest::Mock.new
    product_klass = MiniTest::Mock.new
    creator = MiniTest::Mock.new

    creator.expect :create_or_update, product, [response]

    BrandScraper.new("Gap", driver, product_klass, creator).tap do |s|
      stub(s).get_product("identifier"){product}
    end
  end


  describe "#scrape_all" do
  end

  describe "#scrape_category" do

  end

  describe "#scrape_product" do

    it "scrapes the product specified by the identifier" do
      stub(subject).scrape_product("url"){response}
      #mock(subject).update_product(response){stub!}
      subject.scrape_product_by_identifier("identifier")
    end
  end

  #describe "scrape error" do
  #  let(:response){raise ScrapeError}
  #
  #  it "scrapes the product specified by the identifier" do
  #    stub(subject).get_response("url"){response}
  #    subject.scrape_product_by_identifier("identifier")
  #    dont_allow(subject).update_product
  #  end
  #
  #end

end