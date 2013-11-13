ActiveAdmin.register Order do

  permit_params :first_name, :last_name, :zipcode, :order_id
  
  filter :first_name, :label => 'First Name'
  filter :last_name, :label => 'Last Name'
  filter :zipcode, :label => 'Zipcode'
  filter :order_id, :label => 'Order Id'
  filter :created_at, :label => 'Created_at'
  filter :updated_at, :label => 'Updated_at'


end