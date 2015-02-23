function getSections(){
 return [Boat, Style];
}

$(function(){
  divideBuildWindow();
  sections = getSections();
  for (var i =  0; i < sections.length; i++){
    sections[i].showOptions();
    sections[i].setChangeListeners();
  }
});

function divideBuildWindow(){
  var options_height = $('.options-container').height();
  var results_height = $('.result-container').height();
  if (options_height > results_height){
    $('.options-container').addClass('right-border');
    $('.result-container').removeClass('left-border');
  }else{
    $('.result-container').addClass('left-border');
    $('.options-container').removeClass('right-border');
  }

}


function showStyleOptions(){

}

function showHullOptions(){

}

function updateHullOptions(){

}

function showExtras(){

}

var selectedOptions = {
  boat: null,
  style: null,
  hull: null,
  extras: null,
}

function updateOptionsDisplay(){
  sections = getSections();
  for (var i =  0; i < sections.length; i++){
    sections[i].showOptions();
    sections[i].setChangeListeners();
    sections[i].setCurrentSelection();
  }
};

function noOptionsSelected(selectChoices){
  for (category in selectChoices){
    if (selectChoices[category] != null)
      return false
  }
  return true;
}

