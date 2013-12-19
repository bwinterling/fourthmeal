class ContactMailer < ActionMailer::Base
  default from: "fourthmeal@example.com"

  def contact_requested(contact_params)
    @contact = contact_params
    mail to: "#{contact_params["slug"]}@BankBudz.com", subject: contact_params["subject"]
  end

  def account_confirmation(user)
    @user = user
    mail to: user.email, subject: "Thank you for creating an account!"
  end
end
