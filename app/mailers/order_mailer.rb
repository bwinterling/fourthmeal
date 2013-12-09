class OrderMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(transaction)
    @transaction = transaction

    mail to: "to@example.org", # TODO: transaction.email
      # TODO: NEED TO INCLUDE email address on Transaction Resource
    subject: "Your order is confirmed!"
  end
end
