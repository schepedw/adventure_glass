$(function(){
  $('.product-quantity.best_in_place').focusout(function(){
    $('.caret-container').show();
  });

  $('.fake-select').click(function(){
    bip = $(this).find('.product-quantity.best_in_place');
    if (bip.children().length > 0)
      return;
    bip.click();
    $(this).find('.caret-container').hide();
  });
  $('.product-quantity.best_in_place').bind("ajax:success", function() { $.ajax({url: $(location).attr('href') + '.js'}) } );
});
