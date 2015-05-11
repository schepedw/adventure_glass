class CheckoutController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @user = current_user || User.new
  end

  def confirm
    @user = current_user
    @shopping_cart = current_shopping_cart
    @shipping_address = current_user.shipping_addresses.order(:updated_at).last
  end

end
