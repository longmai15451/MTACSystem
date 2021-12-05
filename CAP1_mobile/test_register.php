<?php
$db = mysqli_connect('localhost','id17989172_root','Root-123456789','id17989172_mtacsystem');
mysqli_set_charset($db, 'UTF8');
if(!$db){
    echo "Connection Faild";
}

$idcard = $_POST['id_card'];
$idhos = $_POST['id_hos'];
$registerDate = $_POST['registerDate'];
$registerTime = $_POST['registerTime'];
$startTime = $_POST['startTime'];
$endTime = $_POST['endTime'];

$sql = "CALL test_register('".$idcard."',".$idhos.",'".$registerDate."','".$registerTime."','".$startTime."','".$endTime."')";
$result = mysqli_query($db,$sql);

if($result){
    $json = mysqli_fetch_assoc($result);
    echo json_encode($json,JSON_UNESCAPED_UNICODE);
}
else{
    echo json_encode("Faild");
}
?>


