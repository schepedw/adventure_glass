class HomeController < ApplicationController
  before_action :current_shopping_cart
  def main
    @carousel_images = {'paddleboats/landing_hero.png' => ''}
  end
end
