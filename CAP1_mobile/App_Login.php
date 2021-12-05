<?php
$db = mysqli_connect('localhost','id17989172_root','Root-123456789','id17989172_mtacsystem');
mysqli_set_charset($db, 'UTF8');

if(!$db){
    echo "Connection Faild";
}

$Phone = $_POST['phone'];
$Pass = $_POST['password'];

$sql = "CALL Get_patients_data('".$Phone."', '".$Pass."');";
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
