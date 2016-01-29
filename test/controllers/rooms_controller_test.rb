require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    name = 'name'
    password = 'pass'

    User.create(name: name, password: password, password_confirmation: password)

    post create_user_session_path,
      params: { user: { name: name, password: password } }
    assert_response :redirect
  end

  test 'should get rooms' do
    get rooms_path
    assert_response :success
  end

  test 'should enter room' do
    room = rooms(:room_1)
    get room_path(room)
    assert_response :redirect
    put enter_room_path(room)
    get room_path(room)
    assert_response :success
  end

  teardown do
    delete destroy_user_session_path
    assert_response :redirect
  end
end
