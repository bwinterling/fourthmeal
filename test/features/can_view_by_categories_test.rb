require './test/test_helper'
require_relative '../helpers/restaurant_helper'

class CanViewByCategoriesTest < Capybara::Rails::TestCase

  def setup
    Restaurant.destroy_all
  end

  def test_can_see_all_items_by_category
    # TODO: requires categories to have restaurant_id
    restaurant = create_valid_restaurant(:name => "Boyoh's")
    category = Category.create(title: "Slushees")
    item = Item.create(title: 'Cherry Slushee',
                       description: 'Yummy',
                       price: '1',
                       restaurant_id: restaurant.id)
    category.items << item

    visit restaurant_path(restaurant)

    assert_content page, "Cherry Slushee"
    assert_content page, "Slushees"
  end

end
