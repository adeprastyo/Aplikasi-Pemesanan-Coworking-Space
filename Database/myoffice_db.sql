-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Sep 2022 pada 11.25
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myoffice_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instansi` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `instansi`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Ade Prastyo', '', '081233446677', 'adeprastyo@gmail.com', NULL, 'ppppp', NULL, NULL, NULL, NULL),
(3, 'Agus Gus', '', '089531334144', 'agus@gmail.com', NULL, 'agus123', NULL, NULL, NULL, NULL),
(4, 'Samsudin', '', '081374445663', 'samsusin@gmail.com', NULL, 'samsu123', NULL, NULL, NULL, NULL),
(5, 'Tes Tes', '', '081236639119', 'testes@gmail.com', NULL, 'tes1234', NULL, NULL, '2022-08-15 07:02:41', '2022-08-15 07:02:41'),
(6, 'Tes Sidang', '', '081241149779', 'tessidang@gmail.com', NULL, 'tes123', NULL, NULL, NULL, NULL),
(7, 'adeee', 'polsri', '081912318856', 'adeee@gmail.com', NULL, 'ade1', NULL, NULL, NULL, NULL),
(8, 'saya', 'saya', '087841213663', 'saya@gmail.com', NULL, 'saya123', NULL, NULL, NULL, NULL),
(9, 'Kamu', 'Kamu', '089536131441', 'kamu@gmail.com', NULL, 'kamu123', NULL, NULL, NULL, NULL),
(11, 'mereka', 'UNSRI', '081231128756', 'mereka@gmail.com', NULL, 'mereka123', NULL, NULL, NULL, NULL),
(12, 'Kita Nih', 'Politeknik Negeri Sriwijaya', '08976341321', 'kita@gmail.com', NULL, 'kita123', NULL, NULL, NULL, NULL),
(13, 'Muhammad Prabowo', 'Politeknik Negeri Sriwijaya', '089913426493', 'muhprabowo@gmail.com', NULL, 'muh123', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `facilities`
--

INSERT INTO `facilities` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Meja', '2022-08-14 08:02:08', '2022-08-15 07:33:45', NULL),
(2, 'Kursi', '2022-08-14 08:15:04', '2022-08-14 08:15:04', NULL),
(3, 'AC', '2022-08-14 08:15:21', '2022-08-14 08:15:21', NULL),
(4, 'Wifi', '2022-08-14 08:15:31', '2022-08-14 08:15:31', NULL),
(5, 'Proyektor', '2022-08-14 08:15:50', '2022-08-14 08:15:50', NULL),
(6, 'Stop Kontak', '2022-08-14 08:16:11', '2022-08-14 08:16:11', NULL),
(7, 'Papan Tulis', '2022-08-14 08:16:34', '2022-08-14 08:16:34', NULL),
(8, 'Alat Tulis', '2022-08-14 08:16:46', '2022-08-14 08:16:46', NULL),
(9, 'Sound System', '2022-08-14 08:17:12', '2022-08-14 08:17:12', NULL),
(10, 'Mushola', '2022-08-14 08:17:26', '2022-08-14 08:17:26', NULL),
(11, 'Dapur', '2022-08-14 08:17:32', '2022-08-14 08:17:32', NULL),
(12, 'Alamat Domisili', '2022-08-14 08:17:39', '2022-08-14 08:17:39', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `facility_room`
--

CREATE TABLE `facility_room` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `facility_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `facility_room`
--

INSERT INTO `facility_room` (`id`, `room_id`, `facility_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 0, NULL, NULL, NULL),
(2, 1, 2, 0, NULL, NULL, NULL),
(3, 1, 3, 0, NULL, NULL, NULL),
(4, 1, 4, 0, NULL, NULL, NULL),
(5, 1, 6, 0, NULL, NULL, NULL),
(6, 1, 10, 0, NULL, NULL, NULL),
(7, 2, 1, 0, NULL, NULL, NULL),
(8, 2, 2, 0, NULL, NULL, NULL),
(9, 2, 3, 0, NULL, NULL, NULL),
(10, 2, 4, 0, NULL, NULL, NULL),
(11, 2, 6, 0, NULL, NULL, NULL),
(12, 2, 10, 0, NULL, NULL, NULL),
(13, 3, 1, 0, NULL, NULL, NULL),
(14, 3, 2, 0, NULL, NULL, NULL),
(15, 3, 3, 0, NULL, NULL, NULL),
(16, 3, 4, 0, NULL, NULL, NULL),
(17, 3, 6, 0, NULL, NULL, NULL),
(18, 3, 10, 0, NULL, NULL, NULL),
(19, 4, 1, 0, NULL, NULL, NULL),
(20, 4, 2, 0, NULL, NULL, NULL),
(21, 4, 3, 0, NULL, NULL, NULL),
(22, 4, 4, 0, NULL, NULL, NULL),
(23, 4, 6, 0, NULL, NULL, NULL),
(24, 4, 10, 0, NULL, NULL, NULL),
(25, 5, 1, 0, NULL, NULL, NULL),
(26, 5, 2, 0, NULL, NULL, NULL),
(27, 5, 3, 0, NULL, NULL, NULL),
(28, 5, 4, 0, NULL, NULL, NULL),
(29, 5, 6, 0, NULL, NULL, NULL),
(30, 5, 10, 0, NULL, NULL, NULL),
(31, 6, 1, 0, NULL, NULL, NULL),
(32, 6, 2, 0, NULL, NULL, NULL),
(33, 6, 3, 0, NULL, NULL, NULL),
(34, 6, 4, 0, NULL, NULL, NULL),
(35, 6, 5, 0, NULL, NULL, NULL),
(36, 6, 6, 0, NULL, NULL, NULL),
(37, 6, 7, 0, NULL, NULL, NULL),
(38, 6, 8, 0, NULL, NULL, NULL),
(39, 6, 9, 0, NULL, NULL, NULL),
(40, 6, 10, 0, NULL, NULL, NULL),
(41, 7, 1, 0, NULL, NULL, NULL),
(42, 7, 2, 0, NULL, NULL, NULL),
(43, 7, 3, 0, NULL, NULL, NULL),
(44, 7, 4, 0, NULL, NULL, NULL),
(45, 7, 5, 0, NULL, NULL, NULL),
(46, 7, 6, 0, NULL, NULL, NULL),
(47, 7, 7, 0, NULL, NULL, NULL),
(48, 7, 8, 0, NULL, NULL, NULL),
(49, 7, 10, 0, NULL, NULL, NULL),
(50, 7, 11, 0, NULL, NULL, NULL),
(51, 8, 1, 0, NULL, NULL, NULL),
(52, 8, 2, 0, NULL, NULL, NULL),
(53, 8, 3, 0, NULL, NULL, NULL),
(54, 8, 4, 0, NULL, NULL, NULL),
(55, 8, 5, 0, NULL, NULL, NULL),
(56, 8, 6, 0, NULL, NULL, NULL),
(57, 8, 7, 0, NULL, NULL, NULL),
(58, 8, 8, 0, NULL, NULL, NULL),
(59, 8, 10, 0, NULL, NULL, NULL),
(60, 8, 11, 0, NULL, NULL, NULL),
(61, 9, 1, 0, NULL, NULL, NULL),
(62, 9, 2, 0, NULL, NULL, NULL),
(63, 9, 3, 0, NULL, NULL, NULL),
(64, 9, 4, 0, NULL, NULL, NULL),
(65, 9, 5, 0, NULL, NULL, NULL),
(66, 9, 6, 0, NULL, NULL, NULL),
(67, 9, 7, 0, NULL, NULL, NULL),
(68, 9, 8, 0, NULL, NULL, NULL),
(69, 9, 10, 0, NULL, NULL, NULL),
(70, 9, 11, 0, NULL, NULL, NULL),
(71, 10, 1, 0, NULL, NULL, NULL),
(72, 10, 2, 0, NULL, NULL, NULL),
(73, 10, 3, 0, NULL, NULL, NULL),
(74, 10, 4, 0, NULL, NULL, NULL),
(75, 10, 5, 0, NULL, NULL, NULL),
(76, 10, 6, 0, NULL, NULL, NULL),
(77, 10, 7, 0, NULL, NULL, NULL),
(78, 10, 8, 0, NULL, NULL, NULL),
(79, 10, 10, 0, NULL, NULL, NULL),
(80, 10, 11, 0, NULL, NULL, NULL),
(81, 11, 1, 0, NULL, NULL, NULL),
(82, 11, 2, 0, NULL, NULL, NULL),
(83, 11, 3, 0, NULL, NULL, NULL),
(84, 11, 4, 0, NULL, NULL, NULL),
(85, 11, 5, 0, NULL, NULL, NULL),
(86, 11, 6, 0, NULL, NULL, NULL),
(87, 11, 7, 0, NULL, NULL, NULL),
(88, 11, 8, 0, NULL, NULL, NULL),
(89, 11, 10, 0, NULL, NULL, NULL),
(90, 11, 11, 0, NULL, NULL, NULL),
(92, 13, 12, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `levels`
--

INSERT INTO `levels` (`id`, `level`) VALUES
(1, 'admin'),
(2, 'staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_09_13_102109_create_levels_table', 1),
(4, '2020_09_13_102119_create_users_table', 1),
(5, '2020_09_13_102140_create_web_profiles_table', 1),
(6, '2022_07_28_000000_create_customers_table', 1),
(7, '2022_07_28_090005_create_facilities_table', 1),
(8, '2022_07_28_090006_create_types_table', 1),
(9, '2022_07_28_090104_create_rooms_table', 1),
(10, '2022_07_28_090735_create_room_facilities_table', 1),
(11, '2022_07_28_091110_create_orders_table', 1),
(12, '2022_07_28_091119_create_payments_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `booking_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `room_id`, `start_date`, `end_date`, `booking_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 2, 1, '2022-08-24 08:00:00', '2022-08-24 15:00:00', '2022-08-23 11:42:00', NULL, NULL, NULL),
(18, 2, 1, '2022-08-27 09:00:00', '2022-08-27 16:00:00', '2022-08-23 11:47:00', NULL, NULL, NULL),
(48, 11, 1, '2022-08-26 08:33:00', '2022-08-26 08:33:00', '2022-08-24 08:33:00', NULL, NULL, NULL),
(49, 11, 1, '2022-08-25 10:37:00', '2022-08-25 00:24:00', '2022-08-24 08:37:00', NULL, NULL, NULL),
(50, 11, 1, '2022-08-25 09:00:00', '2022-08-25 11:00:00', '2022-08-24 06:10:00', NULL, NULL, NULL),
(51, 11, 1, '2022-08-25 10:44:00', '2022-08-25 01:44:00', '2022-08-24 11:44:00', NULL, NULL, NULL),
(52, 13, 5, '2022-08-26 09:00:00', '2022-08-26 12:00:00', '2022-08-25 11:21:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_date` datetime NOT NULL,
  `proof` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','paid','cancelled') COLLATE utf8_unicode_ci NOT NULL,
  `payment_deadline` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `rooms`
--

INSERT INTO `rooms` (`id`, `type_id`, `name`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Open Space 1', 'room-1-62f90e8c80291.jpg', '2022-08-14 08:02:36', '2022-08-15 07:32:53', NULL),
(2, 1, 'Open Space 2', 'room-1-62f912469a57a.jpeg', '2022-08-14 08:18:30', '2022-08-14 08:18:30', NULL),
(3, 1, 'Open Space 3', 'room-1-62f9125e0e030.jpg', '2022-08-14 08:18:54', '2022-08-14 08:18:54', NULL),
(4, 1, 'Open Space 4', 'room-1-62f912748a88f.jpeg', '2022-08-14 08:19:16', '2022-08-14 08:19:16', NULL),
(5, 1, 'Open Space 5', 'room-1-62f9128d8424a.jpg', '2022-08-14 08:19:41', '2022-08-14 08:19:41', NULL),
(6, 2, 'Meeting Room 1', 'room-2-62f912d3e48fa.jpg', '2022-08-14 08:20:51', '2022-08-14 08:20:51', NULL),
(7, 3, 'Private Room 1', 'room-3-62f912fbce53c.jpeg', '2022-08-14 08:21:31', '2022-08-14 08:21:31', NULL),
(8, 3, 'Private Room 2', 'room-3-62f9131d50cb2.jpg', '2022-08-14 08:22:05', '2022-08-14 08:22:05', NULL),
(9, 3, 'Private Room 3', 'room-3-62f913432bc37.jpeg', '2022-08-14 08:22:43', '2022-08-14 08:22:43', NULL),
(10, 3, 'Private Room 4', 'room-3-62f9138fdd28c.jpg', '2022-08-14 08:23:59', '2022-08-14 08:23:59', NULL),
(11, 3, 'Private Room 5', 'room-3-62f913af7a6c8.jpeg', '2022-08-14 08:24:31', '2022-08-14 08:24:31', NULL),
(12, 4, 'Virtual Office 1', 'room-4-62f913c467f0b.png', '2022-08-14 08:24:52', '2022-08-14 08:26:37', NULL),
(13, 4, 'Virtual Office 2', 'room-4-62f913eda264d.png', '2022-08-14 08:25:33', '2022-08-14 08:25:33', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `types`
--

INSERT INTO `types` (`id`, `name`, `price`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Open Space', 50000, 'Open Space adalah ruang kerja terbuka untuk anda yang ingin menyelesaikan pekerjaan atau tugas dan juga kesempatan untuk berkolaborasi atau promosi. ', '2022-08-14 08:01:40', '2022-08-15 07:33:23', NULL),
(2, 'Meeting Room', 500000, '', '2022-08-14 08:13:51', '2022-08-14 08:13:51', NULL),
(3, 'Private Room', 1500000, '', '2022-08-14 08:14:24', '2022-08-14 08:14:24', NULL),
(4, 'Virtual Office', 6000000, '', '2022-08-14 08:14:42', '2022-08-14 08:14:42', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','nonactive') COLLATE utf8_unicode_ci NOT NULL,
  `api_token` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `level_id`, `name`, `email`, `email_verified_at`, `password`, `status`, `api_token`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', '2022-08-14 07:59:41', '$2y$10$S61ax0p.IlwFacPHgn.aae00WaEHYKV6om0xV8jigoUguECvMtXyy', 'active', '', NULL, '2022-08-14 07:59:41', '2022-08-14 07:59:41', NULL),
(2, 2, 'Staff', 'staff@staff.com', '2022-08-14 07:59:41', '$2y$10$yUYfxCZMpNwgMZazWT9BUeeggy8isCm2dWNbq9ZejZ5E6b/3gLqkq', 'active', '', NULL, '2022-08-14 07:59:41', '2022-08-14 07:59:41', NULL),
(3, 2, 'Staff 2', 'staff2@gmail.com', '2022-08-14 09:08:37', '$2y$10$Zf2CefxPRYm40pNeiCrEoO5lLYpdXsTugJZodj23.1lMR80sLWibG', 'active', '', NULL, '2022-08-14 09:08:37', '2022-08-15 07:35:49', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web_profile`
--

CREATE TABLE `web_profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ig` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `web_profile`
--

INSERT INTO `web_profile` (`id`, `logo`, `thumbnail`, `title`, `slogan`, `description`, `version`, `phone`, `email`, `ig`, `line`, `created_at`, `updated_at`) VALUES
(1, 'logo.png', 'dashboard.jpg', 'PT. Sentral Kreasindo Indonesia', 'PT. Sentral Kreasindo Indonesia', 'PT. Sentral Kreasindo Indonesia adalah perusahaan yang bergerak di bidang coworking space dan caffe bernama My Office Coworking Space', '1.0', '0808080808123', 'contact@polsri.ac.id', '@polsri', '@polsri', '2022-08-14 07:59:41', '2022-08-14 07:59:41');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `facility_room`
--
ALTER TABLE `facility_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_room_room_id_foreign` (`room_id`),
  ADD KEY `facility_room_facility_id_foreign` (`facility_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_room_id_foreign` (`room_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_type_id_foreign` (`type_id`);

--
-- Indeks untuk tabel `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_level_id_foreign` (`level_id`);

--
-- Indeks untuk tabel `web_profile`
--
ALTER TABLE `web_profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `facility_room`
--
ALTER TABLE `facility_room`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `web_profile`
--
ALTER TABLE `web_profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `facility_room`
--
ALTER TABLE `facility_room`
  ADD CONSTRAINT `facility_room_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `facility_room_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
