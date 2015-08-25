class Product < ActiveRecord::Base
  has_many :available_options, class_name: 'Option'
  has_and_belongs_to_many :selected_options, class_name: 'Option', join_table: 'selected_product_options'
  belongs_to :shopping_cart
  belongs_to :base_model
  #verify presence of base model
  delegate :price, :description, :class_name, :name, :type, :image_path, :available_options, :specifications, to: :base_model

  def total_cost
    price + selected_options.inject(0){|total, option| total + option.price }
  end

  def total_cost_to_s
    sprintf( "%0.02f", total_cost)
  end

  def price_to_s
    sprintf( "%0.02f", price)
  end
end
