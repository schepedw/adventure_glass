$(function(){
  bindOptionCheckboxes();
  if (typeof(best_in_place_qty) == 'undefined')
    return;
  best_in_place_qty.hide();
  $('#quantity').click(function(){
    $(this).toggle();
    best_in_place_qty.show();
  });
  best_in_place_qty.bind("ajax:success", resetQuantityField );
});

var resetQuantityField = function(){
  best_in_place_qty.hide();
  $('#quantity option:first').text(best_in_place_qty.text());
  $('#quantity').show();
};

var bindOptionCheckboxes = function(){
  $('.select_option :checkbox').click(function(){
    $(this).parent().submit();
  })
}
