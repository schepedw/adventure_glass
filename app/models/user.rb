class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_one  :shopping_cart
  has_many :shipping_addresses, class_name: 'Address'

  def shopping_cart
    super || ShoppingCart.create(user: self)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def registration_complete?
    missing_registration_attrs.empty?
  end

  def most_recent_shipping_address
    shipping_addresses.max_by(&:updated_at) || Address.new(user_id: id)
  end

  def missing_registration_attrs
    %w[email encrypted_password first_name last_name phone_number].select do |attr|
      send(attr).nil?
    end
  end
end
