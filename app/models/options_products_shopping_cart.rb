class OptionsProductsShoppingCart < ActiveRecord::Base
  belongs_to :shopping_cart
  has_one :options_product
  has_one :product, through: :options_product
  has_one :option, through: :options_product
end
