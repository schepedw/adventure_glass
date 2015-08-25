class ShoppingCart < ActiveRecord::Base
  has_many :products
  belongs_to :user
  has_one :order

  def subtotal
    products.inject(0) do |sum, product|
      sum + (product.price * product.quantity)
    end
  end
end
