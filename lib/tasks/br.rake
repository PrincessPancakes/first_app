task :br => :environment do
  require 'csv'


  b = BrandScraper.new("Banana Republic")
  base = 'http://bananarepublic.gap.com/browse/product.do?pid='

  CSV.open(Rails.root.join("br_items.csv"), 'r').each do |row|
    b.scrape_product_by_url(base + row[0])
  end

end
