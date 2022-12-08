class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json(methods: [:friendly_created_at])
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json(methods: [:friendly_created_at])
  end

  def create
    # puts "What is the product you would like to add?"
    # name = gets.chomp
    # puts "What is the price?"
    # price = gets.chomp
    # puts "What is the image URL?"
    # url = gets.chomp
    # puts "What is the description?"
    # desc = gets.chomp
    # product = Product.new(
    #   name: name,
    #   price: price,
    #   image_url: url,
    #   description: desc
    # )
      product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    product.save
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.price = params[:price]
    product.image_url = params[:image_url]
    product.description = params[:description]
    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "he gone"}
  end

end
