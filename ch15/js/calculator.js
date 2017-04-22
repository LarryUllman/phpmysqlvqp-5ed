// Script 15.7 - calculator.js #2
// This script is included by calculator.html.
// This script handles and validates the form submission.

// Do something when the document is ready:
$(function() {

	// Hide all error messages:
	$('.errorMessage').hide();

	// Assign an event handler to the form:
	$('#calculator').submit(function() {

		// Initialize some variables:
		var quantity, price, tax, total;

		// Validate the quantity:
		if ($('#quantity').val() > 0) {

			// Get the quantity:
			quantity = $('#quantity').val();

			// Clear an error, if one existed:
			$('#quantityP').removeClass('error');

			// Hide the error message, if it was visible:
			$('#quantityError').hide();

		} else { // Invalid quantity!

			// Add an error class:
			$('#quantityP').addClass('error');

			// Show the error message:
			$('#quantityError').show();

		}

		// Validate the price:
		if ($('#price').val() > 0) {
			price = $('#price').val();
			$('#priceP').removeClass('error');
			$('#priceError').hide();
		} else {
			$('#priceP').addClass('error');
			$('#priceError').show();
		}

		// Validate the tax:
		if ($('#tax').val() > 0) {
			tax = $('#tax').val();
			$('#taxP').removeClass('error');
			$('#taxError').hide();
		} else {
			$('#taxP').addClass('error');
			$('#taxError').show();
		}

		// If appropriate, perform the calculations:
		if (quantity && price && tax) {

			total = quantity * price;
			total += total * (tax/100);

			// Display the results:
			$('#results').html('The total is <strong>$' + total + '</strong>.');

		}

		// Return false to prevent an actual form submission:
		return false;

	}); // End of form submission.

}); // End of document ready.