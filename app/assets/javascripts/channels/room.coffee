App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#messages').append this.render_message(data)
    # $('#messages').append data['message']

  render_message: (data) ->
    if +$('#current_user_id').val() == data['user_id']
      """
      <div>
        <span>#{data['user_name']}</span>
        <div class="baloon-right">
          #{data['message_content']}
        </div>
      </div>
      """

    else
      """
      <div>
        <span>#{data['user_name']}</span>
        <div class="baloon-left">
          #{data['message_content']}
        </div>
      </div>
      """

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
