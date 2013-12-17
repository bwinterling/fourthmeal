require './test/test_helper'

class TransactionTest < ActiveSupport::TestCase

  def valid_params
    {
      first_name: "Mike",
      last_name: "Williams",
      email: "bob@hope.com",
      credit_card_number: 4444888899996666,
      credit_card_expiration: 8833,
      zipcode: 45455,
      result: "success"
    }
  end

  test "it is invalid without attributes" do
    @transaction = Transaction.create()
    assert @transaction.invalid?
  end

  test "it is valid with correct attributes" do
    @transaction = Transaction.create(valid_params)
    assert @transaction.valid?
  end

  test "it does not create a transaction when first name is empty" do
    invalid_params = valid_params.merge(first_name: "")
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  test "it does not create a transactio with invalid email" do
    invalid_params = valid_params.merge(email: "foo")
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  test "it does not create a transaction when last name is empty" do
    invalid_params = valid_params.merge(last_name: "")
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  test "it does not create a transaction when email is empty" do
    invalid_params = valid_params.merge(email: "")
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  test "it does not create a transaction when zipcode is invalid" do
    invalid_params = valid_params.merge(zipcode: 559)
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  #eventually this needs to test both successful and unsuccessful results

  test "it has a result" do
    order = create_valid_order
    alt_params = valid_params.merge(order_id: order.id)
    transaction = Transaction.create(alt_params)
    assert_equal "success", transaction.result
  end
end
