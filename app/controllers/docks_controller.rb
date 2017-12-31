# TODO: remove me
class DocksController < ApplicationController
  def show
    @display_options = ['Custom Size', 'Custom Shape', 'Wood Or Resin Finish']
    @pictures = []
    Dir.foreach(Rails.root.join('app', 'assets', 'images', 'docks')) do |file|
      @pictures << 'docks/' + file unless ['.', '..', '.DS_Store'].include?(file)
    end
  end
end
