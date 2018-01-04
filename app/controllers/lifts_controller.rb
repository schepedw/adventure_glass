# TODO: remove me
class LiftsController < ApplicationController
  def show
    @display_options = []
    @pictures = []
    Dir.foreach(Rails.root.join('app', 'assets', 'images', 'lifts')) do |file|
      @pictures << 'lifts/' + file unless ['.', '..', '.DS_Store'].include?(file)
    end
  end
end
