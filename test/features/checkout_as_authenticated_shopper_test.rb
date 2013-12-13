require './test/test_helper'
require_relative '../helpers/restaurant_helper'
require 'database_cleaner'

class CheckoutAsAuthenticatedShopperTest < Capybara::Rails::TestCase

  DatabaseCleaner.strategy = :truncation

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_authenticated_shopper_can_checkout
    Capybara.current_driver = :selenium
    restaurant = create_valid_restaurant(:name => "Pdiddy")
    item1 = create_valid_item(restaurant.id)
    create_and_login_user

    visit restaurant_path(restaurant)
    within "#item_#{item1.id}" do
      click_on "Add to Cart"
    end

    click_on "Checkout"

    within "#transaction-container" do
      assert page.has_content?("Transaction Information")
    end

    within "#new_transaction" do
      fill_in "First name", with: "Bob"
      fill_in "Last name", with: "Hope"
      fill_in "Email", with: "shopper@example.com"
      fill_in "Zipcode", with: "12345"
      fill_in "Credit Card", with: "4242424242424242"
      fill_in "CVC", with: "123"
      fill_in "Exp Month (MM)", with: "10"
      fill_in "Exp Year (YYYY)", with: "2020"
      click_on "Submit"
    end

    assert page.has_content?('Successfully created your order')
  end

  def test_authenticated_shopper_sees_previous_billing_details
    skip
    Capybara.reset_sessions!
    item1 = create_valid_item
    user = create_and_login_user
    Order.create(:status => 'unpaid', :user_id => user.id)
    binding.pry
    create_transaction_for(user)
    binding.pry
    visit root_path
    binding.pry

    within "#item_#{item1.id}" do
      click_on "Add to Cart"
    end

    click_on "Checkout"

    within "#transaction-container" do
      assert page.has_content?("Transaction Information")
    end
    binding.pry
    within "#new_transaction" do
      assert page.has_content?("Bennny Smith")
      assert page.has_content?("Bennybeans")
      assert page.has_content?("foo@bar.com")
      assert page.has_content?("12345")
      #fill_in "First name", with: "Bob"
      #fill_in "Last name", with: "Hope"
      #fill_in "Zipcode", with: "12345"
    end

  end
end
