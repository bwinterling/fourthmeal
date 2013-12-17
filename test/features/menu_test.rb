require './test/test_helper'

class MenuTest < Capybara::Rails::TestCase

  def test_guest_can_browse_the_home_page
    visit root_path
    assert page.has_content?('restaurants')
  end
end
