
$( document ).ready(function() {	
    $(".time_zone_used").submit(function( event ) {
		var timeZone = $('.time_zone_select :selected').val()
		var email = $('#patient_email').val()

		if (timeZone == ''){
			alert('Please put in a time zone.');
			event.preventDefault();
		}

		if (email == ''){
			alert('Please put in an email.');
			event.preventDefault();
		}
    });
});