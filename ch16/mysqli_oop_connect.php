<?php # Script 16.1 - mysqli_oop_connect.php
// This file contains the database access information. 
// This file also establishes a connection to MySQL, 
// selects the database, and sets the encoding.
// The MySQL interactions use OOP!

// Set the database access information as constants:
DEFINE ('DB_USER', 'username');
DEFINE ('DB_PASSWORD', 'password');
DEFINE ('DB_HOST', 'localhost');
DEFINE ('DB_NAME', 'sitename');

// Make the connection:
$mysqli = new MySQLi(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

// Verify the connection:
if ($mysqli->connect_error) {
	echo $mysqli->connect_error;
	unset($mysqli);
} else { // Establish the encoding.
	$mysqli->set_charset('utf8');
}