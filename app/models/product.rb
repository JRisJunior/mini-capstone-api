class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  
  # def categories
  #   categories = []
  #   category_products.each do |cp|
  #     categories << cp.category
  #   end
  #   categories
  # end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end
  
  def tax
    tax = price * 0.09
  end

  def total
    total = price + tax
  end

end
