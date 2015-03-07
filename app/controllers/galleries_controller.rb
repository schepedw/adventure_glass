class GalleriesController < ApplicationController
  def boats
    @carousel_images = {'boat_landing_sample.jpg' => 'Caption here'}
  end
end
