require "test_helper"

class TransactionsControllerTest < ActionController::TestCase

  def setup
    reset_email
    @order = create_valid_order
  end

  def test_sends_email_on_valid_create
    post(:create, {"transaction"=>{"first_name"=>"FIRST",
                                   "last_name"=>"LAST",
                                   "email" => "shopper@example.com",
                                   "zipcode"=>"12345"},
                   "stripeToken"=>"tok_35TIbkiF4two9y",
                                  "stripeEmail"=>"EMAIL@em.com"},
                  {"current_order" => @order})
    assert_equal "Your order is confirmed!", last_email.subject
    assert_equal "shopper@example.com", last_email.to.first
  end

end
