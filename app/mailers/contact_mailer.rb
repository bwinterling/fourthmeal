class ContactMailer < ActionMailer::Base
  default from: "fourthmeal@example.com"

  def contact_requested(contact)
    @contact = contact

    mail to: "bwinterling@yahoo.com", subject: contact.subject
  end
end
