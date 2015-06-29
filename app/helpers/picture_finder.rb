module PictureFinder
  def pictures_for(product, limit = 5)
    pics = []
    Dir.foreach(Rails.root.join('app','assets','images', product.image_path)) do |file|
      pics << product.image_path + '/' + file unless ['.', '..', '.DS_Store'].include?(file)
      break if pics.size >= limit
    end
    pics
  end
end
