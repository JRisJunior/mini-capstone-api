class ProductsController < ApplicationController
  def show_all
    products = Product.all
    render json: products.as_json
  end
end
