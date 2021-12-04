<?php
$db = mysqli_connect('localhost','id17804959_root','Root-123456789','id17804959_mtacsystem');
mysqli_set_charset($db, 'UTF8');

if(!$db){
    echo "Connection Faild";
}

$sql = "CALL test2();";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
$rows1 = array();
if($count != 0){
    while($rs = mysqli_fetch_assoc($result)) {
    $rows1[] = $rs;}
}
echo json_encode($rows1,JSON_UNESCAPED_UNICODE);
$sql23 = "CALL test()";
$aaa = mysql_query($db,$sql23);
$cone = mysqli_num_rows($aaa);
$rows2 = array();
if($count != 0){
    while($rsc = mysqli_fetch_assoc($aaa)) {
    $rows2[] = $rsc;}
}
echo json_encode($rows1,JSON_UNESCAPED_UNICODE);
?>
