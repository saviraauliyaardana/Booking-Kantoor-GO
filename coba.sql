-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220926.6a5cb9f66e
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 27, 2022 at 11:42 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `bookingcode` int(11) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `booking_code` longtext DEFAULT NULL,
  `order_date` longtext DEFAULT NULL,
  `check_in` longtext DEFAULT NULL,
  `check_out` longtext DEFAULT NULL,
  `id_gedung` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `status`, `bookingcode`, `created_at`, `deleted_at`, `updated_at`, `booking_code`, `order_date`, `check_in`, `check_out`, `id_gedung`, `id_user`, `id_jenis`) VALUES
(2, 0, NULL, '2022-07-15 20:44:30.169', NULL, '2022-07-15 20:44:30.169', 'asfwr3d', '11-07-2022', '15-07-2022', '15-07-2022', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gedungs`
--

CREATE TABLE `gedungs` (
  `id` bigint(20) NOT NULL,
  `name` longtext DEFAULT NULL,
  `price` longtext DEFAULT NULL,
  `latitude` longtext DEFAULT NULL,
  `longitude` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `reviews_id` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_nearby` int(11) NOT NULL,
  `location` longtext DEFAULT NULL,
  `id_booking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gedungs`
--

INSERT INTO `gedungs` (`id`, `name`, `price`, `latitude`, `longitude`, `description`, `created_at`, `updated_at`, `deleted_at`, `reviews_id`, `id_jenis`, `id_nearby`, `location`, `id_booking`) VALUES
(2, 'Test', '12', '2', '3', 'none', NULL, '2022-07-14 21:39:04.316', NULL, 1, 0, 0, NULL, 0),
(12, 'A', '1000', '1', '3', 'Ini gedung', '2022-07-05 22:45:41.975', '2022-07-05 22:45:41.975', NULL, 1, 0, 0, NULL, 0),
(15, 'B', '10001', '1', '3', 'Ini gedung', '2022-07-06 01:15:44.363', '2022-07-06 01:15:44.363', NULL, 0, 0, 0, NULL, 0),
(16, 'Villa A', '1000000', '1', '3', 'sample description', '2022-07-11 21:22:19.314', '2022-07-11 21:22:19.314', NULL, 0, 0, 0, 'jakarta', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id` int(11) NOT NULL,
  `jenis` longtext NOT NULL,
  `id_gedung` int(11) NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `id_booking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id`, `jenis`, `id_gedung`, `created_at`, `deleted_at`, `updated_at`, `id_booking`) VALUES
(8, 'Penginapan ', 2, '2022-07-16 19:56:50.293', NULL, '2022-07-16 19:56:50.293', 1),
(9, 'Penginapan ', 2, '2022-07-16 22:03:06.609', NULL, '2022-07-16 22:03:06.609', 2);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `userName` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `timestamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `user_name` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `timestamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nearbies`
--

CREATE TABLE `nearbies` (
  `id` int(11) NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name_facilities` longtext DEFAULT NULL,
  `jenis` longtext DEFAULT NULL,
  `jarak` longtext DEFAULT NULL,
  `latitude` longtext DEFAULT NULL,
  `longtitude` longtext DEFAULT NULL,
  `id_gedung` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nearbies`
--

INSERT INTO `nearbies` (`id`, `created_at`, `updated_at`, `deleted_at`, `name_facilities`, `jenis`, `jarak`, `latitude`, `longtitude`, `id_gedung`) VALUES
(3, '2022-07-07 23:12:25.485', '2022-07-07 23:12:25.485', NULL, 'B', 'gatau', '1', '3', '1', 12),
(5, '2022-07-11 21:24:41.829', '2022-07-11 21:24:41.829', NULL, 'Villa ', 'penginapan', '1', '3', '1', 16);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `rating` double DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `id_gedung` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `img` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `description`, `id_gedung`, `id_user`, `img`) VALUES
(2, 4, 'ini description', 12, 0, ''),
(12, 4, 'sample description', 2, 13, '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role-name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role-name`) VALUES
(1, 'customer'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `email` longtext DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `phone` longtext DEFAULT NULL,
  `password` longtext DEFAULT NULL,
  `newpassword` longtext NOT NULL,
  `role_id` int(11) NOT NULL,
  `fullname` longtext DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `full_name` longtext DEFAULT NULL,
  `id_booking` int(11) NOT NULL,
  `id_review` int(11) NOT NULL,
  `new_password` longtext DEFAULT NULL,
  `confirm_password` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `deleted_at`, `email`, `name`, `phone`, `password`, `newpassword`, `role_id`, `fullname`, `alamat`, `full_name`, `id_booking`, `id_review`, `new_password`, `confirm_password`) VALUES
(1, NULL, '2022-07-19 15:28:39.210', NULL, 'admin@administrator.com', 'admin', '12345', '12345678', '', 0, 'admin', 'jl.raya', 'admin', 0, 0, '234567', '234567'),
(13, '2022-07-06 18:06:17.366', '2022-07-19 17:17:38.556', NULL, 'juan@gmail.com', 'Budi', '123455', '12345678', '', 0, NULL, 'jl aapayaa', 'Budi slamet', 2, 0, NULL, NULL),
(17, '2022-09-27 13:50:57.165', '2022-09-27 13:50:57.165', NULL, 'admin1@gmail.com', 'admin1', '123455', '12345678', '', 0, NULL, 'jl aapayaa', 'Budi slamet', 0, 0, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gedung` (`id_gedung`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_jenis` (`id_jenis`);

--
-- Indexes for table `gedungs`
--
ALTER TABLE `gedungs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gedungs_deleted_at` (`deleted_at`),
  ADD KEY `id_review` (`reviews_id`,`id_jenis`),
  ADD KEY `id_nearby` (`id_nearby`),
  ADD KEY `id_jenis` (`id_jenis`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nearbies`
--
ALTER TABLE `nearbies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gedungs`
--
ALTER TABLE `gedungs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `nearbies`
--
ALTER TABLE `nearbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
