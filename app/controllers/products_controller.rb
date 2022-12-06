class ProductsController < ApplicationController
  def show_all
    products = Product.all
    render json: products.as_json
  end
  def show_first
    product_first = Product.first
    render json: product_first.as_json
  end
  def show_last
    product_last = Product.last
    render json: product_last.as_json
    end
  def show_spider
    product_spider = Product.find_by(id: 99)
    render json: product_spider.as_json
  end
end
