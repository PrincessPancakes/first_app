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
links = []

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



scrapeMultipleProducts = (scraper, links) ->
  casper.then ->
    i = 0
    casper.each links, (self, link) ->
      if link?
        unless debug && i > 5
          @then ->
            product = scrapeProduct(link, scraper)
            i++
            products.push product
  products


scrapeProductLinks = (scraper) ->
  log "Scraping product links"

#  links = []
#  casper.then ->
#    casper.each scraper.categoryLinks, (self, link) ->
##      temp = []
#      @then ->
#        log "Opening #{link}"
#        @open link
##      @then ->
##        temp = @evaluate scraper.getProductLinks)
##      links = links.concat(temp)
#  log links
#  links
  links = []
  casper.then ->
    casper.each scraper.categoryLinks, (self, link) ->
      @then ->
        log "Opening #{link}"
        @open link
      @then ->
        links = links.concat(@evaluate scraper.getProductLinks)
  links


scrapeAll = (scraper) ->
  links = []
  casper.then ->
    casper.each scraper.categoryLinks, (self, link) ->
      @then ->
        log "Opening #{link}"
        @open link
      @then ->
        links = links.concat(@evaluate scraper.getProductLinks)
  casper.then ->
    casper.each links, (self, link) ->
      if link?
        @then ->
          product = scrapeProduct(link, scraper)
          products.push product
  products





result = ""
state = ""

run = ->

  casper.start()

  if casper.cli.has("log")
    debug = true
  log "Start"

  brand = casper.cli.get(0)
  scraper = new (eval(brand + "Scraper"))(casper, url)

  if casper.cli.has("all") #scrape all products for the given brand
    log "All"
#    links = scrapeProductLinks(scraper)
#    result = scrapeMultipleProducts(scraper, links)
    result = scrapeAll(scraper)
    state = "all"
  else if casper.cli.has("links")
    log "Links"
    result = scrapeProductLinks(scraper)
    state = "links"
  else if casper.cli.has("url")
    url = casper.cli.get("url").replace(/STYLEKICK/g , "&")
    log "Single product: #{url}"
    result = scrapeProduct(url, scraper)
    state = "single"


  casper.run ->
    if state == "all"
      @echo JSON.stringify(products)
    else if state == "links"
      @echo JSON.stringify(links)
    else if state == "single"
      @echo JSON.stringify(product)
    @exit()

run()