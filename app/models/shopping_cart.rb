class ShoppingCart < ActiveRecord::Base
  has_many :products, through: :shopping_carts_products
  belongs_to :user
end
