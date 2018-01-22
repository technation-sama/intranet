$(document).on('turbolinks:load',function(){
  $(window).bind('rails:flash', function(e, params) {
    new PNotify({
      title: params.type,
      text: params.message,
      type: params.type,
      nonblock: {
			  nonblock: true
		  },
		  delay: 10000,
		  width: "40%",
		  cornerclass: "round",
		  addclass: "stack-bar-top",
    });
  });
});