require_relative 'scrape_error'
require 'json'

class CasperJS

  def initialize(brand)
    @brand = brand
  end

  def scrape_url(url)
    @url = url
    begin
      JSON.parse(run)
    rescue JSON::ParserError
      raise ScrapeError
    end
  end

  def scrape_links

  end


  private

  def path
    Rails.root.join('app/scrapers/')
  end

  def scraper_file
    "#{path}#{@brand.downcase}.coffee"
  end

  def run
    `casperjs "#{scraper_file}" "#{@brand.camelize}" "#{escaped_url}"`
  end

  def escaped_url
    @url.gsub("&","STYLEKICK")
  end
end