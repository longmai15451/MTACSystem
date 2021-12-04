<?php
$db = mysqli_connect('localhost','root','','mtacsystem');
mysqli_set_charset($db, 'UTF8');

if(!$db){
    echo "Connection Faild";
}

$Phone = $_POST['phone'];
$Pass = $_POST['password'];

$sql = "Update patients set password = '".$Pass."' WHERE phone = '".$Phone."'";
$result = mysqli_query($db,$sql);

if($result){
    echo json_encode("Success");
}
else{
    echo json_encode("Error");
}

?>
