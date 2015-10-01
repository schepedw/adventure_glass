class UpdateImagePaths < ActiveRecord::Migration
  def change
    Part.all.each{|p| "parts/#{p.name.downcase.gsub(' ', '_')}"; p.save!}
  end
end
