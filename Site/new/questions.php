<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee: Questions</title>
    <meta charset="utf-8">
    <meta name="author" content="Chung Ming Cheng, Derek Morgan, Matthew Dill, Jordan Benson">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css\bootstrap.css" type="text/css">
	<link rel="stylesheet" href="css\style.css" type="text/css">
  </head>
  <body>
    <nav class= "col-2">
  <img class="logo" src="images/logo.png" alt="A logo for the green fee" title="green fee logo" width="150" height ="195">
  </nav>
	<div class = "col-9" id="topmarg">
	<h1> Winona State</h1>
	<h5 class ="rev" > Green Fee Review </h5>
	<hr>
  <h2>Please rate the project and comment.</h2>
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
	<div id="qstns" class="col-12 prim container">
		<form action="comments.php" method="POST">
		<input type="hidden" name="u_id" value="<?= $UID ?>" readonly><input type="hidden" name="p_id" value="<?= $PID ?>" readonly>
		<div class="row">
			<div class="col-6">  </div>
			<div class="col-6">
				<p class="col-2"><strong>Excellent</strong></p>
				<p class="col-2"><strong>Very good</strong></p>
				<p class="col-2"><strong>Good</strong></p>
				<p class="col-2"><strong>Fair</strong></p>
				<p class="col-2"><strong>Minimal</strong></p>
				<p class="col-2"><strong>N/A</strong></p>
			</div>
		</div>
		<hr>
	<?php		
	$rows = $conn->query("SELECT * FROM question");
	foreach ($rows as $row) {
	?>
		<div class="row">
			<div class="col-6">
				<input type="hidden" name='q<?= $row["id"] ?>' value='<?= $row["id"] ?>' readonly>
				<p><strong>Question <?= $row["id"] ?></strong></p>
				<?= $row["text"]  ?>
				<br>
				<label>Comments: <textarea rows="4" cols="40" name='com<?=$row["id"] ?>' value="Comments"></textarea></label>
				<br>
			</div>
			<div class="col-6">
				<input class="qbut col-2" type="radio" name='res<?= $row["id"] ?>' value="exc1">
				<input class="qbut col-2" type="radio" name='res<?= $row["id"] ?>' value="vgood1">
				<input class="qbut col-2" type="radio" name='res<?= $row["id"] ?>' value="good1">
				<input class="qbut col-2" type="radio" name='res<?= $row["id"] ?>' value="fair1">
				<input class="qbut col-2" type="radio" name='res<?= $row["id"] ?>' value="min1">
				<input class="qbut col-2" type="radio" name='res<?= $row["id"] ?>' value="na1" checked="checked"><br>
			</div>
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
	<br>
	<button class ="but" onclick="goBack()">Go Back</button>
	<input type="submit" class="but" value="Continue">
	</form>
	</div>
  </body>
</html>