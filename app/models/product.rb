class Product < ActiveRecord::Base
  self.inheritance_column = :class_name
  has_and_belongs_to_many :options
  has_and_belongs_to_many :shopping_carts
  has_many :specifications
  scope :boats, -> { where(class_name: 'Boat') }
  scope :parts, -> { where(class_name: 'Part') }
  scope :lifts, -> { where(class_name: 'Lift') }
  scope :docks, -> { where(class_name: 'Dock') }

  def available_options
    Option.available_for(name)
  end
end
