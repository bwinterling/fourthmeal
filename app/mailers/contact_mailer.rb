class ContactMailer < ActionMailer::Base
  default from: "fourthmeal@example.com"

  def contact_requested(contact, slug)
    @contact = contact
    mail to: "#{slug}@example.com", subject: contact.subject
  end

  def account_confirmation(user)
    @user = user
    mail to: user.email, subject: "Thank you for creating an account!"
  end
end
