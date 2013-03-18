#= require <base>

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