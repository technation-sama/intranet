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
        
        /*Post Validation Form*/
        
});
