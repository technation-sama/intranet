//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrapValidator.min
//= require pnotify
//= require unobtrusive_flash
//= require select2-full
//= require lightbox
//= require masonry/jquery.masonry
//= require flashes
//= require form_validation
//= require form_validation_suggestion
//= require infinite-scroll
//= require poll
//= require typer
//= require custom
//= require jquery.countdown.min
//= require readmore
//= require ckeditor/init
$(function(){
  var page=1;
  $("#Next").click(function() {
    if (page == 1) {
      $('#section2').toggleClass('hidden');
      $('#section1').toggleClass('hidden');
      page = 2;
    } else if(page == 2) {
      $('#section2').toggleClass('hidden');
      $('#section3').toggleClass('hidden');
      $('#Back').toggleClass('hidden');
      $('#buttonsubmit').toggleClass('hidden');
      page = 3;
    }

  });

  $("#Back").click(function() {
    if (page == 3) {
      $('#section3').toggleClass('hidden');
      $('#section2').toggleClass('hidden');
      $('#buttonsubmit').toggleClass('hidden');
      page = 2;
    } else if(page == 2) {
      $('#section2').toggleClass('hidden');
      $('#section1').toggleClass('hidden');
      $('#Back').toggleClass('hidden');
      page = 1;
    }
  });

});
