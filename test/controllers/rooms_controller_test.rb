require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    name = 'name'
    password = 'pass'

    User.create(name: name, password: password, password_confirmation: password)

    post create_user_session_path,
      params: { user: { name: name, password: password } }
  end

  test 'should get rooms' do
    get rooms_path
    assert_response :success
  end

  test 'should get room' do
    get room_path(rooms(:room_1))
    assert_response :success
  end

  teardown do
    delete destroy_user_session_path
  end
end
