class Category < ApplicationRecord

  has_many :category_products
  has_many :products, through: :category_products

  # def products
  #   products = []
  #   category_products.each do |cp|
  #     products << cp.product
  #   end
  #   products
  # end

end
