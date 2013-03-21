#= require <base>

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
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/367501',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358002/Blazers'
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358004/Shirts',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358005/Trousers',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/361514/Jeans',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358006/Skirts',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358007/Knitwear',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/364001/Sweatshirts',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358008/T-shirts',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358050/Jackets',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358051/Blazers',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358052/Suits',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358056/Trousers',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/368001/Jeans',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/381001/Bermudas',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358053/Shirts',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358054/T-shirts',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/364002/Sweatshirts',
    'http://www.zara.com/webapp/wcs/stores/servlet/category/us/en/zara-nam-S2013/358055/Knitwear',
    ''
  ]

  getProductLinks: ->
    links = []
    nodes = document.querySelectorAll('.product:not(.hidden) a')
    for i in [0..nodes.length-1]
      links.push nodes[i].href
    links