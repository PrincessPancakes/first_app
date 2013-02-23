require_relative '../../app/services/product_creator'
require_relative '../spec_helper_nulldb'

describe ProductCreator do
  include SpecHelpers

  before do
    setup_nulldb
  end

  after do
    teardown_nulldb
  end

  describe " given incomplete product information" do
    it "marks the status as missing info" do
      Product.create!(name: "name")
    end


  end
end