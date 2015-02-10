$(function(){
  divideBuildWindow();
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
