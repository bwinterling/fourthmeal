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

  test "it_validates_photo" do
    @item = Item.create(:title => "Hello!", :description => "World", :price => 4, :photo => "")
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

end
