require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "it is invalid without a first name and last name" do
    @transaction = Transaction.create()
    assert @transaction.invalid? 
  end


    @transaction = Transaction.create(first_name: "Mike", last_name: "Williams")
    assert @transaction.valid?

end
