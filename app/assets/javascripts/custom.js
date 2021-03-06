$('.carousel').carousel({
  // interval: 10000 //changes the speed interval
});

$("#main").click(function() {
  $("#mini-fab").toggleClass('hidden');
});

$(document).on('turbolinks:load',function(){
  $('.post-body').readmore({
        collapsedHeight: 320,
        lessLink: '<a href="#">Show less</a>'
  });      
  // to show the first tab
  $('#prodTabs a:first').tab('show');

  $(".select2" ).select2();
  // dropdown menu
  $('.dropdown-toggle').dropdown();
  // tooltips 
   $('[data-toggle="tooltip"]').tooltip(); 
   
  // article categories select
  $("#post_tag_list").select2({
    multiple: true,
    tags: true,
    theme: "bootstrap",
    tokenSeparators: [',', ' '],
    placeholder: 'Select Categories',
    width: "100%",
    createTag: function(newTag) {
        return {
            id: newTag.term,
            text: newTag.term + '*new*'
        };
    }
  });

  // masonry transitions
  $('#pins').imagesLoaded(function() {
    $('#pins').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });

  // hover on download button. Gallery
  $(".gallery-attachment").hover(function() {
    $(".download_hover").css({
      visibility: "visible"
    });
  });
});
 
