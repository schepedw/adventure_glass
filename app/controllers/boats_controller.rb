class BoatsController < ApplicationController
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

  end
end
