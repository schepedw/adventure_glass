class CheckoutController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @user = current_user || User.new
  end

  def confirm
    @user = current_user
    @cart = current_shopping_cart
    @shipping_address = current_user.most_recent_shipping_address
    @updated_product = @cart.products.max_by(&:updated_at)
    @total_cost = @cart.subtotal #TODO: should be renamed to @subtotal
  end
end
