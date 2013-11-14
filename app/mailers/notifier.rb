class Notifier < ActionMailer::Base
  include SendGrid
  default :from => 'any_from_address@example.com'

  def send_transaction_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for ordering from OnoBurrito.' )
  end
end
