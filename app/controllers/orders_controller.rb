class OrdersController < ApplicationController

  def create
    @product = Product.find_by(id: params[:product_id])
    @subtotal = @product.price
    @tax = @product.tax
    @total = @product.total
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
    @order = Order.where(user_id: current_user.id)
    render json: @order.as_json
  end


end
