class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

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
      description: params[:description],
      supplier_id: params[:supplier_id]
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
