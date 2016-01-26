require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    room = rooms(:room_1)
    user = users(:user_1)
    @message = Message.new(room: room, user: user, content: 'text')
  end

  test 'validate successfully' do
    assert @message.validate, 'message should be valid'
  end

  test 'invalid message' do
    invalid_message = Message.new(content: 'text')
    assert_not invalid_message.validate, 'message should be invalid'
  end

  test 'message belong to user' do
    assert @message.respond_to?(:user)
  end

  test 'message belong to room' do
    assert @message.respond_to?(:room)
  end
end
