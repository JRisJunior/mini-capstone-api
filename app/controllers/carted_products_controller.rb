class CartedProductsController < ApplicationController

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil

    )
    @carted_product.save
    if @carted_product.save
      render json: @carted_product.as_json
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    if current_user
      @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
      render json: @carted_products.as_json
    else
      render template: "carted_products/index"
    end
  end

  def destroy
    cp = CartedProduct.find_by(id: params[:id])
    cp.status = "removed"
    cp.save
    render json: {message: "item removed"}
  end

end