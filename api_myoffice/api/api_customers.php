<?php
require_once '../config/connection.php';

$response = array();

if (isset($_GET['apicall'])) {
    switch ($_GET['apicall']) {
        case 'register':
            // isset($_POST['name']) and isset($_POST['email']) and isset($_POST['password']) and isset($_POST['phone'])
            if (isTheseParametersAvailable(array('name', 'instansi', 'phone', 'email', 'password'))) {
                $name = $_POST['name'];
                $instansi = $_POST['instansi'];
                $phone = $_POST['phone'];
                $email = $_POST['email'];
                $password = $_POST['password'];

                $stmt = $con->prepare("SELECT id FROM customers WHERE email = ? OR phone = ?");
                $stmt->bind_param("si", $email, $phone);
                $stmt->execute();
                $stmt->store_result();

                if ($stmt->num_rows > 0) {
                    $response['error'] = true;
                    $response['message'] = 'Email atau Nomer Handphone Sudah Terdaftar';
                    $stmt->close();
                } else {
                    $stmt = $con->prepare("INSERT INTO customers (name, instansi, email, password, phone) VALUES (?, ?, ?, ?, ?)");
                    $stmt->bind_param("sssss", $name, $instansi, $email, $password, $phone);

                    if ($stmt->execute()) {
                        $stmt = $con->prepare("SELECT id, name, instansi, email, password, phone FROM customers WHERE name = ?");
                        $stmt->bind_param("s", $name);
                        $stmt->execute();
                        $stmt->bind_result($id, $name, $instansi, $email, $password, $phone);
                        $stmt->fetch();

                        $customer = array(
                            'id' => $id,
                            'name' => $name,
                            'instansi' => $instansi,
                            'email' => $email,
                            'password' => $password,
                            'phone' => $phone
                        );

                        $stmt->close();

                        $response['error'] = false;
                        $response['message'] = 'Berhasil Mendaftar';
                        $response['customer'] = $customer;
                    }
                }
            } else {
                $response['error'] = true;
                $response['message'] = 'Harap isi kolom';
            }
            // if (isTheseParametersAvailable(array('name', 'phone', 'email', 'password'))) {
            //     $name = $_POST['name'];
            //     $phone = $_POST['phone'];
            //     $email = $_POST['email'];
            //     $password = $_POST['password'];

            //     $stmt = $con->prepare("SELECT id FROM customers WHERE email = ? OR phone = ?");
            //     $stmt->bind_param("si", $email, $phone);
            //     $stmt->execute();
            //     $stmt->store_result();

            //     if ($stmt->num_rows > 0) {
            //         $response['error'] = true;
            //         $response['message'] = 'Email atau Nomer Handphone Sudah Terdaftar';
            //         $stmt->close();
            //     } else {
            //         $stmt = $con->prepare("INSERT INTO customers (name, email, password, phone) VALUES (?, ?, ?, ?)");
            //         $stmt->bind_param("ssss", $name, $email, $password, $phone);

            //         if ($stmt->execute()) {
            //             $stmt = $con->prepare("SELECT id, name, email, password, phone FROM customers WHERE name = ?");
            //             $stmt->bind_param("s", $name);
            //             $stmt->execute();
            //             $stmt->bind_result($id, $name, $email, $password, $phone);
            //             $stmt->fetch();

            //             $customer = array(
            //                 'id' => $id,
            //                 'name' => $name,
            //                 'email' => $email,
            //                 'password' => $password,
            //                 'phone' => $phone
            //             );

            //             $stmt->close();

            //             $response['error'] = false;
            //             $response['message'] = 'Berhasil Mendaftar';
            //             $response['customer'] = $customer;
            //         }
            //     }
            // } else {
            //     $response['error'] = true;
            //     $response['message'] = 'Harap isi kolom';
            // }
            break;
        case 'login':
            // if (isTheseParametersAvailable(array('email', 'password'))) {

            //     $email = $_POST['email'];
            //     $password = ($_POST['password']);

            //     $customer = getEmailAndPassword($email, $password);

            //     if ($customer != false) {
            //         $res = array(
            //             'id' => $customer['id'],
            //             'name' => $customer['name'],
            //             'email' => $customer['email'],
            //             'password' => $customer['password'],
            //             'phone' => $customer['phone']
            //             // 'id' => $id,
            //             // 'name' => $name,
            //             // 'email' => $email,
            //             // 'password' => $password,
            //             // 'phone' => $phone
            //         );

            //         $response['error'] = false;
            //         $response['message'] = 'Login successfull';
            //         $response['customer'] = $res;
            //     } else {
            //         $response['error'] = false;
            //         $response['message'] = 'Email atau Password Salah';
            //     }
            // }
            if (isTheseParametersAvailable(array('email', 'password'))) {
                $email = $_POST['email'];
                $password = $_POST['password'];

                $stmt = $con->prepare("SELECT id, name, instansi, email, password, phone FROM customers WHERE email = ? AND password = ?");
                $stmt->bind_param("ss", $email, $password);
                $stmt->execute();
                $stmt->store_result();
                if ($stmt->num_rows > 0) {
                    $stmt->bind_result($id, $name, $instansi, $email, $password, $phone);
                    $stmt->fetch();
                    $customer = array(
                        'id' => $id,
                        'name' => $name,
                        'instansi' => $instansi,
                        'email' => $email,
                        'password' => $password,
                        'phone' => $phone
                    );

                    $response['error'] = false;
                    $response['message'] = 'Login successfull';
                    $response['customer'] = $customer;
                } else {
                    $response['error'] = false;
                    $response['message'] = 'Email atau Password Salah';
                }
            }
            break;
        default:
            $response['error'] = true;
            $response['message'] = 'Invalid Operation Called';
    }
} else {
    $response['error'] = true;
    $response['message'] = 'Invalid API Call';
}
echo json_encode($response);

// function getEmailAndPassword($email, $password)
// {
//     global $con;
//     $stmt = $con->prepare("SELECT * FROM customers WHERE email = ?");
//     $stmt->bind_param("s", $email);

//     if ($stmt->execute()) {
//         $customer = $stmt->get_result()->fetch_assoc();
//         // $stmt->store_result();
//         // $stmt->bind_result($id, $name, $email, $password, $phone);
//         // $customer = $stmt->fetch();

//         // verifikasi password $customer
//         $salt = $customer['salt'];
//         $encrypted_password = $customer['password'];
//         $hash = checkhashSSHA($salt, $password);
//         // cek password jika sesuai
//         if ($encrypted_password == $hash) {
//             // autentikasi cuso$customer berhasil
//             return $customer;
//         }
//     } else {
//         return NULL;
//     }
// }

function isTheseParametersAvailable($params)
{
    foreach ($params as $param) {
        if (!isset($_POST[$param])) {
            return false;
        }
    }
    return true;
}

function checkhashSSHA($salt, $password)
{

    $hash = base64_encode(sha1($password . $salt, true) . $salt);

    return $hash;
}
