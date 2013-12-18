class Mailer
  @queue = :mail_to_send

  def self.perform(contact)
    ContactMailer.contact_requested(contact).deliver
  end
end
