function initBoat(){
  window.Boat = new selectableObject(['Paddleboat', 'Canoe', 'Gondola', 'Riverboat', 'Excursion Boat']);

  Boat.optionsCompatibleWith = function(selection){
    styleOpt = decodeURI(selection.options['style']);
    if (Style.findParentBoat(styleOpt.toLowerCase()) &&
        !selection.options['boat']){
      selection.options['boat'] = Style.findParentBoat(styleOpt.toLowerCase()).toLowerCase();
    }
    return this.options;
  }

  Boat.showOptions = function(){
    boat_options = this.optionsCompatibleWith(selection)
    if ($('.boat-button-container').children().length == 0){
      $('#boat_dropdown').append($("<option />"));
      for (i = 0; i < boat_options.length; i++){
        button = $("<button class='btn btn-info btn-boat-toggle'>"+boat_options[i]+"</button>");
        selectOption = $('<option value=' + encodeURI(boat_options[i]) + '>' + boat_options[i] + '</option>');
        $('#boat_dropdown').append(selectOption);
        $('.boat-button-container').append(button);
      }
    }
  }

  Boat.setChangeListeners = function(){
    $('.btn-boat-toggle').click(function(){
      newSelection = $(this).text().toLowerCase();
      selection.options['boat'] = (selection.options['boat'] == newSelection ? null : newSelection);
      updateOptionsDisplay();
    });

    $('#boat_dropdown').change(function(){
      selection.options['boat'] = $(this).val().toLowerCase();
      updateOptionsDisplay();
    });
  }


  Boat.setCurrentSelection = function(){
    $('.btn-boat-toggle.active').toggleClass('active');
    if (selection.options['boat']){
      $('.btn-boat-toggle:contains(' + selection.options['boat'].capitalize() + ')').addClass('active');
      $('#boat_dropdown').val(selection.options['boat'].capitalize());
    }
  }
}
