class Product < ActiveRecord::Base
  resourcify
  self.inheritance_column = :class_name
  has_many :available_options, class_name: 'Option'
  has_and_belongs_to_many :selected_options, class_name: 'Option', join_table: 'selected_product_options'
  has_and_belongs_to_many :specifications
  belongs_to :shopping_cart
#  has_one :base_model, class_name: 'Product'
  scope :boats, -> { where(class_name: 'Boat') }
  scope :parts, -> { where(class_name: 'Part') }
  scope :lifts, -> { where(class_name: 'Lift') }
  scope :docks, -> { where(class_name: 'Dock') }

  accepts_nested_attributes_for :available_options, allow_destroy: true
  accepts_nested_attributes_for :specifications, allow_destroy: true

  def price_to_s
    sprintf( "%0.02f", price)
  end

=begin
  def base_model
    super || self
  end
=end
end
