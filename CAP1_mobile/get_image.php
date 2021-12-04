<?php
$db = mysqli_connect('localhost','id17804959_root','Root-123456789','id17804959_mtacsystem');
mysqli_set_charset($db, 'UTF8');

if(!$db){
    echo "Connection Faild";
}
     $result = $db->query("SELECT * FROM patients WHERE id_card = '231267915'");
    $count = mysqli_num_rows($result);
    
    if($count == 1){
        $json = mysqli_fetch_assoc($result);
        echo "<td><img src='img/avatars/$json[15]' height='150px' width='300px'></td>";
    }
    else{
        echo json_encode("Error");
    }
 
  ?>