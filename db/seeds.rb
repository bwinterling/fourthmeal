entrees = Category.create(title: "Entrees")
combos = Category.create(title: "Combos")
kids = Category.create(title: "Kids Menu")
add_ons = Category.create(title: "Add Ons")
beverages = Category.create(title: "Beverages")

# ENTREES

burrito = Item.create(
  title: "Steak Burrito", 
  description: "Mouthwatering slab of meat wrapped in white flour.", 
  price: 5.99, 
  photo: File.open("app/assets/images/BURRITO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: burrito.id,
  category_id: entrees.id
  )

breakfast_burrito = Item.create(
  title: "Breakfast Burrito", 
  description: "Eggs and meat!", 
  price: 3.99, 
  photo: File.open("app/assets/images/BREAKFAST.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: breakfast_burrito.id,
  category_id: entrees.id
  )

naked_burrito = Item.create(
  title: "Naked Burrito", 
  description: "Get lucky with a naked burrito.", 
  price: 5.99, 
  photo: File.open("app/assets/images/NAKED_BURRITO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: naked_burrito.id,
  category_id: entrees.id
  )

taco_gumbo = Item.create(
  title: "Taco Gumbo", 
  description: "Good for a cold day.", 
  price: 4.99, 
  photo: File.open("app/assets/images/C2_TACO_GUMBO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: taco_gumbo.id,
  category_id: entrees.id
  )

sig_veggie_burrito = Item.create(
  title: "Signature Vegetable Burrito", 
  description: "Vegetarian is caveman speak for bad hunter.", 
  price: 4.99, 
  photo: File.open("app/assets/images/SIG_VEGGIE_BURRITO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: sig_veggie_burrito.id,
  category_id: entrees.id
  )

taco_salad = Item.create(
  title: "Taco Salad", 
  description: "It's 'healthy'.", 
  price: 5.99, 
  photo: File.open("app/assets/images/TACO_SALAD.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: taco_salad.id,
  category_id: entrees.id
  )



# Kids Menu

kids_meal = Item.create(
  title: "Kids Meal", 
  description: "Comes with a plastic toy.", 
  price: 3.99, 
  photo: File.open("app/assets/images/KIDS_LEADING.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: kids_meal.id,
  category_id: kids.id
  )

kids_taco = Item.create(
  title: "Kids Taco", 
  description: "It's like the big one, only smaller.", 
  price: 3.99, 
  photo: File.open("app/assets/images/KIDS_TACO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: kids_taco.id,
  category_id: kids.id
  )

kids_quesadilla = Item.create(
  title: "Kids Quesadilla", 
  description: "It's like the big one, only smaller.", 
  price: 3.99, 
  photo: File.open("app/assets/images/KIDS_QUESADILLA.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: kids_quesadilla.id,
  category_id: kids.id
  )

kids_burrito = Item.create(
  title: "Kids Naked Burrito", 
  description: "It's like the big one, only smaller.", 
  price: 3.99, 
  photo: File.open("app/assets/images/KIDS_NAKED_BURRITO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: kids_burrito.id,
  category_id: kids.id
  )



# Combos

taco_tortilla_soup = Item.create(
  title: "Taco Torilla Soup", 
  description: "Es Muy Picante.", 
  price: 6.99, 
  photo: File.open("app/assets/images/C2_TACO_TORT_SOUP.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: taco_tortilla_soup.id,
  category_id: combos.id
  )

nacho_dilla = Item.create(
  title: "Nacho Dilla", 
  description: "Eat one every dia.", 
  price: 6.99, 
  photo: File.open("app/assets/images/C2_NACHO_DILLA.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: nacho_dilla.id,
  category_id: combos.id
  )

taco_w_gumbo_soup = Item.create(
  title: "Taco With Gumbo Soup", 
  description: "You must be hungry!", 
  price: 6.99, 
  photo: File.open("app/assets/images/C2_TACO_GUMBO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: taco_w_gumbo_soup.id,
  category_id: combos.id
  )

taco_w_naked_burrito = Item.create(
  title: "Taco With A Naked Burrito", 
  description: "You must be hungry!", 
  price: 6.99, 
  photo: File.open("app/assets/images/C2_TACO_NAKED-BURRITO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: taco_w_naked_burrito.id,
  category_id: combos.id
  )

two_naked_tacos = Item.create(
  title: "Two Naked Tacos", 
  description: "Two tacos caught in bed together!", 
  price: 6.99, 
  photo: File.open("app/assets/images/C2_TACO_NAKED_TACO.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: two_naked_tacos.id,
  category_id: combos.id
  )



# Add-ons

nachos = Item.create(
  title: "Three Cheese Nachos", 
  description: "That's 'not-cho' cheese!", 
  price: 5.99, 
  photo: File.open("app/assets/images/3_CHEESE_NACHOS.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: nachos.id,
  category_id: add_ons.id
  )

chips_dip = Item.create(
  title: "Chips and Dip", 
  description: "Crunchy and smooth.", 
  price: 4.99, 
  photo: File.open("app/assets/images/CHIPS_DIP.png", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: chips_dip.id,
  category_id: add_ons.id
  )



# Beverages

beer = Item.create(
  title: "Beer", 
  description: "Beer beer beer beer.", 
  price: 3.99, 
  photo: File.open("app/assets/images/beers.jpeg", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: beer.id,
  category_id: beverages.id
  )

soda = Item.create(
  title: "Soda", 
  description: "Sodee pop.", 
  price: 1.99, 
  photo: File.open("app/assets/images/soda.jpg", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: soda.id,
  category_id: beverages.id
  )

margarita = Item.create(
  title: "Margaritas", 
  description: "Blended margs for your enjoyment.", 
  price: 5.99, 
  photo: File.open("app/assets/images/cocktails.jpg", 'r'),
  retired: false)
  

ItemCategory.create(
  item_id: margarita.id,
  category_id: beverages.id
  )


order1 = Order.create(status: 'unpaid', user_id: 1)
order2 = Order.create(status: 'unpaid', user_id: 5)
order3 = Order.create(status: 'unpaid', user_id: 4)
order4 = Order.create(status: 'unpaid', user_id: 2)
order5 = Order.create(status: 'unpaid', user_id: 9)
order6 = Order.create(status: 'unpaid', user_id: 8)
order7 = Order.create(status: 'unpaid', user_id: 10)
order8 = Order.create(status: 'unpaid', user_id: 15)
order9 = Order.create(status: 'unpaid', user_id: 12)
order10 = Order.create(status: 'unpaid', user_id: 19)

User.create(email: "demo+franklin@jumpstartlab.com", 
  full_name: "Franklin Webber", 
  display_name: "", 
  admin: false, 
  password_hash: "$2a$10$peyLQDdJKdcB9YqE21wIi.ntTY56kARmsSQhm5WSsNjhPP9vNktWC", 
  password_salt:"$2a$10$peyLQDdJKdcB9YqE21wIi.")

User.create(email: "demo+jeff@jumpstartlab.com", 
  full_name: "Jeff", 
  display_name: "j3", 
  admin: false, 
  password_hash: "$2a$10$peyLQDdJKdcB9YqE21wIi.ntTY56kARmsSQhm5WSsNjhPP9vNktWC", 
  password_salt:"$2a$10$peyLQDdJKdcB9YqE21wIi.")

User.create(email: "demo+katrina@jumpstartlab.com", 
  full_name: "Katrina Owen", 
  display_name: "kytrynx", 
  admin: true, 
  password_hash: "$2a$10$peyLQDdJKdcB9YqE21wIi.ntTY56kARmsSQhm5WSsNjhPP9vNktWC", 
  password_salt:"$2a$10$peyLQDdJKdcB9YqE21wIi.")

User.create(email: "ben@example.com", 
  full_name: "Ben Lewis", 
  display_name: "bennybeans", 
  admin: true, 
  password_hash: "$2a$10$peyLQDdJKdcB9YqE21wIi.ntTY56kARmsSQhm5WSsNjhPP9vNktWC", 
  password_salt:"$2a$10$peyLQDdJKdcB9YqE21wIi.")

AdminUser.create(:email => "admin@example.com", :password => "password")
AdminUser.create(:email => "demo+katrina@jumpstartlab.com", :password => "password")

order_item1 = OrderItem.create(order_id: Order.last.id, item_id: Item.last.id, quantity: 2)
