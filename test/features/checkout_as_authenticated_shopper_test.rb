require './test/test_helper'
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
    item1 = create_valid_item
    create_and_login_user
    visit root_path

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
      fill_in "Zipcode", with: "12345"
      click_on "Pay with Card"
    end

    assert page.has_content?('Pay')
  end

end
