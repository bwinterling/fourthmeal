ActiveAdmin.register Item do

  permit_params :title, :description, :price

  filter :title, :label => 'Title'
  filter :description, :label => 'Description'
  filter :price, :label => 'Price'
  filter :created_at, :label => 'Created_at'
  filter :updated_at, :label => 'Updated_at'  
end
