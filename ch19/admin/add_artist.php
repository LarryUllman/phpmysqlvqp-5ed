<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Add an Artist</title>
</head>
<body>
<?php # Script 19.1 - add_artist.php
// This page allows the administrator to add an artist.

if ($_SERVER['REQUEST_METHOD'] == 'POST') { // Handle the form.

	// Validate the first and middle names (neither required):
	$fn = (!empty($_POST['first_name'])) ? trim($_POST['first_name']) : NULL;
	$mn = (!empty($_POST['middle_name'])) ? trim($_POST['middle_name']) : NULL;

	// Check for a last_name...
	if (!empty($_POST['last_name'])) {

		$ln = trim($_POST['last_name']);

		// Add the artist to the database:
		require ('../../mysqli_connect.php');
		$q = 'INSERT INTO artists (first_name, middle_name, last_name) VALUES (?, ?, ?)';
		$stmt = mysqli_prepare($dbc, $q);
		mysqli_stmt_bind_param($stmt, 'sss', $fn, $mn, $ln);
		mysqli_stmt_execute($stmt);

		// Check the results....
		if (mysqli_stmt_affected_rows($stmt) == 1) {
			echo '<p>The artist has been added.</p>';
			$_POST = array();
		} else { // Error!
			$error = 'The new artist could not be added to the database!';
		}

		// Close this prepared statement:
		mysqli_stmt_close($stmt);
		mysqli_close($dbc); // Close the database connection.

	} else { // No last name value.
		$error = 'Please enter the artist\'s name!';
	}

} // End of the submission IF.

// Check for an error and print it:
if (isset($error)) {
	echo '<h1>Error!</h1>
	<p style="font-weight: bold; color: #C00">' . $error . ' Please try again.</p>';
}

// Display the form...
?>
<h1>Add a Print</h1>
<form action="add_artist.php" method="post">

	<fieldset><legend>Fill out the form to add an artist:</legend>

	<p><strong>First Name:</strong> <input type="text" name="first_name" size="10" maxlength="20" value="<?php if (isset($_POST['first_name'])) echo $_POST['first_name']; ?>"></p>
	<p><strong>Middle Name:</strong> <input type="text" name="middle_name" size="10" maxlength="20" value="<?php if (isset($_POST['middle_name'])) echo $_POST['middle_name']; ?>"></p>
	<p><strong>Last Name:</strong> <input type="text" name="last_name" size="10" maxlength="40" value="<?php if (isset($_POST['last_name'])) echo $_POST['last_name']; ?>"></p>

	</fieldset>

	<div align="center"><input type="submit" name="submit" value="Submit"></div>

</form>

</body>
</html>