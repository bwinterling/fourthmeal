require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  test "contact_requested" do
    mail = ContactMailer.contact_requested
    assert_equal "Contact requested", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
