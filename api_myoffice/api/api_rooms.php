<?php
require_once '../config/connection.php';

if (function_exists($_GET['f'])) {
    $_GET['f']();
} else {
    echo "error";
}

//ambil seluruh data

function getall()
{
    global $con;
    $room = array();
    $query = $con->query("SELECT rooms.id as room_id, rooms.name as room_name, rooms.image as room_image, types.id AS type_id, types.name as type_name, types.price as type_price, types.description as type_description FROM rooms INNER JOIN types ON rooms.type_id = types.id;");

    // $arrIdRoom = [];
    while ($row = $query->fetch_assoc()) {
        $room_id = $row['room_id'];
        // $arrIdRoom[] = $room_id;
        $room_name = $row['room_name'];
        $room_image = $row['room_image'];
        // $base64_img = base64_encode($room_image);
        $url_image = 'http://192.168.58.86/My-Office/uploads/rooms/' . $room_image . '';
        $type_id = $row['type_id'];
        $type_name = $row['type_name'];
        $type_price = $row['type_price'];
        $type_description = $row['type_description'];


        $query_facility = $con->query("SELECT facilities.id as facility_id, facilities.name as facility_name FROM facility_room INNER JOIN facilities ON facility_room.facility_id = facilities.id WHERE facility_room.room_id = $room_id;");
        $arrF = [];

        $room[] = array(
            'room_id' => $room_id,
            'room_name' => $room_name,
            'room_image' => $url_image,
            'type_id' => $type_id,
            'type_name' => $type_name,
            'type_price' => $type_price,
            'type_description' => $type_description,
            'facilities2' => $query_facility->fetch_all(MYSQLI_ASSOC),
        );
    }

    $response = array(
        'status' => 1,
        'message' => 'Success',
        'room' => $room
    );

    header('Content-Type: application/json');
    echo json_encode($response);
}

// function getall()
// {
//     global $con;
//     $room = array();
//     $query = $con->query("SELECT rooms.id as room_id, rooms.name as room_name, rooms.image as room_image, types.id AS type_id, types.name as type_name, types.price as type_price, types.description as type_description FROM rooms INNER JOIN types ON rooms.type_id = types.id;");

//     // $arrIdRoom = [];
//     while ($row = $query->fetch_assoc()) {
//         $room_id = $row['room_id'];
//         // $arrIdRoom[] = $room_id;
//         $room_name = $row['room_name'];
//         $room_image = $row['room_image'];
//         // $base64_img = base64_encode($room_image);
//         $url_image = 'http://192.168.199.15/My-Office/uploads/rooms/' . $room_image . '';
//         $type_id = $row['type_id'];
//         $type_name = $row['type_name'];
//         $type_price = $row['type_price'];
//         $type_description = $row['type_description'];
//         $room[] = array(
//             'room_id' => $room_id,
//             'room_name' => $room_name,
//             'room_image' => $url_image,
//             'type_id' => $type_id,
//             'type_name' => $type_name,
//             'type_price' => $type_price,
//             'type_description' => $type_description
//             // 'facilities' => $facilites
//         );
//     }

//     // foreach ($arrIdRoom as $value) {
//     //     echo $value . ' - ';
//     // }

//     // die;

//     // $getIdFacility = $con->query("SELECT id, facility_id from facility_room where room_id = " . $room_id . "");

//     // $idFacilityRoom = array();
//     // while ($getIdFacility->fetch_assoc()) {
//     //     $idFacilityRoom = $getIdFacility['id'];
//     //     $idFacilityRoom = $getIdFacility['facility_id'];
//     // }

//     // echo $idFacilityRoom;
//     // die;

//     $response = array(
//         'status' => 1,
//         'message' => 'Success',
//         'room' => $room
//     );

//     header('Content-Type: application/json');
//     echo json_encode($response);
// }

//ambil satu data
function get()
{
    global $con;
    $room = array();
    if (!empty($_GET["id"])) {
        $id = $_GET["id"];
    }

    $query = "SELECT * FROM rooms INNER JOIN jenis ON rooms.id_jenis = jenis.id_jenis WHERE id_room = $id";
    $result = $con->query($query);
    while ($row = mysqli_fetch_object($result)) {
        $room[] = $row;
    }
    if ($room) {
        $response = array(
            'status' => 1,
            'message' => 'Success',
            'room' => $room
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
    global $con, $upload_path, $upload_url;
    $check = array('name_room' => '', 'type_id' => '');
    $check_match = count(array_intersect_key($_POST, $check));
    if ($check_match == count($check)) {
        // isset($_POST['nama_room']) and isset($_POST['id_jenis']) and isset($FILES['gambar']['nama'])
        $cekjenis = $con->query("SELECT * FROM types WHERE id = '$_POST[type_id]'");
        if ($cekjenis->num_rows > 0) {
            $nama = $_POST['name_room'];
            $jenis = $_POST['type_id'];
            $gambar_tmp = $_FILES['image']['tmp_name'];
            $nama_gambar = $_FILES['image']['name'];

            move_uploaded_file($gambar_tmp, '../../My-Office/uploads/rooms/' . $nama_gambar);

            $result = mysqli_query($con, "INSERT INTO rooms SET
               name = '$nama',
               type_id = '$jenis',
               image = '$nama_gambar'");

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
                'message' => 'Jenis Tidak Ada'
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

    $check = array('nama_room' => '', 'id_jenis' => '');
    $check_match = count(array_intersect_key($_POST, $check));
    if ($check_match == count($check)) {
        $cekjenis = $con->query("SELECT * FROM jenis WHERE id_jenis = '$_POST[id_jenis]'");
        if ($cekjenis->num_rows > 0) {
            $nama = $_POST['nama_room'];
            $jenis = $_POST['id_jenis'];
            $gambar_tmp = $_FILES['gambar']['tmp_name'];
            $nama_gambar = $_FILES['gambar']['name'];

            move_uploaded_file($gambar_tmp, '../img/' . $nama_gambar);

            $result = mysqli_query($con, "UPDATE rooms SET               
                   nama_room = '$nama',
                   id_jenis = '$jenis',
                   gambar = '$nama_gambar' WHERE id_room = $id");

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
                'message' => 'Jenis Tidak Ada'
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
    $query = "DELETE FROM rooms WHERE id_room =" . $id;
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

// function getFileName()
// {
//     global $con;
//     $sql = "SELECT max(id_room) as id_room FROM rooms";
//     $result = mysqli_fetch_array(mysqli_query($con, $sql));

//     mysqli_close($con);
//     if ($result['id_room'] == null)
//         return 1;
//     else
//         return ++$result['id_room'];
// }
