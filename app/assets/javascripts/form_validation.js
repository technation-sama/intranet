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
        }).on('submit', function (e) {
            e.preventDefault();
             var $form = $(e.target);
            if ($form.data('remote')) {
                 console.log('sucess');

            var numInvalidFields = $form.data('formValidation').getInvalidFields().length;
            if (numInvalidFields) {
                e.preventDefault();
                return false;
                             }
        }   
        });
});

