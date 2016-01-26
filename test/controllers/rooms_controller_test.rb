require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test 'should get rooms' do
    get rooms_path
    assert_response :success
  end

  test 'should get room' do
    get room_path(rooms(:room_1))
    assert_response :success
  end
end
