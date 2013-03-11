#= require <base>

class AmericanApparelScraper extends Base
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