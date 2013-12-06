require './test/test_helper'

class CanViewByCategoriesTest < Capybara::Rails::TestCase

  def test_can_see_all_items_by_category
    category = Category.create(title: "Slushees")
    item = Item.create(title: 'Cherry Slushee', description: 'Yummy', price: '1')
    category.items << item

    visit root_path
    assert_content page, "Cherry Slushee"
    assert_content page, "Slushees"
  end

end
