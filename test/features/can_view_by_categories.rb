require './test/test_helper'

class CanViewByCategoriesTest < Capybara::Rails::TestCase

test "can see all items by category" do
    categories = Category.create(name: "Slushees")
    item = Item.create(title: 'Cherry Slushee', description: 'Yummy', price: '1')
    category.items << item

    visit root_path
    assert_content page, "Cherry Slushee"
    assert_content page, "Slushees"
  end

end
