require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(name: 'user', password: 'pass', password_confirmation: 'pass')
  end

  test 'validate successfully' do
    assert @user.validate
  end

  test 'user has many messages' do
    assert @user.respond_to?(:messages)
  end

  test 'user has and belongs to many rooms' do
    assert @user.respond_to?(:rooms)
  end
end
