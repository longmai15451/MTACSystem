<?php
require_once('connection.php');
mysqli_set_charset($db, 'UTF8');
if(!$db){
    echo "Connection Faild";
}

$regisID = $_POST['regisId'];


$sql = "CALL vacResgisInfo ('".$regisID."')";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);

if($count == 1){
    $json = mysqli_fetch_assoc($result);
    echo json_encode($json,JSON_UNESCAPED_UNICODE);
}
else{
    echo json_encode("Error");
}

?>


