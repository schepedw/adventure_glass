class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_shopping_cart
    @shopping_cart ||= current_user.shopping_cart unless current_user.nil?
    @shopping_cart ||= shopping_cart_from_session
    @shopping_cart
  end

  private
  def shopping_cart_from_session
    session[:shopping_cart_id] = nil
    shopping_cart = session[:shopping_cart_id].nil? ? ShoppingCart.create : ShoppingCart.find(session[:shopping_cart_id])
    session[:shopping_cart_id] = shopping_cart.id
    shopping_cart
  end
end
