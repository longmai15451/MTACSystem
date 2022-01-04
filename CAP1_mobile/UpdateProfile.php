<?php
require_once('connection.php');
mysqli_set_charset($db, 'UTF8');
if(!$db){
    echo "Connection Faild";
}

$old_id = $_POST['old_id_card'];
$name = $_POST['full_name'];
$cccd = $_POST['id_card'];
$phone = $_POST['phone'];
$birthdate = $_POST['birthdate'];
$gender = $_POST['gender'];
$health_card = $_POST['healthCard'];
$email = $_POST['email'];
$job = $_POST['job'];
$address = $_POST['address'];
$ward = $_POST['ward'];
$district = $_POST['district'];
$city = $_POST['city'];
$country = $_POST['country'];
$nation = $_POST['nation'];
//$avatar

$sql = "SELECT * FROM patients WHERE phone = '".$phone."' OR id_card ='".$old_id."'";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);

if($count == 1){
    $updateUsers = "call Update_profile('".$cccd."','".$name."','".$birthdate."','".$gender."','".$health_card."','".$phone."','".$email."','".$job."','".$address."','".$ward."','".$district."','".$city."','".$country."','".$nation."','".$old_id."')";
    $query = mysqli_query($db,$updateUsers);
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
