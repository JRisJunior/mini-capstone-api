class ProductsController < ApplicationController
  def index
    @product = Product.all
    # render json: products.as_json(methods: [:friendly_created_at])
    render "products/index"
  end

  def show
    p current_user
    @product = Product.find_by(id: params[:id])
    # render json: product.as_json(methods: [:friendly_created_at])
    render "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      images: params[:url],
      description: params[:description]
    )
    if @product.save
      render json: @product.as_json
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    if @product.save
      render json: @product.as_json
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "he gone"}
  end

end
