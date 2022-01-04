<?php
require_once('connection.php');
mysqli_set_charset($db, 'UTF8');

if(!$db){
    echo "Connection Faild";
}

$regisID = $_POST['regisID'];

$sql = "Call test_schedule_cancel('".$regisID."')";
$result = mysqli_query($db,$sql);

if($result){
    echo json_encode("Success");
}
else
{

    echo json_encode("Error");
}

?>