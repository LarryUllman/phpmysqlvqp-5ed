<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Widget Cost Calculator</title>
</head>
<body>
<?php # Script 13.2 - calculator.php
// This script calculates an order total based upon three form values.

// Check if the form has been submitted:
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	// Cast all the variables to a specific type:
	$quantity = (int) $_POST['quantity'];
	$price = (float) $_POST['price'];
	$tax = (float) $_POST['tax'];

	// All variables should be positive!
	if ( ($quantity > 0) && ($price > 0) && ($tax > 0) ) {

		// Calculate the total:
		$total = $quantity * $price;
		$total += $total * ($tax/100);

		// Print the result:
		echo '<p>The total cost of purchasing ' . $quantity . ' widget(s) at $' . number_format($price, 2) . ' each, plus tax, is $' . number_format($total, 2) . '.</p>';

	} else { // Invalid submitted values.
		echo '<p style="font-weight: bold; color: #C00">Please enter a valid quantity, price, and tax rate.</p>';
	}

} // End of main isset() IF.

// Leave the PHP section and create the HTML form.
?>
<h2>Widget Cost Calculator</h2>
<form action="calculator.php" method="post">
	<p>Quantity: <input type="number" name="quantity" step="1" min="1" value="<?php if (isset($quantity)) echo $quantity; ?>"></p>
	<p>Price: <input type="number" name="price" step=".01" min="0.01" value="<?php if (isset($price)) echo $price; ?>"></p>
	<p>Tax (%): <input type="text" name="tax" step=".01" min="0.01" value="<?php if (isset($tax)) echo $tax; ?>"></p>
	<p><input type="submit" name="submit" value="Calculate!"></p>
</form>
</body>
</html>