<?php
require_once('connection.php');
mysqli_set_charset($db, 'UTF8');
if(!$db){
    echo "Connection Faild";
}

$name = $_POST['full_name'];
$cccd = $_POST['id_card'];
$phone = $_POST['phone'];
$pass = $_POST['password'];

$sql = "SELECT * FROM patients WHERE phone = '".$phone."' OR id_card ='".$cccd."'";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);

if($count == 0){
    $insertUsers = "INSERT INTO patients
    VALUES('".$cccd."','".$name."',CURRENT_DATE(),'male','','".$phone."','','','','','','','','','".$pass."','',null,null,null)";
    $query = mysqli_query($db,$insertUsers);
    if($query){
        echo json_encode("Success");
    }
    else{
        echo json_encode("Faild");
    }
}
else{
    echo json_encode("Error");
}

?>
