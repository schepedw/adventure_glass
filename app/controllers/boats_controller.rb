class BoatsController < ProductsController
  before_action :current_shopping_cart
  def build
    @boat_options = %w(Paddleboat Canoe Gondola Riverboat Excursion\ Boat)
    @style_options = {:canoe      => ['canoe_option1', 'canoe_option2'],
                      :paddleboat => ['Mark Twain', 'Handicapped Sea Venture', '4 peddler', 'Pirate Ship', 'African Queen', 'Pontoon', 'Dixie'],
                      :gondola    => ['gondola_option1', 'gondola_option2'],
                      :excursion_boat    => ['excursion_boat_option1', 'excursion_boat_option2'],
                      :riverboat    => ['riverboat_option1', 'riverboat_option2']
    }
    @extras = %w(option0 option1 option2 option3 option4 option5 option6 option7 option8 option9 option10)
  end

  def index
    @riverboat = 3
    @boats = Boat.where.not(type: ['waterfowl', 'paddleboats'])
    @carousel_images = {'boat_landing_sample.jpg' => 'Caption here'}
    @products_for_slider = Boat.where(type: 'paddleboat')
  end

  def paddleboat_index
    @products_for_slider = Boat.where(type: 'waterfowl')
    @carousel_images = {
      'paddleboats/seaworldcropped.jpg' => 'caption #1',
      'paddleboats/white_swans.png' => 'caption #3'
    }
    @paddleboats = Boat.where(type: 'paddleboat')
    render 'boats/paddleboats/index'
  end
  private

  def parent_folder_for(dir)
    case
    when ['excursion_boats', 'riverboats'].include?(dir)
      'barges/'
    when ['gondolas', 'mark_twains', 'pirate_ships', 'sea_ventures', 'waterfowl', 'dixie_boats', 'pontoon_boats'].include?(dir)
      'paddleboats/'
    else
      ''
    end
  end

end
