namespace :seeds do

  task :restaurants do

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
            ItemSeeder.new(100,restaurant.id).create_items
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

  end

end
