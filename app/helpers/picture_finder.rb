module PictureFinder
  def pictures_for(product, limit = 5)
    pics = []
    base_path = 'public/assets/base_model_pictures'
    Dir.foreach(Rails.root.join(base_path, product.image_path)) do |file|
      pics << 'base_model_pictures/' + product.image_path + '/' + file unless ['.', '..', '.DS_Store'].include?(file)
      break if pics.size >= limit
    end
    pics
  end
end
