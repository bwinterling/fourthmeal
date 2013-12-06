require './test/test_helper'

class CheckoutAsGuestTest < Capybara::Rails::TestCase

  def test_guest_user_has_option_to_checkout
    item1 = create_valid_item
    visit root_path

    within "#item_#{item1.id}" do
      click_on "Add to Cart"
    end

    click_on "Checkout"
    assert page.has_link?("Guest Checkout")
  end

  def test_guest_user_can_checkout
    Capybara.reset!
    item1 = create_valid_item
    visit root_path

    within "#item_#{item1.id}" do
      click_on "Add to Cart"
    end

    click_on "Checkout"

    within "#checkout-button-guest" do
      click_on "Guest Checkout"
    end

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
