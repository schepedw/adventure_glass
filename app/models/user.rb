class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #TODO - bring the below back, set up devise correctly
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_one  :shopping_cart
  has_one  :shipping_address
end
