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
/* 	$UID = $_POST["u_id"];
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

	} */
	?>
		<div id="cmnts">
	
			
		General Comments:<br>
		
		<form id="txtarea" action="submit.php" method="POST">
			Reviewer Info: ID: <input name="u_id" value="<?= $UID ?>" readonly><br> 	
			Project ID: <input name="p_id" value="<?= $PID ?>" readonly>
			<br>
			<textarea rows="7" cols="50" name="comment" form="txtarea"></textarea>
			<input type="submit" value="Submit">
		</form>
	</div>
  </body>
</html>