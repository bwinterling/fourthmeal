class ContactMailer < ActionMailer::Base
  default from: "fourthmeal@example.com"

  def contact_requested(contact)
    @contact = contact
    mail to: "bwinterling@yahoo.com", subject: contact.subject
  end

  def account_confirmation(user)
    @user = user
    mail to: user.email, subject: "Thank you for creating an account!"
  end
end
