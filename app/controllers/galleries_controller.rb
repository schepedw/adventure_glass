class GalleriesController < ApplicationController

  def subject
    @pictures = []
    Dir.foreach(Rails.root.join('app','assets','images', params[:subject])) do |file|
     @pictures << params[:subject] + '/' + file unless ['.', '..'].include?(file)
    end
    render "galleries/#{params[:subject]}"
  end

end
