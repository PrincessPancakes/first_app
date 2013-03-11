#= require <gap>
#= require <american_apparel>
#= require <banana_republic>
#= require <club_monaco>
#= require <j_crew>

name = ""
identifier = ""
category = ""
styles = []
materials = []
groups = []
sizes = []
product = {}
brand = ""
scraper = null
products = []
gender = ""

casper = require('casper').create(
  httpStatusHandlers: {
  404: ->
    @echo "Not found - 404"
  500: ->
    @echo "Server error - 500"
  }
  headers: {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0'
  }
)

debug = false
log = (message) ->
  if debug
    casper.echo message

scrapeProduct = (url, scraper) ->
  scraper.setup(url)

  casper.then ->
    @open url

  casper.then ->
    name = @evaluate scraper.getName
    styles = @evaluate scraper.getStyles
    category = @evaluate scraper.getCategory
    materials = @evaluate scraper.getMaterials
    identifier = @evaluate scraper.getIdentifier
    sizes = @evaluate scraper.getSizes
    brand = @evaluate scraper.getBrand
    groups = @evaluate scraper.getMeasurementGroups
    gender = @evaluate scraper.getGender

    product = {
      name: name
      identifier: identifier
      category: category
      styles: styles
      groups: groups
      sizes: sizes
      materials: materials
      brand: brand
      url: url
      gender: gender
    }
    log JSON.stringify(product)
    product




scrapeProductLinks = (scraper) ->
  log "Scraping product links"

  links = []
  casper.each scraper.categoryLinks, (self, link) ->
    @then ->
      log "Opening #{link}"
      @open link
    @then ->
      links = links.concat(@evaluate scraper.getProductLinks)

  casper.then ->
    log "Product links scraped"
    log links

  casper.then ->
    i = 0
    casper.each links, (self, link) ->
      if !debug || i < 5
        @then ->
          product = scrapeProduct(link, scraper)
          i++
          products.push product




run = ->
  casper.start()

  if casper.cli.has("log")
    debug = true
  log "Start"

  brand = casper.cli.get(0)
  scraper = new (eval(brand + "Scraper"))(casper, url)

  if casper.cli.has("all") #scrape all products for the given brand
    log "All"
    scrapeProductLinks(scraper)
  else if casper.cli.has("url")
    url = casper.cli.get("url").replace(/STYLEKICK/g , "&")
    log "Single product: #{url}"
    scrapeProduct(url, scraper)


  casper.run ->
    if products.length > 1
      @echo JSON.stringify(products)
    else
      @echo JSON.stringify(product)
    @exit()

run()