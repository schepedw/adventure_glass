class PaddleboatsController < ApplicationController
  def index
    @display_options = []
    @carousel_images = []
    @carousel_images = {
      'paddleboats/seaworldcropped.jpg' => 'caption #1',
      'paddleboats/white_swans.png' => 'caption #3'
    }
    render 'boats/paddleboats/index'
  end
end
