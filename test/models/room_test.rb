require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  setup do
    @user = users(:user_1)
    @room = Room.create(name: 'name')
  end

  test 'room should be valid' do
    room = Room.new(name: 'name')
    assert room.validate
  end

  test 'room has many users' do
    assert @room.respond_to?(:users)
  end

  test 'room has many messages' do
    assert @room.respond_to?(:messages)
  end

  test '#enter user' do
    @room.enter!(@user)
    assert @room.users.include?(@user)
  end
end
