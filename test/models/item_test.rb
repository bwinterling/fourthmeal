require 'test_helper'
SimpleCov.command_name 'test:units'


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

end
