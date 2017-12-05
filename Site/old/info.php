<!doctype html>
<html lang="en">
  <head>
    <title>Green Fee: Reviewer Info</title>
    <meta charset="utf-8">
	<meta name="author" content="Chung Ming Cheng, Derek Morgan, Mathew Dill, Jordan Benson">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  </head>
  <body>
  <div><h1>Review your info and select a project.</h1></div>
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
	<div id="info">
		<form action="review.php" method="POST">
			Please select a project to review:
			<select name="projnum">
				<?php
					$result = $conn->query($get_projectIDs_query);
					while($row = $result->fetch_assoc()) {
							echo "<option value=".$row["id"].">".$row["title"]."</option>";
					}	
				?>
			</select><br>
			
			<?php
				$result = $conn->query($get_user_info_query);
				$row = $result->fetch_assoc();			
			?>
			
			<p>ID: <input name="id" value="<?= "$row[id]" ?>" readonly></p><br>
			<p>Name: <input name="name" value="<?= "$row[u_name]" ?>" readonly></p><br>
			<p>Affiliation: <input name="affil" value="<?= "$row[campus_affiliation]" ?>" readonly></p><br>
			<p>Phone: <input name="phone" value="<?= "$row[phone_primary]" ?>" readonly></p><br>
			<input type="submit" value="Continue">
			
			<?php 
				$conn->close(); 
			?>
		</form>
	</div>
  </body>
</html>