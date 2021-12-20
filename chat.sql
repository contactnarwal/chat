-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2021 at 07:49 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_subject` varchar(255) DEFAULT NULL,
  `message_body` text NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `receiver_id` int(10) UNSIGNED NOT NULL,
  `conversation_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message_subject`, `message_body`, `sender_id`, `receiver_id`, `conversation_id`, `created_at`, `updated_at`, `viewed`) VALUES
(1, 'private Message', 'hi js fill', 1, 3, 'rZBOMg', '2021-12-20 08:18:20', '2021-12-20 08:18:20', NULL),
(2, 'private Message', 'hhow r u ', 3, 1, 'rZBOMg', '2021-12-20 08:18:45', '2021-12-20 08:18:45', NULL),
(3, 'private Message', 'i am fine', 1, 3, 'rZBOMg', '2021-12-20 08:18:52', '2021-12-20 08:18:52', NULL),
(4, 'private Message', 'hello gill sir ', 1, 3, 'rZBOMg', '2021-12-20 08:20:52', '2021-12-20 08:20:52', NULL),
(5, 'private Message', 'yes devender ', 3, 1, 'rZBOMg', '2021-12-20 08:21:03', '2021-12-20 08:21:03', NULL),
(6, 'private Message', 'hello jangsher singh gill', 1, 3, 'rZBOMg', '2021-12-20 08:25:46', '2021-12-20 08:25:46', NULL),
(7, 'private Message', 'hello devender narwal ', 1, 3, 'rZBOMg', '2021-12-20 08:25:58', '2021-12-20 08:25:58', NULL),
(8, 'private Message', 'hi', 1, 2, 'ZTac0B', '2021-12-20 08:26:28', '2021-12-20 08:26:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20170203112134-users-migration.js'),
('20170204111728-messages-migration.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `avatarPath` text DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `socketID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `avatarPath`, `isActive`, `socketID`) VALUES
(1, 'Devender Narwal', 'contactnarwal@gmail.com', '6d1d198d06c1154c687a3852e680c641', 'remember_token', '2021-12-20 18:18:12', '0000-00-00 00:00:00', '1.jpg', 1, '/chat#kOBpwR3VNJb_XqzWAAAD'),
(2, 'MMW', 'info@mmw.com', '6d1d198d06c1154c687a3852e680c641', 'remember_token', '2021-12-20 08:17:23', '0000-00-00 00:00:00', '2.jpg', 0, NULL),
(3, 'JS GIll', 'jangsher.gill@gmal.com', '6d1d198d06c1154c687a3852e680c641', 'remember_token', '2021-12-20 18:38:05', '0000-00-00 00:00:00', '3.jpg', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
