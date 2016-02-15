@autoScroll = (el) ->
  bottomPosition = el.offset().top
  if Math.abs($(window).scrollTop() - bottomPosition) <= 1000
    $(window).scrollTop(bottomPosition)
