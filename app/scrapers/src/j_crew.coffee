##= require <base>
#
#class JCrewScraper extends Base
#  constructor: (@casper, url) ->
#
#  getName: ->
#    document.querySelector('#pdp-title h1').textContent
#
#  getStyles: ->
#    styles = []
#
#    for variant in document.querySelectorAll('#productColor0 option')
#      if variant.value?
#        style = {
#        url: variant.getAttribute('mainimg')
#        name: variant.textContent
#        }
#        styles.push style
#    styles
#
#
#  getMeasurementGroups: ->
#    groups = []
#    if document.querySelectorAll('.pdp-single').length > 0
#      groups = ["Regular"]
#    else
#      for group in document.querySelectorAll('.pdp-shapes .shape-details .shape-name')
#        groups.push group.textContent
#    groups
#
#
#  getIdentifier: ->
#    id = null
#    if document.querySelector('.itemid-single')?
#      id = document.querySelector('.itemid-single').textContent.replace("item ", "")
#    else if
#    id = document.querySelector('.itemid').textContent.replace("item ", "")
#    id
#
#
#  getSizes: ->
#    sizes = []
#
#    for size in document.querySelectorAll('#sizeSelect0 option')
#      if size.value?
#        sizes.push size.value
#
#    sizes
#
#  getCategory: ->
#    cheetahTopCategoryID
#
#  getMaterials: ->
#    null
#
#  getBrand: ->
#    "J Crew"
#
#  getGender: ->
#    cheetahTopCategoryName
#
#  categoryLinks: [
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
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33240',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33496',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33242',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33205',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33202',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33277',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33174',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33192',
#    'http://store.americanapparel.net/subCategory/index.jsp?subCatId=cat33238'
#  ]
#
#  getProductLinks: ->
#    links = []
#    nodes = document.querySelectorAll('.arrayCopy .arrayProdName a')
#    for i in [0..nodes.length-1]
#      links.push nodes[i].href
#    links
