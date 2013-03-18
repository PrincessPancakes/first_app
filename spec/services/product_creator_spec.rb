require_relative '../../app/services/product_creator'
require_relative '../spec_helper_full'



describe ProductCreator do
  include SpecHelpers

  before do
    setup_database
    create(:category, name: "unknown")
    create(:brand, name: "Gap")
  end

  after do
    teardown_database
  end

  describe " given incomplete product information" do
    #it "marks the status as missing info" do
    #  Product.create!(name: "name")
    #end
  end

  describe "#create_or_update" do
    def check_product(product)
      product.name.must_equal "Striped PJ bottoms"
      product.identifier.must_equal "248929"
      product.brand.name.must_equal "Gap"

      product.styles.first.content.must_equal "blue stripe"
      product.measurement_groups.first.description.must_equal "Regular"

    end

    let(:response){{"name"=>"Striped PJ bottoms", "identifier"=>"248929", "category"=>"201072", "styles"=>[{"name"=>"blue stripe", "url"=>"http://www3.assets-gap.com/webcontent/0005/722/259/cn5722259.jpg"}], "groups"=>["Regular"], "sizes"=>["XS", "S", "M", "L", "XL", "XXL"], "materials"=>[{"fabric"=>"Cotton", "percent"=>"100.0"}], "brand"=>"Gap", "url" => "agdfg", "gender" => "men"}}
    it "creates a new entry when an existing one doesn't exist" do
      product = ProductCreator.create_or_update(response)
      Product.count.must_equal 1
      product.name.must_equal "Striped PJ bottoms"
      product.identifier.must_equal "248929"
      product.brand.name.must_equal "Gap"
      check_product(product)

    end

    it "updates a previous entry when one doesn't exist" do
      product = Product.create!(
          name: "a",
          category: Category.unknown,
          gender: "unisex",
          brand: Brand.find_by_name("Gap"),
          url: "agdfg",
          status: "incomplete",
          size_type: "SizeType::Alpha",
          identifier: "248929"
      )
      Product.count.must_equal 1

      ProductCreator.create_or_update(response)
      product.reload
      Product.count.must_equal 1
      check_product(product)


    end
  end
end









