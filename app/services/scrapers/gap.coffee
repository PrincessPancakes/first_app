getLinks = ->
  links = document.querySelectorAll "span.productName"
  Array.prototype.slice.call(links)
#  Array::map.call links, (e) -> e.getAttribute "href"

links = []
casper = require('casper').create()
name = ""
styles = []
image = ""



getName = ->
  document.querySelector("span.productName").innerHTML

getStyles = ->
  styles = []
#  nodes = document.querySelectorAll("#colorSwatchContent label")
#  for node in nodes
#    s = node.innerHTML
#    s = s.substring(0, s.length - 14) #removes " product image" from the string
#
#    id = node.getAttribute("for")
#    document.querySelector('#' + id)
#
#
#
#    styles.push(s)

  for variant in productPage.objV.arrayVariantStyleColors
    style = {
      url: variant.styleColorImagesMap.Z.src
      name: variant.strColorName
    }
    styles.push style
  styles
#  styles = nodes
#  Array::map.call links, (e) ->
#    e.innerHTML


getImage = ->
  document.querySelector("#product_image").getAttribute("src")



casper.start "http://www.gap.com/browse/product.do?cid=11889&vid=1&pid=243639082", ->


casper.then ->
  # aggregate results for the 'casperjs' search
#  links = @evaluate getLinks
  name = @evaluate getName
  styles = @evaluate getStyles
#  image = @evaluate getImage




casper.run ->
  # display results
#  @echo links.length + " links found:"
#  @echo image
#  @echo(styles.join("\n"))
  for style in styles
    @echo "#{style.name} - #{style.url}"
  @echo(styles.length).exit()



#getLinks = ->
#  links = document.querySelectorAll "h3.r a"
#  Array::map.call links, (e) -> e.getAttribute "href"
#
#links = []
#casper = require('casper').create()
#
#casper.start "http://google.fr/", ->
#  # search for 'casperjs' from google form
#  @fill "form[action='/search']", q: "casperjs", true
#
#casper.then ->
#  # aggregate results for the 'casperjs' search
#  links = @evaluate getLinks
#  # search for 'phantomjs' from google form
#  @fill "form[action='/search']", q: "phantomjs", true
#
#casper.then ->
#  # concat results for the 'phantomjs' search
#  links = links.concat @evaluate(getLinks)
#
#casper.run ->
#  # display results
#  @echo links.length + " links found:"
#  @echo(" - " + links.join("\n - ")).exit()