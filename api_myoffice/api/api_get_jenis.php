<?php
require_once('../config/connection.php');
// $myArray = array();
// if ($result = mysqli_query($con, "SELECT * FROM jenis ORDER BY id_jenis ASC")) {
//     while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
//         $myArray[] = $row;
//     }
//     mysqli_close($con);
//     echo json_encode($myArray);
// }

if (empty($_GET)) {
    $myArray = array();
    if ($result = mysqli_query($con, "SELECT * FROM jenis ORDER BY id_jenis ASC")) {
        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            $myArray[] = $row;
        }
        mysqli_close($con);
        echo json_encode($myArray);
    }
} else {
    $myArray = array();
    if ($result = mysqli_query($con, "SELECT * FROM jenis WHERE id_jenis=" . $_GET['id'])) {
        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            $myArray[] = $row;
        }
        mysqli_close($con);
        echo json_encode($myArray);
    }
}
