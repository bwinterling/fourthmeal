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

20.times do |i|
  max = 15
  min = 3 
  price = rand * (max-min) + min
  item = Item.create!(title: "Menu Item" + i.to_s, description: "something", price: price, photo: "BURRITO.png")
  item.categories << Category.find(seed_categories[rand(0..4)].id)
  item.save
end

