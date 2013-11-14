class Notifier < ActionMailer::Base
  include SendGrid
  default :from => 'order_confirmation@onoburrito.com'

  def send_transaction_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for ordering from OnoBurrito.' )
  end
end
