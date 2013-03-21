class Base
  setup: (url) ->

  beforeGender: ->
  afterGender: (url) ->


  beforeCategory: ->
  afterCategory: (url) ->

  returnToUrl: (url) ->
    casper.then ->
      casper.open url

  getSizeChart: (id) ->



class ZaraScraper extends Base
  constructor: (@casper, url) ->

  getName: ->
    document.querySelector('h1').textContent.trim()

  getStyles: ->
    id = document.querySelector('#reference').textContent.trim().substring(5)
    styles = []

    for color in document.querySelectorAll('#colors label')
      code = color.getAttribute('data-colorcode')
      style = {
        url: "http://static.zara.net/photos/2013/V/0/2/p/#{id}/#{code}/2/#{id.replace('/','')}#{code}_1_1_3.jpg"
        name: color.querySelector('a').getAttribute('title')
      }
      styles.push style
    styles

  getMeasurementGroups: ->
    ["Regular"]

  getIdentifier: ->
    document.querySelector('#reference').textContent.trim().substring(5)
  #    document.querySelector('.style').textContent

  getSizes: ->
    sizes = []
    for size in document.querySelectorAll('.size-select .size-name')
      sizes.push size.textContent.trim()
    sizes

  getCategory: ->
    document.querySelector('ul.current li.current').textContent.trim()

  getGender: ->
    map = {
      "Man" : "men"
      "Woman" : "women"
    }
    g = document.querySelector('#menu li.current a').textContent.trim()
    map[g]


  getMaterials: ->
    null

  getBrand: ->
    "Zara"





  categoryLinks: [
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16248126&size=99&cp=12243590.12266442.12454409.16248126&ab=ln_women_apparel_longsleeve',
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
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454432&size=99&cp=12243591.12280933.12454432&ab=ln_men_apparel_casualshirts',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454431&size=99&cp=12243591.12280933.12454431&ab=ln_men_apparel_dressshirts',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454392&size=99&cp=12243591.12280933.12454392&ab=ln_men_apparel_sweaters',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=19748246&size=99&cp=12243591.12280933.19748246&ab=ln_men_apparel_polos',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454424&size=99&cp=12243591.12280933.12454389.12454424&ab=ln_men_apparel_shortsleeve',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=16247756&size=99&cp=12243591.12280933.12454389.16247756&ab=ln_men_apparel_longsleeve'
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454425&size=99&cp=12243591.12280933.12454425&ab=ln_men_apparel_sweatshirtssweatpants',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454397&size=99&cp=12243591.12280933.12454397&ab=ln_men_apparel_pants'
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll('.product-details-a a')
    for i in [0..nodes.length-1]
      links.push nodes[i].href
    links


class UniqloScraper extends Base
  constructor: (@casper, url) ->

  getName: ->
    document.querySelector("#product-name").textContent
  #    document.querySelector('.product-title').textContent

  getStyles: ->
    styles = []

    evObj = document.createEvent('MouseEvents')
    evObj.initEvent( 'mouseover', true, false )

    for color in document.querySelectorAll('[color]')
      color.dispatchEvent(evObj)

      style = {
        name: color.getAttribute("title").toLowerCase()
        url: document.querySelector('#prodMainImg img').src
      }
      styles.push style
    styles

  getMeasurementGroups: ->
    ["Regular"]

  getIdentifier: ->
    document.querySelector("#item-code").textContent.substring(10)
  #    document.querySelector('.style').textContent

  getSizes: ->
    sizes = []
    for node in document.querySelectorAll('[size]')
      sizes.push node.getAttribute('sizenm')
    sizes

  getCategory: ->
    document.querySelector("[category] a").textContent

  getGender: ->
    document.querySelector("[category]").getAttribute("category").toLowerCase()


  getMaterials: ->
    null

  getBrand: ->
    "Uniqlo"

  getSizeChart: (id) ->
#    first table
    #table = $('.fancybox-iframe').contents().find('.productName').next()

#second table
    #table = $('.fancybox-iframe').contents().find('.productName').next().next()

    #find the size title
    #$(table.contents().find('.header01')[1]).text()

    #get the rows
    #rows = table.find('tr').slice(2)

    #iterate through the rows
    #$(rows[2]).find('td')[0].textContent
#    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" ></script>


#    $ = window.jQuery
    data = {}
    casper.then ->
      casper.open "http://www.uniqlo.com/us/store/support/size/#{id}_size.html"
#    document.querySelector('.sizechart').click()
    casper.then ->
      log data = casper.evaluate ->
        doc = document.querySelector('.fancybox-iframe').contentWindow.document

        table = doc.querySelector('.productName').nextElementSibling
        sizes = table.querySelectorAll('.header01')
        rows = Array.prototype.slice.call(table.querySelectorAll('tr'), 2)


        for i in [1..3]
          size = sizes[i].textContent
          data[size] = {}
          for j in rows
            measure = $(rows[j]).find('td')[0].textContent
            data[size][measure] = rows[j].querySelectorAll('td')[(i-1)*2].textContent
        data
    data

#    for(i=1;i<4;i++){j=0;for(j=0; j<rows.length;j++){console.log($(rows[j]).find('td')[(i-1)*2].textContent)}}




  categoryLinks: [
    'http://www.clubmonaco.com/family/index.jsp?categoryId=16248126&size=99&cp=12243590.12266442.12454409.16248126&ab=ln_women_apparel_longsleeve',
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
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454432&size=99&cp=12243591.12280933.12454432&ab=ln_men_apparel_casualshirts',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454431&size=99&cp=12243591.12280933.12454431&ab=ln_men_apparel_dressshirts',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454392&size=99&cp=12243591.12280933.12454392&ab=ln_men_apparel_sweaters',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=19748246&size=99&cp=12243591.12280933.19748246&ab=ln_men_apparel_polos',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454424&size=99&cp=12243591.12280933.12454389.12454424&ab=ln_men_apparel_shortsleeve',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=16247756&size=99&cp=12243591.12280933.12454389.16247756&ab=ln_men_apparel_longsleeve'
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454425&size=99&cp=12243591.12280933.12454425&ab=ln_men_apparel_sweatshirtssweatpants',
    #    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454397&size=99&cp=12243591.12280933.12454397&ab=ln_men_apparel_pants'
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll('.product-details-a a')
    for i in [0..nodes.length-1]
      links.push nodes[i].href
    links


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


class AmericanApparelScraper extends Base
  constructor: (@casper, url) ->

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


  findPage: (id) ->
    document.querySelector("#imgGrid_#{id}")

  beforeCategory: =>
    log "Before category"

    identifier = casper.evaluate @getIdentifier
    log "#{identifier}"

    page = null
    pages = @categoryLinks
    findPage = @findPage
    casper.then ->
      casper.each pages, (self, link) ->

        casper.then ->
          log "Opening #{link}"
          casper.open link
        casper.then ->
          if casper.evaluate(findPage, identifier)
            log "found product on page"
            page = link
            log "found on category page: #{page}"
          else
            log "Did not find product on page"
    casper.then ->
      log "Opening found category page: #{page}"
      casper.open page

  getCategory: (id) ->
    "unknown"
    n = document.querySelector("#imgGrid_#{id}").parentNode.parentNode.parentNode
    found = false
    while(!found)
      n = n.previousSibling
      if(n.className=="sectionLabel")
        found=true
    n.textContent.trim()

#    found=false;while(!found){n = n.previousSibling; if(n.className=="sectionLabel"){found=true}}; n.textContent.trim();

  afterCategory: (url) ->
    @returnToUrl(url)

  beforeGender: (id) ->
    casper.then ->
      @evaluate ->
        document.querySelector('#search').value = id
    casper.then ->
      @click '.search .button'

  getGender: ->
    filters = document.querySelectorAll('.searchFilters a')
    men = false
    women = false

    for filter in filters
      if filter.textContent.trim().substring(0,3) == "Men"
        men = true
      else if filter.textContent.trim().substring(0,5) == "Women"
        women = true

    if men and women
      return "unisex"
    else if men
      return "men"
    else if women
      return "women"
    else
      "unknown"
#    document.querySelectorAll('.breadCrumbs a')[1].textContent

  after_gender: (url) =>
    casper.then ->
      casper.open url

  getMaterials: ->
    null

  getBrand: ->
    "American Apparel"

  categoryLinks: [
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33294',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33401',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33306',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33490',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33209',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33247',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33284',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33194',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33232',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33188',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33240',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33496',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33242',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33205',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33202',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33277',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33174',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33192',
    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33238'
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll('.product a')
    for i in [0..nodes.length-1]
      links.push nodes[i].href
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


class ClubMonacoScraper extends Base
  constructor: (@casper, url) ->

  goToUSSite: (url) ->
    casper.evaluate ->
      cstmlnktrk.geotargetIPRerouteCA2US()
    casper.then ->
      casper.open url

  setup: (url) =>
    @goToUSSite(url)

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
    c = document.querySelectorAll('li.active')
    c[c.length-1].textContent.trim()

  getGender: ->
    document.querySelector('.breadcrumbs').children[1].textContent.replace("/ ", "").toLowerCase()


  getMaterials: ->
    null

  getBrand: ->
    "Club Monaco"





  categoryLinks: [
   'http://www.clubmonaco.com/family/index.jsp?categoryId=16248126&size=99&cp=12243590.12266442.12454409.16248126&ab=ln_women_apparel_longsleeve',
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
#    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454432&size=99&cp=12243591.12280933.12454432&ab=ln_men_apparel_casualshirts',
#    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454431&size=99&cp=12243591.12280933.12454431&ab=ln_men_apparel_dressshirts',
#    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454392&size=99&cp=12243591.12280933.12454392&ab=ln_men_apparel_sweaters',
#    'http://www.clubmonaco.com/family/index.jsp?categoryId=19748246&size=99&cp=12243591.12280933.19748246&ab=ln_men_apparel_polos',
#    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454424&size=99&cp=12243591.12280933.12454389.12454424&ab=ln_men_apparel_shortsleeve',
#    'http://www.clubmonaco.com/family/index.jsp?categoryId=16247756&size=99&cp=12243591.12280933.12454389.16247756&ab=ln_men_apparel_longsleeve'
#    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454425&size=99&cp=12243591.12280933.12454425&ab=ln_men_apparel_sweatshirtssweatpants',
#    'http://www.clubmonaco.com/family/index.jsp?categoryId=12454397&size=99&cp=12243591.12280933.12454397&ab=ln_men_apparel_pants'
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll('.product-details-a a')
    for i in [0..nodes.length-1]
      links.push nodes[i].href
    links


class JCrewScraper extends Base
  constructor: (@casper, url) ->

  getName: ->
    document.querySelector('#pdp-title h1').textContent

  setup: (url) ->
    casper.evaluate ->
      closeWelMatPopUp()

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
    else
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
    'http://www.jcrew.com/mens_category/shirts.jsp?iNextCategory=-1',
    'http://www.jcrew.com/mens_category/sweaters.jsp',
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
    identifier = @evaluate scraper.getIdentifier
    name = @evaluate scraper.getName
    styles = @evaluate scraper.getStyles
#    styles = scraper.getStyles
  casper.then ->
    scraper.beforeCategory()
  casper.then ->
    category = @evaluate(scraper.getCategory, identifier)
  casper.then ->
    scraper.afterCategory(url)
  casper.then ->
    materials = @evaluate scraper.getMaterials
    sizes = @evaluate scraper.getSizes
    brand = @evaluate scraper.getBrand
    groups = @evaluate scraper.getMeasurementGroups
  casper.then ->
    scraper.beforeGender(identifier)
  casper.then ->
    gender = @evaluate scraper.getGender
  casper.then ->
    scraper.afterGender(url)
  casper.then ->
    data = scraper.getSizeChart(identifier)

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
