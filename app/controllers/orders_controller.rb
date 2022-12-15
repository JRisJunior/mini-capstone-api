class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    if current_user
      @product = Product.find_by(id: params[:product_id])
      @subtotal = (@product.price * params[:quantity])
      @tax = (@product.tax * params[:quantity])
      @total = (@product.total * params[:quantity])
      @order = Order.new(
        user_id: current_user.id,
        product_id: @product.id,
        quantity: params[:quantity],
        subtotal: @subtotal,
        tax: @tax,
        total: @total
      )
      if @order.save
        render json: @order.as_json
      else
        render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    if current_user.id == @order.user_id
      render json: @order.as_json
    else
      render json: {error: "You must be logged in to view this order"}
    end
  end

  def index
    if current_user
      @order = Order.where(user_id: current_user.id)
      render json: @order.as_json
    else
      render json: {}, status: :unauthorized
    end
  end
end