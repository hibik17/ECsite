Rails.application.routes.draw do
  get 'addresses/index'
  get 'addresses/create'
  get 'addresses/update'
  root to: "homes#top"

  devise_for :admin, controllers:{
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }

  devise_for :end_users, controllers:{
    sessions: "end_users/sessions",
    registrations: "end_users/registrations"
  }

  resource :customers,only:[:show,:update,:edit]
  get "/customers/confirm" => "customers#confirm" ,as: "confirm_customers"
  patch "/customers/unsubscribed" => "customers#unsubscribed" ,as: "unsubscribed_customers"
  
  
  resources :addresses, only:[:index,:create,:update,:destroy,:edit]
  
  resources :items, only:[:index, :show]

  resources :cart_items, only:[:index,:update, :create, :destroy]
  delete "/cart_items" => "cart_items#destroy_all", as: "destroy_all_cart_items"

  post "/orders/confirm" => "orders#confirm", as: "confirm_order"
  get "/orders/complete" => "orders#complete", as: "complete_order"
  resources :orders, only:[:index, :show, :create, :new]

  namespace :admin do
    root to: "homes#top"
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, only:[:index, :show, :edit, :update, :new, :create]
    get 'search' => "items#search", as: "search"
    resources :genres, only:[:index, :create, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
