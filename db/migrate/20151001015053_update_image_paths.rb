class UpdateImagePaths < ActiveRecord::Migration
  def change
    Part.all.each{|p| p.image_path = "parts/#{p.name.downcase.gsub(' ', '_')}"; p.save!}
  end
end
