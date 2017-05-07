<?php # Script 3.9 - calculator.php #4

// This function creates a radio button.
// The function takes two arguments: the value and the name.
// The function also makes the button "sticky".
function create_radio($value, $name = 'gallon_price') {

	// Start the element:
	echo '<input type="radio" name="' . $name .'" value="' . $value . '"';

	// Check for stickiness:
	if (isset($_POST[$name]) && ($_POST[$name] == $value)) {
		echo ' checked="checked"';
	}

	// Complete the element:
	echo "> $value ";

} // End of create_radio() function.

$page_title = 'Trip Cost Calculator';
include('includes/header.html');

// Check for form submission:
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	// Minimal form validation:
	if (isset($_POST['distance'], $_POST['gallon_price'], $_POST['efficiency']) &&
	 is_numeric($_POST['distance']) && is_numeric($_POST['gallon_price']) && is_numeric($_POST['efficiency']) ) {

		// Calculate the results:
		$gallons = $_POST['distance'] / $_POST['efficiency'];
		$dollars = $gallons * $_POST['gallon_price'];
		$hours = $_POST['distance']/65;

		// Print the results:
		echo '<h1>Total Estimated Cost</h1>
	<p>The total cost of driving ' . $_POST['distance'] . ' miles, averaging ' . $_POST['efficiency'] . ' miles per gallon, and paying an average of $' . $_POST['gallon_price'] . ' per gallon, is $' . number_format ($dollars, 2) . '. If you drive at an average of 65 miles per hour, the trip will take approximately ' . number_format($hours, 2) . ' hours.</p>';

	} else { // Invalid submitted values.
		echo '<h1>Error!</h1>
		<p class="error">Please enter a valid distance, price per gallon, and fuel efficiency.</p>';
	}

} // End of main submission IF.

// Leave the PHP section and create the HTML form:
?>

<h1>Trip Cost Calculator</h1>
<form action="calculator.php" method="post">
	<p>Distance (in miles): <input type="text" name="distance" value="<?php if (isset($_POST['distance'])) echo $_POST['distance']; ?>"></p>
	<p>Ave. Price Per Gallon: <span class="input">
	<?php
	create_radio('3.00');
	create_radio('3.50');
	create_radio('4.00');
	?>
	</span></p>
	<p>Fuel Efficiency: <select name="efficiency">
		<option value="10"<?php if (isset($_POST['efficiency']) && ($_POST['efficiency'] == '10')) echo ' selected="selected"'; ?>>Terrible</option>
		<option value="20"<?php if (isset($_POST['efficiency']) && ($_POST['efficiency'] == '20')) echo ' selected="selected"'; ?>>Decent</option>
		<option value="30"<?php if (isset($_POST['efficiency']) && ($_POST['efficiency'] == '30')) echo ' selected="selected"'; ?>>Very Good</option>
		<option value="50"<?php if (isset($_POST['efficiency']) && ($_POST['efficiency'] == '50')) echo ' selected="selected"'; ?>>Outstanding</option>
	</select></p>
	<p><input type="submit" name="submit" value="Calculate!"></p>
</form>

<?php include('includes/footer.html'); ?>