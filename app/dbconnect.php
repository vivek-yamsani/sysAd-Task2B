<?php 

    $server="database";
    $user="root";
    $pass="passworddelta";
    $db="Delta";
    $conn = mysqli_connect($server,$user,$pass,$db);

    if(!$conn){
        die("Error!". mysqli_connect_error());
    }
?>
