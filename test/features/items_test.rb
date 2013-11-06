 require './test/test_helper'

 class ItemCreationTest < MiniTest::Unit::TestCase


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

