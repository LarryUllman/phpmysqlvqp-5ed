<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>DateTime Usage</title>
	<style>
	body {
		font-family: Verdana, Arial, Helvetica, sans-serif;
		font-size: 12px;
		margin: 10px;
	}
	label { font-weight: bold; }
	.error { color: #F00; }
	</style>
</head>
<body>
<?php # Script 16.5 - datetime.php

// Set the start and end date as today and tomorrow by default:
$start = new DateTime();
$end = new DateTime();
$end->modify('+1 day');

// Default format for displaying dates:
$format = 'Y-m-d';

// This function validates a provided date string.
// The function returns an array--month, day, year--if valid.
function validate_date($date) {

	// Break up the string into its parts:
	$array = explode('-', $date);

	// Return FALSE if there aren't 3 items:
	if (count($array) != 3) return false;

	// Return FALSE if it's not a valid date:
	if (!checkdate($array[1], $array[2], $array[0])) return false;

	// Return the array:
	return $array;

} // End of validate_date() function.

// Check for a form submission:
if (isset($_POST['start'], $_POST['end'])) {

	// Call the validation function on both dates:
	if ( (list($sy, $sm, $sd) = validate_date($_POST['start'])) && (list($ey, $em, $ed) = validate_date($_POST['end'])) ) {

		// If it's okay, adjust the DateTime objects:
		$start->setDate($sy, $sm, $sd);
		$end->setDate($ey, $em, $ed);

		// The start date must come first:
		if ($start < $end) {

			// Determine the interval:
			$interval = $start->diff($end);

			// Print the results:
			echo "<p>The event has been planned starting on {$start->format($format)} and ending on {$end->format($format)}, which is a period of $interval->days day(s).</p>";

		} else { // End date must be later!
			echo '<p class="error">The starting date must precede the ending date.</p>';
		}

	} else { // An invalid date!
		echo '<p class="error">One or both of the submitted dates was invalid.</p>';
	}

} // End of form submission.

// Show the form:
?>
<h2>Set the Start and End Dates for the Thing</h2>
<form action="datetime.php" method="post">

	<p><label for="start">Start Date:</label> <input type="date" name="start" value="<?php echo $start->format($format); ?>"> (YYYY-MM-DD)</p>
	<p><label for="end">End Date:</label> <input type="date" name="end" value="<?php echo $end->format($format); ?>"> (YYYY-MM-DD)</p>

	<p><input type="submit" value="Submit"></p>
</form>
</body>
</html>