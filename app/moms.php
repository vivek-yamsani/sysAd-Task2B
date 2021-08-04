
<?php
	session_start();
	
	if($_SESSION["loggedin"] != true){
		header("location: index.php");
		exit();
	}
	else{	
		if($_SESSION['re-me'] != true){
			$_SESSION['loggedin'] = false;
		}
	}
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>MoMs</title>
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
		
        <button class="btn btn-outline-success" type="submit" onclick=logout() >Logout</button>
    </form>
    </div>
  </div>
</nav>
  <div class="table-responsive">
  <table class="table align-middle">
      <tr>
          <th>User</th>
          <th>MoM</th>
          <th>Date of Meet</th>
      </tr>
    <?php
        require_once "dbconnect.php";
        $res = mysqli_query($conn,"SELECT * FROM MoMs");
        //echo mysqli_error($conn);
        while($row  = mysqli_fetch_assoc($res)){

    ?>
    <tr>
    <td> <?php echo $row['NAME']; ?>  </td>
    <td> <?php echo $row['MOM']; ?>   </td>        
    <td> <?php echo $row['DATE_OF_MEET']; ?> </td>
    </tr>    
     <?php
        }
    ?>
  </table>
</div>

    <script>
		function logout(){
			window.open("logout.php","_self");
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  </body>
</html>

