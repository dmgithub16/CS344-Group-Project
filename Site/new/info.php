<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee: Reviewer Info</title>
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
  $UID = $_POST["username"];
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "344db";
  
  $conn = new mysqli("$servername", "$username", "$password", "$dbname");
  $get_user_info_query = "SELECT * FROM user WHERE id = '$UID'";
  $get_projectIDs_query = "SELECT * FROM `project` WHERE `id` NOT IN (SELECT `project_id` FROM `review` WHERE `user_id` = '$UID')";
  
?>
	<div id = "info" class = "col-9 marg prim">
		<form action="review.php" method="POST">
			<h2>Please select a project to review:</h2>
			<select name="projnum">
				<?php
					$result = $conn->query($get_projectIDs_query);
					while($row = $result->fetch_assoc()) {
							echo "<option value=".$row["id"].">".$row["title"]."</option>";
					}	
				?>
			</select><br><br>
			
			<?php
				$result = $conn->query($get_user_info_query);
				$row = $result->fetch_assoc();			
			?>
			
			<p>ID: <input name="id" value="<?= "$row[id]" ?>" readonly></p><br>
			<p>Name: <input name="name" value="<?= "$row[u_name]" ?>" readonly></p><br>
			<p>Affiliation: <input name="affil" value="<?= "$row[campus_affiliation]" ?>" readonly></p><br>
			<p>Phone: <input name="phone" value="<?= "$row[phone_primary]" ?>" readonly></p><br>
			<input class="but" type="submit" value="Continue">
			
			<?php 
				$conn->close(); 
			?>
		</form>
	</div>
	</div>
  </body>
</html>