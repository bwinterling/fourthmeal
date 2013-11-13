require './test/test_helper'

class CanLogInAndOutTest < Capybara::Rails::TestCase

  test "user can sign up, log in, and log out" do

    visit root_path

    click_on "Sign up or Log in"

    within "#new_user" do
      fill_in "Email", with: 'benji@example.com'
      fill_in "Full name", with: 'Benjamin Franklin'
      fill_in "Display name", with: "bennybeans"
      fill_in "Password", with: 'password'
      fill_in "Password confirmation", with: 'password'
      click_button "Create User"
    end

    assert_content page, 'Logged in'

    click_on "Log out"

    assert_content page, 'Logged out!'

    click_on "Sign up or Log in"

    within "#login-form" do
      fill_in "email", with: 'benji@example.com'
      fill_in "password", with: 'password'
      click_button "Log In"
    end

    assert_content page, 'Logged in'
  end

end

