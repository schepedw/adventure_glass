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
    format('%0.02f', price)
  end

  def add_picture(uploaded_io)
    file_path = ['public', 'assets', 'base_model_pictures', image_path, uploaded_io.original_filename]
    File.open(Rails.root.join(*file_path), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end
end
