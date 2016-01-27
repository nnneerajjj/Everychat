require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(name: 'name', password: 'pass', password_confirmation: 'pass')

    post create_user_session_path,
      params: { user: { name: 'name', password: 'pass' } }
  end

  test 'should get rooms' do
    get rooms_path
    assert_response :success
  end

  test 'should get room' do
    get room_path(rooms(:room_1))
    assert_response :success
  end
end
