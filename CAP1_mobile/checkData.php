<?php
require_once('connection.php');
mysqli_set_charset($db, 'UTF8');

if(!$db){
    echo "Connection Faild";
}

$ID = $_POST['idCard'];

$sql = "call checkData('".$ID."')";
$result = mysqli_query($db,$sql);

if($result){
    $json = mysqli_fetch_assoc($result);
    echo json_encode($json,JSON_UNESCAPED_UNICODE);
}
else{
    echo json_encode("Error");
}

?>
