$(document).ready(function() {
    $('#suggestion_form').bootstrapValidator({
        fields: {
            'suggestion[subject]': {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: 'Please Enter your subject of concern'
                    }
                }
            },

            'suggestion[message]': {
                validators: {
                      stringLength: {
                        min: 10,
                        max: 200,
                        message:'Please enter at least 10 characters and no more than 200'
                    },
                    notEmpty: {
                        message: 'This field is required'
                    }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            e.preventDefault();
            var $form = $(e.target);
            console.log($form.data('bootstrapValidator'))
            var numInvalidFields = $form.data('bootstrapValidator').getInvalidFields().length
            console.log(numInvalidFields)
            if (numInvalidFields>0) {
                e.preventDefault();
                return false;  
            }
            else{ 
              $.ajax({
                 type: "POST",
                 url: $form.attr('action'),
                 data: $form.serialize(),
                 success: function(data){
                    console.log(data)
                    new PNotify({
                     title: "success",
                     text: "sucess",
                     nonblock: {
			            nonblock: true
		          },
        		  delay: 6000,
        		  styling: "bootstrap3",
        		  width: "40%",
        		  cornerclass: "round",
        		  addclass: "stack-bar-top",
                });
                    
                  },
                  error: function(data){
                    console.log(data)
                  }
              });
            }
        });
        
        /*Post Validation Form*/
        
});
