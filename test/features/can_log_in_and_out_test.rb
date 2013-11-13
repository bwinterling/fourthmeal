require './test/test_helper'

class CanLogInAndOutTest < Capybara::Rails::TestCase

  test "user can log in and out" do
    user = User.new
    user.email = 'ben@example.com'
    user.password = 'password'
    user.save

    visit root_path

    click_on "Log In"

    fill_in "email", with: 'ben@example.com'
    fill_in "Password", with: 'password'
    click_button "Login"

    assert_content page, 'logged in'

    click_on "Logout"

    assert_content page, "Logged out"
    refute_content page, "Logout"

  end

end

