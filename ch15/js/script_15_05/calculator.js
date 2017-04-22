// Script 15.5 - calculator.js
// This script is included by calculator.html.
// This script handles and validates the form submission.

// Do something when the document is ready:
$(function() {
	
	// Assign an event handler to the form:
	$('#calculator').submit(function() {
		
		// Initialize some variables:
		var quantity, price, tax, total;
		
		// Validate the quantity:
		if ($('#quantity').val() > 0) {
	
			// Get the quantity:
			quantity = $('#quantity').val();
	
		} else { // Invalid quantity!
	
			// Alert the user:
			alert('Please enter a valid quantity!');
	
		}
		
		// Validate the price:
		if ($('#price').val() > 0) {
			price = $('#price').val();
		} else {
			alert('Please enter a valid price!');
		}

		// Validate the tax:
		if ($('#tax').val() > 0) {
			tax = $('#tax').val();
		} else {
			alert('Please enter a valid tax!');
		}
		
		// If appropriate, perform the calculations:
		if (quantity && price && tax) {
	
			total = quantity * price;
			total += total * (tax/100);
			
			// Display the results:
			alert('The total is $' + total);

		}

		// Return false to prevent an actual form submission:
		return false;
		
	}); // End of form submission.

}); // End of document ready.