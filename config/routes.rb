Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
get "/products" => "products#index"
get "/products/:id" => "products#show"
post "/products" => "products#create"
patch "/products/:id" => "products#update"
delete "/products/:id" => "products#destroy"

post "/users" => "users#create"
post "/sessions" => "sessions#create"

get "/orders" => "orders#index"
get "/orders/:id" => "orders#show"
post "/orders" => "orders#create"

post "/carted_products" => "carted_products#create"
get "/carted_products" => "carted_products#index"
delete "/carted_products/:id" => "carted_products#destroy"


end