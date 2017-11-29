<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee: Review Submission</title>
    <meta charset="utf-8">
	<meta name="author" content="Chung Ming Cheng, Derek Morgan, Mathew Dill, Jordan Benson">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
	
  </head>
  <body>
  <div><h1>Here is a review of your submission.</h1></div>
  <div id="review_answers">
  <?php
	$G_Com = $_POST["comment"];
	$UID = $_POST["u_id"];
	$PID = $_POST["p_id"];
	
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "344db";
  
	$conn = new mysqli("$servername", "$username", "$password", "$dbname");
	
	$update = "UPDATE `344db`.`review` SET `comments` = '$G_Com',`completed` = 1 WHERE `project_id` = '$PID' AND `user_id` = '$UID'";
	
	$conn-> query($update);
	
	$get_review = "SELECT * FROM review WHERE project_id = '$PID' AND user_id = '$UID'";
	$get_review_answers = "SELECT * FROM answer WHERE project_id = '$PID' AND user_id = '$UID' AND question_id IN (SELECT id FROM question WHERE type = 'review')";
	
				
			$result = $conn->query($get_review);
			$row = $result->fetch_assoc();			
	?>
			<div>
			<p> ID: <?= $row["user_id"] ?></p><br>
			<p> Name: <?= $row["r_name"] ?></p><br>
			<p> Affiliation: <?= $row["affiliation"] ?></p><br>
			<p> Review Comment: <?= $row["comments"] ?></p><br>
			</div>
	<?php			
			$result = $conn->query($get_review_answers);
			while($row = $result->fetch_assoc()) {
	?>				
			<p> <?= $row["answer"] ?> - <?= $row["comment"] ?> </p>
	<?php
			};
	$conn->close(); 			
	?>
		<script>
		function goBack() {
			window.history.back();
		}
		</script>
	<button onclick="goBack()">Go Back</button>
	Thank you
	 </body>
</html>