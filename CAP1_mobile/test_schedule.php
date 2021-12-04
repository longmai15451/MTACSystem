<?php
$db = mysqli_connect('localhost','id17804959_root','Root-123456789','id17804959_mtacsystem');
mysqli_set_charset($db, 'UTF8');
if(!$db){
    echo "Connection Faild";
}

$idCard = $_POST['id_card'];
$registerDate = $_POST['registerDate'];

$sql = "CALL test_regis_schedule('".$idCard."','".$registerDate."')";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);

if($count > 0){
    $rows1 = array();
    while($rs = mysqli_fetch_assoc($result)) {
    $rows1[] = $rs;}
    echo json_encode($rows1,JSON_UNESCAPED_UNICODE);
}
else if($count == 0){
    echo json_encode("Error");
}

?>
