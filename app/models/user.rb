class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_one  :shopping_cart
  has_one  :shipping_address

  def shopping_cart
    super || ShoppingCart.create(:user => self)
  end
end
