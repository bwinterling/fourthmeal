require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "it is created with valid attributes" do
    create_valid_order
    assert @order.valid?
  end

  test "it_validates_status" do
    order = Order.create()
    assert order.invalid?
  end

  test "it_validates_user_id" do
    order = Order.create(:status => "ordered")
    assert order.invalid?
  end

  test "it_validates_correct_type_of_status" do
    order = Order.create(:status => 'mumbojumbo', :user_id => 5)
    assert order.invalid?
    order2 = Order.create(:status => 'ordered', :user_id => 5)
    assert order2.valid?
  end

  test "it has items" do
    create_valid_order
    assert @order.items
  end



end
