$(function(){
  $('.gallery-thumbnail').click(function(){
    $('.image-active').empty();
    $('.image-active').append($(this).clone().toggleClass('thumbnail gallery-thumbnail'));
    $('.thumbnail-active').toggleClass('thumbnail-active');
    $(this).toggleClass('thumbnail-active');
  });
  $('#add-option-form-toggle').click(function(){
    $('#option-new').toggle(300);
  });
  $('#add-specification-form-toggle').click(function(){
    $('#specification-new').toggle(300);
  });
});
