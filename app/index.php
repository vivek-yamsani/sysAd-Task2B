<?php

session_start();

	if($_SESSION['loggedin'] == true){
		header("location: moms.php");
	}
	else{	
		include "dbconnect.php";

		if($_SERVER['REQUEST_METHOD'] == "POST"){
			$username = $_POST["username"];
			$passwd = $_POST["passwd"];

			$sql = "SELECT * FROM Users WHERE username='$username' AND passwd='$passwd'";
			$res = mysqli_query($conn,$sql);
			echo mysqli_error($conn);
			$num = mysqli_num_rows($res);
			if($num == 1){
                if(isset($_POST["re-me"])){
					$_SESSION['re-me'] = true;
				}
				$_SESSION['loggedin'] = true;
				header("location: moms.php");
			}
			else{
				echo "<script>alert('invaild credentials')</script>";
                
			}
		}
	}

?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Welcome!</title>
  </head>
  <body>
	<div class="container" style="margin-top: 100px" >
  	<form action="" method="POST">	
		<div class="mb-3 ">
			<label for="username" class="form-label">username</label>
  			<input type="text" class="form-control" id="username" name="username" placeholder="delta" required>
		</div>
		<div class="mb-3">
			<label for="passwd" class="form-label">password</label>
  			<input type="password" class="form-control" id="passwd" name="passwd" placeholder="password" required>
		</div>
		<div class="form-check">
  			<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" name = "re-me">
  			<label class="form-check-label" for="re-me" >
    		Remember Me 
  			</label>
		</div>
		<button type="submit" class="btn btn-primary" name="login">Login</button>
	</form>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>

