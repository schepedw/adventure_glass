class Order < ActiveRecord::Base
  belongs_to :user
  has_one :status
  has_one :shopping_cart
end
