require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(name: 'user', password: 'pass')
  end

  test 'validate successfully' do
    assert @user.validate, 'user should be valid'
  end

  test 'user name should not be blank' do
    user = User.new(password: 'pass')
    assert_not user.validate
  end

  test 'user name should be uniqueness' do
    same_name = 'user_same_name'
    user1 = User.new(name: same_name, password: 'pass')
    user2 = User.new(name: same_name, password: 'pass')
    user1.save
    assert_not user2.save
  end

  test 'user name should be only alphabetic, numeric, hyphen and underscore' do
    assert User.new(name: '-_', password: 'pass').validate
    assert User.new(name: '1234', password: 'pass').validate
    assert User.new(name: 'user_name-1234', password: 'pass').validate
    assert_not User.new(name: 'user/1', password: 'pass').validate
    assert_not User.new(name: 'user<1>', password: 'pass').validate
    assert_not User.new(name: 'ユーザ名', password: 'pass').validate
    assert_not User.new(name: 'abcdefghijklmnopqrstuvwxyz12345', password: 'pass').validate
  end

  test 'user has many messages' do
    assert @user.respond_to?(:messages)
  end

  test 'user has and belongs to many rooms' do
    assert @user.respond_to?(:rooms)
  end
end
