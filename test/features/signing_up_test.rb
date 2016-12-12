require "test_helper"

class SigningUpTest < Capybara::Rails::TestCase
  test "user can successfully sign up" do
    visit "/users/sign_up"
    fill_in "Email",    with: "some_user@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign up"
    assert has_current_path?(root_path)
  end

  test "signing up fails if email is not unique" do
    visit "/users/sign_up"
    fill_in "Email",    with: "existing_user@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign up"
    assert_not page.has_current_path?(root_path)
    assert page.has_content?("Email has already been taken")
  end

  # no email
  test "signing up fails without email" do
    visit "/users/sign_up"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign up"
    assert_not page.has_current_path?(root_path)
    assert page.has_content?("Email can't be blank")
  end
end
