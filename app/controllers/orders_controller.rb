class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    if current_user
      @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
      @subtotal = 0
      @total_tax = 0
      @grand_total = 0
      @carted_products.each_with_index do |cp, i|
        @product = Product.find_by(id: cp.product_id)
        @subtotal += (@product.price * cp.quantity)
        @total_tax += (@product.tax * cp.quantity)
        @grand_total += (@product.total * cp.quantity)
      end
      @order = Order.new(
        user_id: current_user.id,
        subtotal: @subtotal,
        tax: @total_tax,
        total: @grand_total
      )
      if @order.save
        @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
        @carted_products.each do |cp|
          cp.status = "purchased"
          cp.order_id = @order.id
          cp.save
        end
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
      render template: "orders/show"
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