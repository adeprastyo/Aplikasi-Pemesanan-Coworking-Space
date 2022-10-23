<?php
require_once '../config/connection.php';

if (function_exists($_GET['f'])) {
    $_GET['f']();
}

$response = array();

//ambil seluruh data
function getall()
{
    global $con;
    $orders = array();
    $query = $con->query("SELECT orders.id as id_order, customers.id as id_customer, rooms.id as id_room, start_date, end_date, booking_date FROM orders INNER JOIN customers ON orders.customer_id = customers.id INNER JOIN rooms ON orders.room_id = rooms.id;");
    while ($row = mysqli_fetch_object($query)) {
        $orders[] = $row;
    }

    $response = array(
        'status' => 1,
        'message' => 'Success',
        'orders' => $orders
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
    $check = array('nama_customer' => '', 'no_hp' => '', 'nama_ruangan' => '', 'jenis_ruangan' => '', 'start_date' => '', 'end_date' => '', 'booking_date' => '');
    $check_match = count(array_intersect_key($_POST, $check));
    if ($check_match == count($check)) {
        //get id customer
        $idcustomer_query = $con->query("SELECT id FROM customers WHERE name = '$_POST[nama_customer]' AND phone = '$_POST[no_hp]'");
        while ($row_customer = $idcustomer_query->fetch_assoc()) {
            $idcustomer = $row_customer['id'];
        }

        //get id jenis
        $idtype_query = $con->query("SELECT id FROM types WHERE name = '$_POST[jenis_ruangan]'");
        while ($row_type = $idtype_query->fetch_assoc()) {
            $idtype = $row_type['id'];
        }

        // get id room
        $idroom_query = $con->query("SELECT id FROM rooms where name = '$_POST[nama_ruangan]'");

        while ($row_room = $idroom_query->fetch_assoc()) {
            $idroom = $row_room['id'];
        }

        $result = $con->query("INSERT INTO orders SET 
                                customer_id = $idcustomer, 
                                room_id = $idroom, 
                                start_date = '$_POST[start_date]', 
                                end_date = '$_POST[end_date]',
                                booking_date = '$_POST[booking_date]'");

        if ($result) {
            $query = $con->query("SELECT orders.id as id_order,
                orders.customer_id as id_customer,
                customers.name as customer_name,
                customers.instansi as customer_instansi,
                customers.phone as customer_phone,
                rooms.id as id_room,
                rooms.name as room_name,
                rooms.type_id as id_type,
                types.name as type_name,
                types.price as type_price,
                start_date, end_date, booking_date
            FROM orders INNER JOIN customers ON
                orders.customer_id = customers.id 
            INNER JOIN rooms ON 
                orders.room_id = rooms.id
            INNER JOIN types ON
                rooms.type_id = types.id");

            while ($row = mysqli_fetch_array($query)) {
                $orders['id_order'] = $row['id_order'];
                $orders['id_customer'] = $row['id_customer'];
                $orders['customer_name'] = $row['customer_name'];
                $orders['customer_instansi'] = $row['customer_instansi'];
                $orders['customer_phone'] = $row['customer_phone'];
                $orders['id_room'] = $row['id_room'];
                $orders['room_name'] = $row['room_name'];
                $orders['id_type'] = $row['id_type'];
                $orders['type_name'] = $row['type_name'];
                $orders['type_price'] = $row['type_price'];
                $orders['start_date'] = $row['start_date'];
                $orders['end_date'] = $row['end_date'];
                $orders['booking_date'] = $row['booking_date'];
            }

            $response['error'] = false;
            $response['message'] = 'Berhasil Memesan';
            $response['orders'] = $orders;
        } else {
            $response['error'] = true;
            $response['message'] = 'Gagal Ditambah';
        }
    } else {
        $response['error'] = true;
        $response['message'] = 'Parameter Salah!';
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
