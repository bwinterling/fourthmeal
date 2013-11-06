require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "it_validates_its_attributes" do
    create_item
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

end
