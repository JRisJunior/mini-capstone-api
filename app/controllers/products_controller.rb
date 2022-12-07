class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end
  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json
  end
  def create
    product = Product.new(
      name: "hackey sack",
      price: 4,
      image_url: "https://worldfootbag.com/shop/wp-content/uploads/2011/05/Sipa-Sipa-Rasta-Main.jpg",
      description: "use this to hack some sack."
    )
    product.save
    render json: product.as_json
  end

end
