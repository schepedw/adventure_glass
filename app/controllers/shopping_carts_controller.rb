class ShoppingCartsController < ApplicationController
  def show
    @shopping_cart = current_shopping_cart
  end

  def update

  end
end
