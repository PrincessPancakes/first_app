#= require <base>

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