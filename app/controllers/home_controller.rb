class HomeController < ApplicationController
  before_action :current_shopping_cart
  def main
    1/0
    @carousel_images = {'flamingoes_landing.png' => ''}
  end
end
