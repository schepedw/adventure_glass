class ShoppingCartsController < ApplicationController
  before_action :check_cart
  def show
    @total_cost = @cart.subtotal #TODO: should be renamed to @subtotal
    respond_to do |format|
      format.html
      format.js do
        @updated_product = @cart.products.max_by(&:updated_at)
        render action: 'show.js.erb'
      end
    end
  end

  private

  def check_cart
    redirect_to '/' if @cart.user_id != current_user.try(:id)
  end
end
