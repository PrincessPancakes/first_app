#= require <base>

class GapScraper extends Base
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
    cidMapper = {
      "251": "long sleeve"
      "248": "long sleeve"
      "276": "t-shirts"
      "260": "t-shirts"
      "247": "dress shirts"
      "259": "dress shirts"
      "257": "casual shirts"
      "252": "polos"
      "273": "sweaters"
      "245": "jackets"
      "235": "blazers"
      "268": "suit jackets"
      "269": "suit pants"
      "279": "vests"
      "343": "blouses"
      "384": "sleeveless"
      "379": "t-shirts"
      "380": "t-shirts"
      "298": "t-shirts"
      "344": "long sleeve"
      "293": "long sleeve"
      "396": "sweaters"
      "292": "blouses"
    }

    cid = productPage.objP.strProductType
    cidMapper[cid]


  getGender: ->
    cidMapper = {
    "251": "men"
    "248": "men"
    "276": "men"
    "260": "men"
    "247": "men"
    "259": "men"
    "257": "men"
    "252": "men"
    "273": "men"
    "245": "men"
    "235": "men"
    "268": "men"
    "269": "men"
    "279": "men"
    "343": "women"
    "384": "women"
    "379": "women"
    "380": "women"
    "298": "women"
    "344": "women"
    "293": "women"
    "396": "women"
    "292": "women"
    }
    cid = productPage.objP.strProductType
    cidMapper[cid]

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