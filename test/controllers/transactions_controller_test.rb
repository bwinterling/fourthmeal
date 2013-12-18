require_relative "../test_helper"
require_relative "../helpers/restaurant_helper"

class TransactionsControllerTest < ActionController::TestCase

  def setup
    Item.destroy_all
    Restaurant.destroy_all
    reset_email
    @restaurant = create_valid_restaurant(:name => "Resty")
    item = create_valid_item(@restaurant.id,"Shazam")
    @order = create_valid_order
    @order_item = OrderItem.create(
      :order_id => @order.id,
      :item_id => item.id,
      :quantity => 1)
  end

  def test_sends_email_on_valid_create
    skip
    post(:create, {"transaction"=>{"first_name"=>"FIRST",
                                   "last_name"=>"LAST",
                                   "email"=> "shopper@example.com",
                                   "zipcode"=>"12345",
                                   "result"=>"success",
                                   "restaurant_id" => @restaurant.slug},
                   "stripeToken"=>"tok_35TIbkiF4two9y",
                                  "stripeEmail"=>"EMAIL@em.com"},
                  {"current_order" => @order})
    assert_equal "Your order is confirmed!", last_email.subject
    assert_equal "shopper@example.com", last_email.to.first
    assert last_email.body.include?("Shazam")
  end

end
