require './test/test_helper'


class CanMakeAnOrderTest < Capybara::Rails::TestCase

  test "a user can create an order" do
    item = Item.create(title: 'Steak Burrito', description: 'Mouthwatering slab', price: '1')

    visit root_path

    within "#item_#{item.id}" do
      click_on "Add to Cart"
    end

    assert_content page, 'Your Current Order'
    assert_content page, "Mouthwatering slab"
    
  end

  

  test "can add multiple items to order without logging in" do
    item1 = Item.create(title: 'Steak Burrito', description: 'Mouthwatering slab', price: '1')
    item2 = Item.create(title: 'Breakfast Burrito', description: 'Yummy', price: '1')

    visit root_path

    within "#item_#{item1.id}" do
      click_on "Add to Cart"
    end

    within "#item_#{item2.id}" do
      click_on "Add to Cart"
    end

    within("#current_order") do
      assert_content page, "Breakfast Burrito"
      assert_content page, "Steak Burrito"
    end
  end

#   test "can add multiple instances of same item to order" do
#     Item.create(title: 'Burrito', description: 'Yummy', price: '1')
#     Item.create(title: 'Burrito', description: 'Yummy', price: '1')

#     visit root_path
#     within("#") do
#       click_on "Add to Order"
#     end
#     within("#") do
#       click_on "Add to Order"
#     end

#     visit order_path(Order.first)
#     within("#") do
#       assert_equal "2", find_field('Quantity').value
#     end
#   end

end
