require './test/test_helper'

class CheckoutAsAuthenticatedShopperTest < Capybara::Rails::TestCase

  def test_authenticated_shopper_can_checkout
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

    # Capybara.current_driver = :selenium
    # within ".new-transaction" do
    #   fill_in "First name", with: "Bob"
    #   fill_in "Last name", with: "Hope"
    #   fill_in "Zipcode", with: "12345"
    #   click_on "Pay with Card"
    # end
    # See some form of confirmation (what is it?)
  end

end
