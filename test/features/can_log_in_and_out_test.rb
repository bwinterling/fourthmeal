require './test/test_helper'

class CanLogInAndOutTest < Capybara::Rails::TestCase

  test "user can sign up with valid params" do
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
  end

  test "test can log out" do
    user = create_valid_user
    visit log_in_path
    click_on "Log In"

    within "#login-form" do
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Log In"
    end
    click_on "Log out"
    assert_content page, "Logged out"
  end

  test "cannot sign up with invalid params" do
    visit root_path

    click_on "Sign up or Log in"

    within "#new_user" do
      fill_in "Email", with: 'benji@example.com'
      fill_in "Full name", with: 'Benjamin Franklin'
      fill_in "Display name", with: "bennybeans"
      click_button "Create User"
    end
    assert_content page, "can't be blank"
  end


end





