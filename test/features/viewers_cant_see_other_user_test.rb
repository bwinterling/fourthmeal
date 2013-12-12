require './test/test_helper'

class ViewersCantSeeOtherUserTest < Capybara::Rails::TestCase

  def test_logged_in_user_cannot_view_other_users_info
    User.create({full_name: 'benny bean', display_name: 'benny',  password: 'password', email: 'benny@example.com'})
    user2 = User.create({full_name: 'bree bird', display_name: 'bird', password: 'password', email: 'bird@example.com'})

    visit root_path
    click_on "sign-up-log-in"
    within "#main-body" do
      assert_content page, "Log in"
    end

    within "#login-form" do
      fill_in "email", with: 'benny@example.com'
      fill_in "password", with: 'password'
      click_button "Log In"
    end

    refute_content page, "Invalid"

    within "#user-nav" do
      assert_content page, "Logged in as benny"
    end

    visit "/users/#{user2.id}"
    refute_content page, 'bree bird'
  end

  test "logged in user cannot create items" do
    User.create({full_name: 'benny bean', display_name: 'benny',  password: 'password', email: 'benny@example.com'})
    visit root_path
    click_on "sign-up-log-in"

    within "#main-body" do
      assert_content page, "Log in"
    end

    within "#login-form" do
      fill_in "email", with: 'benny@example.com'
      fill_in "password", with: 'password'
      click_button "Log In"
    end

    within "#user-nav" do
      assert_content page, "Logged in as benny"
    end

    visit 'items/new'
    assert_no_button("Create Item")
    assert_no_button("Add Item")
  end
end
