require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase

  test "it is created with valid attributes" do
    @order_item = OrderItem.create(:order_id => 1, :item_id => 2, :quantity => 7)
    assert @order_item.valid?
  end

  test "it_validates_order_id" do
    @order_item = OrderItem.create()
    assert @order_item.invalid?
  end

  test "it_validates_item_id" do
    @order_item = OrderItem.create(:order_id => 1)
    assert @order_item.invalid?
  end

  test "it_validates_quantity" do
    @order_item = OrderItem.create(:order_id => 1, :item_id => 2, :quantity => "")
    assert @order_item.invalid?
  end
end
