class ProductsController < ApplicationController
  before_action :cart, only: [:show]
  before_action :selected_associations, only: [:create]

  def create
    product = create_product
    if product_params.has_key?('shopping_cart_id')
      redirect_to shopping_cart_path
    else
      redirect_to product_path, :id => product.id
    end
  end

  def destroy
    Product.find(params[:id]).delete
    redirect_to :back
  end

  private

  def create_product
    if base_model_id = params[class_name]['base_model_id']
      p = Product.find(base_model_id).deep_dup
      p.update_attributes(product_params)#TODO: should be able to use product_params
    else
      klass.create(product_params)
    end
  end

  def add_to_cart(product)
    product.shopping_carts << cart
    product.save!
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
      :shopping_cart_id,
      :price,
      :description,
      :class_name,
      :base_model_id,
      :name,
      :type,
      :option_ids => [],
      :specification_ids => []
    )
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
