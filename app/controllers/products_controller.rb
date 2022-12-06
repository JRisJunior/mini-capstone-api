class ProductsController < ApplicationController
  def show_all
    render json: {message: "hello world"}
  end
end
