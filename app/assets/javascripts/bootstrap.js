document.addEventListener("DOMContentLoaded", function(event) {
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
});
