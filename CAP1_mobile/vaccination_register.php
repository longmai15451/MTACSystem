<?php
require_once('connection.php');
mysqli_set_charset($db, 'UTF8');
if(!$db){
    echo "Connection Faild";
}

$idcard = $_POST['id_card'];
$idhos = $_POST['id_hos'];
$iddis = $_POST['id_dis'];
$registerDate = $_POST['registerDate'];
$registerTime = $_POST['registerTime'];
$startTime = $_POST['startTime'];
$endTime = $_POST['endTime'];
$estimate = $_POST['estimateTime'];

$sql = "CALL Vacc_register ('".$idcard."','".$idhos."','".$iddis."','".$registerDate."','".$registerTime."','".$startTime."','".$endTime."','".$estimate."')";
$result = mysqli_query($db,$sql);

if($result){
    $json = mysqli_fetch_assoc($result);
    echo json_encode($json,JSON_UNESCAPED_UNICODE);
}
else{
    echo json_encode("Faild");
}
?>


