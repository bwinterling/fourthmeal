require_relative '../test_helper'
require_relative '../helpers/restaurant_helper'

class RestaurantMenuTest < Capybara::Rails::TestCase

  attr_reader :restaurant,
              :item

  def setup
    @restaurant = create_valid_restaurant
    @item = create_valid_item(@restaurant.id)
  end

  def test_shows_items_for_given_restaurant
    visit restaurant_path(restaurant)
    assert page.has_content?(item.title)
  end

end
