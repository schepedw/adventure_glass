$(function() {
  if ($('#parts').length){
    $('#parts').dataTable({
      sPaginationType: "full_numbers",
      bJQueryUI: true,
      bAutoWidth: true,
      aaSorting: [[ 0, "desc" ]],
      bProcessing: true,
      bServerSide: false,
      ajax: $('#parts').data('source'),
      columns: [{'title': '' }, {'title': 'Part #'}, {'title' : 'Description'}, {'title' : 'Price' }],
      pageLength: 50,
      lengthMenu: [ [-1, 10, 20, 30], ['All', 10, 20, 30] ],
    });
  }
});
