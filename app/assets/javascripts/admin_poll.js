$(document).ready(function() {
  
  $('.opevvn_poll_btn').click(function(e) {
    $(this).css("display", "none");
    e.stopPropagation();  // prevent Rails UJS click event
    e.preventDefault();
    $.post("poll_periods",{}, function(data,status){
     alert("Polls successfully opened.\n Email notifications have been sent to each employee")
    });
  })
  
  $('.closevv_poll_btn').click(function(e) {
    $(this).css("display", "none");
    e.stopPropagation();  // prevent Rails UJS click event
    e.preventDefault();
    var idd = $(this).attr('id')
    $.post("poll_periods/"+idd,{_method:'put',id:idd}, function(data,status){
     alert("Poll closed.\n")
    });
  })
  
})