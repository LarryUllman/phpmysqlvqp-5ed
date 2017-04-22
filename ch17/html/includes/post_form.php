<?php # Script 17.6 - post_form.php
// This page shows the form for posting messages.
// It's included by other pages, never called directly.

// Redirect if this page is called directly:
if (!isset($words)) {
	header ("Location: http://www.example.com/index.php");
	exit();
}

// Only display this form if the user is logged in:
if (isset($_SESSION['user_id'])) {

	// Display the form:
	echo '<form action="post.php" method="post" accept-charset="utf-8">';

	// If on read.php...
	if (isset($tid) && $tid) {

		// Print a caption:
		echo '<h3>' . $words['post_a_reply'] . '</h3>';

		// Add the thread ID as a hidden input:
		echo '<input name="tid" type="hidden" value="' . $tid . '">';

	} else { // New thread

		// Print a caption:
		echo '<h3>' . $words['new_thread'] . '</h3>';

		// Create subject input:
		echo '<p><em>' . $words['subject'] . '</em>: <input name="subject" type="text" size="60" maxlength="100" ';

		// Check for existing value:
		if (isset($subject)) {
			echo "value=\"$subject\" ";
		}

		echo '></p>';

	} // End of $tid IF.

	// Create the body textarea:
	echo '<p><em>' . $words['body'] . '</em>: <textarea name="body" rows="10" cols="60">';

	if (isset($body)) {
		echo $body;
	}

	echo '</textarea></p>';

	// Finish the form:
	echo '<input name="submit" type="submit" value="' . $words['submit'] . '">
	</form>';

} else {
	echo '<p>You must be logged in to post messages.</p>';
}

?>