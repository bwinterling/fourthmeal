require_relative "../test_helper"

class RestaurantTest < ActiveSupport::TestCase

  def setup
    @restaurant = Restaurant.create(valid_params)
  end

  def valid_params
    {
      :name => "Bob's",
      :location => "NYC",
      :description => "awesomeness"
    }
  end

  test "it is invalid without name" do
    restaurant = Restaurant.new(valid_params.merge(:name => ""))
    refute restaurant.valid?
  end

  test "it is invalid without location" do
    restaurant = Restaurant.new(valid_params.merge(:location => ""))
    refute restaurant.valid?
  end

  test "it is invalid without description" do
    restaurant = Restaurant.new(valid_params.merge(:description => ""))
    refute restaurant.valid?
  end

  test "it has items method" do
    assert_respond_to(@restaurant, :items)
  end

  test "it returns empty array for #items" do
    item = create_valid_item
    item.restaurant_id = @restaurant.id
    item.save
    assert_equal 1, @restaurant.items.count
  end

end
