<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Testing PCRE</title>
</head>
<body>
<?php // Script 14.2 - matches.php
// This script takes a submitted string and checks it against a submitted pattern.
// This version prints every match made.

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	// Trim the strings:
	$pattern = trim($_POST['pattern']);
	$subject = trim($_POST['subject']);

	// Print a caption:
	echo "<p>The result of checking<br><strong>$pattern</strong><br>against<br>$subject<br>is ";

	// Test:
	if (preg_match_all ($pattern, $subject, $matches) ) {
		echo 'TRUE!</p>';

		// Print the matches:
		echo '<pre>' . print_r($matches, 1) . '</pre>';

	} else {
		echo 'FALSE!</p>';
	}

} // End of submission IF.
// Display the HTML form.
?>
<form action="matches.php" method="post">
	<p>Regular Expression Pattern: <input type="text" name="pattern" value="<?php if (isset($pattern)) echo htmlentities($pattern); ?>" size="40"> (include the delimiters)</p>
	<p>Test Subject: <textarea name="subject" rows="5" cols="40"><?php if (isset($subject)) echo htmlentities($subject); ?></textarea></p>
	<input type="submit" name="submit" value="Test!">
</form>
</body>
</html>