<?php
require_once('../config/connection.php');
// $myArray = array();
// if ($result = mysqli_query($con, "SELECT * FROM `facilities_rooms` INNER JOIN facilities ON facilities_rooms.id_facility = facilities.id_facility INNER JOIN rooms ON facilities_rooms.id_room = rooms.id_room INNER JOIN jenis on rooms.id_jenis = jenis.id_jenis")) {
//     while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
//         $myArray[] = $row;
//     }
//     mysqli_close($con);
//     echo json_encode($myArray);
// }

if (empty($_GET)) {
    $myArray = array();
    if ($result = mysqli_query($con, "SELECT * FROM `facilities_rooms` INNER JOIN facilities ON facilities_rooms.id_facility = facilities.id_facility INNER JOIN rooms ON facilities_rooms.id_room = rooms.id_room INNER JOIN jenis on rooms.id_jenis = jenis.id_jenis")) {
        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            $myArray[] = $row;
        }
        mysqli_close($con);
        echo json_encode($myArray);
    }
} else {
    $myArray = array();
    if ($result = mysqli_query($con, "SELECT * FROM `facilities_rooms` INNER JOIN facilities ON facilities_rooms.id_facility = facilities.id_facility INNER JOIN rooms ON facilities_rooms.id_room = rooms.id_room INNER JOIN jenis on rooms.id_jenis = jenis.id_jenis WHERE id_facility_room=" . $_GET['id'])) {
        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            $myArray[] = $row;
        }
        mysqli_close($con);
        echo json_encode($myArray);
    }
}
