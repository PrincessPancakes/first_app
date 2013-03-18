require_relative '../spec_helper_lite'
stub_module "Rails" #for fast testing

require_relative '../../app/scrapers/casper_js'

#escaped_url = url.gsub("&","STYLEKICK")
#file = Rails.root.join "app/scrapers/#{@brand}.coffee"
#@response = `casperjs "#{file}" "#{escaped_url}"



describe CasperJS do
  subject do
    CasperJS.new("Gap").tap  do |c|
      stub(c).path{""}
    end
  end
  let(:url){"http://www.gap.com/browse/product.do?pid=350912"}

  describe "Successful scrape" do
    it "returns a parsed JSON object" do
      stub(subject).scrape_product{'{"a":"b"}'}
      subject.scrape_url(url).must_equal({"a"=>"b"})
    end
  end

  describe "Scrape Error" do
    it "raises an exception when there is a syntax error" do
      stub(subject).scrape_product{'SyntaxError: Parse error'}
      proc{subject.scrape_url(url)}.must_raise ScrapeError
    end

    it "raises an exception when there is no data found" do
      stub(subject).scrape_product{'Not found'}
      proc{subject.scrape_url(url)}.must_raise ScrapeError
    end
  end


end