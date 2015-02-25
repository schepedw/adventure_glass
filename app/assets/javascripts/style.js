function initStyle(){
  window.Style = new selectableObject(

    {
    canoe:           ['canoe_option1', 'canoe_option2'],
    paddleboat:      ['Mark Twain', 'Handicapped', 'Sea Venture', '4 peddler', 'Pirate Ship', 'African Queen', 'Pontoon', 'Dixie'],
    gondola:         ['gondola_option1', 'gondola_option2'],
    excursion_boat:  ['styleOption1', 'styleOption2'],
    riverboat:       ['styleOption1', 'styleOption2']
  }
  )

  Style.optionsCompatibleWith = function(selection){
    compatibleOpts = {}
    boatOpt = selection.options['boat']
    if (boatOpt)
      compatibleOpts[boatOpt] = this.options[boatOpt];//use select here
    if (noOptionsSelected(compatibleOpts) &&
        selection.except('style').empty()){
      return this.options;
    }
    return compatibleOpts;
  }

  Style.showOptions = function(){
    $('#style_dropdown').empty();
    $('#style_dropdown').append($("<option />"));
    styleOptions = this.optionsCompatibleWith(selection);
    for (boatCategory in styleOptions){
      if (styleOptions.hasOwnProperty(boatCategory)){
        optGroup = $('<optgroup label=' + boatCategory + '>') ;
        for ( i in styleOptions[boatCategory] ){
          selectOption = $('<option value=' + encodeURI(styleOptions[boatCategory][i].toLowerCase()) + '>' + styleOptions[boatCategory][i] + '</option>');
          optGroup.append(selectOption);
        }
        $('#style_dropdown').append(optGroup);
      }
    }
  }

  Style.setChangeListeners = function(){
    $('#style_dropdown').change(function(){
      selection.options['style'] = $(this).val().toLowerCase();
      updateOptionsDisplay();
    });
  }

  Style.setCurrentSelection = function(){
    $('#style_dropdown').val(selection.options['style']);
  }

  Style.findParentBoat = function(styleOpt){
    if (styleOpt != 'null'){
      for (key in this.options){
        for (i = 0; i < this.options[key].length; i++){
          value = this.options[key][i].toLowerCase();
          if (value == styleOpt){
            return key.capitalize();
          }
        }
      }
    }
    return null;
  }
}
