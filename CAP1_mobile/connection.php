<?php
$host = 'localhost';
$dbname = 'id17989172_mtacsystem';
$user = 'id17989172_root';
$pass = 'Root-123456789';

try{
    $db = mysqli_connect($host,$user,$pass,$dbname);
}
catch(PDOException $e){
    echo "Connection Faild";
}
 
?>