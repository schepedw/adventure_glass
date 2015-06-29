class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_one  :shopping_cart
  has_many  :shipping_addresses, class: ShippingAddress

  def shopping_cart
    super || ShoppingCart.create(:user => self)
  end

  def registration_complete?
    missing_registration_attrs.empty?
  end

  def missing_registration_attrs
    %w(email encrypted_password first_name last_name phone_number).select do |attr|
      send(attr).nil?
  end
  end
end
