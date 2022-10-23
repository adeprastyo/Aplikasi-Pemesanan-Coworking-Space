<?php

$server      = "localhost";
$user        = "root";
$password    = "";
$database    = "myoffice_db";

$con = mysqli_connect($server, $user, $password, $database);
if (mysqli_connect_errno()) {
    echo "Gagal terhubung MySQL: " . mysqli_connect_error();
}
