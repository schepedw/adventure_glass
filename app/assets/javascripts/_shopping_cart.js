$(function(){
  $('.product-quantity.best_in_place').focusout(function(){
    $('.caret-container').show();
  });

  $('.fake-select').click(function(){
    if ($('.product-quantity.best_in_place').children().length > 0)
      return;
    $('.product-quantity.best_in_place').click();
    $('.caret-container').hide();
  });
  $('.product-quantity.best_in_place').bind("ajax:success", function() { $.ajax({url: $(location).attr('href') + '.js'}) } );
});
