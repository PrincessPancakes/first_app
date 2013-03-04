#= require <base>

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