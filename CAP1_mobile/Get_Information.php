<?php
require_once('connection.php');
mysqli_set_charset($db, 'UTF8');

if(!$db){
    echo "Connection Faild";
}

$Phone = $_POST['phone'];

$sql = "SELECT * FROM patients WHERE phone = '".$Phone."'";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);

if($count == 1){
    echo json_encode("Exist");
}
else{
    echo json_encode("Error");
}

?>
