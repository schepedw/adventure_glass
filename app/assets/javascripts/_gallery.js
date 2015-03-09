$(function(){
  $('.gallery-thumbnail').click(function(){
    $('.image-active').empty();
    $('.image-active').append($(this).clone().toggleClass('thumbnail gallery-thumbnail'));
  });

});
