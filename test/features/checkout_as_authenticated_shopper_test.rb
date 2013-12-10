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
