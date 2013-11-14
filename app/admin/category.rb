ActiveAdmin.register Category do

  permit_params :title
  filter :title, :label => 'Title'

  controller do
    defaults :finder => :find_by_slug
  end
  
end