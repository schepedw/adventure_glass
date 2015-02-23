var Boat = new selectableObject(
  {
  options : ['Paddleboat', 'Canoe', 'Gondola', 'Riverboat', 'Excursion Boat'],

  optionsCompatibleWith: function(selected_options){
    return this.options;
  },

  showOptions: function(){
    $('.boat-button-container').empty();
    $('#boat_dropdown').empty();
    $('#boat_dropdown').append($("<option />"));
    boat_options = this.optionsCompatibleWith(selectedOptions)
    for (i = 0; i < boat_options.length; i++){
      button = $("<button class='btn btn-info btn-boat-toggle'>"+boat_options[i]+"</button>");
      selectOption = $('<option value=' + boat_options[i] + '>' + boat_options[i] + '</option>');
      $('#boat_dropdown').append(selectOption);
      $('.boat-button-container').append(button);
    }
  },

  setChangeListeners: function(){
    $('.btn-boat-toggle').click(function(){
      selectedOptions['boat'] = $(this).text().toLowerCase();
      updateOptionsDisplay();
    });

    $('#boat_dropdown').change(function(){
      selectedOptions['boat'] = $(this).val().toLowerCase();
      updateOptionsDisplay();
    });
  },

  setCurrentSelection: function(){
    //TODO: there's a bug in here. If a user wants to deselect(remove it from selectedOpts) a boat, they won't be able to 
    $('.btn-boat-toggle.active').toggleClass('active');
    if (selectedOptions['boat']){
      $('.btn-boat-toggle:contains(' + selectedOptions['boat'].capitalize() + ')').addClass('active');
      $('#boat_dropdown').val(selectedOptions['boat'].capitalize());
    }

  }
}
