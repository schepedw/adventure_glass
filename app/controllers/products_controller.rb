class ProductsController < ApplicationController
  before_action :cart, only: [:show]
  before_action :selected_associations, only: [:create]

  def create
    product = klass.create(product_params)
    if params['shopping_cart_id'].present?
      add_to_cart(product) and redirect_to shopping_cart_path
    else
      redirect_to product_path, :id => product.id
    end
  end

  private
  def add_to_cart(product)
    cart.products << product
    cart.save!
  end

  def cart
    @cart ||= current_shopping_cart
  end

  def class_name
    @class_name ||= \
      ['boat', 'part', 'lift', 'dock'].select do |type|
        params[type].present?
    end.first
  end

  def product_params
    params.require(class_name).permit(
      :option_ids,
      :specification_ids,
      :price,
      :description,
      :class_name,
      :name,
      :type,)
  end

  def klass
    class_name.capitalize.constantize
  end

  def selected_associations
    [:specification_ids, :option_ids].each do |association|
      parse_selections!(association)
    end
  end

  def parse_selections!(association)
    if params[class_name][association].is_a?(Hash)
      params[class_name][association] = \
        params[class_name][association].select do |(_, v)|
        v == '1'
      end.keys
    end
  end
end
