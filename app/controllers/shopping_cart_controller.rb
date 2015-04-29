class ShoppingCartController < ApplicationController
  def show
    @shopping_cart = ShoppingCart.find_by_user_id(params[:user_id]) || ShoppingCart.new
  end

  def update

  end
end
