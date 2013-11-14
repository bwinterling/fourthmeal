require './test/test_helper'

class MenuTest < Capybara::Rails::TestCase

  def test_guest_can_browse_the_home_page
    visit root_path
    assert page.has_content?('On the Menu At Ono')
  end

  def test_guest_can_browse_menu_page
    visit root_path
    click_on 'Entrees'
    within ("#main-body") do
      assert page.has_css?('#item_1')
    end
    assert page.has_css?('.tile-details')
    assert page.has_link?('Sign up or Log in')
    assert page.has_css?('.add-to-cart')
  end

  def test_guest_can_sort_by_specific_category
    visit menu_path
    click_on 'Kids Menu'
    within('.menu-view') do
      assert page.has_content?('Kids Taco')
    end
  end

end

