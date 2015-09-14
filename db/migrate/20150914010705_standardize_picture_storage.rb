class StandardizePictureStorage < ActiveRecord::Migration
  def change
    Part.all.each do |part|
      part.update_attribute(:image_path, "parts/#{part.name.downcase.gsub(' ','_')}")
    end
  end

end
