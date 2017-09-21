$('.carousel').carousel({
  // interval: 10000 //changes the speed interval
});

$("#main").click(function() {
  $("#mini-fab").toggleClass('hidden');
});

$(document).on('turbolinks:load',function(){
  
  // to show the first tab
  $('#prodTabs a:first').tab('show');

  $(".select2" ).select2();
   
  // article categories select
  $("#post_tag_list").select2({
    multiple: true,
    theme: "bootstrap",
    tags: true,
    tokenSeparators: [',', ' '],
    placeholder: 'select category',
    width: "100%"
  });

  // masonry transitions
  $('#pins').imagesLoaded(function() {
    $('#pins').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });
});
 
// prevent collapse after page like
$('.like').on('click',function(e){
  var id='#toggle'+$(this).attr('data-id');
  $(id).addClass('in');
});