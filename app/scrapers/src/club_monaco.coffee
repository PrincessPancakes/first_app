#= require <base>

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
    document.querySelector('.active-sub').text

  getMaterials: ->
    null

  getBrand: ->
    "Club Monaco"

  getGender: ->
    document.querySelector('.breadcrumbs').children[1].textContent.replace("/ ", "").toLowerCase()



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