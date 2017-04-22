<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Predefined Variables</title>
</head>
<body>
<?php # Script 1.5 - predefined.php

// Create a shorthand version of the variable names:
$file = $_SERVER['SCRIPT_FILENAME'];
$user = $_SERVER['HTTP_USER_AGENT'];
$server = $_SERVER['SERVER_SOFTWARE'];

// Print the name of this script:
echo "<p>You are running the file:<br><strong>$file</strong>.</p>\n";

// Print the user's information:
echo "<p>You are viewing this page using:<br><strong>$user</strong></p>\n";

// Print the server's information:
echo "<p>This server is running:<br><strong>$server</strong>.</p>\n";

?>
</body>
</html>