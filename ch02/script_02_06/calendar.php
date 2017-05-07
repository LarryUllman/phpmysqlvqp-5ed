<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Calendar</title>
</head>
<body>
<form action="calendar.php" method="post">
<?php # Script 2.6 - calendar.php

// This script makes three pull-down menus
// for an HTML form: months, days, years.

// Make the months array:
$months = [1 => 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

// Make the days and years arrays:
$days = range(1, 31);
$years = range(2017, 2027);

// Make the months pull-down menu:
echo '<select name="month">';
foreach ($months as $key => $value) {
	echo "<option value=\"$key\">$value</option>\n";
}
echo '</select>';

// Make the days pull-down menu:
echo '<select name="day">';
foreach ($days as $value) {
	echo "<option value=\"$value\">$value</option>\n";
}
echo '</select>';

// Make the years pull-down menu:
echo '<select name="year">';
foreach ($years as $value) {
	echo "<option value=\"$value\">$value</option>\n";
}
echo '</select>';

?>
</form>
</body>
</html>