class BoatsController < ApplicationController
  def build
    @boat_options = %w(Paddleboat Canoe Gondola Riverboat Excursion\ Boat)
    @extras = %w(option0 option1 option2 option3 option4 option5 option6 option7 option8 option9 option10)
  end
  def index

  end
end
