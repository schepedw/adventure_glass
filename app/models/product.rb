class Product < ActiveRecord::Base
  has_many :options, through: :products_options
end
