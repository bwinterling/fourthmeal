class OrderMailer < ActionMailer::Base
  add_template_helper(OrdersHelper)
  default from: "from@example.com"

  def order_confirmation(transaction)
    @transaction = transaction

    mail to: transaction.email,
    subject: "Your order is confirmed!"
  end
end
