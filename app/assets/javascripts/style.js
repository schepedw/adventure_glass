var Style = {

  options : { canoe: ['canoe_option1', 'canoe_option2'],
    paddleboat:  ['Mark Twain', 'Handicapped', 'Sea Venture', '4 peddler', 'Pirate Ship', 'African Queen', 'Pontoon', 'Dixie'],
    gondola:    ['gondola_option1', 'gondola_option2'],
    excursion_boat:    ['styleOption1', 'styleOption2'],
    riverboat:  ['styleOption1', 'styleOption2']
  },


  optionsCompatibleWith: function(selected_options){
    return this.options;
  },

  showOptions: function(){
    $('#style_dropdown').empty();
    $('#style_dropdown').append($("<option value=null/>"));
    styleOptions = this.optionsCompatibleWith(null)
    for (boatCategory in styleOptions){
      optGroup = $('<optgroup label=' + boatCategory + '>') ;
      for ( i in styleOptions[boatCategory] ){
        selectOption = $('<option value=' + styleOptions[boatCategory][i] + '>' + styleOptions[boatCategory][i] + '</option>');
        optGroup.append(selectOption);
      }
      $('#style_dropdown').append(optGroup);
    }
    this.setChangeListeners();
  },

  setChangeListeners: function(){
    $('#style_dropdown').change(function(){
      selectedStyle = $(this).val();
      selectedOptions['style'] = selectedStyle;
    });
  },
}

