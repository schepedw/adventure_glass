module PictureFinder
  def pictures_for(product, limit = 5)
    return [part_pic(product)] if product.is_a?(Part)
    pics = []
    Dir.foreach(Rails.root.join('app','assets','images', product.image_path)) do |file|
      pics << product.image_path + '/' + file unless ['.', '..', '.DS_Store'].include?(file)
      break if pics.size >= limit
    end
    pics
  end

  private

  def part_pic(part)
    "parts/#{part.id}_#{part.name.downcase.gsub(' ','_')}.jpg"
  end

end
