colorThief = new ColorThief()

$('[data-image]').each (i, elem) ->

  $elem = $(elem)
  url = $elem.attr('data-image')
  if url == null or url.length <= 0
    return
  $elem.addClass 'image-loading'
  $('<img/>').attr('src', url).load ->
    color = colorThief.getColor @
    $(@).remove()
    $('.content').css 'background-color', "rgba(#{color[0]},#{color[1]},#{color[2]},.1)"
    $('body').css 'background-color', "rgba(#{color[0]},#{color[1]},#{color[2]},.18)"
    $elem.css 'background-image', 'url(' + url + ')'
    $elem.removeClass 'image-loading'
    $elem.addClass 'image-ready'
