require_relative '../spec_helper_full'

describe ProductScraper do
  include SpecHelpers

  before do
    setup_database
  end

  after do
    teardown_database
  end


  let(:response){'{"name":"Lived-in slim khaki","identifier":"243639","category":"251","styles":[{"name":"tile blue","url":"http://www1.assets-gap.com/webcontent/0005/908/379/cn5908379.jpg"},{"name":"pixie green","url":"http://www1.assets-gap.com/webcontent/0006/114/136/cn6114136.jpg"},{"name":"urban blue","url":"http://www1.assets-gap.com/webcontent/0005/920/414/cn5920414.jpg"},{"name":"canary yellow","url":"http://www3.assets-gap.com/webcontent/0005/920/420/cn5920420.jpg"},{"name":"bainbridge blue","url":"http://www3.assets-gap.com/webcontent/0005/909/064/cn5909064.jpg"},{"name":"hula red","url":"http://www3.assets-gap.com/webcontent/0005/909/059/cn5909059.jpg"},{"name":"coral garden","url":"http://www1.assets-gap.com/webcontent/0005/731/010/cn5731010.jpg"},{"name":"storm cloud","url":"http://www3.assets-gap.com/webcontent/0005/730/998/cn5730998.jpg"},{"name":"shadow ","url":"http://www3.assets-gap.com/webcontent/0005/084/873/cn5084873.jpg"},{"name":"cream caramel","url":"http://www3.assets-gap.com/webcontent/0004/994/670/cn4994670.jpg"},{"name":"tapestry navy","url":"http://www1.assets-gap.com/webcontent/0005/084/858/cn5084858.jpg"},{"name":"pine needle","url":"http://www3.assets-gap.com/webcontent/0005/295/888/cn5295888.jpg"},{"name":"deep grape","url":"http://www1.assets-gap.com/webcontent/0005/295/867/cn5295867.jpg"},{"name":"coffee pot","url":"http://www3.assets-gap.com/webcontent/0005/295/873/cn5295873.jpg"},{"name":"olive green","url":"http://www3.assets-gap.com/webcontent/0005/084/851/cn5084851.jpg"},{"name":"turquoise sky","url":"http://www3.assets-gap.com/webcontent/0005/084/839/cn5084839.jpg"},{"name":"raw sienna","url":"http://www3.assets-gap.com/webcontent/0004/991/311/cn4991311.jpg"},{"name":"chimney red","url":"http://www3.assets-gap.com/webcontent/0004/994/658/cn4994658.jpg"}],"groups":["Regular", "Tall"],"sizes":["XS","S","M","L","XL"],"materials":[{"fabric":"Cotton","percent":"100.0"}]}'}


  it "creates a product" do
    FactoryGirl.create(:banana_republic)
    FactoryGirl.create(:long_sleeve)
    FactoryGirl.create(:t_shirts)
    FactoryGirl.create(:sleeveless)

    puts Category.all.inspect

    scraper = Scraper.new("url")
    scraper.response = response
    scraper.parse_json

    scraper.parse
  end
  let(:response){'{"name":"Lived-in slim khaki","identifier":"243639","category":"251","styles":[{"name":"raw sienna","url":"http://www3.assets-gap.com/webcontent/0004/991/311/cn4991311.jpg"},{"name":"chimney red","url":"http://www3.assets-gap.com/webcontent/0004/994/658/cn4994658.jpg"}],"groups":["Regular", "Tall"],"sizes":["XS","S","M","L","XL"],"materials":[{"fabric":"Cotton","percent":"100.0"}]}'}

  describe "given a product that already exists" do
    it "updates the product" do

    end
  end

  describe "given a new product"
end
