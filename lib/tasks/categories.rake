namespace :seeds do

  task :categories do
    entrees = Category.create(title: "Entrees")
    combos = Category.create(title: "Combos")
    kids = Category.create(title: "Kids Menu")
    add_ons = Category.create(title: "Add Ons")
    beverages = Category.create(title: "Beverages")
  end

end
