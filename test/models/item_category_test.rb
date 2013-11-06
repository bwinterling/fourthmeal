require 'test_helper'

class ItemCategoryTest < ActiveSupport::TestCase
  
  test "it is created with valid attributes" do
    @item_category = ItemCategory.create(:item_id => 3, category_id: 5)
    assert @item_category.valid?
  end

  test "it_validates_status" do
    @item_category = ItemCategory.create()
    assert @item_category.invalid?
  end

  test "it_validates_item_id" do
    @item_category = ItemCategory.create(:item_id => "")
    assert @item_category.invalid?
  end

  test "it_validates_category_id" do
    @item_category = ItemCategory.create(:item_id => "5", category_id: "")
    assert @item_category.invalid?
  end

end
