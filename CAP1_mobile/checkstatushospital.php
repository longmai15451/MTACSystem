<?php
$db = mysqli_connect('localhost','root','','mtacsystem');
mysqli_set_charset($db, 'UTF8');

if(!$db){
    echo "Connection Faild";
}

$id_hos = "11";//$_POST('id_hos');

$sql = "CALL checkAvailibleTestRegis('".$id_hos."');";
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
