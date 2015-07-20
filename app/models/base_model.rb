class BaseModel < ActiveRecord::Base
  resourcify
  self.inheritance_column = :class_name
  has_many :available_options, class_name: 'Option'
  has_many :specifications
  scope :boats, -> { where(class_name: 'Boat') }
  scope :parts, -> { where(class_name: 'Part') }
  scope :lifts, -> { where(class_name: 'Lift') }
  scope :docks, -> { where(class_name: 'Dock') }

  accepts_nested_attributes_for :available_options, allow_destroy: true
  accepts_nested_attributes_for :specifications, allow_destroy: true

  def price_to_s
    sprintf( "%0.02f", price)
  end

end
