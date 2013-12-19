class Mailer
  @queue = :mail_to_send

  def self.perform(contact_params)
    ContactMailer.contact_requested(contact_params).deliver
  end
end
