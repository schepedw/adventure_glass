function initBoat(){
  window.Boat = new selectableObject(['Paddleboat', 'Canoe', 'Gondola', 'Riverboat', 'Excursion Boat']);

  Boat.optionsCompatibleWith = function(selected_options){
    return this.options;
  }

  Boat.showOptions = function(){
    $('.boat-button-container').empty();
    $('#boat_dropdown').empty();
    $('#boat_dropdown').append($("<option />"));
    boat_options = this.optionsCompatibleWith(selection)
    for (i = 0; i < boat_options.length; i++){
      button = $("<button class='btn btn-info btn-boat-toggle'>"+boat_options[i]+"</button>");
      selectOption = $('<option value=' + boat_options[i] + '>' + boat_options[i] + '</option>');
      $('#boat_dropdown').append(selectOption);
      $('.boat-button-container').append(button);
    }
  }

  Boat.setChangeListeners = function(){
    $('.btn-boat-toggle').click(function(){
      selection.options['boat'] = $(this).text().toLowerCase();
      updateOptionsDisplay();
    });

    $('#boat_dropdown').change(function(){
      selection.options['boat'] = $(this).val().toLowerCase();
      updateOptionsDisplay();
    });
  }

  Boat.setCurrentSelection = function(){
    //TODO: there's a bug in here. If a user wants to deselect(remove it from selectedOpts) a boat, they won't be able to 
    $('.btn-boat-toggle.active').toggleClass('active');
    if (selection.options['boat']){
      $('.btn-boat-toggle:contains(' + selection.options['boat'].capitalize() + ')').addClass('active');
      $('#boat_dropdown').val(selection.options['boat'].capitalize());
    }

  }
}
