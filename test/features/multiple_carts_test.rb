require_relative '../test_helper'
require_relative '../helpers/restaurant_helper'

class MultipleCartsTest < Capybara::Rails::TestCase

  def setup
    Restaurant.destroy_all
  end

  def test_user_can_shop_at_multiple_restaurants
    restaurant1 = create_valid_restaurant(:name => "Firsties")
    item1 = create_valid_item(restaurant_id=restaurant1.id, title="Numone")
    restaurant2 = create_valid_restaurant(:name => "Secondsies")
    item2 = create_valid_item(restaurant_id=restaurant2.id, title="Numtwo")

    visit root_path

    within "#restaurant_#{restaurant1.id}" do
      click_on "Show"
    end
    click_on "Add to Cart"
    assert page.has_content?("Numone")

    visit root_path
    within "#restaurant_#{restaurant2.id}" do
      click_on "Show"
    end
    within "#item_#{item2.id}" do
      click_on "Add to Cart"
    end

    refute page.has_content?("Numone"), "should not have first item"
    assert page.has_content?("Numtwo"), "should show second item"
  end

end
