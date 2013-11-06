require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test "it_validates_order_id" do
    @order_item = OrderItem.create()
    assert @order_item.invalid?
  end

  test "it_validates_item_id" do
    @order_item = OrderItem.create(:order_id => 1)
    assert @order_item.invalid?
  end

  test "it_validates_quantity" do
    @order_item = OrderItem.create(:order_id => 1, :quantity => "")
    assert @order_item.invalid?
  end
end
