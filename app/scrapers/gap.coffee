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

  categoryLinks: [
    'http://www.gap.com/browse/category.do?cid=17076',
    'http://www.gap.com/browse/category.do?cid=34608',
    'http://www.gap.com/browse/category.do?cid=65895',
    'http://www.gap.com/browse/category.do?cid=5783',
    'http://www.gap.com/browse/category.do?cid=5745',
    'http://www.gap.com/browse/category.do?cid=13658',
    'http://www.gap.com/browse/category.do?cid=5727',
    'http://www.gap.com/browse/category.do?cid=5715',
    'http://www.gap.com/browse/category.do?cid=57240',
    'http://www.gap.com/browse/category.do?cid=78990',
    'http://www.gap.com/browse/category.do?cid=5697',
    'http://www.gap.com/browse/category.do?cid=5664',
    'http://www.gap.com/browse/category.do?cid=5736',
    'http://www.gap.com/browse/category.do?cid=5225',
    'http://www.gap.com/browse/category.do?cid=83056',
    'http://www.gap.com/browse/category.do?cid=15043',
    'http://www.gap.com/browse/category.do?cid=5180',
    'http://www.gap.com/browse/category.do?cid=8655',
    'http://www.gap.com/browse/category.do?cid=5168',
    'http://www.gap.com/browse/category.do?cid=6998',
    'http://www.gap.com/browse/category.do?cid=5150',
    'http://www.gap.com/browse/category.do?cid=80799',
    'http://www.gap.com/browse/category.do?cid=5156',
    'http://www.gap.com/browse/category.do?cid=5270'
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll("a.productItemName")
    for i in [0..nodes.length-1]
      links.push ("http://www.gap.com#{nodes[i].getAttribute('href')}")
    links



class BananaRepublicScraper extends GapScraper
  getBrand: ->
    "Banana Republic"

  categoryLinks: [
    'http://bananarepublic.gap.com/browse/category.do?cid=44866',
    'http://bananarepublic.gap.com/browse/category.do?cid=79399',
    'http://bananarepublic.gap.com/browse/category.do?cid=44873',
    'http://bananarepublic.gap.com/browse/category.do?cid=44876',
    'http://bananarepublic.gap.com/browse/category.do?cid=10894',
    'http://bananarepublic.gap.com/browse/category.do?cid=80117',
    'http://bananarepublic.gap.com/browse/category.do?cid=28660',
    'http://bananarepublic.gap.com/browse/category.do?cid=14845',
    'http://bananarepublic.gap.com/browse/category.do?cid=5040',
    'http://bananarepublic.gap.com/browse/category.do?cid=43148',
    'http://bananarepublic.gap.com/browse/category.do?cid=5037',
    'http://bananarepublic.gap.com/browse/category.do?cid=5032',
    'http://bananarepublic.gap.com/browse/category.do?cid=86858',
    'http://bananarepublic.gap.com/browse/category.do?cid=67595',
    'http://bananarepublic.gap.com/browse/category.do?cid=5030'
  ]







class ClubMonacoScraper
  constructor: (@casper, url) ->
#    casper.evaluate ->
#      cstmlnktrk.geotargetIPRerouteCA2US()
#    casper.then ->
#      casper.open url

  getName: ->
    ess.product.p.title
#    document.querySelector('.product-title').textContent

  getStyles: ->
    styles = []

    for variant in ess.product.p.colorSliceValues
      style = {
        url: variant.mainImageURL
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

  categoryLinks: [
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16248126&size=99&cp=12243590.12266442.12454409.16248126&ab=ln_women_apparel_longsleeve',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16248136&size=99&cp=12243590.12266442.12454409.16248136&ab=ln_women_apparel_shortsleeve',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16248146&size=99&cp=12243590.12266442.12454409.16248146&ab=ln_women_apparel_sleeveless',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16248266&size=99&cp=12243590.12266442.12454410.16248266&ab=ln_women_apparel_roundneck',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16248286&size=99&cp=12243590.12266442.12454410.16248286&ab=ln_women_apparel_cardiganswraps',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16248296&size=99&cp=12243590.12266442.12454410.16248296&ab=ln_women_apparel_cashmere',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12759982&size=99&cp=12243590.12266442.12454408.12759982&ab=ln_women_apparel_longsleeve',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12759981&size=99&cp=12243590.12266442.12454408.12759981&ab=ln_women_apparel_shortsleeve',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12759980&size=99&cp=12243590.12266442.12454408.12759980&ab=ln_women_apparel_tankscamis',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12754144&size=99&cp=12243590.12266442.12754144&ab=ln_women_apparel_pants'
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454432&size=99&cp=12243591.12280933.12454432&ab=ln_men_apparel_casualshirts',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454431&size=99&cp=12243591.12280933.12454431&ab=ln_men_apparel_dressshirts',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454392&size=99&cp=12243591.12280933.12454392&ab=ln_men_apparel_sweaters',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12770707&size=99&cp=12243591.12280933.12454389.12770707&ab=ln_men_apparel_polos',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454424&size=99&cp=12243591.12280933.12454389.12454424&ab=ln_men_apparel_shortsleeve',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16247756&size=99&cp=12243591.12280933.12454389.16247756&ab=ln_men_apparel_longsleeve'
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454425&size=99&cp=12243591.12280933.12454425&ab=ln_men_apparel_sweatshirtssweatpants',
    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454397&size=99&cp=12243591.12280933.12454397&ab=ln_men_apparel_pants'
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll('.product-details-a a')
    for i in [0..nodes.length-1]
      links.push nodes[i].href
    links



class AmericanApparelScraper
  constructor: (@casper, url) ->
    #    casper.evaluate ->
    #      cstmlnktrk.geotargetIPRerouteCA2US()
    #    casper.then ->
    #      casper.open url

  getName: ->
    document.querySelector('.name').innerHTML.replace("<br>", " ")

  getStyles: ->
    styles = []

    for variant in document.querySelectorAll('.productDetails .colors .color')
      style = {
      url: variant.getAttribute("data-productdetailsimagelarge")
      name: variant.getAttribute("data-name")
      }
      styles.push style
    styles

  getMeasurementGroups: ->
    ["Regular"]

  getIdentifier: ->
    document.querySelector('.code').textContent

  getSizes: ->
    sizes = []

    for size in document.querySelectorAll('.productDetails .sizes .size')
      sizes.push size.getAttribute('data-name')

    sizes

  getCategory: ->
    "unknown"

  getMaterials: ->
    null

  getBrand: ->
    "American Apparel"

  categoryLinks: [
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33294',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33401',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33306',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33490',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33209',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33247',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33284',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33194',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33232',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33188',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33240',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33496',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33242',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33205',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33202',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33277',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33174',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33192',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33238'
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll('.product a')
    for i in [0..nodes.length-1]
      links.push nodes[i].href
    links




class JCrewScraper
  constructor: (@casper, url) ->
    #    casper.evaluate ->
    #      cstmlnktrk.geotargetIPRerouteCA2US()
    #    casper.then ->
    #      casper.open url

  getName: ->
    document.querySelector('#pdp-title h1').textContent

  getStyles: ->
    styles = []

    for variant in document.querySelectorAll('#productColor0 option')
      if variant.value?
        style = {
        url: variant.getAttribute('mainimg')
        name: variant.textContent
        }
        styles.push style
    styles


  getMeasurementGroups: ->
    groups = []
    if document.querySelectorAll('.pdp-single').length > 0
      groups = ["Regular"]
    else
      for group in document.querySelectorAll('.pdp-shapes .shape-details .shape-name')
        groups.push group.textContent
    groups


  getIdentifier: ->
    id = null
    if document.querySelector('.itemid-single')?
      id = document.querySelector('.itemid-single').textContent.replace("item ", "")
    else if
      id = document.querySelector('.itemid').textContent.replace("item ", "")
    id


  getSizes: ->
    sizes = []

    for size in document.querySelectorAll('#sizeSelect0 option')
      if size.value?
        sizes.push size.value

    sizes

  getCategory: ->
    cheetahTopCategoryID

  getMaterials: ->
    null

  getBrand: ->
    "J Crew"

  getGender: ->
    cheetahTopCategoryName

  categoryLinks: [
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33294',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33401',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33306',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33490',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33209',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33247',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33284',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33194',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33232',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33188',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33240',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33496',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33242',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33205',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33202',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33277',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33174',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33192',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33238'
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll('.arrayCopy .arrayProdName a')
    for i in [0..nodes.length-1]
      links.push nodes[i].href
    links




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







scrapeProduct = (url, scraper) ->
#  casper.echo "Scraping #{url}"

#  casper.start()

  casper.then ->
    @open url
#    casper.echo "Scraping #{url}"


  casper.then ->
#    casper.echo "Scraping #{url}"

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
    url: url
    }
    @echo JSON.stringify(product)


    product

#  casper.then ->
#    if identifier?
#      @echo JSON.stringify(product)
#    else
#      @echo "Not found"

#  casper.then ->
#    new ProductScraper(casper, scraper).scrape


goToUSSite = ->
  cstmlnktrk.geotargetIPRerouteCA2US()

scrapeProductLinks = (scraper) ->
  #  scraper = new (eval(brand + "Scraper"))(casper, url)

  casper.then ->
    @open 'http://www.clubmonaco.com/'



    @evaluate goToUSSite


  links = []
  casper.each scraper.categoryLinks, (self, link) ->
#    @then ->
#      @open link
#    @then ->
#      @evaluate ->
#        cstmlnktrk.geotargetIPRerouteCA2US()
    @then ->
      @open link
    #      @echo "opened #{link}"
    @then ->
#      @echo "Checkpoint #{link}"
      links = links.concat(@evaluate scraper.getProductLinks)
#      @echo "Checkpoint #{link}"
  #      links.concat(@evaluate scraper.getProductLinks)



  casper.then ->
#    @echo links
#
    casper.each links, (self, link) ->
      @then ->
##      @echo "opened #{link}"
        product = scrapeProduct(link, scraper)
        products.push product
#  products


run = ->

  brand = casper.cli.get(0)
  scraper = new (eval(brand + "Scraper"))(casper, url)

  casper.start()

  if casper.cli.has("all") #scrape all products for the given brand
    scrapeProductLinks(scraper)
  else #scrape the product specified by the url
#    casper.echo "Scrape single"
    url = casper.cli.get(1).replace(/STYLEKICK/g , "&")
    scrapeProduct(url, scraper)

  casper.run ->
    @echo JSON.stringify(products)
    @exit()


run()