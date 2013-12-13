require_relative "../test_helper"

class RestaurantTest < ActiveSupport::TestCase

  def setup
    Restaurant.destroy_all
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

  test "it returns its items" do
    restaurant = Restaurant.create(valid_params.merge(:name => "Roy Rogers"))
    item = create_valid_item
    item.restaurant_id = restaurant.id
    item.save
    assert_equal 1, restaurant.items.count
  end

  test "it returns its slug" do
    restaurant = Restaurant.create(valid_params.merge(:name => "bobby sue's"))
    assert_equal "bobby-sue-s", restaurant.slug
  end

  test "rejects duplicate slug" do
    restaurant = Restaurant.create(valid_params.merge(:name => "bobby sue's"))
    assert_equal "bobby-sue-s", restaurant.slug
    restaurant2 = Restaurant.create(valid_params.merge(:name => "bobby sue s"))
    refute restaurant2.valid?
  end

end
