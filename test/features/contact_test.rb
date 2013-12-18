require './test/test_helper'

class ContactRequestTest < Capybara::Rails::TestCase

  test "user can send contact request" do
    skip
    reset_email
    rest = Restaurant.last
    visit restaurant_path(rest.slug)
    click_on "Contact"
    assert_content page, 'Contact Us'
    within "#new_contact" do
      fill_in "Name", with: "Bobcat G."
      fill_in "Email", with: "question_guy@example.com"
      fill_in "Subject", with: "Question"
      fill_in "Comment", with: "Is America is one of the finest countries anyone ever stole?"
      click_button "Enter"
    end
    assert_content page, 'Thanks for your message!'
    assert_equal "Question", last_email.subject
  end

end
