# USERS

user1 = User.create(email: "demo+franklin@jumpstartlab.com",
  full_name: "Franklin Webber",
  display_name: "",
  password: "password")

user2 = User.create(email: "demo+jeff@jumpstartlab.com",
  full_name: "Jeff",
  display_name: "j3",
  password: "password")

user3 = User.create(email: "demo+katrina@jumpstartlab.com",
  full_name: "Katrina Owen",
  display_name: "kytrynx",
  password: "password")

user4 = User.create(email: "benjamin@example.com",
  full_name: "Ben Lewis",
  display_name: "bennybeans",
  password: "password")

user5 = User.create(email: "admin@example.com",
  full_name: "Neck Beard",
  display_name: "neckbeard",
  password: "password",
  admin: true)

# CATEGORIES
entrees = Category.create(title: "Entrees")
combos = Category.create(title: "Combos")
kids = Category.create(title: "Kids Menu")
add_ons = Category.create(title: "Add Ons")
beverages = Category.create(title: "Beverages")

# ITEMS
class ItemSeeder

  attr_reader :amount,
              :restaurant_id

  def initialize(amount,restaurant_id=nil)
    @amount = amount
    @restaurant_id = restaurant_id
  end

  def create_items
    amount.times do
      title = item_titles.sample + " " + hipster_ipsum.sample.capitalize
      description = 10.times.map do
        hipster_ipsum.sample + " " + title
      end.join(" ")
      image_url = item_image_urls.sample
      item = Item.create(
        title: title,
        description: description,
        price: 5.99,
        photo: File.open(image_url, 'r'),
        retired: false,
        restaurant_id: restaurant_id
      )
      if item.save
        puts "Created #{title} for restaurant #{item.restaurant_id}"
      else
        puts "Failed to create #{title}"
      end
    end
  end

  def item_titles
    ["Burrito",
      "Tacos",
      "Korma",
      "Burger",
      "Cheese"]
  end

  def item_image_urls
    [
      "app/assets/images/BURRITO.png",
      "app/assets/images/BREAKFAST.png",
      "app/assets/images/NAKED_BURRITO.png",
      "app/assets/images/C2_TACO_GUMBO.png",
      "app/assets/images/SIG_VEGGIE_BURRITO.png",
      "app/assets/images/TACO_SALAD.png",
      "app/assets/images/KIDS_LEADING.png",
      "app/assets/images/KIDS_TACO.png",
      "app/assets/images/KIDS_QUESADILLA.png",
      "app/assets/images/KIDS_NAKED_BURRITO.png",
      "app/assets/images/C2_TACO_TORT_SOUP.png",
      "app/assets/images/C2_NACHO_DILLA.png",
      "app/assets/images/C2_TACO_GUMBO.png",
      "app/assets/images/C2_TACO_NAKED-BURRITO.png",
      "app/assets/images/C2_TACO_NAKED_TACO.png",
      "app/assets/images/3_CHEESE_NACHOS.png",
      "app/assets/images/CHIPS_DIP.png",
      "app/assets/images/beers.jpeg",
      "app/assets/images/soda.jpg",
      "app/assets/images/cocktails.jpg"
    ]
  end

  def hipster_ipsum
    ["Delectus", "flannel", "accusamus", "nulla", "Neutra.", "Meggings", "Cosby", "sweater", "duis,", "butcher", "Austin", "anim", "chambray", "locavore", "single-origin", "coffee.", "Marfa", "Banksy", "jean", "shorts", "meggings", "Intelligentsia", "disrupt.", "Bicycle", "rights", "direct", "trade", "cupidatat,", "velit", "commodo", "in", "qui", "Brooklyn", "mollit.", "Bitters", "letterpress", "artisan", "Tonx", "Williamsburg.", "Qui", "ennui", "retro", "banh", "mi", "YOLO", "ea.", "Tattooed", "mumblecore", "Marfa,", "pickled", "kitsch", "selvage", "aesthetic", "synth", "beard", "deserunt", "Blue", "Bottle", "eu."]
  end

end
#ItemSeeder.new(10).create_items

# RESTAURANTS
class RestaurantSeeder

  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def create_restaurants
    amount.times do
      name = restaurant_names.sample + " " + hipster_ipsum.sample.capitalize
      description = 10.times.map do
        hipster_ipsum.sample
      end.join(" ")
      location = locations.sample
      restaurant = Restaurant.create(:name => name,
                        :location => location,
                        :description => description
      )
      if restaurant.save
        puts "Created #{name} : #{description} in #{location}"
        ItemSeeder.new(10,restaurant.id).create_items
      else
        puts "Failed to create #{name}"
      end
    end
  end

  def restaurant_names
    ["Little India",
      "Thai Tapas",
      "Korean BBQ",
      "Burger Bedlam",
      "Taco Tuesday"]
  end

  def hipster_ipsum
    ["Delectus", "flannel", "accusamus", "nulla", "Neutra.", "Meggings", "Cosby", "sweater", "duis,", "butcher", "Austin", "anim", "chambray", "locavore", "single-origin", "coffee.", "Marfa", "Banksy", "jean", "shorts", "meggings", "Intelligentsia", "disrupt.", "Bicycle", "rights", "direct", "trade", "cupidatat,", "velit", "commodo", "in", "qui", "Brooklyn", "mollit.", "Bitters", "letterpress", "artisan", "Tonx", "Williamsburg.", "Qui", "ennui", "retro", "banh", "mi", "YOLO", "ea.", "Tattooed", "mumblecore", "Marfa,", "pickled", "kitsch", "selvage", "aesthetic", "synth", "beard", "deserunt", "Blue", "Bottle", "eu."]
  end

  def locations
    ["Aelas", "Vendor", "Alpha", "Centauri", "Afehirr", "Onias", "Psi", "Velorum", "Agrama", "Sierra", "Alpha", "Centauri", "Aido", "Onias", "Psi", "Velorum", "Aihai", "Devron", "Iota", "Pavonis", "Ajilon", "Archanis", "Eta", "Eridani", "Aldebaran", "Aldebaran", "Eta", "Eridani", "Algira", "Algira", "Alpha", "Trianguli", "Alhena", "Donatu", "Eta", "Eridani", "Alth'ndor"]
  end

end
RestaurantSeeder.new(10).create_restaurants

# ITEMS

# Entrees

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

ItemCategory.create(
  item_id: nacho_dilla.id,
  category_id: entrees.id
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

ItemCategory.create(
  item_id: two_naked_tacos.id,
  category_id: entrees.id
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

ItemCategory.create(
  item_id: nachos.id,
  category_id: entrees.id
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

# ORDERS

order1 = Order.create(status: 'unpaid', user_id: user1.id)
order2 = Order.create(status: 'unpaid', user_id: user2.id)
order3 = Order.create(status: 'unpaid', user_id: user3.id)
order4 = Order.create(status: 'unpaid', user_id: user4.id)
order5 = Order.create(status: 'unpaid', user_id: user1.id)
order6 = Order.create(status: 'paid', user_id: user2.id)
order7 = Order.create(status: 'unpaid', user_id: user3.id)
order8 = Order.create(status: 'paid', user_id: user4.id)
order9 = Order.create(status: 'unpaid', user_id: user1.id)
order10 = Order.create(status: 'paid', user_id: user2.id)


# ORDER ITEMS

order_item1 = OrderItem.create(order_id: order1.id, item_id: burrito.id, quantity: 1)
order_item2 = OrderItem.create(order_id: order2.id, item_id: breakfast_burrito.id, quantity: 2)
order_item3 = OrderItem.create(order_id: order3.id, item_id: naked_burrito.id, quantity: 3)
order_item4 = OrderItem.create(order_id: order4.id, item_id: taco_gumbo.id, quantity: 4)
order_item5 = OrderItem.create(order_id: order5.id, item_id: sig_veggie_burrito.id, quantity: 5)
order_item6 = OrderItem.create(order_id: order6.id, item_id: taco_salad.id, quantity: 4)
order_item7 = OrderItem.create(order_id: order7.id, item_id: kids_meal.id, quantity: 3)
order_item8 = OrderItem.create(order_id: order8.id, item_id: kids_quesadilla.id, quantity: 2)
order_item9 = OrderItem.create(order_id: order9.id, item_id: kids_burrito.id, quantity: 1)
order_item10 = OrderItem.create(order_id: order10.id, item_id: kids_taco.id, quantity: 2)
