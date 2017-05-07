<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Sorting Arrays</title>
</head>
<body>
<table border="0" cellspacing="3" cellpadding="3" align="center">
<thead>
	<tr>
		<th><h2>Rating</h2></th>
		<th><h2>Title</h2></th>
	</tr>
</thead>
<tbody>
<?php # Script 2.8 - sorting.php

// Create the array:
$movies = [
	'Casablanca' => 10,
	'To Kill a Mockingbird' => 10,
	'The English Patient' => 2,
	'Stranger Than Fiction' => 9,
	'Story of the Weeping Camel' => 5,
	'Donnie Darko' => 7
];

// Display the movies in their original order:
echo '<tr><td colspan="2"><strong>In their original order:</strong></td></tr>';
foreach ($movies as $title => $rating) {
	echo "<tr><td>$rating</td>
	<td>$title</td></tr>\n";
}

// Display the movies sorted by title:
ksort($movies);
echo '<tr><td colspan="2"><strong>Sorted by title:</strong></td></tr>';
foreach ($movies as $title => $rating) {
	echo "<tr><td>$rating</td>
	<td>$title</td></tr>\n";
}

// Display the movies sorted by rating:
arsort($movies);
echo '<tr><td colspan="2"><strong>Sorted by rating:</strong></td></tr>';
foreach ($movies as $title => $rating) {
	echo "<tr><td>$rating</td>
	<td>$title</td></tr>\n";
}

?>
</tbody>
</table>
</body>
</html>