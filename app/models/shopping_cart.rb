class ShoppingCart < ActiveRecord::Base
  has_many :products
  belongs_to :user
  has_one :order
  delegate :empty?, :include?, to: :products

  def subtotal
    products.inject(0) do |sum, product|
      sum + (product.price * product.quantity)
    end
  end

  def total_item_count
    products.inject(0) do |sum, product|
      sum + product.quantity
    end
  end
end
