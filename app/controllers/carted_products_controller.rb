class CartedProductsController < ApplicationController

  def create
    @carted_product = CartedProduct.new(
      user_id: 1,
      product_id: 52,
      quantity: 1,
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
end
