class Address < ActiveRecord::Base
  def to_s
    "#{building_number} #{street}, #{city} #{state}, #{zip_code}"
  end
end
