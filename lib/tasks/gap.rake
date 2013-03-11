task :gap => :environment do
  require 'csv'


  b = BrandScraper.new("Gap")
  base = 'http://gap.com/browse/product.do?pid='

  CSV.open(Rails.root.join("gap_items.csv"), 'r').each do |row|
    b.scrape_product_by_url(base + row[0])
  end

end
