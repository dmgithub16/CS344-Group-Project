<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee: Comments</title>
    <meta charset="utf-8">
    <meta name="author" content="Chung Ming Cheng, Derek Morgan, Mathew Dill, Jordan Benson">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
  </head>
  <body>
  <div><h1>Let us know what comments you have about the project in general.</h1></div>
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
		
		$qnum = $_POST["$qid"];
		$response = $_POST["$resid"];
		$comment = $_POST["$comid"];
		
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
		<div id="cmnts">
		<script>
		function goBack() {
			window.history.back();
		}
		</script>
		<form id="txtarea" action="submit.php" method="POST">
			<input type="hidden" name="u_id" value="<?= $UID ?>" readonly><input type="hidden" name="p_id" value="<?= $PID ?>" readonly>
			<textarea rows="7" cols="50" name="comment" form="txtarea"></textarea>
			
			<input type="submit" value="Submit">
		</form>
		<button onclick="goBack()">Go Back</button>
	</div>
  </body>
</html>