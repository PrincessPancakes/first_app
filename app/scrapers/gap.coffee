casper = require('casper').create()
name = ""
identifier = ""
category = ""
styles = []
materials = []
groups = []
sizes = []
product = {}

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

  #"http://www.gap.com/browse/product.do?cid=11889&vid=1&pid=243639082"
casper.start url, ->


casper.then ->
  name = @evaluate getName
  styles = @evaluate getStyles
  category = @evaluate getCategory
  materials = @evaluate getMaterials
  identifier = @evaluate getIdentifier
  sizes = @evaluate getSizes

  product = {
    name: name
    identifier: identifier
    category: category
    styles: styles
    groups: groups
    sizes: sizes
    materials: materials
  }



casper.run ->
#  @echo url
  @echo JSON.stringify(product)
  @exit()


