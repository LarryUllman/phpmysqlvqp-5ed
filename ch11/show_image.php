<?php # Script 11.5 - show_image.php
// This page displays an image.

$name = FALSE; // Flag variable:

// Check for an image name in the URL:
if (isset($_GET['image'])) {

	// Make sure it has an image's extension:
	$ext = strtolower ( substr ($_GET['image'], -4));
	
	if (($ext == '.jpg') OR ($ext == 'jpeg') OR ($ext == '.png')) {

		// Full image path:
		$image = "../uploads/{$_GET['image']}";

		// Check that the image exists and is a file:
		if (file_exists ($image) && (is_file($image))) {
			
			// Set the name as this image:
			$name = $_GET['image'];	

		} // End of file_exists() IF.

	} // End of $ext IF.
	
} // End of isset($_GET['image']) IF.

// If there was a problem, use the default image:
if (!$name) {
	$image = 'images/unavailable.png';	
	$name = 'unavailable.png';
}

// Get the image information:
$info = getimagesize($image);
$fs = filesize($image);

// Send the content information:
header ("Content-Type: {$info['mime']}\n");
header ("Content-Disposition: inline; filename=\"$name\"\n");
header ("Content-Length: $fs\n");

// Send the file:
readfile ($image);