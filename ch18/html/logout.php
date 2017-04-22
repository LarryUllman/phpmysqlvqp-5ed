<?php # Script 18.9 - logout.php
// This is the logout page for the site.
require ('includes/config.inc.php'); 
$page_title = 'Logout';
include ('includes/header.html');

// If no first_name session variable exists, redirect the user:
if (!isset($_SESSION['first_name'])) {

	$url = BASE_URL . 'index.php'; // Define the URL.
	ob_end_clean(); // Delete the buffer.
	header("Location: $url");
	exit(); // Quit the script.
	
} else { // Log out the user.

	$_SESSION = array(); // Destroy the variables.
	session_destroy(); // Destroy the session itself.
	setcookie (session_name(), '', time()-3600); // Destroy the cookie.

}

// Print a customized message:
echo '<h3>You are now logged out.</h3>';

include ('includes/footer.html');
?>