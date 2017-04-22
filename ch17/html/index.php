<?php # Script 17.3 - index.php
// This is the main page for the site.

// Include the HTML header:
include ('includes/header.html');

// The content on this page is introductory text
// pulled from the database, based upon the 
// selected language:
echo $words['intro']; 

// Include the HTML footer file:
include ('includes/footer.html');
?>