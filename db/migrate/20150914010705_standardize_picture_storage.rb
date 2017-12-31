class StandardizePictureStorage < ActiveRecord::Migration
  def change
    Part.all.each do |part|
      part.update_attribute(:image_path, "parts/#{part.name.downcase.tr(' ', '_')}")
    end
  end
end
