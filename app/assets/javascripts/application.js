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
  var x = "";
  var page=1;

  $("#Next").click(function() {
    if (page == 1) {
      //load section 2 category page
      $('#buttonsubmit').addClass('hidden');
      $('#section2').removeClass('hidden');
      $('#section1').addClass('hidden');
      $('#Back').removeClass('hidden');
      page = 2;
    } else if(page == 2) {
      //load section 3 description page
      $('#section2').addClass('hidden');
      $('#section3').removeClass('hidden');
      //get selected category and show corresponding list
      x = $("#repair_category").find(":selected").val();
      $('#sectionHead2').text(x);
      x="[id='"+x+"']";
      $(x).removeClass('hidden');
      page = 3;
    }else if(page == 3) {
      //load section 4
      if($('#repair_description_other').prop('checked')) {
        var y = $('#other').val();
        $('#repair_description_other').val(y);

      }
      $('#buttonsubmit').removeClass('hidden');
      $('#section3').addClass('hidden');
      $('#Next').addClass('hidden');
      $(x).addClass('hidden');
      page=4;
    }

  });

  $("#Back").click(function() {
    if(page ==4) {
      //load section 3
      $('#section3').removeClass('hidden');
      $('#buttonsubmit').addClass('hidden');
      $(x).removeClass('hidden');
      $('#Next').removeClass('hidden');
      page = 3;
    } else if (page == 3) {
      //load section 2
      $('#section3').addClass('hidden');
      $('#section2').removeClass('hidden');
      $(x).addClass('hidden');
      page = 2;
    } else if(page == 2) {
      //load section 1
      $('#section2').addClass('hidden');
      $('#section1').removeClass('hidden');
      $('#Back').addClass('hidden');
      page = 1;
      }
  });
  $('#other').focus(function() {
    $('#repair_description_other').prop("checked", true);
  });

});
