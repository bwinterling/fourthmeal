ActiveAdmin.register Transaction do
  permit_params :status, :user_id
  
  filter :status, :label => 'Status'
  filter :user_id, :label => 'User Id'
  filter :created_at, :label => 'Created_at'
  filter :updated_at, :label => 'Updated_at'

  
end
