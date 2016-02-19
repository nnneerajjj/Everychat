$ ->
  $('.room-messages').scrollTop($('.room-messages').prop('scrollHeight'))

@autoScroll = ->
  height = $('.room-messages').prop('scrollHeight')
  if Math.abs(height - $('.room-messages').scrollTop()) <= 1000
    $('.room-messages').scrollTop(height)
