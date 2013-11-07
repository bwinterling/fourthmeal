category_1 = Category.create(title: "Soup")
category_2 = Category.create(title: "Booze")
category_3 = Category.create(title: "Cake")
category_4 = Category.create(title: "Stupid")
category_5 = Category.create(title: "Beer")

seed_categories = [
category_1, 
category_2, 
category_3, 
category_4, 
category_5 ]

seed_photos = [
"BURRITO.png",
"C2_DILLA_NAKED_TACO.png",
"C2_TACO_GUMBO.png",
"C2_TACO_NAKED-BURRITO.png",
"C2_TACO_NAKED_TACO.png",
"C2_TACO_TORT_SOUP.png",
"CHIPS_DIP.png",
"KIDS_LEADING.png",
"KIDS_QUESADILLA.png",
"KIDS_TACO.png",
"NAKED_BURRITO.png",
"Quesadilla.png",
"TACOS.png"
]

seed_titles = [
"Burrito",
"Dilla Naked Taco",
"Taco Gumbo",
"Naked Burrito",
"Naked Taco",
"Taco Tortilla Soup",
"Chips and Dip",
"Menu Item",
"Kids Quesadilla",
"Kids Taco",
"Naked Burrito",
"Quesadilla",
"Tacos"
]

20.times do |i|
  max = 15
  min = 3 
  price = rand * (max-min) + min
  item = Item.create!(title: seed_titles[rand(0..12)], description: "Delicious yummy food! Order now!", price: price, photo: seed_photos[rand(0..12)])
  item.categories << Category.find(seed_categories[rand(0..4)].id)
  item.save
end

order1 = Order.create(status: 'ordered', user_id: 1)
order2 = Order.create(status: 'ordered', user_id: 5)
order3 = Order.create(status: 'completed', user_id: 4)
order4 = Order.create(status: 'completed', user_id: 2)
order5 = Order.create(status: 'cancelled', user_id: 9)
order6 = Order.create(status: 'cancelled', user_id: 8)
order7 = Order.create(status: 'ordered', user_id: 10)
order8 = Order.create(status: 'ordered', user_id: 15)
order9 = Order.create(status: 'cancelled', user_id: 12)
order10 = Order.create(status: 'completed', user_id: 19)

order_item1 = OrderItem.create(order_id: Order.last.id, item_id: Item.last.id, quantity: 2)
