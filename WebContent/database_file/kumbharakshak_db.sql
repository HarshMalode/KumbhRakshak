-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2026 at 01:07 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kumbharakshak_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `camera_status`
--

CREATE TABLE `camera_status` (
  `location` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_status`
--

INSERT INTO `camera_status` (`location`, `is_active`, `last_updated`) VALUES
('gfd', 0, '2026-01-03 09:39:14'),
('hgf', 0, '2026-01-22 06:31:55'),
('jh', 1, '2026-01-21 12:02:04'),
('Seminar Hall A', 0, '2026-01-15 09:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `city_news`
--

CREATE TABLE `city_news` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city_news`
--

INSERT INTO `city_news` (`id`, `title`, `description`, `city`, `created_at`, `image`, `publish_date`) VALUES
(14, 'Govt relaxes land acquisition norms for Nashik Ring Road project ahead of Kumbh', 'On Tuesday, the cabinet committee on infrastructure granted approval for the 65.60 - kilometers of Nashik Ring Road, to be constructed by the Maharashtra State infrastructure Development Corporation (MSIDC) at an Estimated cost of 7,600 crore.', 'Nashik', '2026-02-27 03:18:18', 'Screenshot 2026-02-27 084802.png', '2026-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `crowd_status`
--

CREATE TABLE `crowd_status` (
  `id` int(11) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `people_count` int(11) DEFAULT NULL,
  `density` varchar(10) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crowd_status`
--

INSERT INTO `crowd_status` (`id`, `location`, `people_count`, `density`, `last_updated`) VALUES
(1032, 'Lab1', 2, 'LOW', '2026-03-16 05:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `findlog`
--

CREATE TABLE `findlog` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `location` varchar(300) NOT NULL,
  `typee` varchar(100) NOT NULL,
  `datee` date NOT NULL,
  `timee` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `findlog`
--

INSERT INTO `findlog` (`id`, `name`, `location`, `typee`, `datee`, `timee`) VALUES
(37, 'Harshwardhan Malode', 'Lab1', 'Detected', '2026-02-17', '13:08:38'),
(54, 'Harshwardhan Malode', 'Lab1', 'Detected', '2026-02-26', '20:34:53'),
(55, 'Pranav Pawar', 'Lab1', 'Detected', '2026-03-16', '11:19:23'),
(56, 'Harshwardhan Malode', 'Lab1', 'Detected', '2026-03-16', '11:19:31'),
(57, 'Pranav Pawar', 'Lab1', 'Detected', '2026-03-16', '11:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `description`, `image_url`, `latitude`, `longitude`) VALUES
(34, 'Tapovan', 'vary beautiful place', 'locations/1771686681761_kumbh.png', '19.9872579', '73.806567'),
(35, 'Ganga Ghat', 'Place known for its cultural bath', 'uploads/1771860735333_panchvati.webp', '20.0075811', '73.7900318'),
(36, 'Tapovan', 'dfuhhchbdxjcxdkxnskndxlncscj', 'locations/1781451055055_IMG_6823.JPG', '19.1883035', '72.8629248');

-- --------------------------------------------------------

--
-- Table structure for table `missingpeople`
--

CREATE TABLE `missingpeople` (
  `id` int(11) NOT NULL,
  `added_by_email` varchar(255) DEFAULT NULL,
  `First_Name` varchar(100) DEFAULT NULL,
  `Last_Name` varchar(100) DEFAULT NULL,
  `Father_Full_Name` varchar(150) DEFAULT NULL,
  `Mother_Full_Name` varchar(150) DEFAULT NULL,
  `Relative_Full_Name` varchar(150) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Eye_Colour` varchar(50) DEFAULT NULL,
  `Hair_Colour` varchar(50) DEFAULT NULL,
  `Height_IN_CM` int(11) DEFAULT NULL,
  `Weight_IN_KG` int(11) DEFAULT NULL,
  `Blood_Group` varchar(10) DEFAULT NULL,
  `Birth_Mark` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  `Occupation` varchar(100) DEFAULT NULL,
  `Last_Seen_Location` varchar(255) DEFAULT NULL,
  `Date_Of_Missing` date DEFAULT NULL,
  `Image_Filename` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `missingpeople`
--

INSERT INTO `missingpeople` (`id`, `added_by_email`, `First_Name`, `Last_Name`, `Father_Full_Name`, `Mother_Full_Name`, `Relative_Full_Name`, `Age`, `Gender`, `Eye_Colour`, `Hair_Colour`, `Height_IN_CM`, `Weight_IN_KG`, `Blood_Group`, `Birth_Mark`, `Phone_Number`, `Address`, `City`, `State`, `Nationality`, `Occupation`, `Last_Seen_Location`, `Date_Of_Missing`, `Image_Filename`, `file_name`) VALUES
(57, 'admin@gmail.com', 'Harshwardhan', 'Malode', '', '', '', NULL, '', '', '', NULL, NULL, '', '', '', 'Jatra Hotel, Nashik, Nandur Road, Vishwa Avanue Apartment, Flat No. 07', 'Nashik', 'Maharashtra', '', '', '', '2026-02-17', '57_795A3054.jpg', '57_Screenshot 2026-01-22 211540.png'),
(63, 'harshwardhanmalode798@gmail.com', 'Pranav', 'Pawar', 'Anil', '', '', NULL, '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '2026-02-12', '63_WhatsApp Image 2026-02-26 at 8.19.04 PM (1).jpeg', '63_Screenshot 2026-02-26 202210.png'),
(64, 'panchvatipolice@gmail.com', 'Rutuja ', 'Malode', 'Arun', 'Ratna', 'Harsh Malode', 22, 'Female', 'Brown', 'Brown', 149, 68, 'B+', '', '8567678877', 'Lok Sahakar Nagar Rd, opp. Krushi Utpanna Market, Adityakunj Society, Nashik - 422401.', 'Nashik', 'Maharashtra', 'Indian', 'Persuing (MBA)', 'Tapovan', '2026-06-14', '64_Aditi01.jpeg', '64_AdminDashboard.png');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `reference_id`, `is_read`, `created_at`) VALUES
(1, 'NEW_LOCATION', 12, 1, '2026-01-21 06:53:28'),
(2, 'NEW_LOCATION', 13, 1, '2026-01-21 06:54:35'),
(3, 'NEW_LOCATION', 14, 1, '2026-01-21 07:13:59'),
(4, 'NEW_LOCATION', 15, 1, '2026-01-21 07:16:04'),
(5, 'NEW_LOCATION', 16, 1, '2026-01-21 07:21:45'),
(6, 'NEW_LOCATION', 17, 1, '2026-01-31 07:30:11'),
(7, 'NEW_LOCATION', 18, 1, '2026-01-31 08:50:14'),
(8, 'NEW_LOCATION', 19, 1, '2026-01-31 12:57:16'),
(9, 'NEW_LOCATION', 20, 1, '2026-01-31 13:10:34'),
(10, 'NEW_LOCATION', 21, 1, '2026-01-31 13:10:48'),
(11, 'NEW_LOCATION', 22, 1, '2026-01-31 13:10:59'),
(12, 'NEW_LOCATION', 23, 1, '2026-01-31 13:11:13'),
(13, 'NEW_LOCATION', 24, 1, '2026-01-31 13:11:26'),
(14, 'NEW_LOCATION', 25, 1, '2026-01-31 13:11:47'),
(15, 'NEW_LOCATION', 26, 1, '2026-01-31 13:12:04'),
(16, 'NEW_LOCATION', 27, 1, '2026-02-06 12:46:14'),
(17, 'NEW_LOCATION', 28, 1, '2026-02-07 05:20:05'),
(18, 'NEW_LOCATION', 29, 1, '2026-02-07 10:37:00'),
(19, 'NEW_LOCATION', 30, 1, '2026-02-09 13:12:00'),
(20, 'NEW_LOCATION', 31, 1, '2026-02-10 05:37:58'),
(21, 'NEW_LOCATION', 32, 1, '2026-02-10 06:10:36'),
(22, 'NEW_LOCATION', 33, 1, '2026-02-17 07:32:56'),
(23, 'NEW_LOCATION', 34, 1, '2026-02-21 15:11:21'),
(24, 'NEW_LOCATION', 35, 1, '2026-02-23 15:31:45'),
(25, 'NEW_LOCATION', 36, 1, '2026-06-14 15:30:55');

-- --------------------------------------------------------

--
-- Table structure for table `police_helpline`
--

CREATE TABLE `police_helpline` (
  `id` int(11) NOT NULL,
  `station_name` varchar(200) NOT NULL,
  `officer_name` varchar(200) NOT NULL,
  `helpline_no` varchar(20) NOT NULL,
  `emergency_no` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pincode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `police_helpline`
--

INSERT INTO `police_helpline` (`id`, `station_name`, `officer_name`, `helpline_no`, `emergency_no`, `email`, `password`, `address`, `location`, `state`, `city`, `pincode`) VALUES
(20, 'Panchvati Police Station', 'Mr. Jitendra Sapkale', '2532465533', '2532455133', 'panchvatipolice@gmail.com', '1234', 'Lok Sahakar Nagar Rd, opp. Krushi Utpanna Market, Adityakunj Society, Nashik - 422401.', 'Lab1', 'Maharashtra', 'Nashik', '422006'),
(21, 'Trimbakeshwar Police Station', 'Mr. Balasaheb Patil', '2594233133', '9126377829', 'trimbakpolice@gmail.com', '1234', 'Shrimant Peshwa Balaji Bajirao Road, Trimbakeshwar, Nasik, Maharashtra 422212.', 'Lab1', 'Maharashtra', 'Nashik', '422006'),
(22, 'Ozar Police Station', 'Mr. G.G. Patil', '8978798876', '4567467677', 'admin@gmail.com', 'admin', 'Shrimant Peshwa Balaji Bajirao Road, Trimbakeshwar, Nasik, Maharashtra 422212.', 'Lab1', 'Maharashtra', 'Nashik', '422006'),
(23, 'Ozar Police Station', 'Mr. G.G. Patil', '8978738948', '4567467677', 'admin@gmail.com', 'admin', 'Shrimant Peshwa Balaji Bajirao Road, Trimbakeshwar, Nasik, Maharashtra 422212.', 'Lab1', 'Maharashtra', 'Nashik', '344534');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `city`, `password`) VALUES
(3, 'user', 'user@gmail.com', '9834563456', 'Nashik', '1234'),
(6, 'Pranav Patil', 'pawarpranav283@gmail.com', '5467438764', 'Nashik', '1234'),
(7, 'Gokul Malode', 'gokulmalode45@gmail.com', '6356563674', 'Nashik', 'gokul'),
(8, 'Rutuja Malode', 'rutz03@gmail.com', '7747636367', 'Nashik', 'rutz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `camera_status`
--
ALTER TABLE `camera_status`
  ADD PRIMARY KEY (`location`);

--
-- Indexes for table `city_news`
--
ALTER TABLE `city_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crowd_status`
--
ALTER TABLE `crowd_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location` (`location`);

--
-- Indexes for table `findlog`
--
ALTER TABLE `findlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `missingpeople`
--
ALTER TABLE `missingpeople`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `police_helpline`
--
ALTER TABLE `police_helpline`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `helpline_no` (`helpline_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city_news`
--
ALTER TABLE `city_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `crowd_status`
--
ALTER TABLE `crowd_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1302;

--
-- AUTO_INCREMENT for table `findlog`
--
ALTER TABLE `findlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `missingpeople`
--
ALTER TABLE `missingpeople`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `police_helpline`
--
ALTER TABLE `police_helpline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
