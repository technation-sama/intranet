
$(document).on('turbolinks:load',function(){
	$('#pins').masonry({
    itemSelector: '.box',
    isAnimated: true
  });
  lightbox.option({
    'resizeDuration': 200,
    'wrapAround': true,
    'albumLabel': "Photo %1 of %2",
    'fadeDuration': 600
  });
});