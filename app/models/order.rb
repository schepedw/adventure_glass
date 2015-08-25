class Order < ActiveRecord::Base
  belongs_to :user
  has_one :status
  has_many :products, through: :shopping_cart
  belongs_to :shopping_cart
end
