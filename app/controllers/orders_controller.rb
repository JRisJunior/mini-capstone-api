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
    render json: @order.as_json
  end

  def index
    @order = Order.all
    render json: @order.as_json
  end


end
