require './test/test_helper'

class ItemCreationTest < Capybara::Rails::TestCase

  #Guests
  def test_guest_can_browse_the_home_page
    visit "root_path"
    within('#index') do
      assert page.has_css?('#main_nav')
      assert page.has_css?('#hero_photo')
    end
  end

  def test_guest_can_browse_menu_page
    visit "root_path"
    click_on 'menu'
    within('#menu') do
      assert page.has_content?('Tacos')
      assert page.has_css?('#item_photo')
      assert page.has_css?('#price')
      assert page.has_css?('#category')
      assert page.has_link?('login')
      assert page.has_link?('add to order')
    end
  end

  def test_guest_can_sort_by_specific_category
    visit menu_path
    click_on 'Kids Menu'
    within('#kids_menu') do
      assert page.has_content?('Kids Tacos')
    end
  end


  #Admins
  def test_it_creates_an_item_with_a_price_and_description
    visit items_path
    click_on 'new-item'
    fill_in 'description', :with => "Chicken Burrito"
    fill_in 'price', :with => "20000."
    click_on 'save-item'
    within('#item') do
      assert page.has_content?("Chicken Burrito")
    end
    within('#price') do
      assert page.has_css?("price", price: "20000.")
    end
  end
end

