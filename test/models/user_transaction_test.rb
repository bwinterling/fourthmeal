require "test_helper"

class UserTransactionTest < ActiveSupport::TestCase

  test "can_retrieve_users_most_recent_transaction" do
    user = create_valid_user("password", "test@example.com")
    Order.create(:status => 'unpaid', :user_id => user.id)
    create_transaction_for(user)
    Order.create(:status => 'unpaid', :user_id => user.id)
    trans2 = create_transaction_for(user)
    assert_equal trans2.id, user.last_transaction.id
  end


end
