class HomeController < ApplicationController
  def main
    @carousel_images = {'flamingoes_landing.png' => 'Look, a caption!'}
  end
end
