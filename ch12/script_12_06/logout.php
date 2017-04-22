<?php # Script 12.6 - logout.php
// This page lets the user logout.

// If no cookie is present, redirect the user:
if (!isset($_COOKIE['user_id'])) {

	// Need the function:
	require ('includes/login_functions.inc.php');
	redirect_user();	
	
} else { // Delete the cookies:
	setcookie ('user_id', '', time()-3600, '/', '', 0, 0);
	setcookie ('first_name', '', time()-3600, '/', '', 0, 0);
}

// Set the page title and include the HTML header:
$page_title = 'Logged Out!';
include ('includes/header.html');

// Print a customized message:
echo "<h1>Logged Out!</h1>
<p>You are now logged out, {$_COOKIE['first_name']}!</p>";

include ('includes/footer.html');
?>