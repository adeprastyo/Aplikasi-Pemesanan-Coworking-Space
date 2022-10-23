<?php
require_once('../config/connection.php');
// $myArray = array();
// if ($result = mysqli_query($con, "SELECT * FROM `orders` INNER JOIN customers ON orders.id_customer = customers.id_customer 
// INNER JOIN employees ON orders.id_employee = employees.id_employee
// INNER JOIN rooms ON orders.id_room = rooms.id_room
// INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis")) {
//     while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
//         $myArray[] = $row;
//     }
//     mysqli_close($con);
//     echo json_encode($myArray);
// }

if (empty($_GET)) {
    $myArray = array();
    if ($result = mysqli_query($con, "SELECT * FROM `orders` INNER JOIN customers ON orders.id_customer = customers.id_customer 
INNER JOIN employees ON orders.id_employee = employees.id_employee
INNER JOIN rooms ON orders.id_room = rooms.id_room
INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis")) {
        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            $myArray[] = $row;
        }
        mysqli_close($con);
        echo json_encode($myArray);
    }
} else {
    $myArray = array();
    if ($result = mysqli_query($con, "SELECT * FROM `orders` INNER JOIN customers ON orders.id_customer = customers.id_customer 
    INNER JOIN employees ON orders.id_employee = employees.id_employee
    INNER JOIN rooms ON orders.id_room = rooms.id_room
    INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis WHERE id_order=" . $_GET['id'])) {
        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            $myArray[] = $row;
        }
        mysqli_close($con);
        echo json_encode($myArray);
    }
}
