$(document).on ("turbolinks:load",function() {
    $('#polls_form').bootstrapValidator({
         framework: 'bootstrap',
        fields: {
            'poll[user_id]': {
                validators: {
                   notEmpty: {
                   message: 'Please select name of the Nominee'
                 }
                }
            },
            'poll[project_name]': {
                validators: {
                    notEmpty: {
                        message: 'Please select the name of  your project'
                    }
                }
            },
            'poll[body]': {
                validators: {
                      stringLength: {
                        min: 10,
                        max: 200,
                        message:'Please enter at least 10 characters and no more than 200'
                    },
                    notEmpty: {
                        message: 'Please enter the reason why you are voting for him/her'
                    }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            e.preventDefault();
            var $form = $(e.target);
            var numInvalidFields = $form.data('bootstrapValidator').getInvalidFields().length
            if (numInvalidFields>0) {
                e.preventDefault();
                return false;  
            }
            else{
                 // console.log($form.serialize())
              $.ajax({
                 type: "POST",
                 url: $form.attr('action'),
                 data: $form.serialize(),
                 success: function(data){
                    $('#poll-div').html('<div class="alert elert-success">Your vote successfully submited</div>')
                    return false
                  },
                  error: function(data){
                    console.log(data)
                    return false
                  }
              });
            }
        });
});

