class UpdateImagePaths < ActiveRecord::Migration
  def change
    Part.all.each { |p| p.image_path = "parts/#{p.name.downcase.tr(' ', '_')}"; p.save! }
  end
end
