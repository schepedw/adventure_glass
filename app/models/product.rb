class Product < ActiveRecord::Base
  self.inheritance_column = :class_name
  has_and_belongs_to_many :options
  belongs_to :shopping_carts
  has_many :specifications
  scope :boats, -> { where(class_name: 'Boat') }
  scope :parts, -> { where(class_name: 'Part') }
  scope :lifts, -> { where(class_name: 'Lift') }
  scope :docks, -> { where(class_name: 'Dock') }

  def available_options
    Option.available_for(name)
  end

  def quantity
    Product.where(attributes.except('id', 'created_at', 'updated_at')).count
  end

  def base_model
    Product.find(base_model_id)
  end
end
