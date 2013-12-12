OnoBurrito::Application.routes.draw do
  resources :restaurants do
    resources :items
  end

  resources :regions do
    resources :restaurants, :only => [:index, :show], :controller => :region_restaurants
  end

  root :to => "restaurants#index"

  resources :contacts
  resources :items
  resources :locations
  resources :orders
  resources :order_items
  resources :sessions
  resources :transactions, only: [:new, :create, :show]
  resources :users do
    :stores
  end

  get "code" => "codes#index"
  get "log_out" => "sessions#destroy"
  get "log_in" => "sessions#new"
  get 'menu' => 'items#index', as: :menu
  get "menu/:category_slug" => "items#in_category", as: "menu_items"
  get "sign_up" => "users#new"

end
