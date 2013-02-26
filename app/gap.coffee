casper = require('casper').create()
name = ""
identifier = ""
category = ""
styles = []
materials = []
groups = []
sizes = []
product = {}
mode = ''


class GapScraper

  constructor: ->

  getName: = ->
    productPage.objP.strProductStyleName

url = casper.cli.get(0).replace(/STYLEKICK/g , "&")

getName = ->
  productPage.objP.strProductStyleName

getStyles = ->
  styles = []

  for variant in productPage.objV.arrayVariantStyleColors
    style = {
      url: variant.styleColorImagesMap.Z.src
      name: variant.strColorName
    }
    styles.push style
  styles

getMeasurementGroups = ->
  groups = []

  groups.push productPage.objP.arrayVariantStyles[1].strVariantName
  groups.push productPage.objP.arrayVariantStyles[2].strVariantName if productPage.objP.arrayVariantStyles[2]?
  groups.push productPage.objP.arrayVariantStyles[3].strVariantName if productPage.objP.arrayVariantStyles[3]?

  groups

getIdentifier = ->
  productPage.productId

getSizes = ->
  sizes = []
#  list = productPage.objP.arrayVariantStyles[1].objStyleSizeInfo.strSizeDimension1ListOptions.split(/(\w+)(\^[,]\^\d+[|]*[|]*)/)
#  for entry in list
#    if entry.match(/^\w+/)
#      sizes.push entry.match(/^\w+/)[0]
  for size in productPage.arrayAllSizeDimension1
    sizes.push size.strName
  sizes

getCategory = ->
  productPage.objP.strProductType

getMaterials = ->
  materials = []
  for fabric in productPage.objP.arrayFabricContent
    material = {
      fabric: fabric.strName
      percent: fabric.strPercent
    }
    materials.push(material)
  materials

getBrand = ->
  "Banana Republic"


#  "http://www.gap.com/browse/product.do?cid=11889&vid=1&pid=243639082"
casper.start url, ->


casper.then ->
  name = @evaluate getName
  styles = @evaluate getStyles
  category = @evaluate getCategory
  materials = @evaluate getMaterials
  identifier = @evaluate getIdentifier
  sizes = @evaluate getSizes
  brand = @evaluate getBrand

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
#  @echo url
  @echo JSON.stringify(product)
  @exit()
#currentLink = 0
#links = []
#
## Just opens the page and prints the title
#start = (link) ->
#  @open link, ->
##    @echo "Page title: #{ @getTitle() }"
#
#getProduct = (link) ->
#  @echo "Getting product"
#  @open link, ->
#
#  @then ->
#    @echo "Page title: #{ @getTitle() }"
##    found = @evaluate searchLinks
##    @echo "#{found.length} links found on #{link}"
##    links = links.concat found


#base = "http://www.gap.com"
#scrapeLinks = ->
#  links = []
#  nodes = document.querySelectorAll("a.productItemName")
#  nodes[3].getAttribute('href')
#  for i in [0..nodes.length-1]
#    links.push ("http://www.gap.com#{nodes[i].getAttribute('href')}")
#  links
##  i = 0
##  while(i < nodes.length)
##    links.push (base + nodes[i].getAttribute('href'))
##  links


#getProductLinks = ->
#  @echo "Finding product links"
#  @open "http://www.gap.com/browse/category.do?cid=5225"
#  @then ->
#    links = @evaluate scrapeLinks
#
#check = ->
#  getProductLinks.call @ if links.length == 0
#  @echo links
#
#  if links[currentLink]
#    getProduct.call @, links[currentLink]
#    currentLink++
#    @run check
#  else
#    @exit()
#
#casper.start()
#
#casper.then ->
#  @open "http://www.gap.com/browse/category.do?cid=5225"
#
#
##  @echo "Starting"
#
#products = []
#
#casper.then ->
#  links = @evaluate scrapeLinks
##  @echo links
#casper.then ->
#  casper.each links, (self, link) ->
#    @then ->
#      @open link
#    @then ->
#      name = @evaluate getName
#      styles = @evaluate getStyles
#      category = @evaluate getCategory
#      materials = @evaluate getMaterials
#      identifier = @evaluate getIdentifier
#      sizes = @evaluate getSizes
#      brand = @evaluate getBrand
#
#      product = {
#        name: name
#        identifier: identifier
#        category: category
#        styles: styles
#        groups: groups
#        sizes: sizes
#        materials: materials
#        brand: brand
#      }
#      products.push product
#
#


#  for i in [0..links.length-1]
#    casper.then ->
#      @echo links[i]
#      @open links[i]
#    casper.then ->
#      name = @evaluate getName
#      @echo name
#




#casper.run ->
#  @echo JSON.stringify(products)
#  @exit()


#for i in [0..links-1]
#  @then ->
#  @open link
#  name = @evaluate getName
#  @echo name