require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_user
    User.new(email: "user@example.com", password: "123456", password_confirmation: "123456")
  end

  test "user with correct email and password is valid" do
    assert valid_user.valid?
  end

  test "validation of password confirmation" do
    user = valid_user
    user.password_confirmation = "something wrong"
    assert user.invalid?
    assert_includes user.errors[:password_confirmation], "doesn't match Password"
  end

  test "validation of short password" do
    user = valid_user
    user.assign_attributes(password: "12", password_confirmation: "12")
    assert user.invalid?
    assert user.errors[:password].any? { |mes| mes =~ /is too short/ }
  end

  test "validation of email presence" do
    user = valid_user
    user.email = nil
    assert user.invalid?
    assert_includes user.errors[:email], "can't be blank"
  end

  # Password presence, email format, etc.
end
