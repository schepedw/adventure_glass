class Address < ActiveRecord::Base
  def to_s
    "#{building_number} #{street}, #{apt_or_unit_number && apt_or_unit_number + ', '}"\
    "#{city}, #{state}, #{zip_code}".squeeze(' ')
  end
end
