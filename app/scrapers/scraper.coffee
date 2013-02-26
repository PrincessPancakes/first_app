name = ""
identifier = ""
category = ""
styles = []
materials = []
groups = []
sizes = []
product = {}
brand = ""
mode = ''

scrape = ->


  casper = require('casper').create(
    httpStatusHandlers: {
    404: ->
      @echo "Not found - 404"
    500: ->
      @echo "Server error - 500"
    }
  )
  url = casper.cli.get(0).replace(/STYLEKICK/g , "&")



  casper.start url, ->


  casper.then ->
    scraper = new GapScraper()

    name = @evaluate scraper.getName
    styles = @evaluate scraper.getStyles
    category = @evaluate scraper.getCategory
    materials = @evaluate scraper.getMaterials
    identifier = @evaluate scraper.getIdentifier
    sizes = @evaluate scraper.getSizes
    brand = @evaluate scraper.getBrand
    groups = @evaluate scraper.getMeasurementGroups

    product = {
    name: name
    identifier: identifier
    category: category
    styles: styles
    groups: groups
    sizes: sizes
    materials: materials
    brand: brand
    }



  casper.run ->
    if identifier?
      @echo JSON.stringify(product)
    else
      @echo "Not found"
    @exit()