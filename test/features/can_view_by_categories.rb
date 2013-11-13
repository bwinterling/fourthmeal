require './test/test_helper'

class CanViewByCategoriesTest < Capybara::Rails::TestCase

test "can see all items by category" do
    categories = Category.create(name: "Kids Menu")
    item = Item.create(title: 'Kids Taco', description: 'Yummy', price: '1')
    category.items << item

    visit root_path
    assert_content page, "Burrito"
    assert_content page, "Kids Menu"
  end

end
