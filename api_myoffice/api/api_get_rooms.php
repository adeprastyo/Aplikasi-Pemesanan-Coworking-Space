<?php
require_once('../config/connection.php');
// $myArray = array();
// if ($result = mysqli_query($con, "SELECT * FROM rooms INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis")) {
//     while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
//         $myArray[] = $row;
//     }
//     mysqli_close($con);
//     echo json_encode($myArray);
// }

if (empty($_GET)) {
    $myArray = array();
    if ($result = mysqli_query($con, "SELECT * FROM rooms INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis")) {
        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            $myArray[] = $row;
        }
        mysqli_close($con);
        echo json_encode($myArray);
    }
} else {
    $myArray = array();
    if ($result = mysqli_query($con, "SELECT * FROM rooms INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis WHERE id_room=" . $_GET['id'])) {
        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            $myArray[] = $row;
        }
        mysqli_close($con);
        echo json_encode($myArray);
    }
}
