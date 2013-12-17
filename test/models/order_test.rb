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
    order = Order.create
    assert order.invalid?
  end

  test "it_answers_with_correct_status" do
    user = create_valid_user
    order = Order.create(:user_id => user.id)
    assert_equal "unpaid", order.status
    Transaction.create(transaction_base_params(order))
    assert_equal "paid", order.reload.status
  end

  test "it has items" do
    create_valid_order
    assert @order.items
  end

  def transaction_base_params(order)
    {
      order_id: order.id,
      first_name: "Mike",
      last_name: "Williams",
      email: "bob@hope.com",
      zipcode: 45455,
      result: "success"
    }
  end


end
