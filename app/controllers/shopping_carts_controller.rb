class ShoppingCartsController < ApplicationController
  def show
    @total_cost = @cart.subtotal #TODO: should be renamed to @subtotal
    respond_to do |format|
      format.html
      format.js do
        @updated_product = @cart.products.max(&:updated_at)
        render action: 'show.js.erb'
      end
    end
  end
end
