class ShoppingCartsController < ApplicationController
  before_action :current_shopping_cart
  def show
    @shopping_cart = current_shopping_cart
    @total_cost = @shopping_cart.subtotal #TODO: should be renamed to @subtotal
  end
end
