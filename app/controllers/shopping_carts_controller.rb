class ShoppingCartsController < ApplicationController
  def show
    @total_cost = @cart.subtotal #TODO: should be renamed to @subtotal
  end
end
