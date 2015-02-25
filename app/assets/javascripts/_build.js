function getSections(){
 return [Boat, Style];
}

$(function(){
  initBoat();
  initStyle();
  initSelectedOptions();
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


function initSelectedOptions(){
  window.selection = new selectableObject({
    boat: null,
    style: null,
    hull: null,
    extras: null,
  });
}

function updateOptionsDisplay(){
  sections = getSections();
  selection.replaceEmptyWithNull();
  for (var i =  0; i < sections.length; i++){
    sections[i].showOptions();
    sections[i].setCurrentSelection();
  }
};

function noOptionsSelected(selectChoices){
  for (category in selectChoices){
    if (selectChoices[category] != null && selectChoices.hasOwnProperty(category))
      return false
  }
  return true;
}


