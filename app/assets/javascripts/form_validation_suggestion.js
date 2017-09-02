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
        })
        .on('success.form.bv', function(e) {
            console.log('sucess');
            var $form = $(e.target);
            if ($form.data('remote')) {
                e.preventDefault();
                return false;
            }
            }).on('submit', function (e) {
                    e.preventDefault();
                var $form = $(e.target);
                if ($form.data('remote')) {
                var numInvalidFields = $form.data('formValidation').getInvalidFields().length;
                if (numInvalidFields) {
                    e.preventDefault();
                    return false;
                }
            }
        });
});
