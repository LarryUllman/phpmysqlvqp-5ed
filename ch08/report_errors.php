<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Reporting Errors</title>
</head>
<body>
<h2>Testing Error Reporting</h2>
<?php # Script 8.2 - report_errors.php

// Show errors:
ini_set('display_errors', 1);

// Adjust error reporting:
error_reporting(E_ALL | E_STRICT);

// Create errors:
foreach ($var as $v) {}
$result = 1/0;

?>
</body>
</html>