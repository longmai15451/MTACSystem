<?php
$db = mysqli_connect('localhost','id17989172_root','Root-123456789','id17989172_mtacsystem');
mysqli_set_charset($db, 'UTF8');
if(!$db){
    echo "Connection Faild";
}

$idcard = $_POST['id_card'];
$anamnesis1 = $_POST['anamnesis1'];
$anamnesis2 = $_POST['anamnesis2'];
$anamnesis3 = $_POST['anamnesis3'];
$anamnesis4 = $_POST['anamnesis4'];
$anamnesis5 = $_POST['anamnesis5'];
$anamnesis6 = $_POST['anamnesis6'];
$anamnesis7 = $_POST['anamnesis7'];
$anamnesis8 = $_POST['anamnesis8'];
$anamnesis9 = $_POST['anamnesis9'];
$anamnesis10 = $_POST['anamnesis10'];

$sql = "CALL Anamnesis_update (null,'".$idcard."',".$anamnesis1.",".$anamnesis2.",".$anamnesis3.",".$anamnesis4.",".$anamnesis5.",".$anamnesis6.",".$anamnesis7.",".$anamnesis8.",".$anamnesis9.",".$anamnesis10.")";
$result = mysqli_query($db,$sql);
if($result){
        echo json_encode("Success");
    }
    else{
        echo json_encode("Faild");
    }
?>
