OnoBurrito::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "log_out" => "sessions#destroy"
  get "log_in" => "sessions#new"
  get "sign_up" => "users#new"
  root :to => "items#index"
  resources :users
  resources :sessions

  resources :items do
    resources :item_categories
  end
  get 'menu' => 'items#index', as: :menu

  get "menu/:category_slug" => "items#in_category", as: "menu_items"
  resources :orders  
  resources :contacts
  resources :order_items
  resources :locations
  resources :transactions

end
