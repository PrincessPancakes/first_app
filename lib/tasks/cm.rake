task :cm => :environment do
  require 'csv'

  b = BrandScraper.new("Club Monaco")
  base = 'http://www.clubmonaco.com/product/index.jsp?productId='

  CSV.open(Rails.root.join("cm_items.csv"), 'r').each do |row|
    b.scrape_product_by_url(base + row[0])
  end

end
