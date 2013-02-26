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


class GapScraper
  getName: ->
    productPage.objP.strProductStyleName


  getStyles: ->
    styles = []

    for variant in productPage.objV.arrayVariantStyleColors
      style = {
      url: variant.styleColorImagesMap.Z.src
      name: variant.strColorName
      }
      styles.push style
    styles

  getMeasurementGroups: ->
    groups = []

    groups.push productPage.objP.arrayVariantStyles[1].strVariantName
    groups.push productPage.objP.arrayVariantStyles[2].strVariantName if productPage.objP.arrayVariantStyles[2]?
    groups.push productPage.objP.arrayVariantStyles[3].strVariantName if productPage.objP.arrayVariantStyles[3]?

    groups

  getIdentifier: ->
    productPage.productId

  getSizes: ->
    sizes = []
    for size in productPage.arrayAllSizeDimension1
      sizes.push size.strName
    sizes

  getCategory: ->
    productPage.objP.strProductType

  getMaterials: ->
    materials = []
    for fabric in productPage.objP.arrayFabricContent
      material = {
      fabric: fabric.strName
      percent: fabric.strPercent
      }
      materials.push(material)
    materials

  getBrand: ->
    "Gap"


class BananaRepublicScraper extends GapScraper
  getBrand: ->
    "Banana Republic"




class ClubMonacoScraper
  constructor: (@casper, url) ->
    casper.evaluate ->
      cstmlnktrk.geotargetIPRerouteCA2US()
    casper.then ->
      casper.open url

  getName: ->
    ess.product.p.title
#    document.querySelector('.product-title').textContent

  getStyles: ->
    styles = []

    for variant in ess.product.p.colorSliceValues
      style = {
        url: "http://www.clubmonaco.com" + variant.mainImageURL
        name: variant.colorName
      }
      styles.push style
    styles

  getMeasurementGroups: ->
    ["Regular"]

  getIdentifier: ->
    ess.GET.productId
#    document.querySelector('.style').textContent

  getSizes: ->
    Object.keys(ess.sizes)

  getCategory: ->
    document.querySelector('.active-sub').text

  getMaterials: ->
    null

  getBrand: ->
    "Club Monaco"


class ProductScraper

  constructor: (@casper, @scraper) ->


  scrape: ->
    casper.echo "Scraping"

    casper.then ->

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

    casper.then ->
      if identifier?
        @echo JSON.stringify(product)
      else
        @echo "Not found"




scrape = ->


  brand = casper.cli.get(0)
  url = casper.cli.get(1).replace(/STYLEKICK/g , "&")


  casper.start url, ->
    scraper = new (eval(brand + "Scraper"))(casper, url)


  casper.then ->

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

  casper.then ->
    if identifier?
      @echo JSON.stringify(product)
    else
      @echo "Not found"

#  casper.then ->
#    new ProductScraper(casper, scraper).scrape

  casper.run ->
    @exit()

scrape()


#casper = require('casper').create()
#url = casper.cli.get(0)
#
#
#categories = [
#  'http://www.gap.com/browse/category.do?cid=17076',
#  'http://www.gap.com/browse/category.do?cid=34608',
#  'http://www.gap.com/browse/category.do?cid=65895',
#  'http://www.gap.com/browse/category.do?cid=5783',
#  'http://www.gap.com/browse/category.do?cid=5745',
#  'http://www.gap.com/browse/category.do?cid=13658',
#  'http://www.gap.com/browse/category.do?cid=5727',
#  'http://www.gap.com/browse/category.do?cid=5715',
#  'http://www.gap.com/browse/category.do?cid=57240',
#  'http://www.gap.com/browse/category.do?cid=78990',
#  'http://www.gap.com/browse/category.do?cid=5697',
#  'http://www.gap.com/browse/category.do?cid=5664',
#  'http://www.gap.com/browse/category.do?cid=5736',
#  'http://www.gap.com/browse/category.do?cid=5225',
#  'http://www.gap.com/browse/category.do?cid=83056',
#  'http://www.gap.com/browse/category.do?cid=15043',
#  'http://www.gap.com/browse/category.do?cid=5180',
#  'http://www.gap.com/browse/category.do?cid=8655',
#  'http://www.gap.com/browse/category.do?cid=5168',
#  'http://www.gap.com/browse/category.do?cid=6998',
#  'http://www.gap.com/browse/category.do?cid=5150',
#  'http://www.gap.com/browse/category.do?cid=80799',
#  'http://www.gap.com/browse/category.do?cid=5156',
#  'http://www.gap.com/browse/category.do?cid=5270'
#]
#
#
#casper.start ->
#
#casper.each categories, (self, link) ->
#  @then ->
#  @open link
#  @then ->
