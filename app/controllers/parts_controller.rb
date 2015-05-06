require 'csv_reader'
include CSVReader
class PartsController < ProductsController
  def index
    respond_to do |format|
      format.html
      format.json {
        render json: {:aaData => format_yml}}
    end
  end

  def show
    part = find(params[:id].to_i) || Product.find(params[:id])
    name = part[0]
    attrs = part[1]
    @pictures = ["parts/#{attrs.part_number.to_s}_#{name}.jpg"]
    @display_options = []
    @product = Product.new(class_name: 'Part')
  end

  private
  def format_yml
    AppConfig.parts.inject( [] ) do |rows, (part_name, attrs)|
      rows << display_row("#{attrs.part_number.to_s}_#{part_name}.jpg", attrs.part_number, attrs.description, attrs.price)
    end
  end

  def display_row(image_file, part_number, description, price)
    [img_tag(image_file), part_number, description, price].inject( [] ) do |row, col|
      row << link_tag(col, part_number)
    end
  end

  def link_tag(link_text, part_number)
    "<a href = 'parts/#{part_number}'>#{link_text}</a>"
  end

  def img_tag(img)
    "<img src='assets/parts/#{img}' class='img-responsive thumbnail'/>"
  end

  def find(id)
    #TODO - can remove this if we move to AR
    AppConfig.parts.find do |name, attrs|
      attrs.part_number == id
    end
  end
end

