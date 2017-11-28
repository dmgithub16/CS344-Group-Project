<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee</title>
    <meta charset="utf-8">
    <meta name="author" content="Chung Ming Cheng, Derek Morgan, Mathew Dill, Jordan Benson">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
  </head>
  <body>
  <?php
	/* $UID = $_POST['id'];
	$PID = $_POST['projnum'];
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
} */

	?>
	<div id="qstns">
		<form action="comments.php" method="POST">
		Reviewer Info: ID: <input name="u_id" value="<?= $UID ?>" readonly><p>Name:<?= $Name?></p><br> 	
		Project ID: <input name="p_id" value="<?= $PID ?>" readonly>
	<?php		
	/* $rows = $conn->query("SELECT * FROM question");
	foreach ($rows as $row) { */
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
			<label>Comments: <input  style="height:200px;" type="text" name="com<?=$row["id"] ?>" value="Comments"></label><br>
			</div>
  <?php
    // }
  ?>
  <input type="submit" value="Continue">
		</form>
  </body>
</html>