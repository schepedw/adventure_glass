var Boat = {
  options : ['Paddleboat', 'Canoe', 'Gondola', 'Riverboat', 'Excursion Boat'],

  optionsCompatibleWith: function(selected_options){
    return this.options;
  },

  showOptions: function(){
    $('.boat-button-container').empty();
    $('#boat_dropdown').empty();
    $('#boat_dropdown').append($("<option value=null/>"));
    boat_options = this.optionsCompatibleWith(null)
    for (i = 0; i < boat_options.length; i++){
      button = $("<button class='btn btn-info btn-boat-toggle'>"+boat_options[i]+"</button>");
      selectOption = $('<option value=' + boat_options[i] + '>' + boat_options[i] + '</option>');
      $('#boat_dropdown').append(selectOption);
      $('.boat-button-container').append(button);
    }
    this.setChangeListeners();
  },

  setChangeListeners: function(){
    $('.btn-boat-toggle').click(function(){
      $(this).toggleClass('active');
      selectedBoat = $(this).text();
      selectedOptions['boat'] = selectedBoat;
      $('#boat_dropdown').val(selectedBoat);
    });

    $('#boat_dropdown').change(function(){
      selectedBoat = $(this).val();
      selectedOptions['boat'] = selectedBoat;
      $('.btn-boat-toggle.active').toggleClass('active');
      $('.btn-boat-toggle:contains(' + selectedBoat + ')').addClass('active');
    });
  }

}
