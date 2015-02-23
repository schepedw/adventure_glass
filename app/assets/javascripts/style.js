var Style = {

  options : {
    canoe:           ['canoe_option1', 'canoe_option2'],
    paddleboat:      ['Mark Twain', 'Handicapped', 'Sea Venture', '4 peddler', 'Pirate Ship', 'African Queen', 'Pontoon', 'Dixie'],
    gondola:         ['gondola_option1', 'gondola_option2'],
    excursion_boat:  ['styleOption1', 'styleOption2'],
    riverboat:       ['styleOption1', 'styleOption2']
  },


  optionsCompatibleWith: function(selectedOptions){
    compatibleOpts = {}
    boatOpt = selectedOptions['boat']
    if (boatOpt)
      compatibleOpts[boatOpt] = this.options[boatOpt];//use select here
    if (noOptionsSelected(compatibleOpts) &&
        noOptionsSelected(optionsExcept(selectedOptions, 'style'))){
      return this.options;
    }
    return compatibleOpts;
  },

  showOptions: function(){
    $('#style_dropdown').empty();
    $('#style_dropdown').append($("<option />"));
    styleOptions = this.optionsCompatibleWith(selectedOptions);
    for (boatCategory in styleOptions){
      if (styleOptions.hasOwnProperty(boatCategory)){
        optGroup = $('<optgroup label=' + boatCategory + '>') ;
        for ( i in styleOptions[boatCategory] ){
          selectOption = $('<option value=' + styleOptions[boatCategory][i] + '>' + styleOptions[boatCategory][i] + '</option>');
          optGroup.append(selectOption);
        }
        $('#style_dropdown').append(optGroup);
      }
    }
  },

  setChangeListeners: function(){
    $('#style_dropdown').change(function(){
      selectedOptions['style'] = $(this).val().toLowerCase();
      updateOptionsDisplay();
    });
  },

  setCurrentSelection: function(){
    $('#style_dropdown').val(selectedOptions['style']);
  }
}

