var ready;
ready = function() {

  // new_note

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
          message: 'Field required',
          callback: function(value, validator) {
              // Get the selected options
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


};

  $(document).ready(ready);
  $(document).on('page:load', ready);