App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#messages').append this.render_message(data)
    autoScroll()

  render_message: (data) ->
    [align, balloon] =
      if +$('#current_user_id').val() == data['user_id']
        ['align-right', 'balloon-right']
      else
        ['align-left', 'balloon-left']

    $('<div />')
        .addClass("message #{align}")
        .append(
          $('<span />')
            .text(data['user_name'])

          $('<div />')
            .addClass(balloon)
            .text(data['message_content'])
        )

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
