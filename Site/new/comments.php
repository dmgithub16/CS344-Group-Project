<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee: Comments</title>
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
  <h2>Let us know what comments you have about the project in general and submit your review.</h2>
   <?php	
	$UID = $_POST["u_id"];
	$PID = $_POST["p_id"];
	
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "344db";
  
	$conn = new mysqli("$servername", "$username", "$password", "$dbname");
	
	
	$rows = $conn->query("SELECT * FROM question");
	
	
	foreach ($rows as $row) {
		
		$qid = "q".$row["id"];
		$resid = "res".$row["id"];
		$comid = "com".$row["id"];
		
		$qnum = $_POST[$qid];
		$response = $_POST[$resid];
		$comment = $_POST[$comid];
		
		$insert = "REPLACE INTO `344db`.`answer`
			(`user_id`,
			`question_id`,
			`project_id`,
			`answer`,
			`comment`)
			VALUES
			('$UID',
			'$qnum',
			'$PID',
			'$response',
			'$comment')";

			$conn->query($insert);
	};
	$conn->close(); 
	?>
		<div id="cmnts" class="col-9 prim">
		<script>
		function goBack() {
			window.history.back();
		}
		</script>
		<form id="txtarea" action="submit.php" method="POST">
			<input type="hidden" name="u_id" value="<?= $UID ?>" readonly><input type="hidden" name="p_id" value="<?= $PID ?>" readonly>
			<textarea rows="7" cols="50" name="comment" form="txtarea"></textarea>
			<br>
			<button class = "but" onclick="goBack()">Go Back</button>
			<input class = "but" type="submit" value="Submit">
		</form>
	</div>
	</div>
  </body>
</html>