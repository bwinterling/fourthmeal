require './test/test_helper'


class ViewersCantSeeOtherUserTest < Capybara::Rails::TestCase

  test "logged in user cannot view other user's info" do
    user1 = User.create({full_name: 'benny bean', password: 'password'})
    user2 = User.create({full_name: 'bree bird', password: 'password'})

    visit root_path
    click_on "Login"

    fill_in "Username", with: 'benny bean'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit user_path(user2)
    refute_content page, 'bree bird'
  end


  

  test "logged in user cannot create items" do
    user1 = User.create({full_name: 'benny bean', password: 'password'})
    visit root_path
    click_on "Login"

    fill_in "email", with: 'ben@example.com'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit new_item_path
    refute_content page, "Create an Item"
  end
end
