class HomeController < ApplicationController
  before_action :current_shopping_cart
  def main
    @carousel_images = {'flamingoes_landing.png' => 'Look, a caption!'}
  end
end
