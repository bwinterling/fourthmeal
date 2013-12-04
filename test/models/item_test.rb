require 'test_helper'


class ItemTest < ActiveSupport::TestCase

  test "it is created with valid attributes" do
    create_valid_item
    assert @item.valid?
  end

  test "it_validates_its_attributes" do
    @item = Item.new
    @item.save
    assert @item.invalid?
  end

  test "it_validates_description" do
    @item = Item.create(:title => "Hello!", :description => "")
    assert @item.invalid?
  end

  test "it_validates_price" do
    @item = Item.create(:title => "Hello!", :description => "World")
    assert @item.invalid?
  end

  test "its_price_must_be_greater_than_zero" do
    @item = Item.create(:title => "Hello!", :description => "World", :price => -5)
    assert @item.invalid?
  end

  test "it has categories" do
    create_valid_item
    assert @item.categories
  end

  test "it has orders" do
    create_valid_item
    assert @item.orders
  end

  test "it has a slug" do
    create_valid_item
    assert @item.slug
  end

  test "it has a retired flag" do
    create_valid_item
    assert_respond_to @item, :retired
    refute @item.retired
  end

  test "it has photo attributes" do
    create_valid_item
    assert_respond_to @item, :photo_file_name
    assert_respond_to @item, :photo_content_type
    assert_respond_to @item, :photo_file_size
    assert_respond_to @item, :photo_updated_at
  end

  test "it finds items given a category title" do
    item = create_valid_item
    item2 = item.dup
    item2.title = "Goodbye!"
    category = create_valid_category
    category2 = category.dup
    category2.title = "Lunch"
    item.categories << category
    item2.categories << category2
    found_items = Item.filter_by_category("Brunch")
    assert_equal "Hello!", found_items.first.title
  end

end
