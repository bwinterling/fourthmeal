Category.create(title: "Soup")
Category.create(title: "Booze")
Category.create(title: "Cake")
Category.create(title: "Stupid")
Category.create(title: "Beer")

20.times do |i|
  max = 15
  min = 3 
  price = rand * (max-min) + min
  item = Item.create!(title: "Menu Item" + i.to_s, description: "something", price: price, photo: "BURRITO.png")
  item.categories << Category.find(rand(1..5))
  item.save
end

