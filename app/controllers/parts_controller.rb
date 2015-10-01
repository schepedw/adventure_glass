require 'csv_reader'
include CSVReader
class PartsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json {
        render json: {:aaData => format_yml}}
    end
  end

  def show
    part = Product.find(params[:id])
    @pictures = ["parts/#{params[:id]}_#{part.name}.jpg"]
    @display_options = []
    @product = Part.new(base_model_id: part.id)
  end

  private

  def format_yml
    Part.all.inject( [] ) do |rows, part|
      rows << display_row(part)
    end
  end

  def display_row(part)
    base_model_id = part.id
    image_file = "#{part.image_path}/#{part.id}_#{part.name.downcase.gsub(' ','_')}.jpg"
    [img_tag(image_file), part.id, part.description, part.price].inject( [] ) do |row, col|
      row << link_tag(col, base_model_id)
    end
  end

  def link_tag(link_text, base_model_id)
    "<a href = '#{new_product_path(base_model_id: base_model_id)}'>#{link_text}</a>"
  end

  def img_tag(img)
    "<img src='assets/#{img}' class='img-responsive thumbnail table-thumbnail'/>"
  end

end
