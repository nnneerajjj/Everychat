require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  setup do
    @room = Room.new(name: 'name')
  end

  test 'room should be valid' do
    assert @room.validate
  end

  test 'room has many users' do
    assert @room.respond_to?(:users)
  end

  test 'room has many messages' do
    assert @room.respond_to?(:messages)
  end
end
