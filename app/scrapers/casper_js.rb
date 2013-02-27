require_relative 'scrape_error'
require 'json'

class CasperJS

  def initialize(brand)
    @brand = brand
  end

  def scrape_url(url)
    @url = url

    begin
      response = scrape_product
      #puts response.inspect
      JSON.parse(response)
    rescue JSON::ParserError
      #puts response.inspect
      raise ScrapeError
    end
  end

  def scrape_all
    begin
      JSON.parse(scrape_all_products)
    rescue JSON::ParserError
      raise ScrapeError
    end
  end

  #private

  def path
    Rails.root.join('app/scrapers/')
  end

  def scraper_file
    #"#{path}#{@brand.downcase}.coffee"
    "#{path}gap.coffee"
  end

  def scrape_product
    #puts "scraping"

    `casperjs "#{scraper_file}" "#{brand}" "#{escaped_url}"`
  end

  def brand
    @brand.camelize.gsub(/\s+/, "")
  end

  def scrape_all_products
    `casperjs "#{scraper_file}" "#{@brand.camelize}" --all`
  end

  #we escape the url to prevent the & symbol from running casperjs as a background process
  def escaped_url
    @url.gsub("&","STYLEKICK")
  end
end