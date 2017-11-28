<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee: Questions</title>
    <meta charset="utf-8">
    <meta name="author" content="Chung Ming Cheng, Derek Morgan, Mathew Dill, Jordan Benson">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
  </head>
  <body>
  <div><h1>Please rate the project and comment.</h1></div>
  <?php
	$UID = $_POST['uid'];
	$PID = $_POST['pid'];
	$Name = $_POST['name'];
	$Status = $_POST['affil'];
	$Phone = $_POST['phone'];
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "344db";
  
	$conn = new mysqli("$servername", "$username", "$password", "$dbname");
	
	$insert = "REPLACE INTO `344db`.`review`
				(`project_id`,
				`user_id`,
				`r_name`,
				`affiliation`,
				`comments`,
				`completed`)
				VALUES
				('$PID',
				'$UID',
				'$Name',
				'$Status',
				'',
				'0')";
	
	if ($conn->query($insert) === TRUE) {
    echo "New record created successfully";
		} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

	?>
	<div id="qstns">
		<form action="comments.php" method="POST">
		<input type="hidden" name="u_id" value="<?= $UID ?>" readonly><input type="hidden" name="p_id" value="<?= $PID ?>" readonly>
	<?php		
	$rows = $conn->query("SELECT * FROM question");
	foreach ($rows as $row) {
	?>

			<input type="hidden" name='q<?= $row["id"] ?>' value='<?= $row["id"] ?>' readonly>
			<p>Question <?= $row["id"] ?></p>
			<?= $row["text"]  ?>
			<br>
			<input type="radio" name='res<?= $row["id"] ?>' value="exc1" checked="checked">
			<input type="radio" name='res<?= $row["id"] ?>' value="vgood1">
			<input type="radio" name='res<?= $row["id"] ?>' value="good1">
			<input type="radio" name='res<?= $row["id"] ?>' value="fair1">
			<input type="radio" name='res<?= $row["id"] ?>' value="min1">
			<input type="radio" name='res<?= $row["id"] ?>' value="na1"><br>
			<label>Comments: <input type="text" name="com<?=$row["id"] ?>" value="Comments"></label><br>
			</div>
  <?php
	};
	$conn->close();
  ?>
  	<script>
		function goBack() {
			window.history.back();
		}
	</script>
    <input type="submit" value="Continue">
	</form>
	<button onclick="goBack()">Go Back</button>
  </body>
</html>