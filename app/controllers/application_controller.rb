class ApplicationController < ActionController::Base
  class UnauthorizedError < RuntimeError; end
  protect_from_forgery with: :exception
  before_action :current_shopping_cart

  rescue_from UnauthorizedError do |ex|
    render 'site/unauthorized', layout: 'application', status: 403, formats: [:html]
  end

  rescue_from StandardError do |ex|
    if ['production', 'staging'].include? Rails.env
      Airbrake.notify(ex)
      #TODO: make a 500 page
    else
      raise ex
    end
  end

  def current_shopping_cart
    @cart ||= current_user.shopping_cart unless current_user.nil?
    @cart ||= shopping_cart_from_session
  end

  private

  def shopping_cart_from_session
    shopping_cart = ShoppingCart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    shopping_cart = ShoppingCart.create(user: current_user)
  ensure
    session[:cart_id] = shopping_cart.id
    shopping_cart
  end
end
