<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee</title>
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
  <?php
	//echo "<div><h2>"."This page would show the answers to the project and budget questions for the reviewer to, review"."</h2></div>";
	
	$UID = $_POST['id'];
	$PID = $_POST['projnum'];
	$Name = $_POST['name'];
	$Status = $_POST['affil'];
	$Phone = $_POST['phone'];
	
	
	
	/* $UID = $_POST["u_id"];
	$PID = $_POST["p_id"];
	
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "344db";
  
	$conn = new mysqli("$servername", "$username", "$password", "$dbname");
	
	$get_review = "SELECT * FROM project WHERE project_id = '$PID'";
	$get_project_answers = "SELECT * FROM answer WHERE project_id = '$PID' AND user_id = '$UID' AND `id` IN (SELECT 'id' FROM 'question' WHERE type = 'budget' OR type = 'project')";
	
				
			$resultA = $conn->query($get_review);
			$row = $resultA->fetch_assoc();			
			
			echo "<p>ID: ".$row["user_id"]."</p><br>";
			echo "<p>Name: ".$row["r_name"]."</p><br>";
			echo "<p>Affiliation: ".$row["affiliation"]."</p><br>";
			echo "<p>Project Comment: ".$row["comments"]."</p><br>";
			
			$resultB = $conn->query($get_review_answers);
			$rowB = $resultB->fetch_assoc();
			foreach ($rowB as $row) {
			echo "<p>answer: ".$rowB["answer"]." comments: ".$rowB["comment"]."</p><br>";			
			};	 */
				
	
	
	?>
	<script>
	function goBack() {
		window.history.back();
	}
	</script>
	<div class="col-9 prim"
		<p id="ty">Thank you</p>
		<button class="but" onclick="goBack()">Go Back</button>
		<form action="questions.php" method="POST">
				<input type="hidden" name="uid" value="<?= "$UID" ?>" readonly>
				<input type="hidden" name="pid" value="<?= "$PID" ?>" readonly>
				<input type="hidden" name="name" value="<?= "$Name" ?>" readonly>
				<input type="hidden" name="affil" value="<?= "$Status" ?>" readonly>
				<input type="hidden" name="phone" value="<?= "$Phone" ?>" readonly>
				<input class="but" type="submit" value="Continue">
		</form>
	</div>
	 </body>
</html>