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
  /* $UID = $_POST["username"];;
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "344db";
  
  $conn = new mysqli("$servername", "$username", "$password", "$dbname");
  $get_user_info_query = "SELECT * FROM user WHERE id = '$UID'";
  $get_projectIDs_query = "SELECT * FROM `project` WHERE `id` NOT IN (SELECT `project_id` FROM `review` WHERE `user_id` = '$UID')"; */
  
?>
	<div id="info">
		<form action="questions.php" method="POST">
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
/* 				$result = $conn->query($get_user_info_query);
				$row = $result->fetch_assoc();	 */		
			?>
			Reviewer Info:<br>
			ID: <input name="id" value="<?= "$row[id]" ?>" readonly><br>
			Name: <input name="name" value="<?= "$row[u_name]" ?>" readonly><br>
			Affiliation: <input name="affil" value="<?= "$row[campus_affiliation]" ?>" readonly><br>
			Phone: <input name="phone" value="<?= "$row[phone_primary]" ?>" readonly><br>
			<input type="submit" value="Continue">
			
			<?php 
/* 				$conn->close();  */
			?>
		</form>
	</div>
  </body>
</html>