require 'test_helper'

class ItemCategoryTest < ActiveSupport::TestCase
  
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
