class OrderMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(transaction)
    @transaction = transaction

    mail to: transaction.email,
    subject: "Your order is confirmed!"
  end
end
