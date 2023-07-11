/*global $*/
$(document).ready(function() {
  $('.show-image-button').click(function() {
    var image = $(this).data('image');
    // $('#imageContainer').html('<img src="' + image + '">');
    $('#imageContainer').html('<a href="'+image+'" data-lightbox="item"><img src="' + image + '" class="equipmentimg"></a>');
  });
});