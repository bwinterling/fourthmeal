require './test/test_helper'


class CanMakeAnOrderTest < Capybara::Rails::TestCase

  test "a user can create an order" do

    visit root_path

    within "#item_1" do
      click_on "Add to Cart"
    end

    assert_content page, 'Your current order'

    assert_content page, "Mouthwatering slab"
    
    within "#item_1" do
      click_on "Add to Cart"
    end   

  end

#   test "can add an item to the current order" do
#     item = Item.new(title: 'Burrito', description: 'Yummy', price: '1')
#     item.save
#     visit root_path
#     within("#orders") do
#       click_on "Add to Order"
#     end

#     assert_content page, "Burrito added to cart!"
#   end

  

#   test "can add multiple items to order without logging in" do
#     Item.create(title: 'Burrito', description: 'Yummy', price: '1')
#     Item.create(title: 'Nachos', description: 'Delicious', price: '1')
#     visit root_path
#     within("#order") do
#       click_on "Add to Cart"
#     end
#     within("#item_2") do
#       click_on "Add to Cart"
#     end

#     visit order_path(Order.first)
#     within("#item_1") do
#       assert_content page, "Burrito"
#     end
#     within("#item_2") do
#       assert_content page, "Nachos"
#     end
#   end

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
