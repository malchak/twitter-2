$(document).ready(function() {
 
  $.get('/shit', function(data) {
    $('.container img').hide();
    $('.container').append(data);
  });

});
