<?php
require_once '../config/connection.php';

if (function_exists($_GET['f'])) {
    $_GET['f']();
}

//ambil seluruh data
function getall()
{
    global $con;
    $jenis = array();
    $query = $con->query("SELECT * FROM jenis");
    while ($row = mysqli_fetch_object($query)) {
        $jenis[] = $row;
    }

    $response = array(
        'status' => 1,
        'message' => 'Success',
        'jenis' => $jenis
    );

    header('Content-Type: application/json');
    echo json_encode($response);
}

//ambil satu data
function get()
{
    global $con;
    $jenis = array();
    if (!empty($_GET["id"])) {
        $id = $_GET["id"];
    }

    $query = "SELECT * FROM jenis WHERE id_jenis = $id";
    $result = $con->query($query);
    while ($row = mysqli_fetch_object($result)) {
        $jenis[] = $row;
    }

    if ($jenis) {
        $response = array(
            'status' => 1,
            'message' => 'Success',
            'jenis' => $jenis
        );
    } else {
        $response = array(
            'status' => 0,
            'message' => 'No Data Found'
        );
    }

    header('Content-Type: application/json');
    echo json_encode($response);
}

// tambah data
function insert()
{
    global $con;
    $check = array('nama_jenis' => '', 'harga' => '', 'deskripsi_jenis' => '');
    $check_match = count(array_intersect_key($_POST, $check));
    if ($check_match == count($check)) {
        $result = mysqli_query($con, "INSERT INTO jenis SET
               nama_jenis = '$_POST[nama_jenis]',
               harga = $_POST[harga],
               deskripsi_jenis = '$_POST[deskripsi_jenis]'");

        if ($result) {
            // $query = $con->query("SELECT * FROM rooms INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis");
            // while ($row = mysqli_fetch_object($query)) {
            //     $room[] = $row;
            // }
            $response = array(
                'status' => 1,
                'message' => 'Berhasil Ditambah'
                // 'room' => $room
            );
        } else {
            $response = array(
                'status' => 0,
                'message' => 'Gagal Ditambah'
            );
        }
    } else {
        $response = array(
            'status' => 0,
            'message' => 'Parameter Salah'
        );
    }
    header('Content-Type: application/json');
    echo json_encode($response);
}

// ubah data
function update()
{
    global $con;
    if (!empty($_GET["id"])) {
        $id = $_GET["id"];
    }

    $check = array('nama_jenis' => '', 'harga' => '', 'deskripsi_jenis' => '');
    $check_match = count(array_intersect_key($_POST, $check));
    if ($check_match == count($check)) {

        $result = mysqli_query($con, "UPDATE jenis SET               
               nama_jenis = '$_POST[nama_jenis]',
               harga = $_POST[harga],
               deskripsi_jenis = '$_POST[deskripsi_jenis]' WHERE id_jenis = $id");

        if ($result) {
            // $query = $con->query("SELECT * FROM rooms INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis");
            // while ($row = mysqli_fetch_object($query)) {
            //     $room[] = $row;
            // }

            $response = array(
                'status' => 1,
                'message' => 'Berhasil Diupdate'
                // 'room' => $room
            );
        } else {
            $response = array(
                'status' => 0,
                'message' => 'Gagal Diupdate'
            );
        }
    } else {
        $response = array(
            'status' => 0,
            'message' => 'Parameter Salah',
            'data' => $id
        );
    }
    header('Content-Type: application/json');
    echo json_encode($response);
}

// hapus data
function delete()
{
    global $con;
    $id = $_GET['id'];
    $query = "DELETE FROM jenis WHERE id_jenis =" . $id;
    if (mysqli_query($con, $query)) {
        // $query = $con->query("SELECT * FROM rooms INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis");
        // while ($row = mysqli_fetch_object($query)) {
        //     $room[] = $row;
        // }

        $response = array(
            'status' => 1,
            'message' => 'Berhasil Dihapus'
            // 'room' => $room
        );
    } else {
        $response = array(
            'status' => 0,
            'message' => 'Gagal Dihapus'
        );
    }
    header('Content-Type: application/json');
    echo json_encode($response);
}
