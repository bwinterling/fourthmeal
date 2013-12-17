namespace :seeds do

  task :users do
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
  end

end
