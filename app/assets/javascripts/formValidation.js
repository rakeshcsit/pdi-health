var ready;
ready = function() {

$(".select2").select2({ width: '100%',
  placeholder: 'Choose an option',
  allowClear: true
});

$('#new_note, .edit_note').bootstrapValidator({
  feedbackIcons: {
    valid: 'glyphicon glyphicon-ok',
    invalid: 'glyphicon glyphicon-remove',
    validating: 'glyphicon glyphicon-refresh'
  },
  fields: {
    "note[patient_id]": {
      validators: {
        callback: {
          message: 'Field required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('note[patient_id]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
    "note[interaction_type]": {
      validators: {
        callback: {
          message: 'Field required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('note[interaction_type]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
    "note[note]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "user[time_zone]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('user[time_zone]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
    "patient[email]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "patient[phone_number]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "patient[communication_preferred]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('patient[communication_preferred]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    }  
  }

});


$('#new_patient, .edit_patient').bootstrapValidator({
  feedbackIcons: {
    valid: 'glyphicon glyphicon-ok',
    invalid: 'glyphicon glyphicon-remove',
    validating: 'glyphicon glyphicon-refresh'
  },
  fields: {
    "patient[first_name]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "patient[last_name]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "patient[address]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "patient[state]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              debugger;
              var options = validator.getFieldElements('patient[state]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
    "patient[zipcode]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "user[time_zone]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('user[time_zone]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
    "patient[email]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "patient[phone_number]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "patient[communication_preferred]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('patient[communication_preferred]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    }  
  }

});

// Full name can't be blank
// Phone number can't be blank
// Address can't be blank
// State can't be blank
// Zipcode can't be blank

$('#new_doctor, .edit_doctor').bootstrapValidator({
  feedbackIcons: {
    valid: 'glyphicon glyphicon-ok',
    invalid: 'glyphicon glyphicon-remove',
    validating: 'glyphicon glyphicon-refresh'
  },
  fields: {
    "doctor[full_name]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "doctor[address]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "doctor[state]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('doctor[state]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
    "doctor[zipcode]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "user[time_zone]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('user[time_zone]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
    "doctor[email]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "doctor[phone_number]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    }
  }

});

$('#new_staff, .edit_staff').bootstrapValidator({
  feedbackIcons: {
    valid: 'glyphicon glyphicon-ok',
    invalid: 'glyphicon glyphicon-remove',
    validating: 'glyphicon glyphicon-refresh'
  },
  fields: {
    "staff[full_name]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "staff[email]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "user[time_zone]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('user[time_zone]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
  }

});

$('#new_rep, .edit_rep').bootstrapValidator({
  feedbackIcons: {
    valid: 'glyphicon glyphicon-ok',
    invalid: 'glyphicon glyphicon-remove',
    validating: 'glyphicon glyphicon-refresh'
  },
  fields: {
    "rep[full_name]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "rep[email]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "user[time_zone]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('user[time_zone]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    },
    "rep[phone_number]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
  }

});

$('.edit_user').bootstrapValidator({
  feedbackIcons: {
    valid: 'glyphicon glyphicon-ok',
    invalid: 'glyphicon glyphicon-remove',
    validating: 'glyphicon glyphicon-refresh'
  },
  fields: {
    "user[email]": {
      trigger: 'blur',
      validators: {
        notEmpty: {
          message: 'Field Required'
        }
      }
    },
    "user[role]": {
      validators: {
        callback: {
          message: 'Field Required',
          callback: function(value, validator) {
              // Get the selected options
              var options = validator.getFieldElements('user[role]]').val();
              return (options != null && options.length >= 1);
          }
        }
      }
    }
  }

});

};

  $(document).ready(ready);
  $(document).on('page:load', ready);