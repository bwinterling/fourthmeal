require_relative '../test_helper'
require_relative '../helpers/restaurant_helper.rb'

class ItemsControllerTest < ActionController::TestCase

  attr_reader :restaurant,
              :item,
              :other_item

  def setup
    Item.destroy_all
    @restaurant = create_valid_restaurant
    @restaurant.name = "Foobar's"
    @restaurant.save
    @item = create_valid_item(@restaurant.id)
  end

  def test_index_page_has_items_for_current_restaurant
    get(:index, { :restaurant => restaurant.name }, { })
    assert_response :success
    assert_not_nil assigns(:items)
    assert_equal 1, assigns(:items).count
    assert_equal [restaurant.id], assigns(:items).map(&:restaurant_id)
    assert_template :index
  end

end
