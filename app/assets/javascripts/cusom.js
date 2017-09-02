
$('.carousel').carousel({
        // interval: 10000 //changes the speed interval
     
})
$("#main").click(function() {
  $("#mini-fab").toggleClass('hidden');
});

$(document).on('turbolinks:load',function(){
   $(".select2" ).select2();
   
   /*article categories select*/
   $("#post_tag_list").select2({
    multiple: true,
    theme: "bootstrap",
    tags: true,
    tokenSeparators: [',', ' '],
    placeholder: 'select category',
    width: "100%"
  });
   /* /article categories select*/
});
 
  /* prevent collapse after page like*/
  $('.like').on('click',function(e){
   var id='#toggle'+$(this).attr('data-id');
   
      $(id).addClass('in');
     
  });