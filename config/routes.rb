Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/all_products" => "products#show_all"
  get "/first_product" => "products#show_first"
  get "/last_product" => "products#show_last"
  get "/spider_product" => "products#show_spider"
end


