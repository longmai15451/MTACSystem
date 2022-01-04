<?php
require_once('connection.php');
mysqli_set_charset($db, 'UTF8');
if(!$db){
    echo "Connection Faild";
}

$sql = "CALL disease_data()";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);

if($count > 0){
    $rows1 = array();
    while($rs = mysqli_fetch_assoc($result)) {
    $rows1[] = $rs;}
    echo json_encode($rows1,JSON_UNESCAPED_UNICODE);
}
else{
    echo json_encode("Error");
}

?>
