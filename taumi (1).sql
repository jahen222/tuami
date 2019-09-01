-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 30, 2019 at 04:31 AM
-- Server version: 5.6.43-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `email`, `mobile`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sid Jangra', 'sunderjangra789@gmail.com', '9254600789', '$2y$10$Fd2WbsF22hKDz.6Z1X32SOwCwRx/gkSu/9UgQXXKgDGq74XmNP5FO', NULL, '2018-10-07 01:15:44', '2018-10-07 01:15:44'),
(2, 'sid jangra', 'abc2@gmail.com', '1234567890', '$2y$10$iPktry4qDZ4jV9FAAuCd2urBBuoVOD87Mh4i7CVp1KWfOe8b3U8xO', 'tS9N2BOnNhS31RTSYMJBMTmkuIXMu0EXZrE4dx93ado0WrF2wzormLhaIPqi', '2018-10-07 03:06:12', '2018-10-08 23:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `account_password_resets`
--

CREATE TABLE `account_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_switches`
--

CREATE TABLE `account_switches` (
  `id` int(12) NOT NULL,
  `provider_id` varchar(12) DEFAULT NULL,
  `provider_service_type` varchar(222) DEFAULT NULL,
  `service_type_id` varchar(22) DEFAULT NULL,
  `major_service_type_id` varchar(22) DEFAULT NULL,
  `currency_id` varchar(12) DEFAULT NULL,
  `available_for_emergency` varchar(22) DEFAULT NULL,
  `available_to` varchar(222) DEFAULT NULL,
  `base_amount` varchar(222) DEFAULT NULL,
  `status` varchar(12) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_switches`
--

INSERT INTO `account_switches` (`id`, `provider_id`, `provider_service_type`, `service_type_id`, `major_service_type_id`, `currency_id`, `available_for_emergency`, `available_to`, `base_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'CARETAKER', '38, 41, 44, 39', '3', '35', 'YES', '0:0PM-11:59AM', '21', '0', '2018-10-16 00:13:01', '2018-10-16 00:13:01'),
(2, '2', 'CARETAKER', '37, 38, 39, 40, 42, 43', '3', '35', 'YES', '0:0PM-0:0PM', '20', '0', '2018-10-16 02:22:32', '2018-10-16 02:22:32'),
(3, '3', 'CARETAKER', '', '1', '34', 'NO', 'Over nights', '20', '0', '2018-10-16 12:07:52', '2018-10-16 12:07:52'),
(4, '4', 'CARETAKER', '', '1', '34', 'NO', 'Mon-Friday After 6pm, Weekends 3pm-9pm', '20', '0', '2018-10-16 12:18:17', '2018-10-16 12:18:17'),
(5, '5', 'CARETAKER', '', '3', '34', 'NO', 'Over nights', '20', '0', '2018-10-16 12:21:59', '2018-10-16 12:21:59'),
(6, '6', 'CARETAKER', '', '3', '34', 'NO', 'Saturdays PRN', '20', '0', '2018-10-16 12:30:44', '2018-10-16 12:30:44'),
(7, '7', 'CARETAKER', '', '3', '34', 'NO', 'Overnights ', '20', '0', '2018-10-16 12:42:34', '2018-10-16 12:42:34'),
(8, '8', 'CARETAKER', '', '3', '34', 'NO', 'Firday night, Overnight Weekends', '20', '0', '2018-10-16 12:48:38', '2018-10-16 12:48:38'),
(9, '9', 'CARETAKER', '', '3', '34', 'NO', 'Sunday-Fridays, No Saturdays', '20', '0', '2018-10-16 12:51:10', '2018-10-16 12:51:10'),
(10, '10', 'CARETAKER', '', '3', '34', 'YES', 'open', '20', '0', '2018-10-16 12:56:35', '2018-10-16 12:56:35'),
(11, '11', 'CARETAKER', '', '3', '34', 'NO', 'Week days, Mornings', '20', '0', '2018-10-16 13:07:46', '2018-10-16 13:07:46'),
(12, '12', 'CARETAKER', '', '3', '34', 'NO', 'Week days, Mornings', '20', '0', '2018-10-16 13:13:44', '2018-10-16 13:13:44'),
(13, '13', 'CARETAKER', '', '1', '34', 'YES', 'open', '20', '0', '2018-10-16 13:18:55', '2018-10-16 13:18:55'),
(14, '14', 'CARETAKER', '', '3', '34', 'NO', 'Mon-Fri 6am-10pm, Sat-Sun 6am-10pm', '20', '0', '2018-10-16 13:23:28', '2018-10-16 13:23:28'),
(15, '15', 'CARETAKER', '', '3', '34', 'YES', 'open', '20', '0', '2018-10-16 13:28:24', '2018-10-16 13:28:24'),
(16, '16', 'CARETAKER', '', '1', '34', 'YES', 'open , no early mornings', '20', '0', '2018-10-16 13:33:35', '2018-10-16 13:33:35'),
(17, '17', 'CARETAKER', '', '3', '34', 'YES', 'ompen, No Sundays', '20', '0', '2018-10-16 13:40:40', '2018-10-16 13:40:40'),
(18, '18', 'CARETAKER', '', '1', '34', 'YES', 'open', '20', '0', '2018-10-16 13:45:08', '2018-10-16 13:45:08'),
(19, '19', 'CARETAKER', '', '1', '34', 'NO', 'Saturday, Sunday', '20', '0', '2018-10-16 13:49:39', '2018-10-16 13:49:39'),
(20, '20', 'CARETAKER', '', '1', '34', 'NO', 'Monday-Friday', '20', '0', '2018-10-16 13:55:03', '2018-10-16 13:55:03'),
(21, '21', 'CARETAKER', '', '3', '34', 'NO', 'Monday-Friday', '20', '0', '2018-10-16 14:00:56', '2018-10-16 14:00:56'),
(22, '22', 'CARETAKER', '', '1', '34', 'NO', 'Overnights', '20', '0', '2018-10-16 14:05:46', '2018-10-16 14:05:46'),
(23, '23', 'CARETAKER', '', '1', '34', 'NO', '11pm-7am, Mon-Thur & everyother Friday', '20', '0', '2018-10-16 15:18:55', '2018-10-16 15:18:55'),
(24, '24', 'CARETAKER', '', '1', '34', 'NO', 'assigned specific client', '20', '0', '2018-10-16 15:28:11', '2018-10-16 15:28:11'),
(25, '25', 'CARETAKER', '', '1', '34', 'NO', 'senior care. Transportation', '20', '0', '2018-10-16 15:43:10', '2018-10-16 15:43:10'),
(26, '26', 'CARETAKER', '7 ,8 ,9 ,10 ,11 ,12 ,1', '1', '35', 'YES', '12am-12pm', '12', '0', '2018-10-17 02:59:34', '2018-10-17 02:59:34'),
(27, '27', 'CARETAKER', '22', '2', '35', 'YES', '7/7', '11.00', '0', '2018-10-17 21:59:20', '2018-10-17 21:59:20'),
(28, '28', 'CARETAKER', '7, 8', '1', '35', 'YES', '7:24AM-7:24PM', '200', '0', '2018-10-18 19:25:10', '2018-10-29 19:32:22'),
(29, '29', 'CAR', '20', '20', '35', 'YES', '8:00am to 8:00pm', '0', '0', '2018-10-19 06:30:01', '2018-10-19 06:30:01'),
(30, '30', 'CARETAKER', '7 ,8 ,9 ,10 ,11 ,12 ,1', '1', '35', 'YES', '6am-5pm', '11.00', '0', '2018-10-23 19:03:16', '2018-10-23 19:03:16'),
(31, '31', 'CARETAKER', '7 ,8 ,9 ,10 ,11 ,12 ,1', '1', '35', 'YES', '7am-7pm 7pm -7am ', '10', '0', '2018-10-24 09:41:25', '2018-10-24 09:41:25'),
(32, '28', 'AMBULANCE', '6', '6', '35', NULL, '3:21AM-7:21PM', '0', '0', '2018-10-29 15:21:35', '2018-10-29 19:37:49'),
(33, '28', 'CAR', '5', '5', '35', NULL, '4:1AM-8:1PM', '0', '0', '2018-10-29 16:01:23', '2018-10-29 18:58:43'),
(34, '32', 'CARETAKER', '57, 56, 65', '21', '35', 'YES', '4:15AM-8:15PM', '100', '0', '2018-10-30 16:16:15', '2018-10-30 16:16:15'),
(35, '33', 'CARETAKER', '8', '1', '35', 'NO', '06:35 PM-06:35 PM', '235', '0', '2018-10-31 16:35:59', '2018-10-31 16:35:59'),
(36, '34', 'CARETAKER', '15', '1', '35', 'YES', '07:01 AM-12:00 PM', '20', '0', '2018-11-07 22:32:35', '2018-11-07 22:32:35'),
(37, '35', 'CARETAKER', '27', '2', '35', 'NO', '08:17 PM-07:14 PM', '28000', '0', '2018-11-08 07:48:38', '2018-11-08 07:48:38'),
(38, '36', 'CARETAKER', '9 ,10 ,11 ,12', '1', '35', 'YES', '5pm - 10pm', '50/hour', '0', '2018-11-08 13:25:07', '2018-11-08 13:25:07'),
(39, '37', 'CARETAKER', '12', '1', '35', 'YES', '08:30 AM-04:19 PM', '15', '0', '2018-11-09 02:50:01', '2018-11-09 02:50:01'),
(40, '38', 'CARETAKER', '15', '1', '35', 'YES', '07:53 AM-09:49 AM', '15', '0', '2018-11-11 20:24:15', '2018-11-11 20:24:15'),
(41, '39', 'CARETAKER', '37, 38, 39, 40, 41, 42', '3', '35', 'YES', '0:0AM-11:59PM', '1', '0', '2018-11-13 03:08:32', '2018-11-13 03:08:32'),
(42, '40', 'CARETAKER', '37, 39, 40', '3', '35', 'YES', '0:32AM-8:32PM', '100', '0', '2018-11-13 12:33:00', '2018-11-13 12:33:00'),
(43, '41', 'CARETAKER', '9', '1', '35', 'NO', '04:45 PM-06:45 PM', '234', '0', '2018-11-13 14:46:07', '2018-11-13 14:46:07'),
(44, '42', 'CARETAKER', '14', '1', '35', 'YES', '11:08 AM-02:07 PM', '14', '0', '2018-11-13 21:38:31', '2018-11-13 21:38:31'),
(45, '43', 'CAR', '5', '5', '35', 'YES', '10:58AM-10:58PM', '0', '0', '2018-11-14 10:58:49', '2018-11-14 10:58:49'),
(46, '44', 'CAR', '5', '5', '35', 'YES', '6:50AM-11:50PM', '0', '0', '2018-11-14 18:51:15', '2018-11-14 18:51:15'),
(47, '45', 'CARETAKER', '12', '1', '35', 'YES', '11:43 PM-09:43 AM', '1', '0', '2018-11-14 22:13:52', '2018-11-14 22:13:52'),
(48, '46', 'CARETAKER', '8', '1', '35', 'NO', '02:17 PM-11:17 PM', '23', '0', '2018-11-15 13:18:21', '2018-11-15 13:18:21'),
(49, '47', 'CARETAKER', '37, 38, 39, 40, 41, 42', '3', '35', 'NO', '5:0PM-0:0AM', '14', '0', '2018-11-16 21:31:18', '2018-11-16 21:31:18'),
(50, '41', 'AMBULANCE', '6', '6', '35', NULL, '01:36 AM-03:36 AM', '', '0', '2018-11-19 00:36:51', '2018-11-19 00:36:51'),
(51, '48', 'CARETAKER', '27', '2', '35', 'NO', '6:0AM-6:0PM', '5', '0', '2018-11-19 19:40:33', '2018-11-19 19:40:33'),
(52, '49', 'CARETAKER', '9, 10, 11, 12, 8', '1', '35', 'YES', '10:0AM-10:0PM', '14', '0', '2018-11-21 08:40:15', '2018-11-21 08:40:15'),
(53, '50', 'CARETAKER', '7', '1', '35', 'NO', '07:09 PM-09:09 PM', '32', '0', '2018-11-22 17:11:18', '2018-12-02 19:19:41'),
(54, '51', 'CARETAKER', '7, 8', '1', '35', 'NO', '10:0AM-6:30PM', '12', '0', '2018-11-26 17:37:01', '2018-11-26 17:37:01'),
(55, '52', 'CARETAKER', '22', '2', '35', 'NO', '6:31AM-6:31PM', '11', '0', '2018-11-26 18:35:20', '2018-11-28 12:07:37'),
(56, '53', 'CARETAKER', '37, 38, 43', '3', '35', 'YES', '2:37AM-2:37PM', '20', '0', '2018-11-27 14:38:22', '2018-11-27 14:38:22'),
(57, '52', 'CAR', '5', '5', '35', NULL, '4:2AM-11:2PM', '0', '0', '2018-11-28 11:02:44', '2018-11-28 12:44:57'),
(58, '54', 'CARETAKER', '24, 26, 27, 29, 23', '2', '35', 'NO', '11:0AM-5:0PM', '16', '0', '2018-12-01 01:28:51', '2018-12-01 01:28:51'),
(59, '50', 'AMBULANCE', '6', '6', '35', NULL, '09:16 PM-09:16 PM', '', '0', '2018-12-02 19:16:54', '2018-12-02 19:52:36'),
(60, '55', 'CARETAKER', '7 ,8 ,9 ,10 ,11 ,12 ,1', '1', '35', 'NO', '7am-7am', '15.00', '0', '2018-12-10 05:05:54', '2018-12-10 05:05:54'),
(61, '56', 'CARETAKER', '27', '2', '35', 'YES', '6am-9pm', '$30.00/hr', '0', '2018-12-18 05:49:02', '2018-12-18 05:49:02'),
(62, '57', 'CARETAKER', '37, 41, 45', '3', '35', 'YES', '1:0PM-1:0AM', '12', '0', '2018-12-21 13:01:48', '2018-12-21 19:10:19'),
(63, '57', 'CAR', '5', '5', '35', NULL, '7:9AM-10:50PM', '0', '0', '2018-12-21 19:09:48', '2018-12-21 19:13:58'),
(64, '40', 'CAR', '5', '5', '35', NULL, '6:30AM-11:35PM', '0', '0', '2018-12-27 12:30:38', '2018-12-27 12:30:38'),
(65, '58', 'CARETAKER', '13', '13', '35', 'NO', '8:33AM-8:33PM', '200', '0', '2019-01-01 20:34:50', '2019-01-01 20:34:50'),
(66, '59', 'CARETAKER', '13', '13', '35', 'NO', '8:43AM-8:43PM', '200', '0', '2019-01-01 20:44:36', '2019-01-01 20:44:36'),
(67, '61', 'EDUCATION', '10', '10', '35', 'NO', '8:14AM-10:14PM', '1000', '0', '2019-01-01 21:15:42', '2019-01-01 21:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `picture`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'RideShare', 'admin@admin.com', '$2y$10$M6oPdgp1/mb/iXeI8L1qDeFinLEbHxGee3hQRR/PCgkoNAOURGY9a', NULL, 'eD18q20hzVacUH4qDy4h9ez08YaLl9p7EMD0VQjZ1Y4sSvjBImW2X9LnIvq3', NULL, '2019-07-29 22:57:17');

-- --------------------------------------------------------

--
-- Table structure for table `admin_faqs`
--

CREATE TABLE `admin_faqs` (
  `faq_id` int(11) NOT NULL,
  `question` longtext,
  `answer` longtext,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_faqs`
--

INSERT INTO `admin_faqs` (`faq_id`, `question`, `answer`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2018-06-08 03:09:14', '2018-06-08 03:09:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_helps`
--

CREATE TABLE `admin_helps` (
  `help_id` int(11) NOT NULL,
  `description` longtext,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_helps`
--

INSERT INTO `admin_helps` (`help_id`, `description`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, '<p><strong>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum .</strong></p>\r\n', '2018-06-08 03:12:06', '2018-06-08 03:12:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_terms`
--

CREATE TABLE `admin_terms` (
  `terms_id` int(11) NOT NULL,
  `description` longtext,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_terms`
--

INSERT INTO `admin_terms` (`terms_id`, `description`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\r\n', '2018-06-08 03:10:05', '2018-06-08 03:10:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api_test`
--

CREATE TABLE `api_test` (
  `id` int(12) NOT NULL,
  `api_name` varchar(122) NOT NULL,
  `api_hit` int(12) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_test`
--

INSERT INTO `api_test` (`id`, `api_name`, `api_hit`, `created_at`) VALUES
(1, 'trip?', 165193, '2018-09-15 07:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(8) NOT NULL,
  `provider_id` int(8) DEFAULT NULL,
  `account_name` varchar(222) DEFAULT NULL,
  `bank_name` varchar(222) DEFAULT NULL,
  `account_number` int(20) DEFAULT NULL,
  `routing_number` int(20) DEFAULT NULL,
  `country` varchar(222) DEFAULT NULL,
  `currency` varchar(22) DEFAULT NULL,
  `status` varchar(122) DEFAULT 'WAITING',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(12) NOT NULL,
  `title` text,
  `description` text,
  `image` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_four` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider_id` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `user_id`, `last_four`, `card_id`, `brand`, `is_default`, `created_at`, `updated_at`, `provider_id`) VALUES
(1, 14, '4242', 'card_1DOL3HE77TvJ1YcLug1BDj9Q', 'Visa', 1, '2018-10-23 13:45:51', '2018-12-27 13:10:54', NULL),
(2, 14, '4444', 'card_1DWH2YE77TvJ1YcLzkFGi8eu', 'MasterCard', 0, '2018-11-14 11:05:53', '2018-12-27 13:10:54', NULL),
(3, 35, '1111', 'card_1DYVLHE77TvJ1YcLcUQZFYXb', 'Visa', 0, '2018-11-20 14:46:26', '2018-11-21 12:38:41', NULL),
(4, 34, '1111', 'card_1DYrsGE77TvJ1YcL3T6GPKKR', 'Visa', 0, '2018-11-21 14:49:59', '2018-11-22 12:24:15', NULL),
(5, 41, '1111', 'card_1DZFs9E77TvJ1YcLgQynXL6Z', 'Visa', 1, '2018-11-22 16:27:28', '2018-11-22 16:27:28', NULL),
(6, 42, '4242', 'card_1DZGPKE77TvJ1YcL1iH9irAI', 'Visa', 0, '2018-11-22 17:01:45', '2018-11-22 19:34:02', NULL),
(7, 4, '4242', 'card_1DZJtjE77TvJ1YcLwO3lpKOx', 'Visa', 1, '2018-11-22 20:45:20', '2018-12-14 21:18:15', NULL),
(8, 43, '1111', 'card_1DZY2oE77TvJ1YcLEgrveBPS', 'Visa', 1, '2018-11-23 11:51:40', '2018-11-23 14:44:57', NULL),
(9, 44, '1111', 'card_1DZdLFE77TvJ1YcLIwYbIiCZ', 'Visa', 0, '2018-11-23 17:31:04', '2018-11-23 19:00:04', NULL),
(10, 45, '1111', 'card_1DahXQE77TvJ1YcLVntFZyWc', 'Visa', 0, '2018-11-26 16:12:03', '2018-11-30 19:50:53', NULL),
(11, 10, '4242', 'card_1DbNJ1E77TvJ1YcLtAHHaj7F', 'Visa', 1, '2018-11-28 12:48:00', '2018-11-28 12:48:00', NULL),
(12, 49, '4242', 'card_1DjPcaE77TvJ1YcL6gDoBUCg', 'Visa', 1, '2018-12-20 16:53:24', '2018-12-20 17:05:47', NULL),
(16, 0, '4242', 'card_1Dlb3aE77TvJ1YcL5bT5ZZhR', 'Visa', 1, '2018-12-26 17:30:17', '2018-12-26 21:20:47', 40),
(17, 58, '4242', 'card_1DmN4iE77TvJ1YcLrAaM95y0', 'Visa', 1, '2018-12-28 20:46:40', '2019-01-04 20:13:02', NULL),
(18, 62, '4242', 'card_1Dv73sE77TvJ1YcLd3pyTIuz', 'Visa', 1, '2019-01-22 06:29:56', '2019-01-22 06:29:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Grocery', '2019-05-13 13:34:44', '2019-07-19 00:01:56'),
(2, 'Food', '2019-05-13 13:34:12', '2019-05-13 13:34:12'),
(3, 'Medical', '2019-05-13 13:34:31', '2019-05-13 13:34:31'),
(5, 'Pharmacy', '2019-07-03 20:00:53', '2019-07-03 20:00:53'),
(6, 'Snack & Juice', '2019-07-08 22:36:12', '2019-07-08 22:36:12'),
(7, 'Gift', '2019-07-08 22:36:23', '2019-07-08 22:36:23');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('u_p','p_u') COLLATE utf8_unicode_ci NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `request_id`, `user_id`, `provider_id`, `message`, `type`, `delivered`, `created_at`, `updated_at`) VALUES
(1, '60@2', 60, 2, 'teste', 'u_p', 0, '2019-01-04 23:06:03', '2019-01-04 23:06:03'),
(2, '60@2', 60, 2, 'teste', 'u_p', 0, '2019-01-04 23:06:06', '2019-01-04 23:06:06'),
(3, '60@2', 60, 2, 'oi', 'u_p', 0, '2019-01-04 23:20:12', '2019-01-04 23:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `courier_details`
--

CREATE TABLE `courier_details` (
  `id` int(8) NOT NULL,
  `user_id` int(8) DEFAULT NULL,
  `service_type_id` int(6) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `item_height` int(5) DEFAULT NULL,
  `item_width` int(4) DEFAULT NULL,
  `item_weight` int(4) DEFAULT NULL,
  `item_quantity` int(4) DEFAULT NULL,
  `s_location` varchar(333) DEFAULT NULL,
  `s_latitude` varchar(333) DEFAULT NULL,
  `s_longitude` varchar(333) DEFAULT NULL,
  `pickup_info` varchar(3333) DEFAULT NULL,
  `d_location` varchar(333) DEFAULT NULL,
  `d_latitude` varchar(333) DEFAULT NULL,
  `d_longitude` varchar(333) DEFAULT NULL,
  `distance` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courier_details`
--

INSERT INTO `courier_details` (`id`, `user_id`, `service_type_id`, `status`, `item_height`, `item_width`, `item_weight`, `item_quantity`, `s_location`, `s_latitude`, `s_longitude`, `pickup_info`, `d_location`, `d_latitude`, `d_longitude`, `distance`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 0, 2, 2, 2, NULL, 'ss2', '3232', '232f', NULL, NULL, NULL, NULL, NULL, '2019-03-09 01:27:05', '2019-03-09 01:27:05'),
(2, 82, 2, 0, 2, 2, 2, NULL, 'da3', '3232', '232f', 'ss2', 'da3', '3232', '232f', NULL, '2019-03-09 01:34:23', '2019-03-09 01:34:23'),
(3, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.00', '2019-03-09 01:51:39', '2019-03-09 01:51:39'),
(4, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.00', '2019-03-09 01:52:09', '2019-03-09 01:52:09'),
(5, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.00', '2019-03-09 01:52:13', '2019-03-09 01:52:13'),
(6, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.00', '2019-03-09 01:53:24', '2019-03-09 01:53:24'),
(7, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.39', '2019-03-09 01:53:51', '2019-03-09 01:53:51'),
(8, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.39', '2019-03-09 01:54:09', '2019-03-09 01:54:09'),
(9, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.39', '2019-03-09 01:58:52', '2019-03-09 01:58:52'),
(10, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.39', '2019-03-09 01:59:01', '2019-03-09 01:59:01'),
(11, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.39', '2019-03-09 02:04:48', '2019-03-09 02:04:48'),
(12, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.39', '2019-03-09 02:04:51', '2019-03-09 02:04:51'),
(13, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.39', '2019-03-09 02:06:40', '2019-03-09 02:06:40'),
(14, 82, 2, 0, 2, 2, 2, NULL, 'da3', '28.5961279', '77.15873750000003', 'ss2', 'da3', '28.5355161', '77.39102649999995', '30.39', '2019-03-09 02:09:12', '2019-03-09 02:09:12'),
(15, 82, 46, 0, 1, 2, 1, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.5826698', '77.3156918', 'vdjdkkd', 'Bandh Road, Sector 125, Noida, Delhi 201303, India,null', '28.538913014545322', '77.33100514858961', '7.67', '2019-03-09 02:11:46', '2019-03-09 02:11:46'),
(16, 82, 46, 0, 1, 1, 2, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.5826686', '77.3156911', 'vzbxb', 'A-368, A Block, Sector 46, Noida, Uttar Pradesh 201303, India,null', '28.552386367971984', '77.36040551215412', '7.82', '2019-03-09 02:45:59', '2019-03-09 02:45:59'),
(17, 82, 47, 0, 1, 1, 1, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.5826682', '77.3156908', 'fjm', 'Gali Number 1, Palla Number 1, Chauhan Colony, Sector 91, Faridabad, Haryana 121009, India,null', '28.471604111077937', '77.32080269604921', '15.47', '2019-03-09 02:47:54', '2019-03-09 02:47:54'),
(18, 82, 46, 0, 1, 1, 1, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.5826689', '77.3156911', 'a', '14/5, Mathura Rd, Pocket B, Sector 27, Faridabad, Haryana 121003, India,null', '28.445965175142724', '77.30387359857559', '25.48', '2019-03-09 02:53:55', '2019-03-09 02:53:55'),
(19, 82, 46, 0, 1, 2, 3, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.5826697', '77.315691', '3', 'Badarpur Thermal Power Station, Badarpur, New Delhi, Delhi 110044, India,null', '28.503808292608337', '77.30706308037043', '13.63', '2019-03-09 03:05:48', '2019-03-09 03:05:48'),
(20, 82, 47, 0, 1, 4, 5, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.5826703', '77.3156915', 'vxbxb', 'Saket District Centre, District Centre, Sector 6, Pushp Vihar, New Delhi, Delhi 110017, India', '28.5280842', '77.2182409', '16.50', '2019-03-09 03:12:48', '2019-03-09 03:12:48'),
(21, 82, 47, 0, 1, 1, 1, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.582673', '77.3156911', 'ghd', 'Unnamed Road, New Delhi, Delhi 110076, India,null', '28.528965418545457', '77.30985224246979', '12.33', '2019-03-09 03:15:32', '2019-03-09 03:15:32'),
(22, 82, 47, 0, 1, 1, 1, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.5826709', '77.315692', 'fshxj', 'Feroze Shah Kotla, Vikram Nagar, New Delhi, Delhi 110002, India', '28.6379621', '77.24267069999999', '12.44', '2019-03-09 04:02:29', '2019-03-09 04:02:29'),
(23, 82, 47, 0, 12, 515, 7, NULL, 'D-34, D Block, Sector 2, Noida, Uttar Pradesh 201301, India\n', '28.5826704', '77.3156918', 'bzj', 'A-4-5, A Block, Sector 16, Noida, Uttar Pradesh 201301, India,null', '28.57945686083933', '77.31485389173031', '0.86', '2019-03-09 04:03:38', '2019-03-09 04:03:38'),
(24, 82, 46, 0, 1, 1, 1, NULL, 'Delhi Cantonment, New Delhi, Delhi, India', '28.596127900000003', '77.1587375', 'msg', 'Noida, Uttar Pradesh, India', '28.535516100000002', '77.3910265', '30.40', '2019-03-27 23:07:37', '2019-03-27 23:07:37'),
(25, 82, 46, 0, 1, 1, 1, NULL, 'Delhi Cantonment, New Delhi, Delhi, India', '28.596127900000003', '77.1587375', 'msg', 'Noida, Uttar Pradesh, India', '28.535516100000002', '77.3910265', '30.40', '2019-03-27 23:08:01', '2019-03-27 23:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `dispatchers`
--

CREATE TABLE `dispatchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dispatchers`
--

INSERT INTO `dispatchers` (`id`, `name`, `email`, `mobile`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Ajay Tiwari', 'ajay.tiwari@97pixels.com', '9015954994', '$2y$10$5GCPnvUqcA4E8Yv/cQUbO.myUuS3fM1ozv0W6mipdXlKEJoz/gCDe', NULL, '2018-10-23 11:36:11', '2018-10-23 11:36:11'),
(6, 'Javed', 'jawed@97pixels.com', '1234567890', '$2y$10$xUUmV/UFalzBStP3lmpCs.r8ol0NhUIFXMJZQX2dJlSmVdItG7GAu', NULL, '2018-10-23 11:38:05', '2018-10-23 11:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_password_resets`
--

CREATE TABLE `dispatcher_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('DRIVER','VEHICLE') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Driver\'s License', 'DRIVER', '2018-10-06 23:08:01', '2018-10-06 23:08:01'),
(2, 'Social Security Card', 'DRIVER', '2018-10-06 23:08:31', '2018-10-06 23:08:31'),
(3, 'Background Screening', 'DRIVER', '2018-10-06 23:08:48', '2018-10-06 23:08:48'),
(4, 'Certificate\'s ', 'VEHICLE', '2018-10-06 23:09:10', '2018-10-06 23:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `fleets`
--

CREATE TABLE `fleets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fleet_password_resets`
--

CREATE TABLE `fleet_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurances`
--

CREATE TABLE `insurances` (
  `insurance_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `price` bigint(11) DEFAULT '0',
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurances`
--

INSERT INTO `insurances` (`insurance_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(4, 'Self Pay', 20, '2018-07-27 20:07:27', '2018-11-19 17:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `item_requests`
--

CREATE TABLE `item_requests` (
  `id` int(7) NOT NULL,
  `booking_id` varchar(33) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `selling_item_id` int(6) DEFAULT NULL,
  `item_price` int(32) DEFAULT NULL,
  `quantity` int(4) DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '1',
  `request_status` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_requests`
--

INSERT INTO `item_requests` (`id`, `booking_id`, `user_id`, `selling_item_id`, `item_price`, `quantity`, `status`, `request_status`, `created_at`, `updated_at`) VALUES
(1, 'CC796666', 110, 8, 12, 1, 1, 1, '2019-07-11 19:43:10', '2019-07-11 19:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'servicetypes', 'MIN', 'Per Minute Pricing', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(2, 0, 'en', 'servicetypes', 'HOUR', 'Per Hour Pricing', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(3, 0, 'en', 'servicetypes', 'DISTANCE', 'Distance Pricing', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(4, 0, 'en', 'servicetypes', 'DISTANCEMIN', 'Distance and Per Minute Pricing', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(5, 0, 'en', 'servicetypes', 'DISTANCEHOUR', 'Distance and Per Hour Pricing', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(6, 0, 'en', 'api', 'user.incorrect_password', 'Incorrect Password', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(7, 0, 'en', 'api', 'user.password_updated', 'Password Updated', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(8, 0, 'en', 'api', 'user.location_updated', 'Location Updated', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(9, 0, 'en', 'api', 'user.profile_updated', 'Profile Updated', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(10, 0, 'en', 'api', 'user.user_not_found', 'User Not Found', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(11, 0, 'en', 'api', 'user.not_paid', 'User Not Paid', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(12, 0, 'en', 'api', 'ride.request_inprogress', 'Already Request in Progress', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(13, 0, 'en', 'api', 'ride.no_providers_found', 'No Drivers Found', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(14, 0, 'en', 'api', 'ride.request_cancelled', 'Your Ride Cancelled', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(15, 0, 'en', 'api', 'ride.already_cancelled', 'Already Ride Cancelled', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(16, 0, 'en', 'api', 'ride.already_onride', 'Already You are Onride', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(17, 0, 'en', 'api', 'ride.provider_rated', 'Driver Rated', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(18, 0, 'en', 'api', 'ride.request_scheduled', 'Ride Scheduled', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(19, 0, 'en', 'api', 'ride.request_already_scheduled', 'Ride Already Scheduled', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(20, 0, 'en', 'api', 'something_went_wrong', 'Something Went Wrong', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(21, 0, 'en', 'api', 'logout_success', 'Logged out Successfully', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(22, 0, 'en', 'api', 'services_not_found', 'Services Not Found', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(23, 0, 'en', 'api', 'promocode_applied', 'Promocode Applied', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(24, 0, 'en', 'api', 'promocode_expired', 'Promocode Expired', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(25, 0, 'en', 'api', 'promocode_already_in_user', 'Promocode Already in Use', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(26, 0, 'en', 'api', 'paid', 'Paid', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(27, 0, 'en', 'api', 'added_to_your_wallet', 'Added to your Wallet', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(28, 0, 'en', 'api', 'push.request_accepted', 'Your Ride Accepted by a Driver', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(29, 0, 'en', 'api', 'push.arrived', 'Driver Arrived at your Location', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(30, 0, 'en', 'api', 'push.incoming_request', 'New Incoming Ride', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(31, 0, 'en', 'api', 'push.added_money_to_wallet', ' Added to your Wallet', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(32, 0, 'en', 'api', 'push.charged_from_wallet', ' Charged from your Wallet', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(33, 0, 'en', 'api', 'push.document_verfied', 'Your Documents are verified, Now you are ready to Start your Business', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(34, 0, 'en', 'api', 'push.provider_not_available', 'Sorry for inconvience time, Our partner or busy. Please try after some time', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(35, 0, 'en', 'api', 'push.user_cancelled', 'User Cancelled the Ride', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(36, 0, 'en', 'api', 'push.provider_cancelled', 'Driver Cancelled the Ride', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(37, 0, 'en', 'api', 'push.schedule_start', 'Your schedule ride has been started', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(38, 0, 'en', 'user', 'profile.old_password', 'Old Password', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(39, 0, 'en', 'user', 'profile.password', 'Password', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(40, 0, 'en', 'user', 'profile.confirm_password', 'Confirm Password', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(41, 0, 'en', 'user', 'profile.first_name', 'First Name', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(42, 0, 'en', 'user', 'profile.last_name', 'Last Name', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(43, 0, 'en', 'user', 'profile.email', 'Email', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(44, 0, 'en', 'user', 'profile.mobile', 'Mobile', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(45, 0, 'en', 'user', 'profile.general_information', 'General Information', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(46, 0, 'en', 'user', 'profile.profile_picture', 'Profile Picture', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(47, 0, 'en', 'user', 'profile.wallet_balance', 'Wallet Balance', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(48, 0, 'en', 'user', 'profile.edit', 'Edit', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(49, 0, 'en', 'user', 'profile.save', 'Save', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(50, 0, 'en', 'user', 'profile.edit_information', 'Edit Information', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(51, 0, 'en', 'user', 'profile.change_password', 'Change Password', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(52, 0, 'en', 'user', 'profile.profile', 'Profile', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(53, 0, 'en', 'user', 'profile.logout', 'Logout', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(54, 0, 'en', 'user', 'profile.name', 'Name', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(55, 0, 'en', 'user', 'cash', 'CASH', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(56, 0, 'en', 'user', 'booking_id', 'Booking Id', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(57, 0, 'en', 'user', 'service_number', 'Car Number', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(58, 0, 'en', 'user', 'service_model', 'Car Model', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(59, 0, 'en', 'user', 'card.fullname', 'Full Name', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(60, 0, 'en', 'user', 'card.card_no', 'Card Number', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(61, 0, 'en', 'user', 'card.cvv', 'CVV', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(62, 0, 'en', 'user', 'card.add_card', 'Add Card', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(63, 0, 'en', 'user', 'card.delete', 'Delete', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(64, 0, 'en', 'user', 'card.month', 'Month', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(65, 0, 'en', 'user', 'card.year', 'Year', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(66, 0, 'en', 'user', 'card.default', 'Default', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(67, 0, 'en', 'user', 'fare_breakdown', 'FARE BREAKDOWN', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(68, 0, 'en', 'user', 'ride.finding_driver', 'Finding your Driver', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(69, 0, 'en', 'user', 'ride.accepted_ride', 'Accepted Your Ride', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(70, 0, 'en', 'user', 'ride.arrived_ride', 'Arrived At your Location', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(71, 0, 'en', 'user', 'ride.onride', 'Enjoy your Ride', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(72, 0, 'en', 'user', 'ride.waiting_payment', 'Waiting for Payment', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(73, 0, 'en', 'user', 'ride.rate_and_review', 'Rate and Review', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(74, 0, 'en', 'user', 'ride.ride_now', 'Ride Now', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(75, 0, 'en', 'user', 'ride.cancel_request', 'Cancel Request', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(76, 0, 'en', 'user', 'ride.ride_status', 'Ride Status', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(77, 0, 'en', 'user', 'ride.dropped_ride', 'Your Ride is Completed', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(78, 0, 'en', 'user', 'ride.ride_details', 'Ride Details', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(79, 0, 'en', 'user', 'ride.invoice', 'Invoice', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(80, 0, 'en', 'user', 'ride.base_price', 'Base Fare', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(81, 0, 'en', 'user', 'ride.tax_price', 'Tax Fare', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(82, 0, 'en', 'user', 'ride.distance_price', 'Distance Fare', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(83, 0, 'en', 'user', 'ride.comment', 'Comment', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(84, 0, 'en', 'user', 'ride.detection_wallet', 'Wallet Detection', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(85, 0, 'en', 'user', 'ride.rating', 'Rating', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(86, 0, 'en', 'user', 'ride.km', 'Kilometer', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(87, 0, 'en', 'user', 'ride.total', 'Total', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(88, 0, 'en', 'user', 'ride.amount_paid', 'Amount to be Paid', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(89, 0, 'en', 'user', 'ride.promotion_applied', 'Promotion Applied', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(90, 0, 'en', 'user', 'ride.request_inprogress', 'Ride Already in Progress', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(91, 0, 'en', 'user', 'ride.request_scheduled', 'Ride Already Scheduled on this time', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(92, 0, 'en', 'user', 'ride.cancel_reason', 'Cancel Reason', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(93, 0, 'en', 'user', 'dashboard', 'Dashboard', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(94, 0, 'en', 'user', 'payment', 'Payment', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(95, 0, 'en', 'user', 'wallet', 'Wallet', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(96, 0, 'en', 'user', 'my_wallet', 'My Wallet', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(97, 0, 'en', 'user', 'my_trips', 'Book a Trips', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(98, 0, 'en', 'user', 'in_your_wallet', 'in your wallet', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(99, 0, 'en', 'user', 'status', 'Status', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(100, 0, 'en', 'user', 'driver_name', 'Driver Name', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(101, 0, 'en', 'user', 'driver_rating', 'Driver Rating', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(102, 0, 'en', 'user', 'payment_mode', 'Payment Mode', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(103, 0, 'en', 'user', 'add_money', 'Add Money', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(104, 0, 'en', 'user', 'date', 'Date', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(105, 0, 'en', 'user', 'schedule_date', 'Scheduled Date', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(106, 0, 'en', 'user', 'amount', 'Total Amount', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(107, 0, 'en', 'user', 'type', 'Type', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(108, 0, 'en', 'user', 'time', 'Time', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(109, 0, 'en', 'user', 'request_id', 'Request ID', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(110, 0, 'en', 'user', 'paid_via', 'PAID VIA', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(111, 0, 'en', 'user', 'from', 'From', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(112, 0, 'en', 'user', 'total_distance', 'Total Distance', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(113, 0, 'en', 'user', 'eta', 'ETA', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(114, 0, 'en', 'user', 'to', 'To', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(115, 0, 'en', 'user', 'use_wallet_balance', 'Use Wallet Balance', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(116, 0, 'en', 'user', 'available_wallet_balance', 'Available Wallet Balance', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(117, 0, 'en', 'user', 'estimated_fare', 'Estimated Fare', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(118, 0, 'en', 'user', 'charged', 'CHARGED', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(119, 0, 'en', 'user', 'payment_method', 'Payment Methods', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(120, 0, 'en', 'user', 'promotion', 'Promotions', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(121, 0, 'en', 'user', 'add_promocode', 'Add Promocode', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(122, 0, 'en', 'user', 'upcoming_trips', 'Schedule Trips', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(123, 0, 'en', 'user', 'list_trip', 'My Trips', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(124, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(125, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(126, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(127, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(128, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(129, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(130, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(131, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(132, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(133, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(134, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(135, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(136, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(137, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(138, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(139, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(140, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(141, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(142, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(143, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(144, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(145, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(146, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2018-06-14 21:24:06', '2018-06-14 21:24:15'),
(147, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(148, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(149, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(150, 0, 'en', 'validation', 'filled', 'The :attribute field is required.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(151, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(152, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(153, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(154, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(155, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(156, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(157, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(158, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(159, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(160, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(161, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(162, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(163, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(164, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(165, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(166, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(167, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(168, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(169, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(170, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(171, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(172, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(173, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(174, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(175, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(176, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(177, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(178, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(179, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(180, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(181, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(182, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(183, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(184, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(185, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(186, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(187, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(188, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(189, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(190, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(191, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(192, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(193, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(194, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(195, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(196, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2018-06-14 21:24:07', '2018-06-14 21:24:15'),
(197, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2018-06-14 21:24:07', '2018-06-14 21:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `request_id` varchar(50) DEFAULT NULL,
  `provider_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `message` text,
  `from_to` enum('p_u','u_p') DEFAULT 'p_u' COMMENT 'p_u: Provider to User, u_p: User to Provider',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2015_08_25_172600_create_settings_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(8, '2016_06_01_000004_create_oauth_clients_table', 1),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(10, '2017_01_11_180503_create_admins_table', 1),
(11, '2017_01_11_180511_create_providers_table', 1),
(12, '2017_01_11_181312_create_cards_table', 1),
(13, '2017_01_11_181357_create_chats_table', 1),
(14, '2017_01_11_181558_create_promocodes_table', 1),
(15, '2017_01_11_182454_create_provider_documents_table', 1),
(16, '2017_01_11_182536_create_provider_services_table', 1),
(17, '2017_01_11_182649_create_user_requests_table', 1),
(18, '2017_01_11_182717_create_request_filters_table', 1),
(19, '2017_01_11_182738_create_service_types_table', 1),
(20, '2017_01_25_172422_create_documents_table', 1),
(21, '2017_01_31_122021_create_provider_devices_table', 1),
(22, '2017_02_02_192703_create_user_request_ratings_table', 1),
(23, '2017_02_06_080124_create_user_request_payments_table', 1),
(24, '2017_02_14_135859_create_provider_profiles_table', 1),
(25, '2017_02_21_131429_create_promocode_usages_table', 1),
(26, '2017_06_07_045207_add_social_login_to_providers_tables', 1),
(27, '2017_06_17_151030_create_dispatchers_table', 1),
(28, '2017_06_17_151031_create_dispatcher_password_resets_table', 1),
(29, '2017_06_17_151145_create_fleets_table', 1),
(30, '2017_06_17_151146_create_fleet_password_resets_table', 1),
(31, '2017_06_17_151150_add_fleet_to_providers_table', 1),
(32, '2017_06_19_130022_add_booking_id_to_user_request', 1),
(33, '2017_06_19_155736_add_cancel_reason_to_user_request', 1),
(34, '2017_06_20_154148_create_accounts_table', 1),
(35, '2017_06_20_154149_create_account_password_resets_table', 1),
(36, '2018_02_13_200425_create_country_state_city_tables', 2),
(37, '2018_11_19_114837_update_user_requests_table', 2),
(38, '2018_11_19_121725_add_column_request_proce_to_user_requests', 3),
(39, '2019_03_28_201044_create_categories_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('001f5d7829996df3b960b8879b3e282831fa977af31eb7b7d3e28ef594e37d00dc962ca09b0a4dba', 73, 2, NULL, '[]', 0, '2019-02-16 07:20:13', '2019-02-16 07:20:13', '2019-03-03 00:20:13'),
('00b957d0338e806ac6acd3710cd4b3b8b514519e05e7b8e28896c556c8d91c034de1af53d2bd8e0a', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:47', '2018-09-15 18:06:47', '2018-09-30 11:06:47'),
('00ce99a27b100edbd9d7f30f6d6263e532329d3e1c740850fced532dffc6ca249c30de35de72db63', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:07', '2018-09-15 18:08:07', '2018-09-30 11:08:07'),
('0183030c5fe3551dd320cb06687c6e2e2f980216af8a75b7ed7944b734741f5171e633a3659da871', 120, 2, NULL, '[]', 0, '2018-09-05 20:49:23', '2018-09-05 20:49:23', '2018-09-20 13:49:23'),
('01ceb34538e560f55512839ee0c1dbd4510ccbe08e5680c727ef1d73568875ec773a72d8aa83df26', 1, 2, NULL, '[]', 0, '2018-09-18 22:29:04', '2018-09-18 22:29:04', '2018-10-03 15:29:04'),
('01d4a85248e4ec0266c95433062cc0a40cc5dd5e46b17cf59372e9e412078847a095c33447bcce22', 14, 2, NULL, '[]', 0, '2018-11-22 19:28:37', '2018-11-22 19:28:37', '2018-12-07 19:28:37'),
('025507251af384b4cdabbf3860140d50207e22aafd1a8e6947c29384df7231ecde63e92a05cf9a05', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:42', '2018-09-15 18:06:42', '2018-09-30 11:06:42'),
('0281681404ae217d9a5642841b575712816ad04539661d7d6b55425fb0e666758aa748c4ea6d982f', 6, 2, NULL, '[]', 0, '2018-10-08 19:10:02', '2018-10-08 19:10:02', '2018-10-23 12:10:02'),
('02e7b0c28f49179707275b8c6838e22884f0ffcdd4ffe849d6c7d803f27817cd375b7fe3db96b9a1', 156, 2, NULL, '[]', 1, '2018-09-15 17:43:50', '2018-09-15 17:43:50', '2018-09-30 10:43:50'),
('02ecc814373830b5d59ec77f645b4e147b91385e7dab300e2e3176684b1fe8342f3d8439cb92ac70', 123, 1, 'socialLogin', '[]', 0, '2018-05-21 19:57:55', '2018-05-21 19:57:55', '2028-05-21 12:57:55'),
('02f479612f7fcaebb56c744eec41d74e1e1bca43dae0d1f59e0dce4cb216f46371868e5e7f046b07', 156, 2, NULL, '[]', 1, '2018-09-14 02:25:41', '2018-09-14 02:25:41', '2018-09-28 19:25:41'),
('02f9877ddce03d620285ce57da2f49f786c89b05aef466ddaba45aa6f825cdadc1103960b593435c', 120, 2, NULL, '[]', 0, '2018-09-15 17:32:14', '2018-09-15 17:32:14', '2018-09-30 10:32:14'),
('030ff2faa5bfd856bc1b95675698dc6370d6bd17f1290edc1ac473ccb9ac5ff0f0f72929e7c06f4a', 62, 2, NULL, '[]', 0, '2019-01-21 23:09:30', '2019-01-21 23:09:30', '2019-02-05 16:09:29'),
('03203ecc378945675bc01ce44822e2158249f7b7037363821b91ac1e52110f06456d67d56ed8bb21', 3, 1, 'socialLogin', '[]', 0, '2018-10-17 11:19:42', '2018-10-17 11:19:42', '2028-10-17 11:19:42'),
('03360177f7ac1b29cd8473cc8c6d87d696a401bea0ea9b7bbd80c1daa51ad2bec7b720c9224baabb', 1, 2, NULL, '[]', 0, '2018-09-16 02:55:06', '2018-09-16 02:55:06', '2018-09-30 19:55:05'),
('0348162db90d13eaadf6a94338837e92b71fe10aac18cf59a0100a9482970365f33c0788ba56427f', 14, 2, NULL, '[]', 0, '2018-12-26 15:56:18', '2018-12-26 15:56:18', '2019-01-10 15:56:18'),
('0381e14f1a15eaf708ef5801de12a3df83101a901c2fd497705f07cdb140d321286478343d001c10', 45, 2, NULL, '[]', 0, '2018-11-30 17:31:37', '2018-11-30 17:31:37', '2018-12-15 17:31:37'),
('04303b41d39696e55e6544b4a0947b1e9e6979fa78bbb4b1449d78c4492ddf64228c92c08f0fbfbc', 1, 2, NULL, '[]', 1, '2018-09-15 22:49:37', '2018-09-15 22:49:37', '2018-09-30 15:49:37'),
('043bb6e5948df4bd0abf4e6b31744b367ea01a6d4666bc194265b7da898f2f5fb87aa859314a2cdb', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:57', '2018-09-15 18:03:57', '2018-09-30 11:03:57'),
('04472db7d6d3588a3f67e5e3d5bd15a71f67ad438db373d7d4bd571b413158e5fff1391f56baacbe', 18, 2, NULL, '[]', 0, '2018-09-20 04:33:20', '2018-09-20 04:33:20', '2018-10-04 21:33:19'),
('0471c1bb9162e9368bed604e14d1fef55ee4e8b6f2111e16175ad9caf6c9d45e13c005a8dcb9f4c2', 20, 2, NULL, '[]', 0, '2018-09-20 19:20:54', '2018-09-20 19:20:54', '2018-10-05 12:20:54'),
('048995b356d0107bc573decbb96340ea6ce48c6cd68609346e092184407bd57301e328220eb51d9c', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:43', '2018-09-15 17:50:43', '2018-09-30 10:50:43'),
('0493b389e0f3d9fabc36b1570881f526ad2df0cccb287a997ce77cc50bada2646409cd90218cf11d', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:58', '2018-09-15 17:51:58', '2018-09-30 10:51:57'),
('04aa860cdc298488826409e2644ab1c5c40d0b937e00ae1b2430ed8af35232d19e186d69f7e4414c', 23, 1, 'socialLogin', '[]', 0, '2018-10-24 15:01:45', '2018-10-24 15:01:45', '2028-10-24 15:01:45'),
('04ded0904a37bf88514c25db0174212bab2f132ae0ef631709e37d4949e2c2b50fd2dd68b4c2092e', 82, 2, NULL, '[]', 0, '2019-03-28 19:09:27', '2019-03-28 19:09:27', '2019-04-12 12:09:27'),
('04e68b57140b0ca092d61a2f5c1a680a13f45496f7ddb4b4bde1beff05a34bd0d334adc6b21c487f', 120, 2, NULL, '[]', 0, '2018-09-01 23:21:47', '2018-09-01 23:21:47', '2018-09-16 16:21:47'),
('054002d6ff33d78ffd1ab2c3668f9c04434875fb3e9738e20585c238174255664997b699522a3ef1', 4, 2, NULL, '[]', 0, '2018-10-05 21:38:31', '2018-10-05 21:38:31', '2018-10-20 14:38:30'),
('054cdfebd03af5ada8bcb22e3f6a9b2599221f4943c9b5933f94ece177c9239372adc49d8ea4210f', 2, 2, NULL, '[]', 0, '2018-10-09 19:54:25', '2018-10-09 19:54:25', '2018-10-24 12:54:25'),
('055cfa948bd3ea5ffc864e856a52a3fa4f6124d952d5d954467a9f0914e0e4328a0cbb8e217a092c', 1, 2, NULL, '[]', 1, '2018-09-16 00:27:20', '2018-09-16 00:27:20', '2018-09-30 17:27:20'),
('0569eb7b4f839d611e827080ce761e1894183af5158f4ea25ad52ff7b5e3d2863c553fc05f1460ad', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:05', '2018-07-20 23:22:05', '2018-08-04 16:22:04'),
('05dfaeaa6e6ab1ef912d9b137b20ee4811dd6e34e63c6e684558cb5fa3998336039f241a78ac6537', 34, 2, NULL, '[]', 0, '2018-10-31 15:13:50', '2018-10-31 15:13:50', '2018-11-15 15:13:50'),
('05ffa2303e8a3340f062086081e806407732bcf552f0dbff20627fbeb439b5c7e0a5bbc0ea15a12e', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:43', '2018-09-15 17:49:43', '2018-09-30 10:49:43'),
('06726f2c23854a4c537aa53b19a8d89eea21f86e0b9970b2635c0a62988eaf9e15ba4da6052565fb', 4, 2, NULL, '[]', 0, '2018-10-03 21:55:07', '2018-10-03 21:55:07', '2018-10-18 14:55:07'),
('069a1667435d2b24c181bec35b8512f8f7ca2356a60617053c787ae73ab12d65d5b5fdb2452716b3', 84, 2, NULL, '[]', 0, '2019-05-10 06:03:58', '2019-05-10 06:03:58', '2019-05-24 23:03:58'),
('069c5c25f503e7f19faefffd3c0f3cc1c43f2a7faf7e9fd1e243f736af9f398a62a73a493046ceb3', 83, 2, NULL, '[]', 0, '2019-06-11 17:03:32', '2019-06-11 17:03:32', '2019-06-26 10:03:32'),
('06b8b532b617067ab185be2f095e83a59d23e391ac3601be13a7040b1b504e3e00517923538dd841', 14, 2, NULL, '[]', 0, '2018-10-29 13:06:36', '2018-10-29 13:06:36', '2018-11-13 13:06:36'),
('06d01bc19f692044a8951528389f0bc643c859dfca504f63f661d96fbc17c337f874a3decb3ffe8c', 132, 2, NULL, '[]', 0, '2018-06-14 21:55:01', '2018-06-14 21:55:01', '2018-06-29 14:55:01'),
('06e918526fd0f1f02e7b4b7ba2961896410c7a766775eaae723695f51e79b2132d310a04b05b129e', 144, 2, NULL, '[]', 0, '2018-09-15 22:58:37', '2018-09-15 22:58:37', '2018-09-30 15:58:37'),
('071ddc4658d1211a33cf903f07b5c7434e13e91ed3efaf38b8f2f2f27555a066f174503234dffacc', 156, 2, NULL, '[]', 1, '2018-09-14 02:26:32', '2018-09-14 02:26:32', '2018-09-28 19:26:31'),
('07339d58eae3604ce3152576ab1996deff4a50ddb7eb96afb1dcacc1495cd815006b3bcaa3c88656', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:28', '2018-09-15 17:56:28', '2018-09-30 10:56:28'),
('075b40bc2a9abbfdec000386ca00b011c198143ec656f0a98d795d0f3ba7f29ab2c63aafe46f1ae5', 156, 2, NULL, '[]', 1, '2018-09-14 06:11:00', '2018-09-14 06:11:00', '2018-09-28 23:11:00'),
('0766a555007af545611046641e62e65cbc36ce7b7e6f223d5ed231c24fc9e95eb6888cfe7bd7499d', 27, 1, 'socialLogin', '[]', 0, '2019-01-05 15:14:12', '2019-01-05 15:14:12', '2029-01-05 15:14:12'),
('079e8645ee29a677928bf6b4b8bd99b80f27eb2aede5703e7efa227e337899994105d25859dba3bb', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:23', '2018-09-15 17:57:23', '2018-09-30 10:57:23'),
('07b310a43957ca99851ade9127acce757fd62f1ff3ecee6d2f10aba467e4b99ba066415ef3f2df1f', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:40', '2018-08-10 23:12:40', '2018-08-25 16:12:40'),
('07d79c5764f703d39163c7fb1d15b335179c4a64c5bd60d7f3b26ce87f8008fc4a84811d849083cf', 73, 2, NULL, '[]', 0, '2019-02-14 20:45:29', '2019-02-14 20:45:29', '2019-03-01 13:45:29'),
('07da74a1a369eb86afe7bf056f1b2ff5cc3af6aba56590c687f92cdb5d02d8f8c34c78064577691c', 106, 2, NULL, '[]', 0, '2019-07-03 23:45:51', '2019-07-03 23:45:51', '2019-07-18 16:45:51'),
('0811e8546c0823c49d07a7a9f11cc32192f15f078d3aa8f4d50421e5fb9ce3b1d7dec366641797cf', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:57', '2018-09-15 17:59:57', '2018-09-30 10:59:57'),
('0852d525fff875bdd52728dec8ee19354041961c0d8afe7850f36ae406343cbdcb9cca0353b62442', 108, 2, NULL, '[]', 0, '2019-07-20 01:33:16', '2019-07-20 01:33:16', '2019-08-03 18:33:15'),
('085878e587312ebf0d016fc6ecf767aa6caf234e29c94adbcf7db5c99ef77625ef17c5326f88ada6', 14, 2, NULL, '[]', 0, '2018-12-10 17:06:29', '2018-12-10 17:06:29', '2018-12-25 17:06:29'),
('089423fa697418d235ff58ab3e7a7c42a09bce65c44918ecaa3afce8168ea155cae477ff4e3eac02', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:02', '2018-09-15 18:09:02', '2018-09-30 11:09:02'),
('089a555382baab0cab0f87f887d19bcac4195231054ed7117e1c6c16f1c249b255aa3e9f43e1d475', 14, 2, NULL, '[]', 0, '2018-09-25 00:40:28', '2018-09-25 00:40:28', '2018-10-09 17:40:28'),
('08a79e330a999e69018ab9dd8fb2682c88cb1b7d7ac2c750d0654fc541c2e9b7024163fa14451723', 150, 2, NULL, '[]', 0, '2018-08-10 23:45:00', '2018-08-10 23:45:00', '2018-08-25 16:45:00'),
('08a90bd6cd3d155c70dea4a396a6b04a3b4f1844a5f8527b46bf62343b481c92476d34b9b75a5630', 24, 1, 'socialLogin', '[]', 0, '2018-10-24 15:12:59', '2018-10-24 15:12:59', '2028-10-24 15:12:59'),
('08afe9180986503bf7632d61b7c07ef643032ab20ebd5807bf8024fa08ed9a72018cf0cdf44ad4ef', 77, 2, NULL, '[]', 0, '2019-02-06 23:23:52', '2019-02-06 23:23:52', '2019-02-21 16:23:52'),
('08c9af7e116fae335c487bd45bcd3cc6aee7c56a79533d93ab0c89147e168497d9a41df5ccf98f39', 138, 2, NULL, '[]', 0, '2018-06-06 22:08:02', '2018-06-06 22:08:02', '2018-06-21 15:08:02'),
('08dbb5cdb0fa02f6805e51665bb246962d29b81d568e90efe343e1d90273b5af027d2f3bbdb59a06', 2, 1, 'socialLogin', '[]', 0, '2018-09-15 22:46:28', '2018-09-15 22:46:28', '2028-09-15 15:46:28'),
('096bbaa0e02ce37fc668f05c39bda66b26c8b13c34630239622c996960eeb930c65b169640a91ab8', 144, 2, NULL, '[]', 0, '2018-07-25 18:53:11', '2018-07-25 18:53:11', '2018-08-09 11:53:11'),
('09825d595ff11f894a4ee0338af83baa280215dcf70ef7c043da98d0b6a201d0a622fc49e79bf442', 1, 2, NULL, '[]', 0, '2018-09-18 18:21:42', '2018-09-18 18:21:42', '2018-10-03 11:21:42'),
('09895d35d7f58fbdf77c6fec67075de9fcd4eef3b7a776be604645078b1fa9822cbad7e67a7b7b9e', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:57', '2018-09-15 17:55:57', '2018-09-30 10:55:57'),
('09928f4894f9034d6b706f44a8aa5410969777a237294bd51587afe34bbda8cee3f38404d31e6ac3', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:12', '2018-09-15 18:03:12', '2018-09-30 11:03:12'),
('0993049b120d07c26325dd0833fb9896a93715524f9eb4835bc6040eff9f5955a072061c4534c895', 82, 2, NULL, '[]', 0, '2019-04-10 00:50:23', '2019-04-10 00:50:23', '2019-04-24 17:50:23'),
('099fc8440a68af694e869d063430b3dbc8f656b3abe08e94820ef1484e77705f31db472e42d4ff74', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:03', '2018-09-15 17:45:03', '2018-09-30 10:45:03'),
('09cf37d0f2bc7c3a2a905458cf1953bbd7be3a25d019cb1b271524c1f83b0a25602eefbe18415f5f', 25, 1, 'socialLogin', '[]', 0, '2018-10-25 15:22:46', '2018-10-25 15:22:46', '2028-10-25 15:22:46'),
('09d7d97de9c90a5bbd6e8b206eed842c1906142b603f35b7002560f22824ae4e736869b2e7bc3a79', 86, 2, NULL, '[]', 0, '2019-06-18 02:47:20', '2019-06-18 02:47:20', '2019-07-02 19:47:19'),
('09e325330ef329b6427b65c4914162689b778251ffebad0ae590fd3ba0e99d25c27e1309991e1c31', 84, 2, NULL, '[]', 0, '2019-06-25 08:59:51', '2019-06-25 08:59:51', '2019-07-10 01:59:51'),
('0a1367ff850836ceda55085aae4860c3b51f5da48310f29d71d9d3bde7f362d5a7aae575d65b5ebc', 4, 2, NULL, '[]', 1, '2018-09-16 06:48:22', '2018-09-16 06:48:22', '2018-09-30 23:48:21'),
('0a3cb1cb4ae28370755945adfc0652fa5d12391d7f9a480adfa0ce1599e09148dece4a6de60a13e4', 86, 2, NULL, '[]', 0, '2019-06-11 21:35:34', '2019-06-11 21:35:34', '2019-06-26 14:35:34'),
('0a9275bd3ca9daf76b0532cc535704823b11317c40d5baf7746edd44083b1e9fc74efc16b85817ee', 5, 2, NULL, '[]', 0, '2018-10-07 00:21:20', '2018-10-07 00:21:20', '2018-10-21 17:21:20'),
('0a955ef5db893e2db631508eaa5a22d9a95611dd2fcdc60997d18885c54f9a2ecc0fa1112ac2273d', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:27', '2018-09-15 17:58:27', '2018-09-30 10:58:27'),
('0a99ac3d9e017ae198277b79684103daaf0b8444459153a96fa6546b1240338435b20b01d0ebf193', 14, 2, NULL, '[]', 0, '2018-09-25 00:35:08', '2018-09-25 00:35:08', '2018-10-09 17:35:08'),
('0a9e9cd719afa430d492f39a79d5a0771e9a36c171a406c6142fd6a6c285cc0891a273f0a869cf1e', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:23', '2018-09-15 17:50:23', '2018-09-30 10:50:23'),
('0ac1e9b24b9558928bd39f507ad2fa3a8ffa1e2fee722c4ae06388d55b9a2ecfc23822701e7b3888', 4, 2, NULL, '[]', 0, '2018-10-04 21:55:18', '2018-10-04 21:55:18', '2018-10-19 14:55:17'),
('0ae053585e4ecf5dbe61af42d22a9304c36a91283e8079b0f6825f02e61611e774c3b45ff7a2780d', 82, 2, NULL, '[]', 0, '2019-03-29 19:26:37', '2019-03-29 19:26:37', '2019-04-13 12:26:37'),
('0afccab79c480df1f70cb480da15b2bba5e584d327f653885d026c3099ebc6853776a2deb49da370', 62, 2, NULL, '[]', 0, '2019-02-05 22:14:28', '2019-02-05 22:14:28', '2019-02-20 15:14:28'),
('0b2a49e2f950fcb9a2890c40f4c20ef7d4f2edb9683db1c11fddb25cabc1bf9a23bb8ade067c6e6f', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:42', '2018-09-15 17:54:42', '2018-09-30 10:54:42'),
('0b39a93d14762f8f68baf9a3682e26eb3964039fda1c4c8d3073ca1b52bfba19f7925d188badfaad', 56, 2, NULL, '[]', 0, '2018-12-26 20:29:43', '2018-12-26 20:29:43', '2019-01-10 20:29:43'),
('0b51be1d682614590af28ba1fd863fcd79eb6aa7c7fd44dfc7062694628df843b15cc7d501441173', 17, 1, 'Personal Access Token', '[]', 0, '2019-04-16 02:40:39', '2019-04-16 02:40:39', '2029-04-15 19:40:39'),
('0b523262ea677f23b278d6d3a700d7680e8c54f3546da5ba8c9c864eda26cca4971255dd7bc1e19e', 9, 1, 'socialLogin', '[]', 0, '2018-10-09 17:59:43', '2018-10-09 17:59:43', '2028-10-09 10:59:43'),
('0bf1e907afc952625ebdb820287aa4abbf4f830dcd26d7e517aac3c0890e2097f70c78132e88e9da', 113, 2, NULL, '[]', 0, '2018-01-25 23:01:14', '2018-01-25 23:01:14', '2018-02-09 16:01:14'),
('0c11810c5de5e1f726f20e283eb2bab2da07f543e906562851db996faacf98cb22257127d2cf1af5', 14, 2, NULL, '[]', 0, '2018-11-20 10:29:55', '2018-11-20 10:29:55', '2018-12-05 10:29:55'),
('0c1be1a42cd95011f049fd60c43b0b6b01a425541540ede9da620c005225930664e5c715bae537b4', 73, 2, NULL, '[]', 0, '2019-02-14 20:53:02', '2019-02-14 20:53:02', '2019-03-01 13:53:02'),
('0c42b2c2a1b87179bec96d00be08b5bd29b073eedba77a2f0c71ee197f16bbcceee7124bab68a943', 86, 2, NULL, '[]', 0, '2019-06-11 01:53:03', '2019-06-11 01:53:03', '2019-06-25 18:53:03'),
('0c6512373bb7baf23c378265ad87fc9bfa28e5aae863d835953e4766f981db83d4ef9c7e9b2aea89', 146, 2, NULL, '[]', 0, '2018-08-01 01:43:22', '2018-08-01 01:43:22', '2018-08-15 18:43:21'),
('0c6a1dbc1cef7d1ef3d74a7e799885fa49037b72e588eabba57ba2797f71427673b7365e696f8faf', 120, 2, NULL, '[]', 0, '2018-08-31 20:51:33', '2018-08-31 20:51:33', '2018-09-15 13:51:32'),
('0c9e597407e3348b5f88c8b353ef387f7dea8fc31a6d387259ff4fedbccd7584e968b37aeac0a388', 156, 2, NULL, '[]', 1, '2018-09-13 23:09:59', '2018-09-13 23:09:59', '2018-09-28 16:09:59'),
('0c9efa0082748052ba8ef74e17c9f7f956ee68500b97bd1b65f5fe22161c3456239e4829047f7a60', 14, 2, NULL, '[]', 0, '2018-11-19 15:44:58', '2018-11-19 15:44:58', '2018-12-04 15:44:58'),
('0cabf5e5e4c5844af4df1a6bcd1b6addcb78e5f11208596c4a4664198ad0a0043bef6f0c849468ec', 14, 2, NULL, '[]', 0, '2018-11-13 17:00:02', '2018-11-13 17:00:02', '2018-11-28 17:00:02'),
('0ceaecf4dd26c417d0ebb84b5da8509ad26b763010e173b6ffaeb27eab01a2dd3778668128f69e15', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:17', '2018-09-15 17:56:17', '2018-09-30 10:56:17'),
('0d00836f4d333ce3216693cca8131caab7b6c555cbf5f5e3769e740a158f131d31918053ef1791ec', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:42', '2018-09-15 18:07:42', '2018-09-30 11:07:42'),
('0d42cadd92953e9fb45bcd12f8b45c35d9f59a07c8530c72db036840ac1b2a35f67f3ea9fff53c65', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:04', '2018-09-15 18:00:04', '2018-09-30 11:00:04'),
('0d6cabbb0757a07b24498cf647cd7e8fd95a44751484e09fa65ebf5c7091a82fa2364183d77b5117', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:26', '2018-07-20 23:22:26', '2018-08-04 16:22:26'),
('0e4b32b1b35d747ce62de5e9b57543b08e8c29c678cce9ce72d8b9f18caffc7d5088bddabc9e9e52', 7, 1, 'socialLogin', '[]', 0, '2018-10-17 17:39:59', '2018-10-17 17:39:59', '2028-10-17 17:39:59'),
('0e6fe18278e1ee2e70343f3c79c7a0084902c41f49f090b01592181e41aaf722be21187e6b959164', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:53', '2018-09-15 17:45:53', '2018-09-30 10:45:53'),
('0e701943fc0c258ff40f3151efbd1f89b46ab43107c7bfb30a7b26006e1da5bd11a03edcc883f94f', 7, 1, 'Personal Access Token', '[]', 0, '2019-07-09 19:02:14', '2019-07-09 19:02:14', '2029-07-09 12:02:14'),
('0e9eda5fdbb516d419ffb4363a2d2af6b6cf416813bcae6e174b0a21588bea2bea7aa8a87d03d2cf', 14, 2, NULL, '[]', 0, '2019-01-15 01:44:55', '2019-01-15 01:44:55', '2019-01-29 18:44:55'),
('0e9f61b1d857dd6d2b9b5ff9b85dacfbaf328203cdd075e0f121b7d570b356b6a796c7c9f6abcf3e', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:15', '2018-07-20 23:22:15', '2018-08-04 16:22:15'),
('0f01b17140f4a5c0928df2b7799a31f8cd34e04d3f4b2bede205965008bce456dfcb4aa52407045f', 79, 2, NULL, '[]', 0, '2019-03-06 23:55:43', '2019-03-06 23:55:43', '2019-03-21 16:55:43'),
('0f1237400ee23f9fd940e6f6983d33ad21c3d588ca5860513266b0893c4396e6777f48ae2906d0b7', 5, 2, NULL, '[]', 0, '2018-10-10 13:00:39', '2018-10-10 13:00:39', '2018-10-25 13:00:39'),
('0f35e27843c73edcc07a7df1450a82a2b9e75fd4ea92363fc1c09a36fd7c533d6e7fc242ac748cab', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:18', '2018-09-15 18:02:18', '2018-09-30 11:02:17'),
('0f565594cb190a2e12301f7d6f1b55d3b706810beef67daafc356a38c63c3d430713ff23d0e8f8f8', 4, 2, NULL, '[]', 1, '2018-09-16 06:30:55', '2018-09-16 06:30:55', '2018-09-30 23:30:55'),
('0f5d0420d8ed75a2e72296051e34fea0a6a1024e8ce0cf3342fc0ee9218b7cc314ebe4d3c11e239f', 134, 2, NULL, '[]', 0, '2018-05-29 18:04:38', '2018-05-29 18:04:38', '2018-06-13 11:04:38'),
('0f730a92ad796ef0853c6433c279de475d7d4ed0e0446d6f41eb0212e5fa96214ae59d952361368c', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:07', '2018-09-15 17:49:07', '2018-09-30 10:49:07'),
('0f88dff5b1b8a937983d9c80ad550a7cac0042957f38aeee287cb981ec71c5f67902f3e999155b36', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:42', '2018-09-15 17:56:42', '2018-09-30 10:56:42'),
('0f927e7c6bd0e058fe7cb1b19c0180165bc3cb4e126c85de8ab256854c9ddcaa4775d5d0be487c41', 1, 1, 'Personal Access Token', '[]', 0, '2019-03-29 23:05:28', '2019-03-29 23:05:28', '2029-03-29 16:05:28'),
('0fc45fa2cd88236a6f265491ce139b74c41db32c71c840e17e8db80885711fdb4a94846640da7522', 1, 2, NULL, '[]', 1, '2018-09-15 21:46:53', '2018-09-15 21:46:53', '2018-09-30 14:46:53'),
('102d5af92c9d0681efa18d284047d4f220407de12ae51ed37723cb9550c998eeb245e6fca60e6006', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:07', '2018-09-15 18:04:07', '2018-09-30 11:04:07'),
('104d49386e25110514df5416f6eb1a1eff648ceb52f547a70e92c61a03aeddb7b59df0be4e5e6eca', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:22', '2018-09-15 17:51:22', '2018-09-30 10:51:22'),
('10511f2c3d328a9d69d11b3f40cf3147dc2eaec4eff7c4daa9c951b4c30ee9752562dffede10a30f', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:17', '2018-09-15 17:53:17', '2018-09-30 10:53:17'),
('107cfd5c52903e490c6c6d5f1c242cafcccf383a5a7703b2b34229adf76342a23ba7232a00b10459', 47, 2, NULL, '[]', 0, '2018-12-10 04:51:42', '2018-12-10 04:51:42', '2018-12-25 04:51:42'),
('10e1d3a6517845b4b77769102b251f1e30d5f8c82f29988702e29766077cb6db56d1bcc939574038', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:28', '2018-09-15 17:53:28', '2018-09-30 10:53:28'),
('10e734c883a74da4920c0c7b14fa50355711ce3db7089eaa1f9b532d9166d0a72191c73b8e4fc6ce', 5, 2, NULL, '[]', 0, '2018-10-09 21:55:35', '2018-10-09 21:55:35', '2018-10-24 14:55:35'),
('11187599e91e552f4d01aecdd116a01f657f6f9174ee6231e83016f32694534b36e0c02b6c407a26', 4, 2, NULL, '[]', 1, '2018-09-16 06:54:24', '2018-09-16 06:54:24', '2018-09-30 23:54:24'),
('1162b4bf97cfc43a0e42316454daa6102109c20bef84ba9cc96212074275625a7a388d478bbd3182', 136, 2, NULL, '[]', 0, '2018-05-30 18:04:24', '2018-05-30 18:04:24', '2018-06-14 11:04:24'),
('11721df792ce828d67afdb64a7df0df43177ffb2ea16db2ff5134b0d732ae2051382aaed3c8b2157', 14, 2, NULL, '[]', 0, '2018-09-21 01:11:23', '2018-09-21 01:11:23', '2018-10-05 18:11:23'),
('11853038ba54bd4576c73fdc1b390ab609e9e58f120a670b86f268e881273747421caf679b5e972b', 5, 2, NULL, '[]', 0, '2018-10-09 02:13:08', '2018-10-09 02:13:08', '2018-10-23 19:13:08'),
('12244f0e07e473e4f65acb02cfabc83f81263e34216058ab46c8661599ab3eb279d5a1f361e0a98f', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:52', '2018-09-15 18:03:52', '2018-09-30 11:03:52'),
('12aa05ba61de78e5ce4d47ae71f5285d40f3db632a6c1388e4d67f5879bd0aad6b656358ca741658', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:14', '2018-09-15 18:01:14', '2018-09-30 11:01:14'),
('12f4aba5c98ad24a31a7a9fddaf2b73015b625cd95bd1b6e0f30156d65d1ba88acce010290f2a4eb', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:18', '2018-07-20 23:22:18', '2018-08-04 16:22:18'),
('130356813cd9e138e4e6fc686c12a0119d6f1ced72c530d34a48351ba23fb87d06b9a20427a7d2cd', 5, 2, NULL, '[]', 0, '2018-10-17 03:45:01', '2018-10-17 03:45:01', '2018-11-01 03:45:01'),
('130dd9f91ee69bfae29a12cc83f240a446391838c125bf7edb38a1fef9e32ee0ec8005cd24f1e313', 10, 1, 'socialLogin', '[]', 0, '2018-10-09 18:35:28', '2018-10-09 18:35:28', '2028-10-09 11:35:28'),
('1353db6fc6a5a0bfad0be6ccf4ede9ad2a76635009b4c261277a3a5891745989232f5cea3532177a', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:42', '2018-09-15 17:46:42', '2018-09-30 10:46:42'),
('135e2e10a7bc25a49d2bcc27cc9ca539f355c343a5315b5532ed812a91a989a922d9059d25b44780', 5, 2, NULL, '[]', 0, '2018-10-07 00:48:16', '2018-10-07 00:48:16', '2018-10-21 17:48:16'),
('13a5ed6f5ad93940d3bb2c65b2b760eca49a5d0590a55d135fe2311fbb63a2b565c8a8b2e3bd9c6d', 120, 2, NULL, '[]', 0, '2018-08-30 20:02:41', '2018-08-30 20:02:41', '2018-09-14 13:02:41'),
('1429f3ef6c15a5401dc912b96c8f6cc09df69792994881cb6bb2c1b6bc0746ccffb1e98f985e261b', 83, 2, NULL, '[]', 0, '2019-07-05 00:22:07', '2019-07-05 00:22:07', '2019-07-19 17:22:07'),
('143e7c45d6c4e778ee07aa723a1bcb2aae34e10c723660ff0c8abc22e83a30829f52d3ce56430e1b', 146, 2, NULL, '[]', 0, '2018-08-04 20:04:43', '2018-08-04 20:04:43', '2018-08-19 13:04:43'),
('145fdbe1da8d857e38e8511146c06a88d300e63bdf2dbe84c6b7ceaf6858b7999f48576b01e5c66c', 61, 1, 'socialLogin', '[]', 0, '2019-01-05 14:50:48', '2019-01-05 14:50:48', '2029-01-05 14:50:48'),
('1487fc8ab2a3f4cab6ba6ecc16b241143a209fcbe60340d8c66494a9678cf82195f1f801ef67c946', 132, 2, NULL, '[]', 0, '2018-06-14 23:06:02', '2018-06-14 23:06:02', '2018-06-29 16:06:02'),
('14a1afbb67524f25b8b9df6302c98c6da009a89ad6b8f38c426c5a79665a0d91376440fb03e2486e', 89, 1, 'socialLogin', '[]', 0, '2019-06-18 01:58:25', '2019-06-18 01:58:25', '2029-06-17 18:58:25'),
('14d21a325e501d2742fbeed02872753b48225dd4cc7454fb832a4540868c66da21aad5e7cd712a5d', 58, 2, NULL, '[]', 0, '2019-01-05 14:10:30', '2019-01-05 14:10:30', '2019-01-20 14:10:30'),
('15269a4b0c607068cfab69c815c18d3c3be0a0b2cb6aee1e8116749c648b693894b6437a83c62680', 144, 2, NULL, '[]', 0, '2018-08-01 04:34:46', '2018-08-01 04:34:46', '2018-08-15 21:34:46'),
('1539189a97f8f9055f803feffb2406270b4a49b2b39223bed1bb88001dcdbf253cba63d48f091ab5', 8, 1, 'socialLogin', '[]', 0, '2018-10-18 11:30:46', '2018-10-18 11:30:46', '2028-10-18 11:30:46'),
('1572ce52fc446add7d5a92c9d76175b99900e1a7a7ff126b36c549ffa22cb0d896ed175e9026487f', 14, 2, NULL, '[]', 0, '2018-11-28 13:20:21', '2018-11-28 13:20:21', '2018-12-13 13:20:21'),
('157cfb376f1dcb30804fe839440d642fff530d8c9758593a20fa4be6ef4d922443c1cd5de0dafbc0', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:52', '2018-09-15 17:59:52', '2018-09-30 10:59:52'),
('15850f767b24b6715df2af727be06799892755a590f20cf790464cf177a0d58c82d31a9ffdbc826f', 1, 1, 'Token Name', '[]', 0, '2019-03-29 23:03:38', '2019-03-29 23:03:38', '2029-03-29 16:03:38'),
('15b3f460e1974762eee5ffe19c825d894376ec041aaf1b7f4838c1ef36106a9fc1d82f7592b44d71', 14, 2, NULL, '[]', 0, '2018-12-21 19:40:58', '2018-12-21 19:40:58', '2019-01-05 19:40:58'),
('15c8210748b9b076bb1a8bc6b7d2cf406dde6a4d23845f5ea08ebae0b66275c620af3eee4a48d042', 113, 2, NULL, '[]', 0, '2018-01-27 08:32:21', '2018-01-27 08:32:21', '2018-02-11 01:32:21'),
('15cdd89c06bb3de0adebe79a0b750285392fe77dedea62a4b197b740f78652fbc17a9fa1af156290', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:51', '2018-08-10 23:12:51', '2018-08-25 16:12:51'),
('15d0e1de60cee488ce9411057172d1d4f6a6adc9e62f1158af56088f7ee9d603a6defcb8fe145241', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:02', '2018-09-15 18:03:02', '2018-09-30 11:03:02'),
('15d39901a458ce05a6ab140fd834c00a758179e60192d1a95b548c09dc0c36409a8b4544f82270ae', 2, 2, NULL, '[]', 0, '2018-10-06 02:12:48', '2018-10-06 02:12:48', '2018-10-20 19:12:48'),
('160faa5fab1c0f38368683e3cf603f066127f36fba789c15aeaffb9d43d3cbbb6154720ffa33baae', 146, 2, NULL, '[]', 0, '2018-08-10 21:48:24', '2018-08-10 21:48:24', '2018-08-25 14:48:24'),
('1625dd1d4079b656cab4f7a199dd58de476bbd9145f19fd54baa9a96fd0a636a20b500646bb5cddd', 3, 1, 'socialLogin', '[]', 0, '2018-09-15 23:59:30', '2018-09-15 23:59:30', '2028-09-15 16:59:30'),
('16d3a266e9e9774b098c40e39e0b0cf02a753ed3673ae9e48643d711fac956eac6a16a14efaa70e8', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:13', '2018-09-15 17:48:13', '2018-09-30 10:48:12'),
('17519aa8e480e64c17965e9587af205e3fd834291aa4a03c721be189dec2c0d6ea772625bf9f77cc', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:04', '2018-09-15 17:52:04', '2018-09-30 10:52:04'),
('17548c3b3cfcef82e85687a9cb0bd0968906f19c4b3034cf86bf5d2b355de00aceeb739ff528a42e', 4, 2, NULL, '[]', 1, '2018-09-16 06:30:56', '2018-09-16 06:30:56', '2018-09-30 23:30:56'),
('176ca076275d137e73e8d5135630c2c41ee9f88a66b81676755cba274d0c29f599393a9d322e9ab2', 8, 1, 'Personal Access Token', '[]', 0, '2019-07-04 00:53:30', '2019-07-04 00:53:30', '2029-07-03 17:53:30'),
('178c330858ceda31c41a2a73cc28f522281313386f673e6b5a04dd84ee42281e0167e493816a35e0', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:59', '2018-09-15 17:44:59', '2018-09-30 10:44:59'),
('17b0ba2908124389d261b6c47bb56c5246fd79179025d177b4696db6bbd8e8dbdf5abd04e4aa72b2', 76, 2, NULL, '[]', 0, '2019-02-06 21:51:08', '2019-02-06 21:51:08', '2019-02-21 14:51:08'),
('17c32e41b2009ed3c0639f511b4380f201062603d613c4a87f6b17a07323692b851aa89038bd64a5', 156, 2, NULL, '[]', 1, '2018-09-13 17:32:38', '2018-09-13 17:32:38', '2018-09-28 10:32:38'),
('18095624d8ac80fa22fa19dfc327cfe13dabd8fc8d0a6f2d0e4b97275a9026b21abdbe9ce1b3fb51', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:08', '2018-09-15 17:46:08', '2018-09-30 10:46:07'),
('18095821c733a5e06911e872b79c9d06d962cd0a0219e2bc6a12886305968b0ba0da70e0cb0b84e7', 5, 2, NULL, '[]', 0, '2018-10-06 17:55:02', '2018-10-06 17:55:02', '2018-10-21 10:55:02'),
('1811cf0b30c807d38678fe186339dc389df8281ba2c750f63aa1b42c58522381831ff6a9138c5baf', 86, 2, NULL, '[]', 0, '2019-04-24 01:06:24', '2019-04-24 01:06:24', '2019-05-08 18:06:24'),
('182fdb739e03da9be192619e75c450b160dbd2336583b8b99940a4bba0f777072b8ccad5f8cded2f', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:53', '2018-08-10 23:12:53', '2018-08-25 16:12:53'),
('184e8a725a7607a10cd230f1cb0d3c920d112680318994d40f8f91e14032f46d3b41a87caabeaf4a', 100, 2, NULL, '[]', 0, '2019-07-02 19:43:05', '2019-07-02 19:43:05', '2019-07-17 12:43:05'),
('185ba493c8d6650bba510bb210edc69b70e66a9cd246601f7d3275960874633b403a2197792c02d1', 144, 2, NULL, '[]', 0, '2018-08-02 07:42:20', '2018-08-02 07:42:20', '2018-08-17 00:42:20'),
('185d29313e781f1dfd577aff92419bc2aa3a656903ea488792ecb97115ef9ee1999403598fd50c94', 1, 2, NULL, '[]', 1, '2018-09-15 22:30:50', '2018-09-15 22:30:50', '2018-09-30 15:30:50'),
('18706103ef4161f589d0ed0b38cffe1b83accac814d8fefc28bdff9386be1d75836785eb9dca37d9', 120, 2, NULL, '[]', 0, '2018-08-10 21:13:17', '2018-08-10 21:13:17', '2018-08-25 14:13:17'),
('188b04549815f766f2b0549a1b41b9ce8041c2abe3d07db0b51f53117b2cef9214197095f3bee242', 16, 2, NULL, '[]', 0, '2018-10-19 15:58:52', '2018-10-19 15:58:52', '2018-11-03 15:58:52'),
('189485a5bd40481c94d4b4bb7c768aec82a6e67f1d3c20daaddaf01fd98d8e06c16aa8deaf94b1ee', 120, 2, NULL, '[]', 0, '2018-09-14 01:14:59', '2018-09-14 01:14:59', '2018-09-28 18:14:59'),
('18a03859b04c2b4feeb7daa18a60975bbc748867f8ebb0d210377f3dcd3e4967a9595b61d4ea9921', 157, 2, NULL, '[]', 0, '2018-09-12 06:15:35', '2018-09-12 06:15:35', '2018-09-26 23:15:35'),
('18bc6202236d99bec248a9e5f53697eab91830a795cb597e7bdbee36db50d92eb94c64ed9e6deabd', 2, 2, NULL, '[]', 0, '2018-10-12 13:49:13', '2018-10-12 13:49:13', '2018-10-27 13:49:13'),
('18f5e6af3d837ab4e092126bf7f45240dc6497a09a971edc8ae984bacd2b8840db279ff1f6d41b5d', 108, 2, NULL, '[]', 0, '2019-07-26 23:04:00', '2019-07-26 23:04:00', '2019-08-10 16:04:00'),
('193e58699c1c30b2df8f9ffe3715e09343114cb2be3af4e8878512fbd70924e715d874b9eada2e20', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:17', '2018-09-15 18:05:17', '2018-09-30 11:05:17'),
('19940cbbb4162549d2b5d41b75c99bdc02c8eef540e57e53f9493f61618b7f8770fc595c5fe44ae3', 120, 2, NULL, '[]', 0, '2018-08-26 02:01:42', '2018-08-26 02:01:42', '2018-09-09 19:01:42'),
('1a1a026467edeb80e66d51f92ed02195daffdb99d58d40b6673eefdb77fda1f81248be2e4d1d746a', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:22', '2018-09-15 17:45:22', '2018-09-30 10:45:22'),
('1a1cf8f12f5c80c8b0d159289467632df0f378d3c91557cded5590bc51507461bc4a18e7ec45934d', 1, 2, NULL, '[]', 0, '2018-09-19 01:54:23', '2018-09-19 01:54:23', '2018-10-03 18:54:23'),
('1a9ea4b87cb8401e53d8c125f134539333f29be237aa7751f96094c0a70cd48d46ab069ac95983b9', 16, 2, NULL, '[]', 0, '2018-09-19 23:19:16', '2018-09-19 23:19:16', '2018-10-04 16:19:16'),
('1aaf3f0f64bdeab53a88503d13fce99eee0c65742141669afb7cc49aa3c233ed5f15852217fba9d6', 1, 2, NULL, '[]', 0, '2018-10-04 17:13:16', '2018-10-04 17:13:16', '2018-10-19 10:13:16'),
('1abcbc250b84de9a337f20ab7b5c6a82b32340ec1aa5ff06285801f7b8e938bac1f86627874fba6f', 48, 2, NULL, '[]', 0, '2018-12-21 21:59:01', '2018-12-21 21:59:01', '2019-01-05 21:59:01'),
('1af28bbf2561bb0e357c681d6af6774792899f049f38820fc1fa1f971b07a179aebd2a8b7f855262', 144, 2, NULL, '[]', 0, '2018-08-06 06:00:28', '2018-08-06 06:00:28', '2018-08-20 23:00:27'),
('1b7bfb485f87b4e43503bfe382c4050618d6e60e02b6206ab2d294cd8d765c5e854fb485db3d8644', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:54', '2018-09-15 18:09:54', '2018-09-30 11:09:54'),
('1bc4c2015ec95171b98a031ec2bbdd62683d38ac88150ed0d8b4220fd5b8f2580df9b376dd927124', 148, 2, NULL, '[]', 0, '2018-08-10 02:53:38', '2018-08-10 02:53:38', '2018-08-24 19:53:38'),
('1be753ad852eca1c748de857ceb0ab7c03339d71a837859bb2c3b6cb7288c5b6325c1d8df77ae1ed', 1, 2, NULL, '[]', 1, '2018-09-16 00:15:17', '2018-09-16 00:15:17', '2018-09-30 17:15:17'),
('1bfd7d92349db0156aab24ce3d48a511a495d10fe4cfd18dd03ba90ae7463359b834016fd6aaee96', 1, 1, 'Personal Access Token', '[]', 0, '2019-06-25 09:16:30', '2019-06-25 09:16:30', '2029-06-25 02:16:30'),
('1c0f8289905f4e7d0dfde817e8b4c4a1fffcca5535cb6dec510df3c5afff3a33fdada46063194540', 20, 1, 'socialLogin', '[]', 0, '2018-10-24 12:26:04', '2018-10-24 12:26:04', '2028-10-24 12:26:04'),
('1c23120a6d5d5258685e1c25cf8d27e45bac4277e9ef46765bd8c395be4c76cd257c391ccaf9a6fc', 14, 2, NULL, '[]', 0, '2018-11-28 12:58:51', '2018-11-28 12:58:51', '2018-12-13 12:58:51'),
('1c49165c880c986bc3a7c738bdd27b330f4484620231a9dcb255bd7c53f72ff313c83f8040dc2fee', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:27', '2018-09-15 17:49:27', '2018-09-30 10:49:27'),
('1c4dfbf26d967cabe984fcd71ce2cd5f22846cb3af69065fec2bf5597ac5f0f13993186ad8590f7e', 156, 2, NULL, '[]', 1, '2018-09-14 19:30:46', '2018-09-14 19:30:46', '2018-09-29 12:30:46'),
('1c6145139973ef820c6c75ae44597f7f3a76aa4f86cc8630269f3e5b5b2b1418ce50f3615261fce0', 149, 2, NULL, '[]', 1, '2018-08-10 23:11:19', '2018-08-10 23:11:19', '2018-08-25 16:11:19'),
('1ceaba87fb00ed3cf673a3ac8dbad6f44118431680f43d7c31473296396698e2c8d9b48edac0e748', 14, 2, NULL, '[]', 0, '2018-12-26 19:51:28', '2018-12-26 19:51:28', '2019-01-10 19:51:28'),
('1d0caaf95110fe160b7e2f3d1b69dd14f76d2ee4648234b39cac44daf59cb19f6d6b7a1279942b89', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:27', '2018-09-15 17:47:27', '2018-09-30 10:47:27'),
('1d17f14e755216cde991a11a181bd3c07f6e808dac9e99d237c94b3a34a17de429f362410e3f7628', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:00', '2018-09-15 17:46:00', '2018-09-30 10:46:00'),
('1d18af29766f85e8ec2495fd3701ea667064e195f377b7d3b26e6cc8346e5a1c7ebc56b1b728d3c6', 146, 2, NULL, '[]', 0, '2018-07-31 17:38:31', '2018-07-31 17:38:31', '2018-08-15 10:38:31'),
('1d57e5150653b52d7588fb309853a397d2077e694c91a503641c98f4b29929819eabe05c9debc976', 1, 2, NULL, '[]', 0, '2018-09-29 01:39:44', '2018-09-29 01:39:44', '2018-10-13 18:39:44'),
('1d7c8228bad47b26d43c02d17d1d98cffae9290bfc933d5a12f4b194c5dcdc2a57d5c20e90e5e5d9', 13, 1, 'Personal Access Token', '[]', 0, '2019-03-29 23:52:56', '2019-03-29 23:52:56', '2029-03-29 16:52:56'),
('1d83e53d9de9acbdd4cef886cd544fdaa2946e33760a2e09475682d375ea54fc5e8158e28fa96681', 156, 2, NULL, '[]', 1, '2018-09-14 06:11:06', '2018-09-14 06:11:06', '2018-09-28 23:11:06'),
('1d95f3e102bdab18aa651011d9f5ab89ef1e4c8a05ca25029f3bb76a3c06f15bc8ae1873f9fd3b58', 1, 2, NULL, '[]', 0, '2018-09-27 22:06:34', '2018-09-27 22:06:34', '2018-10-12 15:06:34'),
('1dcafaa3922fb8518d16513f873b7cec53ce9d2360d0b8276a2deaa754460e72be890274e77c42e3', 14, 2, NULL, '[]', 0, '2019-01-15 01:52:10', '2019-01-15 01:52:10', '2019-01-29 18:52:10'),
('1de762d3a55a53b7c2b731704d4cb317f4291a44315e24c32e1a98c2c198f2c3054738cd3ad90b46', 12, 2, NULL, '[]', 0, '2018-09-19 21:17:37', '2018-09-19 21:17:37', '2018-10-04 14:17:37'),
('1df6b739843c816a89a490ba78a4f9638dddfb68c47e43786494a759a11af8d548e58d7749e7f3d6', 1, 2, NULL, '[]', 1, '2018-09-15 22:20:56', '2018-09-15 22:20:56', '2018-09-30 15:20:56'),
('1df9eec2c33bd587650646315592af074a74e9fb578f3624783a432f241e2046f92ee7f3e67d1226', 84, 2, NULL, '[]', 0, '2019-05-10 06:38:50', '2019-05-10 06:38:50', '2019-05-24 23:38:50'),
('1e287117c98a08a490446903d60d6ffb1a9569bd2636e3bd182cbb1d44cd21ef616c7ba07244b4ed', 100, 2, NULL, '[]', 0, '2019-07-03 21:32:59', '2019-07-03 21:32:59', '2019-07-18 14:32:59'),
('1e44e03d48b4b0034f7bc379720551e43173baa3dc00ad69746a0a8e250bee51c1b350f2a0a4527e', 120, 2, NULL, '[]', 0, '2018-08-31 01:26:08', '2018-08-31 01:26:08', '2018-09-14 18:26:08'),
('1e9648eafc76bd1947af2d01aa8aa5f1e26c6974f61d101ca64cf4d8a74f173bbb3f03a537216ade', 1, 2, NULL, '[]', 0, '2018-09-29 22:08:38', '2018-09-29 22:08:38', '2018-10-14 15:08:38'),
('1ea0142a172ebc8c24c6ae78d5d73a5e8aebb9912cf7af99bf88781469bb6fd79a71696669542e9c', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:12', '2018-09-15 17:50:12', '2018-09-30 10:50:12'),
('1ed8c949194a1bd781c5e1c2f25ac99ff96c08c3e69407f5d209718feb49bb2e35cab3faafc321d4', 14, 2, NULL, '[]', 0, '2018-11-19 15:08:40', '2018-11-19 15:08:40', '2018-12-04 15:08:40'),
('1f269deff4515bb3ba19dca69657c68010060f32a44d91396f1af3cbfcbe987cc3fe757d04b03dba', 5, 2, NULL, '[]', 0, '2018-10-04 04:28:36', '2018-10-04 04:28:36', '2018-10-18 21:28:36'),
('1f32d9a039ec020ae0c9743851530d05f2dca4f134ed3c382ab0d0de8f02195e2b1a24684e269041', 15, 1, 'Personal Access Token', '[]', 0, '2019-05-14 00:55:27', '2019-05-14 00:55:27', '2029-05-13 17:55:27'),
('1f583d038edb5a08e9f08f51db8db1440f905b0c3c7c19b55fab9583df03ceb791cb892f10e2b23c', 1, 2, NULL, '[]', 0, '2018-10-10 16:10:33', '2018-10-10 16:10:33', '2018-10-25 16:10:33'),
('1fa272aae54c16f9eec0dc39d713b06bac0862d7ff7445c97724e3e7d2442108e0ef1a79e9138afa', 113, 2, NULL, '[]', 1, '2018-02-13 12:32:26', '2018-02-13 12:32:26', '2018-02-28 05:32:26'),
('1fb2f74b0ab39a0205481a71140faaa90905e0ae12d427ee0128b1e28ef2bf3677ca4ae540ebbb5a', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:37', '2018-09-15 17:54:37', '2018-09-30 10:54:37'),
('1fcfe35e375c2c87e11a1a2b0f8be8d77bc1579772baf6f197a2a41f0d451da0d279cad260a4d93b', 1, 2, NULL, '[]', 0, '2018-10-04 21:59:04', '2018-10-04 21:59:04', '2018-10-19 14:59:04'),
('200164d1bccec09311a613d6ab5847c5faaff6b9512d2689890cf3b1116cad772834f5aadcdd651b', 144, 2, NULL, '[]', 0, '2018-09-06 08:48:21', '2018-09-06 08:48:21', '2018-09-21 01:48:21'),
('202c71a1374c867ccdbdf7f9d1b08b2c10134b5241757f1908a4b445932a2706c4dfebe7a43c90db', 14, 2, NULL, '[]', 0, '2018-11-15 17:24:00', '2018-11-15 17:24:00', '2018-11-30 17:24:00'),
('202d7eb2a33384c228c3f8e3cbaf2ff27baea46ffb51a5a56cbba0abf4bee58411b8a14647a5c233', 120, 2, NULL, '[]', 0, '2018-09-07 00:07:34', '2018-09-07 00:07:34', '2018-09-21 17:07:33'),
('203713b437cee89a2b5f293cd84707850005b3410f8c0ef686e20e18066d146aee19321bdae16994', 1, 2, NULL, '[]', 0, '2018-09-21 21:29:24', '2018-09-21 21:29:24', '2018-10-06 14:29:24'),
('20750e6fab25dfdc19101f9f5c416f1b619e348adf1a2c9e89e5f4c1f86ffd9ee7502fac74f11161', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:37', '2018-09-15 18:08:37', '2018-09-30 11:08:37'),
('21168ae7f3b3135240e77629ed9dbcdafb5b4abc9007ffb8359bb4a372ec0c6f3f31f7979bcd9322', 1, 1, 'Personal Access Token', '[]', 0, '2019-05-16 03:33:48', '2019-05-16 03:33:48', '2029-05-15 20:33:48'),
('2191884c969c3e7f8c4d315091dd4bb8287aa905b189a5e1d71da13c05a3fb1dd4111341598fc6e2', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:13', '2018-09-15 17:44:13', '2018-09-30 10:44:12'),
('21e921c1d69a75487bfc453be3b1580b431fe39b995f27c7966386787c64fa022011e914cd3cf1de', 5, 2, NULL, '[]', 0, '2018-10-09 21:37:30', '2018-10-09 21:37:30', '2018-10-24 14:37:30'),
('221c03b5b954bb782da4647b6432c885f0e13df3cc0b0e1dcbebb60916df1e6dc84dea6bc1cec463', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:47', '2018-09-15 18:04:47', '2018-09-30 11:04:47'),
('22a810e3e3d658ec56f5353cd83f6a96230465d17e9738f7e61811d073379eeb89110c7344b0a822', 6, 2, NULL, '[]', 0, '2018-10-07 03:02:10', '2018-10-07 03:02:10', '2018-10-21 20:02:10'),
('22d6e6458d21b695979e3557f94eab43f3c21930122fb40745797c17cf6e55cf0ab817640debf100', 35, 2, NULL, '[]', 0, '2018-11-20 16:45:05', '2018-11-20 16:45:05', '2018-12-05 16:45:05'),
('233a90d6ba60fffb2f6523e79dab52ba962ca4cefe765d7727c912794f4384e478e5ada3ffaeabe2', 6, 2, NULL, '[]', 0, '2018-10-08 23:38:45', '2018-10-08 23:38:45', '2018-10-23 16:38:44'),
('2364b0e8bc259a939d8019772cb624349b5ec95f8b6473c023f1f654fe89e8bd35f36fc6962e5808', 86, 2, NULL, '[]', 0, '2019-04-17 22:47:07', '2019-04-17 22:47:07', '2019-05-02 15:47:07'),
('23792b32604ef930efbfbf051a730830b90b42fb7b50c6202580cac3068cbefe261c0edc60178fb6', 3, 1, 'Personal Access Token', '[]', 0, '2019-06-11 23:58:25', '2019-06-11 23:58:25', '2029-06-11 16:58:25'),
('23a4af11aad1515f3ccc8c9dd02dbdcc11cbf60acfae147938131bd35b689d94a5c3532621edf8b8', 153, 2, NULL, '[]', 0, '2018-08-25 18:17:52', '2018-08-25 18:17:52', '2018-09-09 11:17:52'),
('2408d6e756a524d7dc97229213b9b86ea9b489a87c92d52064c4a0d00fbd67e0d886d0023d794f6d', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:57', '2018-09-15 17:56:57', '2018-09-30 10:56:57'),
('2427b7f3d0409ef36c35c7927bfef8c283bdfc136cc9a9653af1005505186a6b286c0fa944ff42ed', 48, 2, NULL, '[]', 0, '2018-12-14 21:17:50', '2018-12-14 21:17:50', '2018-12-29 21:17:50'),
('2437002a9b9381e9abff514df252cf81493d8b6b4c9e0e096883b2fa575cb08e1d21e61dab704139', 1, 2, NULL, '[]', 0, '2018-09-19 07:49:06', '2018-09-19 07:49:06', '2018-10-04 00:49:06'),
('24578aa2a12dc2eb355e89d23cf3647629e65c6659c52d3e55460c9825c70f9c4cfad2c61b75daf8', 5, 2, NULL, '[]', 0, '2018-10-09 21:26:53', '2018-10-09 21:26:53', '2018-10-24 14:26:53'),
('24721bd0ced3c94317c3fc77e1d7e727195e37293021c0fb5b53bd5b31c504ba8e13a652561ac75e', 41, 2, NULL, '[]', 0, '2018-11-22 16:09:55', '2018-11-22 16:09:55', '2018-12-07 16:09:55'),
('2472532efd811c27c9a7811974f263c9447981fd9284ef026e8c36605e30e0a6c0f920f269fecaa5', 3, 1, 'socialLogin', '[]', 0, '2018-09-16 02:01:45', '2018-09-16 02:01:45', '2028-09-15 19:01:45'),
('2497ab89e5bbb86828340099466697edb07784ff3e2b4c35afeccf4efb42718e2b57e10a46223dd9', 7, 1, 'socialLogin', '[]', 0, '2018-10-18 10:49:47', '2018-10-18 10:49:47', '2028-10-18 10:49:47'),
('24992935fdb9d2c3deb6e5ec6f1c9544ae18487d78b9eba1749967d69b70cc4a6d6f093ef9b8dcc3', 17, 1, 'Personal Access Token', '[]', 0, '2019-05-10 23:27:10', '2019-05-10 23:27:10', '2029-05-10 16:27:10'),
('2547af27046c861b6920eb65b5925dfbaccf94121d813bbc6b4cfdbb25fba21e03f636d58ae63c24', 150, 2, NULL, '[]', 0, '2018-08-10 23:16:04', '2018-08-10 23:16:04', '2018-08-25 16:16:04'),
('2558deca3b66832609f0d910f0e2f674cb66199b5c2043296bb4876561e3efe45ace40acd93b8cd7', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:14', '2018-07-20 23:22:14', '2018-08-04 16:22:14'),
('2592793fcfbb7432b16564be425cffb92fc5043b89c31052ed39027e014abfb531a18bfebce86c4b', 1, 1, 'Personal Access Token', '[]', 0, '2019-03-29 23:09:11', '2019-03-29 23:09:11', '2029-03-29 16:09:11'),
('25d93d3c24b6d94bb7af15b77da76bb4ce6ccdc7efb78cf04010b95575826d8f43c0bbcec37fcefe', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:02', '2018-07-20 23:22:02', '2018-08-04 16:22:02'),
('2617ef0c90e2ce2580968dab243702d76c441d064791e49fd79d95618d957c5826b789ecb3fab195', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:46', '2018-09-15 17:45:46', '2018-09-30 10:45:46'),
('262c7ddd771684e180d5e296ac9e61d615053dc12694ae6819b587a4a4914496ec01af40152d4a80', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:04', '2018-09-15 18:01:04', '2018-09-30 11:01:04'),
('263474c151d320d77ffc722cf18a50393baca04d2d529f7fc2446743229957047656b97b73ab9e30', 156, 2, NULL, '[]', 1, '2018-09-13 18:41:57', '2018-09-13 18:41:57', '2018-09-28 11:41:57'),
('263565b623f0f86067da4f8c443ec531b20270aedf076deccfb15f5a079ba85bedc9490624ba63ab', 1, 2, NULL, '[]', 0, '2018-09-18 22:55:05', '2018-09-18 22:55:05', '2018-10-03 15:55:04'),
('2673a98951324a38374efb688dceae5dac855141493509108af464127138b2180d68f4098d31e051', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:12', '2018-09-15 18:06:12', '2018-09-30 11:06:12'),
('26c9ebe7b35aa1ee6a5e122e22099367d8411334325e1d1ac08db4580d8f77e9149915437c114e60', 142, 2, NULL, '[]', 0, '2018-07-21 03:22:17', '2018-07-21 03:22:17', '2018-08-04 20:22:17'),
('2704d0a5ee58545a6a24f215caa6c321ddfba2d52835e2598810f81659aa59f144c5dcb14721d372', 53, 2, NULL, '[]', 0, '2018-12-26 19:09:06', '2018-12-26 19:09:06', '2019-01-10 19:09:06'),
('277f41eb2fdbdd73fca2874d29e06c727fa26bc40f649919dd515e626dc0bc7e4ce745f523b13a6a', 100, 2, NULL, '[]', 0, '2019-07-03 19:07:10', '2019-07-03 19:07:10', '2019-07-18 12:07:10'),
('2782a5a0666c2e555e0ea27191e75eb55f453ee81cc76d3484c93d1485f67e80901998367846d8f0', 62, 2, NULL, '[]', 0, '2019-01-22 01:36:28', '2019-01-22 01:36:28', '2019-02-05 18:36:28'),
('27835f516999b887230bc582416f61a97cd777f69ef42c7645174e1289d5bf3df3c0919f396cecd0', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:32', '2018-09-15 18:09:32', '2018-09-30 11:09:32'),
('2792331b88daeb1afeadeea2719e38de2391ea6673673cedd31f34f7d1f36b4f73b6bd9a892637b9', 110, 2, NULL, '[]', 0, '2019-07-04 20:48:29', '2019-07-04 20:48:29', '2019-07-19 13:48:29'),
('2799b2269803068237d5deddc3d1c53f908a26269295597e6aec00798d6ea0f65159b4eccb12e6a9', 2, 2, NULL, '[]', 0, '2018-10-12 19:03:46', '2018-10-12 19:03:46', '2018-10-27 19:03:46'),
('27b2452272d4008629a728229a021f7866250870a5b3dd8c00d2e6d3013444c4cec5eee8809ee0d1', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:02', '2018-09-15 17:50:02', '2018-09-30 10:50:02'),
('2807ffcd3c259f801cfd9581ebd55fa0a7afe343770be48ad3bdf976f86e560c1a4c993080970140', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:47', '2018-09-15 18:07:47', '2018-09-30 11:07:47'),
('28126ffc3a2ed05a068cf38c3e4c09f4ff9db755ce72c805b4439feedfc72db8ffc99f9df2a41dd8', 144, 2, NULL, '[]', 0, '2018-07-28 17:40:21', '2018-07-28 17:40:21', '2018-08-12 10:40:21'),
('2820c982f4f2d81ae93daa49bff1391f41af941bfc019a828453bb92662ee51b2c4f09fa43b80d17', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:27', '2018-09-15 17:54:27', '2018-09-30 10:54:27'),
('282301e1a381fbafdb706afc0481416f1181fac24bdcc41033b1c1f88ac2222a973fdaab73f734c4', 156, 2, NULL, '[]', 1, '2018-09-13 21:51:15', '2018-09-13 21:51:15', '2018-09-28 14:51:15'),
('284052d307a81674a0e1a143e07d3499fa46d26c71bff2e0af4504912e01345e765eea65a48c20ab', 110, 2, NULL, '[]', 0, '2019-07-09 19:07:16', '2019-07-09 19:07:16', '2019-07-24 12:07:16'),
('28933a5a1989f6e34b2aaaf5c3862e30d0f97b4c5504a5fac6e4e32798103ad399f3f307b1e35136', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:47', '2018-09-15 17:48:47', '2018-09-30 10:48:47'),
('289ef2709760eeb7748a2e2746d7a0ac625f829c41aa2d1f5dddbc3eb2ae8d69692226f741e959de', 7, 1, 'socialLogin', '[]', 0, '2018-10-18 11:30:12', '2018-10-18 11:30:12', '2028-10-18 11:30:12'),
('28bb9e5c2bc8eb5d84820480b0a3d36a81337fa591061519aca33a1511ae9c0df0c0eda488a5b1b7', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:57', '2018-09-15 17:53:57', '2018-09-30 10:53:57'),
('28e19293252d1c04b7372357e4f277c3cdf242d23e6b8b3b3ab15de781166d9fd2ddefedb5491a81', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:37', '2018-09-15 17:59:37', '2018-09-30 10:59:37'),
('28e57711b3f78f8843a9fb16ce64a14ef6141205b603ecf85fac0dc1647b3840ddca0162a76356fe', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:47', '2018-09-15 17:59:47', '2018-09-30 10:59:47'),
('28f7091f359f0aa9c9a0333f5743ce399f148824c8b48b2c19d8917cb427e6382606b197159c7cc8', 120, 2, NULL, '[]', 0, '2018-05-22 01:08:19', '2018-05-22 01:08:19', '2018-06-05 18:08:19'),
('2919af59b491665aa3cceff809840d5e558b23422ba428db4e850fc1dc6a817561274ae34e0550fd', 5, 2, NULL, '[]', 0, '2018-10-09 22:01:54', '2018-10-09 22:01:54', '2018-10-24 15:01:53'),
('295a4ad3638b98817487f4aa4f3064bb54711c9ff6cd4bb90bbd0a50c98dc88960cca436dc233394', 7, 1, 'Personal Access Token', '[]', 0, '2019-07-10 18:59:48', '2019-07-10 18:59:48', '2029-07-10 11:59:48'),
('297abef102b1e992445c2959ca8b42823a48089680bc952c4663510ac6eccf5ae39af69eab550bd5', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:53', '2018-09-15 17:46:53', '2018-09-30 10:46:52'),
('29862e94126d3869075334946d3e51f0722246e7ff3f98f734c323d40ba58af9a66ade83b1c755bf', 110, 2, NULL, '[]', 0, '2019-07-04 20:48:20', '2019-07-04 20:48:20', '2019-07-19 13:48:20'),
('29b45b3ec278911d2cc02af114db30dcbe2ef70dac48c55d5ed9a9aacb3ab675c64f63f8946e87bc', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:07', '2018-09-15 17:53:07', '2018-09-30 10:53:07'),
('29c56eac40da7f60e77b7a59ccfc389fc0b51e13feb372976c6a2e9c23369cc1cfc789a0886e6ec7', 14, 2, NULL, '[]', 0, '2018-11-01 11:21:43', '2018-11-01 11:21:43', '2018-11-16 11:21:43'),
('29deb1e96bc79a5e70e396fb3a9c10a476640b016d5a7eba4f665a509d0b9f37465f32b22ece1b05', 146, 2, NULL, '[]', 0, '2018-08-06 19:30:28', '2018-08-06 19:30:28', '2018-08-21 12:30:28'),
('29ed4482a122b1d7a6a546c96f525611ca3f1609205827ff3b086fbe24f0394633eec8be00d4fe09', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:17', '2018-09-15 17:51:17', '2018-09-30 10:51:17'),
('2a10207c1aabe32974cc1e751239f09f32f61779c0e89e736c9fe69a848d97a7db2e0d286f081b8a', 26, 2, NULL, '[]', 0, '2018-10-30 03:02:06', '2018-10-30 03:02:06', '2018-11-14 03:02:06'),
('2aa88117cb94f5959d37063fe52f6ac4be6002c252cbf7acad6ae34c8e6fa0bb1726e58eed59b849', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:12', '2018-09-15 17:51:12', '2018-09-30 10:51:12'),
('2ab5061576cfefcf37b6bd1743dff983b79014e9f8ff55f2c924028caa468032ed5116e20faf88f0', 14, 2, NULL, '[]', 0, '2018-11-19 17:37:18', '2018-11-19 17:37:18', '2018-12-04 17:37:18'),
('2aba26500529e609b784dd0d11c8980a5e3eeb88e8eaa314952eccef1c031f31bccc0ba6270c18b1', 120, 2, NULL, '[]', 0, '2018-08-31 01:18:33', '2018-08-31 01:18:33', '2018-09-14 18:18:33'),
('2ae58cb5fcdbd26a65b9031fbfb6461389b6b5b49ede6da3adeff9f17f5e8117c40879a77b41c30a', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:12', '2018-09-15 17:55:12', '2018-09-30 10:55:12'),
('2ae8e0e93d1f127bf1732d261e8341ebcec9b647eb50aad96c1cf9edbc54992529dd94a9577616ec', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:07', '2018-09-15 18:09:07', '2018-09-30 11:09:07'),
('2b2a21b1c089f2293d55970171083f9b99f9cd267bd7eef67dcc7d393e3983058b64b15ca01e80e6', 7, 1, 'Personal Access Token', '[]', 0, '2019-07-10 01:24:45', '2019-07-10 01:24:45', '2029-07-09 18:24:45'),
('2b6bcabfb1f23237396ad40c08e3e9e85889a3fd8d2e63148805f161cb6e24c06020ea33824040c8', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:17', '2018-09-15 18:04:17', '2018-09-30 11:04:17'),
('2b76960e80e25ec465473d86fccd4285b41d6441c5b9d857e199e01c5856a6a2d364c25f877260fd', 5, 2, NULL, '[]', 0, '2018-10-06 20:16:08', '2018-10-06 20:16:08', '2018-10-21 13:16:08'),
('2b7a37d0213486ae13e29b1801b1b76305abfa13512a04cc6ae438e13c7af176eb3931a1bfb4958c', 1, 2, NULL, '[]', 0, '2018-10-10 16:07:12', '2018-10-10 16:07:12', '2018-10-25 16:07:12'),
('2b83b6b6ce62646266a0b38eeef628e2c3b8f4f000ca98c90ed52c07c3291b686d2fb8bfe0f0ff0c', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:47', '2018-09-15 18:08:47', '2018-09-30 11:08:47'),
('2bb819e5dd4727aedfe3043e2ad87bf5935eab9ab8542ba5a370cf01d55dad687673622db2bcd63e', 81, 2, NULL, '[]', 0, '2019-03-08 00:15:43', '2019-03-08 00:15:43', '2019-03-22 17:15:43'),
('2bf147673f4db2917f7df9f21ff2497b2ef74f2360f8a82644c868e3eae14202d8d1996d86e1d54e', 14, 2, NULL, '[]', 0, '2018-09-19 23:17:47', '2018-09-19 23:17:47', '2018-10-04 16:17:47'),
('2bfd702e0db7a8d0504a18f1bc928c1f089327d8e2be3a73de14285a52fbc193a2ce1cd55f0d48e8', 86, 2, NULL, '[]', 0, '2019-05-09 21:53:19', '2019-05-09 21:53:19', '2019-05-24 14:53:19'),
('2c0e24a58bc2a40519d720c305a8b0d72697563f999d634be403953bcd4caf1a41736cbf7727238d', 42, 2, NULL, '[]', 0, '2018-11-22 16:54:54', '2018-11-22 16:54:54', '2018-12-07 16:54:54'),
('2ca4e4d169e6954e8dedc30bfcb35ddc63cac0ed50e0f85e0f0e8599e3630bbabf1f579f9832edd6', 7, 2, NULL, '[]', 0, '2018-09-18 17:21:21', '2018-09-18 17:21:21', '2018-10-03 10:21:21'),
('2cc0936b86028745b9c3177133a2d26a06000f9bbe91eaa3bdb904047ce44436ed3763adc57fe477', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:27', '2018-09-15 18:07:27', '2018-09-30 11:07:27'),
('2cc72158f2bbe5b9270c1257f06bf387389ea43f28708fd5ff1a52f2a756bb4e63b77a79d767104f', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:27', '2018-09-15 18:04:27', '2018-09-30 11:04:27'),
('2cd76a0b027911bea31f2299ba8d394bd1fbb9c9d599a326c74a05482c53779bea10bc9ea13cb780', 10, 1, 'socialLogin', '[]', 0, '2018-10-18 11:10:37', '2018-10-18 11:10:37', '2028-10-18 11:10:37'),
('2cf979bf1a59e39f0bb64755c93751ac9aaacc84f4607795a2531dc854faee298db4bc375a8fa948', 62, 2, NULL, '[]', 0, '2019-01-25 22:29:40', '2019-01-25 22:29:40', '2019-02-09 15:29:40'),
('2d1a6ea866d58d658a90428ebb267c05ba652d814f0b50c44f6742d00f1ae6af895ad65fab281e0f', 122, 2, NULL, '[]', 0, '2018-05-24 05:33:27', '2018-05-24 05:33:27', '2018-06-07 22:33:27'),
('2d285488f836755d94b17b3614ea697fbe4158690f7817516ed6b3e083b441e02ee3ba2e61b1b90d', 156, 2, NULL, '[]', 0, '2018-09-11 22:37:05', '2018-09-11 22:37:05', '2018-09-26 15:37:05');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2d7759418c388b994d5032f35962c0f4b63274e7c59f33c1b3e20ff9d426a8fb02bc80732c95916c', 17, 1, 'Personal Access Token', '[]', 0, '2019-04-02 19:41:33', '2019-04-02 19:41:33', '2029-04-02 12:41:33'),
('2dacfe0976fed0786282bcbf5384f1296dcee37e11ec28d962df516ff4b2c2743d6c6d17b60e8265', 156, 2, NULL, '[]', 1, '2018-09-14 02:26:28', '2018-09-14 02:26:28', '2018-09-28 19:26:28'),
('2dc887a43ad79f267b332f76333a8f671b7c5901ee3d9d9a6eb5a16663d50910cf725d798ceede75', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:24', '2018-07-20 23:22:24', '2018-08-04 16:22:24'),
('2e51eca2380488cdb617d2186adb738266b935510d42398d9a647fb37518f24f1e5b2b45ad7eca7b', 5, 2, NULL, '[]', 0, '2018-09-16 10:23:11', '2018-09-16 10:23:11', '2018-10-01 03:23:11'),
('2ebd83524b9f5a819db8966127be52922558e723ede2b2cdce3916cc30d758a905cb9ea24ff2c8b1', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:47', '2018-09-15 17:47:47', '2018-09-30 10:47:47'),
('2edd30bd4a63f83477e0f3193e607aa1ec09dc2e713dfc7f8e6b8974215585775ab67cfddcf3bddd', 4, 2, NULL, '[]', 0, '2018-10-04 19:56:57', '2018-10-04 19:56:57', '2018-10-19 12:56:57'),
('2f1ea74ec8d8645092d32daad50bf35a56679626bb4bda32701c25db8511e49ac4deb0489960d2b7', 120, 2, NULL, '[]', 0, '2018-05-20 19:59:23', '2018-05-20 19:59:23', '2018-06-04 12:59:23'),
('2f2bc4573b85f9f63f3a2487462b6c0c9cae7a7867a976ce03c4cfe77204c6ddb3982229a8ee8ab4', 14, 2, NULL, '[]', 0, '2018-10-26 13:52:53', '2018-10-26 13:52:53', '2018-11-10 13:52:53'),
('2f34c96945f86fc4c94b362462c05ab01ce659a00fb9a324aead50062f508445c0329596fed4a404', 108, 2, NULL, '[]', 0, '2019-07-03 23:55:59', '2019-07-03 23:55:59', '2019-07-18 16:55:59'),
('2faad5e3572acbedd0b6682c64c0de33eb205b2a9b7b12d6c3b0bc853362d81cd94394717537df87', 156, 2, NULL, '[]', 1, '2018-09-14 06:00:05', '2018-09-14 06:00:05', '2018-09-28 23:00:05'),
('2fcf2c63fbf13906c49ed38c935d18ba09a4fa2be3add9e270e01e6ac50f21810a7ef06a0b0cd613', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:22', '2018-09-15 17:46:22', '2018-09-30 10:46:22'),
('2fe0bf661c499671a3eab4aee9702e7d7d811474b5dd31a82b5278f924773f60621b040b12dba496', 1, 2, NULL, '[]', 1, '2018-09-15 22:49:33', '2018-09-15 22:49:33', '2018-09-30 15:49:33'),
('2ffc2d336e34e0c53977de08511a3924dd80d16d8f2fff6be59d7f3bbebbc9dc41add17b479422c8', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:32', '2018-09-15 17:58:32', '2018-09-30 10:58:32'),
('2fffd6c042448264eca3a0cd980620356aa640fe784272fddca5428cc3d8697d6e4a3964b102c69e', 120, 2, NULL, '[]', 0, '2018-08-30 19:58:59', '2018-08-30 19:58:59', '2018-09-14 12:58:59'),
('30395c3ddc1ee08ade62c708c2ee7579d63c7c2a20e8b12a979719cd8d23476e947299c67b57acfd', 14, 2, NULL, '[]', 0, '2018-12-26 20:55:37', '2018-12-26 20:55:37', '2019-01-10 20:55:37'),
('303ed0779eefd259e21deb178f4f1f04d957a24f7364241c9f1ead38be59eee27a2dfb1118182726', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:02', '2018-09-15 18:06:02', '2018-09-30 11:06:02'),
('30764fa992b3735608f9382666eea3ccf123be40017450127d59cea33d1390b6456e18b4d774feaf', 156, 2, NULL, '[]', 1, '2018-09-15 17:43:52', '2018-09-15 17:43:52', '2018-09-30 10:43:52'),
('30de9ad43245cd69d50151aad8f3e673e7e58d75e54debafa7c98fb719fc5d3ab0f301a033e25d42', 120, 2, NULL, '[]', 0, '2018-09-06 23:34:57', '2018-09-06 23:34:57', '2018-09-21 16:34:57'),
('30e9d700d3091c8bacd90e7f80bd10f25d471a3a9d49eeb4e48bc1f1f7ed0c2773fd015016a14445', 1, 2, NULL, '[]', 0, '2018-10-06 02:05:06', '2018-10-06 02:05:06', '2018-10-20 19:05:05'),
('311734b0156a80fe3f56daa4f20a89d1674c83d1c58753fc504a7ceafafd2a53a1eb7af24b1458c2', 1, 2, NULL, '[]', 0, '2018-10-10 16:15:13', '2018-10-10 16:15:13', '2018-10-25 16:15:13'),
('312161e51415b09677c6ddce62527fb32d0aea9fbf828204ae78bd1f2a7e51b6b705a1e0c6326576', 21, 2, NULL, '[]', 0, '2018-09-25 00:32:22', '2018-09-25 00:32:22', '2018-10-09 17:32:22'),
('31906380ce82dadaf27a44dad3990be39be0e65a0e5b3e17e4e7d4881fafd2b40ce47e2750e6b68b', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:22', '2018-09-15 18:08:22', '2018-09-30 11:08:22'),
('3195c6953299f5dded0c8e9e3e545c6e88e20cb195d557c70178db3a80b784b398d618f0ae2d9cd4', 1, 2, NULL, '[]', 0, '2018-10-05 22:29:27', '2018-10-05 22:29:27', '2018-10-20 15:29:27'),
('31d82c500ae0c980a5aea86f4126c764079946ea205a9e11a7b3064587a7b879af556f8224770b0c', 122, 2, NULL, '[]', 0, '2018-05-21 02:59:48', '2018-05-21 02:59:48', '2018-06-04 19:59:48'),
('31d8e888febb15bc0762ee58e476804fad74a2ade02b795b24403d4339738909f5735e71d704da55', 5, 2, NULL, '[]', 0, '2018-10-09 02:09:23', '2018-10-09 02:09:23', '2018-10-23 19:09:23'),
('31fa4296f410b8bdf390089ec4fe3a6e45fee2cc09b8d482661aed711dbc2fc2ce8b02e1bbc3d4d7', 4, 1, 'Personal Access Token', '[]', 0, '2019-07-08 20:14:25', '2019-07-08 20:14:25', '2029-07-08 13:14:25'),
('32c3168cd43100c843a2b8e889ac6ac6c6da7393c975ec9caf3e6f25c82a80957ede97704ab0a352', 1, 2, NULL, '[]', 0, '2018-10-05 22:33:02', '2018-10-05 22:33:02', '2018-10-20 15:33:02'),
('32c4e3e060ac502a32262291728045eb2db01487afba4a5c632e5a1283bba4cb12b852e263ed4af1', 113, 2, NULL, '[]', 0, '2018-01-27 10:07:25', '2018-01-27 10:07:25', '2018-02-11 03:07:25'),
('32e3bdcc30f8b998668ee6864c2a2fbb8bb38ba34b4858ffa2f6a28c9fcfb9c69aa83ce0d016d1c1', 120, 2, NULL, '[]', 0, '2018-09-14 19:30:14', '2018-09-14 19:30:14', '2018-09-29 12:30:14'),
('32ef46fbc1222e392e1f95a48bc93d90ae483542d69a3d03a1e8584f56194a741a2a7870752a8edb', 1, 2, NULL, '[]', 1, '2018-09-15 21:46:52', '2018-09-15 21:46:52', '2018-09-30 14:46:52'),
('3304292a70c48aadf09b7b857d2304a7a2b24d31f8a2986a6bb8fcab8e3e1ccb12b18c41750e5024', 1, 1, 'Personal Access Token', '[]', 0, '2019-03-29 23:04:06', '2019-03-29 23:04:06', '2029-03-29 16:04:06'),
('3356c7bbc2920e26e6cddad8f79edcf92b642d1604ecdeaac387955f091f328e3a2d4a5b87f0b70b', 4, 2, NULL, '[]', 0, '2018-10-04 01:59:29', '2018-10-04 01:59:29', '2018-10-18 18:59:29'),
('335ba5e662360f21298041730fb4b615df741ff9d06a5a553d1666c5f577b0ef1e1bde3766535ba2', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:52', '2018-09-15 17:53:52', '2018-09-30 10:53:52'),
('338325d3d9c5fdf3b02267589b31d329c045147e2db8bc9f9a36da22b3101e591d2e981f2c081bcc', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:32', '2018-09-15 18:01:32', '2018-09-30 11:01:32'),
('3399a6f7aa3b3d9f7a2dd3b8b276c0ced9f4dd4d9180e4f570166ca16cab392bf51d36896de93d37', 4, 2, NULL, '[]', 1, '2018-09-16 06:54:22', '2018-09-16 06:54:22', '2018-09-30 23:54:22'),
('33e6a869674569649a88dc9c6d1476f6662e5730f441ef98cb028230840d2be6fbb591bdd324f140', 35, 2, NULL, '[]', 0, '2018-11-20 11:07:02', '2018-11-20 11:07:02', '2018-12-05 11:07:02'),
('33ff204fc0f9b62553e2fb95b59ce4eed0f8b340f46bb689744833c11186ccd6e2524de076d9ffbc', 14, 2, NULL, '[]', 0, '2019-01-18 20:51:43', '2019-01-18 20:51:43', '2019-02-02 13:51:42'),
('3404eaf623ddbf5fc3efcc1378672857ae6337b184dd48c33a0acf9efc513690328ecb87e64127a6', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:07', '2018-09-15 17:48:07', '2018-09-30 10:48:07'),
('34513a111f218ff583744d0ee908011c83a4d09e5282fe11e6e9827edca8a57dc821475626b8ca8b', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:42', '2018-09-15 18:03:42', '2018-09-30 11:03:42'),
('3493f94a6ab0547a3a114e5662407493d2da0cd0eec4f04032ed9419f5edb1f38e75d9efcc86f377', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:34', '2018-09-15 17:48:34', '2018-09-30 10:48:34'),
('3498f0b8b21a23b08804fb54acc9797f2be41f475037edca34cc42b2c80dd190ed4ac4337c0ccee7', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:17', '2018-09-15 18:03:17', '2018-09-30 11:03:17'),
('34ca8bc924bb02b4560cfffb58ce078c5f90bb17cf5df825ce73f45bdaebf3eae42af707a6b86bcc', 4, 2, NULL, '[]', 1, '2018-09-16 06:43:05', '2018-09-16 06:43:05', '2018-09-30 23:43:05'),
('34d86ecf5edcc38dd3a8954f306f64d4ecde339fc5b25806bce14fb7b8a154246ecd4b217518ae26', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:12', '2018-09-15 18:09:12', '2018-09-30 11:09:12'),
('34f498ebaae2957902d897a13e2fc839d4dafa19dfafe5aa5a9a741a70f140c974ef2fbc5496cc6f', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:27', '2018-09-15 17:51:27', '2018-09-30 10:51:27'),
('35045a0186c79511a2c87978c03868d1335d515c52c8c166a89612fefb0c2a349505bdc1e1d0c625', 146, 2, NULL, '[]', 0, '2018-08-07 20:19:29', '2018-08-07 20:19:29', '2018-08-22 13:19:29'),
('357410ad36088382774ce2bff7d61850370d7b95f238718727661aba659e65ed5974d0d6f0a323fb', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:52', '2018-09-15 17:49:52', '2018-09-30 10:49:52'),
('35b8a9e903fb78e4d6f56dc64c2d118ab5621c36851eacc65eff4a1fbef133c7b20ad4a5d866ef02', 3, 1, 'socialLogin', '[]', 0, '2018-09-16 01:24:02', '2018-09-16 01:24:02', '2028-09-15 18:24:02'),
('35ed187217df32021e90853d64004225e61997179154f4c2d114e24266f7e5168ffbe2d239a25a2f', 14, 2, NULL, '[]', 0, '2018-09-22 18:26:13', '2018-09-22 18:26:13', '2018-10-07 11:26:13'),
('35f1d5cc69a754caabeda540f171553e46586afd005658089f014a3b54ee393db5c9ba02578ab7d1', 146, 2, NULL, '[]', 0, '2018-08-06 18:43:12', '2018-08-06 18:43:12', '2018-08-21 11:43:12'),
('35fd87a8b1453463297cb981f5b5b5aa6920bfc033720484b075f6364d32493e86821fb76b9aa2d0', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:07', '2018-09-15 18:03:07', '2018-09-30 11:03:07'),
('365e3b87177eabb27dc81887a8f81b09c1dff685c68f87158c4b6707594b9e51e297df83e39205d2', 156, 2, NULL, '[]', 1, '2018-09-14 06:00:04', '2018-09-14 06:00:04', '2018-09-28 23:00:04'),
('369b41858b7ef2568ef2fdee38ca98805f70de1635d0d0c2b31885c72a7865a8c5f6e9cf9da72e13', 3, 2, NULL, '[]', 0, '2018-10-05 01:52:19', '2018-10-05 01:52:19', '2018-10-19 18:52:19'),
('36a1ff46f967d9dd433232fbbe7be0254dfc1ace63498406c166bdcb4fbefbcdf0f948c75517369b', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:02', '2018-09-15 18:05:02', '2018-09-30 11:05:02'),
('36a4b72c0e877dd61c3e79168a7fabf69c73284af0516da4d64c06cdc86e8cc31249cd7515f83603', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:17', '2018-09-15 17:52:17', '2018-09-30 10:52:17'),
('36b95ea4a0f719959bf0e335d1d9ff87fd7824d7b222240757a18138e055c99e4d960e0dbacd7902', 23, 2, NULL, '[]', 0, '2018-09-20 23:55:04', '2018-09-20 23:55:04', '2018-10-05 16:55:04'),
('36f66802ffddc5a4f77b04e23e0e73e6157251d3aad78869dd4514dcfcde257cb5680b33e49085a7', 1, 2, NULL, '[]', 0, '2018-09-26 17:55:58', '2018-09-26 17:55:58', '2018-10-11 10:55:58'),
('371f699cba0da1cdd0cd7650517a1b4197729881d82787164f03991723fa5e12efe73ca013fcab8d', 1, 2, NULL, '[]', 1, '2018-09-16 00:19:29', '2018-09-16 00:19:29', '2018-09-30 17:19:29'),
('37420e96c6e806391d769e8adb230733b37eb01c2c7a0e578c04c82ef38b8ce41c2578f0e27cb356', 22, 2, NULL, '[]', 0, '2018-09-22 18:13:31', '2018-09-22 18:13:31', '2018-10-07 11:13:31'),
('3783bfaff5d300d9e9149dc5d07638e4c3438031b617194bd5c55c3431e1951b2ea640fdf4c6872f', 9, 1, 'Personal Access Token', '[]', 0, '2019-07-10 01:18:08', '2019-07-10 01:18:08', '2029-07-09 18:18:08'),
('37eee2b75c70bc89d3923e943af7574c20e5f604873bd5830fbd09f9fe55703c8b0ae9c315cd1e51', 79, 2, NULL, '[]', 0, '2019-03-06 23:08:07', '2019-03-06 23:08:07', '2019-03-21 16:08:07'),
('382615e5efa09cdf8f9393bfb4ec98ae5a7639776f6460a4d349ee73aa4f01e4ebd47ba5d9959569', 1, 2, NULL, '[]', 0, '2018-09-20 19:57:03', '2018-09-20 19:57:03', '2018-10-05 12:57:03'),
('386b223ab6c99a9d3c72ed4b8d877979eba677b78567903b60d6a8ad7a7758bbaa85fc0e3cbb7f32', 144, 2, NULL, '[]', 1, '2018-09-12 23:00:13', '2018-09-12 23:00:13', '2018-09-27 16:00:13'),
('3885be5e80db4d2e9e814ebf3d27841edfce0baf60717b06124abb8ea7560e392630dac2a8ee1ae9', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:35', '2018-08-10 23:12:35', '2018-08-25 16:12:35'),
('38906f1c5cda57b72cba7b971fea09e009627118b9bdae2e20cc5f299b27f67b8ede707e2337e957', 14, 2, NULL, '[]', 0, '2018-09-25 00:37:46', '2018-09-25 00:37:46', '2018-10-09 17:37:46'),
('38988d3e8a450635febce017cab0c8462d9970f2064ca36accc124b005a90411de2a8dacba7c2a53', 21, 2, NULL, '[]', 0, '2018-09-20 23:20:56', '2018-09-20 23:20:56', '2018-10-05 16:20:56'),
('38b371abfb92f06964c82bf91c1539e40ffded2aa8d98fa4b4472ae0a86f330a9baf4b142e4eca3f', 43, 2, NULL, '[]', 0, '2018-11-22 17:07:05', '2018-11-22 17:07:05', '2018-12-07 17:07:05'),
('38df08c8dbeff0622889d953c9bacdca6cfb9048e763a1485632a7375eca2ad947243fdbdaf97b82', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:27', '2018-09-15 18:09:27', '2018-09-30 11:09:27'),
('394ac4c0954b78326999b0dce73a257e864bdd25bff397d4c77c022bd4da90b7990c4117902ee520', 6, 2, NULL, '[]', 0, '2018-10-08 17:57:43', '2018-10-08 17:57:43', '2018-10-23 10:57:43'),
('39759deabf02e36855d5e17381997ebde5b46c896efec9cb5722d2553a2dbd96ea6fcdf5808b9fe5', 59, 2, NULL, '[]', 0, '2019-01-04 21:35:55', '2019-01-04 21:35:55', '2019-01-19 21:35:55'),
('397c9406688aa895b73fc9573495e2cb7b87d52ff3dba0875674c80cd105c38e08c586d9c7813a75', 5, 2, NULL, '[]', 0, '2018-10-09 02:12:55', '2018-10-09 02:12:55', '2018-10-23 19:12:55'),
('39c6443130f0d967bd53fde4db11cd1a9fe7c01f233f5f472ed436bfb61c1697162a5c7a51114de6', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:37', '2018-09-15 18:05:37', '2018-09-30 11:05:37'),
('3a2c68c36096b77995a423d0da018fc8ef42054bf95955347dc36402432ba4dde129f860c13650e9', 146, 2, NULL, '[]', 0, '2018-08-01 22:39:46', '2018-08-01 22:39:46', '2018-08-16 15:39:46'),
('3a7db092a9e8fd05ff1c1021b318d9a0935899e726bd8a7b32f22b951824a59706a243eda6b76c36', 4, 2, NULL, '[]', 1, '2018-09-16 06:48:25', '2018-09-16 06:48:25', '2018-09-30 23:48:25'),
('3a92d87d99c270ad258060e305a69260e6627e743866a4153a8831e3ce898a5044ac2ecad87004dc', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:02', '2018-09-15 17:56:02', '2018-09-30 10:56:02'),
('3ac727d7b5ccdbb68d6a98ab60eac224dd7c67e4332302eb9c1a53d4fa6d32c268b4783f9b8fc8cb', 4, 2, NULL, '[]', 0, '2018-10-05 21:47:25', '2018-10-05 21:47:25', '2018-10-20 14:47:25'),
('3ae315c70d3865877c0a6ffa72ecc9335710309f0c7c98d484bc5d0595c384814729191edddba4ed', 14, 2, NULL, '[]', 0, '2018-10-22 10:39:03', '2018-10-22 10:39:03', '2018-11-06 10:39:03'),
('3b28622c69677dacb22cd3886727c8f2e93efba57cb6b6c965841469ed69c6bc2d7b22a255d0d560', 78, 2, NULL, '[]', 0, '2019-02-23 08:57:33', '2019-02-23 08:57:33', '2019-03-10 01:57:33'),
('3b6546a847a3954e55862bd71e93c6ddb35f69a1ae621cbb96f3b6920b9d1f9591d485a7ffa5f575', 59, 2, NULL, '[]', 0, '2019-01-04 22:05:44', '2019-01-04 22:05:44', '2019-01-19 22:05:44'),
('3bd147c5944ec4405f021b2e48d0b24990edb1b80b4d1fe5ed9f8cc097f5387041137048fb3b84cb', 154, 2, NULL, '[]', 0, '2018-08-26 01:55:31', '2018-08-26 01:55:31', '2018-09-09 18:55:31'),
('3c00d701156cbf53e24179bf50541a0af0e79329779aab3f3befe44c1904e4a4894302115cadec9a', 5, 2, NULL, '[]', 0, '2018-09-16 03:46:21', '2018-09-16 03:46:21', '2018-09-30 20:46:21'),
('3c91e3c50116b44a78ad08ef3aec9d1e968fff8e0df3a6fd33b3c322877d133a8d7d269cb982c879', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:44', '2018-09-15 17:44:44', '2018-09-30 10:44:44'),
('3c9cc1ff8abfa557f42218f3658834da374d1302676967634714e04841a97b864bba0044534f1a00', 5, 2, NULL, '[]', 0, '2018-10-06 17:26:06', '2018-10-06 17:26:06', '2018-10-21 10:26:06'),
('3cb5daf4d3e006bbf2b8ef006db3b205a76be1df22c4e253ef6bdea15aab88dc2cb4569c41e17ca0', 83, 2, NULL, '[]', 0, '2019-07-05 00:32:31', '2019-07-05 00:32:31', '2019-07-19 17:32:31'),
('3cc03350481328446fe7df90249e14030c9521ce75595c71fdcdbe79d335463ccd202b60d7cdc1ba', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:32', '2018-09-15 18:04:32', '2018-09-30 11:04:32'),
('3cca82853b765a22e9ff3354fdc93d1707dcd37f7bd5f3994ce279d4fe611e6b8c1e3ed63eda9a4c', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:07', '2018-09-15 17:47:07', '2018-09-30 10:47:07'),
('3d0c0f3c2c2f50ee6c0bbd089f5af77ba4a29e34d7a97165fdb9adfff23939e75dfde3b4abb14f93', 10, 1, 'socialLogin', '[]', 0, '2018-11-28 12:21:35', '2018-11-28 12:21:35', '2028-11-28 12:21:35'),
('3d2a54fb0c7bbee4569a7682cebfd762f3ea5806e1312eb7d31fa314f8c65329d879c40d3ef9755c', 4, 2, NULL, '[]', 0, '2018-10-04 19:00:38', '2018-10-04 19:00:38', '2018-10-19 12:00:38'),
('3d3a148ca3fbcba449c5a877a0a6b95c4dd795de217b8b909e102cc08739478e32f587d3dc4d82b2', 19, 1, 'Personal Access Token', '[]', 0, '2019-05-15 05:28:16', '2019-05-15 05:28:16', '2029-05-14 22:28:16'),
('3d4a621760d55a5aad6ee5ba2f982ed0ebb86bd7309682a7aec827ca8a3e6166974d58aaaa3c7038', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:47', '2018-09-15 18:02:47', '2018-09-30 11:02:47'),
('3d78c6629448368906053c1ac9cc706a355546f5ee21e7fcf0ac3d07fe9e9ba9756aac82faac68bc', 46, 2, NULL, '[]', 0, '2018-12-01 21:34:37', '2018-12-01 21:34:37', '2018-12-16 21:34:37'),
('3daa7c9262d4f507a9b928fddcfa649e4ddc603ef670528ec910758157ef1bd346515385cec53608', 14, 2, NULL, '[]', 0, '2018-11-19 15:11:44', '2018-11-19 15:11:44', '2018-12-04 15:11:44'),
('3df2c78704753c0a614eed84504658fdb85ded74183d6c0c1083b8d75b65705674992c143fea4be4', 146, 2, NULL, '[]', 0, '2018-08-07 20:19:27', '2018-08-07 20:19:27', '2018-08-22 13:19:26'),
('3e8469861dfda2f8f38ae9df18d2ae361ee5b7e49f4c956991952768295924b9a93155000231405c', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:17', '2018-09-15 17:59:17', '2018-09-30 10:59:17'),
('3ed7493e8c05fc8e96ed03066099850da3edcc7779d27e6dc1e906c175411951769b9ebdc5a10e1f', 156, 2, NULL, '[]', 1, '2018-09-14 18:52:32', '2018-09-14 18:52:32', '2018-09-29 11:52:32'),
('3f074cbb9b0471ef96b221f941a7ae4880150b60c94b1fa49c7ec787269fffb599978227c588ea79', 150, 2, NULL, '[]', 0, '2018-08-11 23:57:58', '2018-08-11 23:57:58', '2018-08-26 16:57:58'),
('3f27d4eb471544651a30b817592de37dbe6dc5123b584c084a353d29f6f0ce7c614a9902a895aca5', 108, 2, NULL, '[]', 0, '2019-07-08 20:54:51', '2019-07-08 20:54:51', '2019-07-23 13:54:51'),
('3fbcfbadcfd91e5d55b37888fab02d9d458074956042b95829071b416df222f15f9d6a138c5292e7', 146, 2, NULL, '[]', 0, '2018-08-08 20:29:40', '2018-08-08 20:29:40', '2018-08-23 13:29:40'),
('3fd6e58b0e569d0b5c322b481e2ece8b89d0c0030709acbb13bfaa02888a2b36a4adfcdfdd1a1b47', 62, 2, NULL, '[]', 0, '2019-01-21 23:21:17', '2019-01-21 23:21:17', '2019-02-05 16:21:17'),
('3fe77448a04e1d1b69a717e40dd0a89c921fbec9a0ca862e207f711903f0d385c71afa683d951992', 156, 2, NULL, '[]', 0, '2018-09-15 18:10:14', '2018-09-15 18:10:14', '2018-09-30 11:10:14'),
('4001a346cb942f05cf36abb828025758586bd65fd6d22647b9c09aaf6ede9f8087d9a2cd93d6b20a', 14, 2, NULL, '[]', 0, '2018-10-25 12:52:23', '2018-10-25 12:52:23', '2018-11-09 12:52:23'),
('40101a0ff49a13e6738c89732d898bd68581f25ddfd24529bdeb5238904def3a9bea6f03e339da59', 132, 2, NULL, '[]', 0, '2018-06-15 17:46:52', '2018-06-15 17:46:52', '2018-06-30 10:46:52'),
('4046b93063820af2000c1b37328aef60c3679fa465fe2e11755ef8076d0436e2be9e37ce3678b0df', 5, 2, NULL, '[]', 0, '2018-10-09 22:09:48', '2018-10-09 22:09:48', '2018-10-24 15:09:48'),
('40c5bdc8cb299ec3f03ec1243dfe73aec1802d627539db964c8ce4ef129adfa582a8ce6abbcb9b82', 6, 2, NULL, '[]', 0, '2018-10-08 19:32:45', '2018-10-08 19:32:45', '2018-10-23 12:32:45'),
('40d3e325ccb65c5c409b3da7b1e698ebf9c1744a2804ef10ab1d81a66c96246b04e06499c87ac574', 2, 2, NULL, '[]', 0, '2018-10-06 18:33:09', '2018-10-06 18:33:09', '2018-10-21 11:33:09'),
('40e977bfaa6dd0484478f29bb3aafd88e4363ad9d84b35cd1fb05a5d9605952ec5001d93b4afb118', 38, 1, 'socialLogin', '[]', 0, '2018-11-13 21:36:47', '2018-11-13 21:36:47', '2028-11-13 21:36:47'),
('412a02563bbfa291e1cd0e007d1d865502ab1a46501cacde2bd74e4980427b7f72572489d101eeb2', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:43', '2018-09-15 17:52:43', '2018-09-30 10:52:43'),
('416b9025e9b10a8f4254d54c84b2e9133531837daaead9b5494731cf98c0103041f98f58d934b702', 83, 2, NULL, '[]', 0, '2019-05-09 04:30:24', '2019-05-09 04:30:24', '2019-05-23 21:30:24'),
('4179da29ac4f3c543c2ad8d37a17d9ada47e97feb4f39105987180585e77561fdc8cb791aa133caa', 3, 2, NULL, '[]', 0, '2018-10-04 22:01:57', '2018-10-04 22:01:57', '2018-10-19 15:01:57'),
('417b917cc8700117a510299162fdf5ab4c261ce855384ff86c165f72baf90507c28f1c8ab32bcbd5', 1, 2, NULL, '[]', 0, '2018-09-15 18:23:41', '2018-09-15 18:23:41', '2018-09-30 11:23:41'),
('41978dbc4b5f210d465f562d51139378a1ca6f79fc8ce10d2756158c7d568a115feb83d34a39d884', 19, 1, 'socialLogin', '[]', 0, '2018-11-27 18:54:16', '2018-11-27 18:54:16', '2028-11-27 18:54:16'),
('4199664eb67668ca2a342229154197acd91ea4f7742ec2d82b915b5fe50d95cacedee8d09b8a0872', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:27', '2018-09-15 18:05:27', '2018-09-30 11:05:27'),
('41aed2b69d58b542535446c6fd91870bb9dfd84bf8411c161de2a44bb2318b200e490d860238de0a', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:22', '2018-09-15 18:04:22', '2018-09-30 11:04:22'),
('41fa7779090f598e74a166fb01da9675f85a1d50c63dc8b71101cba67338b28b89223b7033fc5950', 110, 2, NULL, '[]', 0, '2019-07-04 20:27:50', '2019-07-04 20:27:50', '2019-07-19 13:27:49'),
('4204a9de2f3cc84fed73411161af160d4b4f74b3c422d4fe198ccdf7735c9579f537b82fbe5f68c7', 8, 1, 'socialLogin', '[]', 0, '2018-10-18 10:53:18', '2018-10-18 10:53:18', '2028-10-18 10:53:18'),
('426852b88596ebec41c86babfdb274f3b18050903e6005683a9e22a293a421c9a21019c19fe73cda', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:42', '2018-09-15 18:01:42', '2018-09-30 11:01:42'),
('42844375bc8ef0d5bb8b7d72e98791f42d366b9a604816ea93fc3f590be8692acefbdf911911016a', 6, 2, NULL, '[]', 0, '2018-10-08 21:42:33', '2018-10-08 21:42:33', '2018-10-23 14:42:33'),
('42c421e02f00f8bbc749730d46c5a7cf64de551bfa3c90042f17f4376962757f795ccacb22ca9d34', 156, 2, NULL, '[]', 0, '2018-09-07 00:27:08', '2018-09-07 00:27:08', '2018-09-21 17:27:08'),
('432603e616545dd8bbea3df23b9d132be9b6a3c2a80ee20abcd52e7d7a0bc683d49d0e72fdb5cfd8', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:27', '2018-09-15 18:03:27', '2018-09-30 11:03:27'),
('433c3a9008bd334260df1169a2506bd2f7e409eb392ddc88d958ff0e2be752324f3fa89e6ee68bee', 18, 2, NULL, '[]', 0, '2018-10-14 19:17:09', '2018-10-14 19:17:09', '2018-10-29 19:17:09'),
('43903e403d7fef50cea9c76ac97d34694dd560acb801f34026551d9ee7464c88a8f1beba1ac8aa18', 86, 2, NULL, '[]', 0, '2019-05-13 22:30:39', '2019-05-13 22:30:39', '2019-05-28 15:30:39'),
('4395bf82f85aec1160a69b409080a6e53bc48742ca55761c5891315faa4dcf61da64c51739e345e7', 2, 2, NULL, '[]', 0, '2018-10-12 18:25:02', '2018-10-12 18:25:02', '2018-10-27 18:25:02'),
('439f32e5db0b4dd6ea7e2282857fda09dc0154a7e80fc746e51a4d764853dfb63a5bf34f9b7b04e5', 17, 1, 'Personal Access Token', '[]', 0, '2019-04-18 19:44:46', '2019-04-18 19:44:46', '2029-04-18 12:44:46'),
('43d5a3b36c87621cc334f705b712c21d913e98397f8d037f4fc5088e71bc96d3aea229d3d68412fe', 1, 2, NULL, '[]', 0, '2018-10-05 02:22:18', '2018-10-05 02:22:18', '2018-10-19 19:22:17'),
('43d72e7b689b415dcbc52281c9f596f8ead42be0685af6c6050a2c63bf17291cda5babd1dc892764', 10, 1, 'socialLogin', '[]', 0, '2018-10-18 11:10:08', '2018-10-18 11:10:08', '2028-10-18 11:10:08'),
('4471b8408f0ea3839d908d60fd8b45675fe4e4bfcd1f698cc7a07a80ac60b5122da503e46b61872e', 120, 2, NULL, '[]', 0, '2018-09-08 17:28:51', '2018-09-08 17:28:51', '2018-09-23 10:28:51'),
('44ac0ebbb23f5f7409a2a978f302c2be2f649879a64a5a9a842eb92234681bddc24135d6fe3f83a1', 22, 1, 'socialLogin', '[]', 0, '2018-10-24 13:30:53', '2018-10-24 13:30:53', '2028-10-24 13:30:53'),
('44c6f04ae850442f99b1e37c092a885b66de5333eb3e91cbb0e9738a5202c2edbf073a043d70061b', 144, 2, NULL, '[]', 0, '2018-07-23 00:12:33', '2018-07-23 00:12:33', '2018-08-06 17:12:33'),
('4501c07a2c3f5880be877dd014c565ae5e6688d3c4ffb4092069f93813b33e2b805c07a7ff00408d', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:17', '2018-09-15 17:57:17', '2018-09-30 10:57:17'),
('455cf0c78b251e82cd6d1ac367bf83c4c08ae7b443a85796b5cfc3daf87790673f92a444ea86ca97', 4, 2, NULL, '[]', 0, '2018-10-06 00:56:20', '2018-10-06 00:56:20', '2018-10-20 17:56:20'),
('459dbe7db9580fa8fc68c86b2dea4e4006998446d177dd6fb72ab1fc6464fb570694b03882b12252', 144, 2, NULL, '[]', 0, '2018-07-22 01:57:24', '2018-07-22 01:57:24', '2018-08-05 18:57:24'),
('45ccaccce61284ce642c85287886d83d11c3be24ae95338665b8a48268fdf74f93dec3d621760c56', 4, 2, NULL, '[]', 0, '2018-10-04 18:17:36', '2018-10-04 18:17:36', '2018-10-19 11:17:36'),
('45d58820cadf90ed4ca1a741bbef17385c9018752991baf6286825950b09c28a0292d4ad8cbf8c15', 58, 2, NULL, '[]', 0, '2018-12-28 20:45:40', '2018-12-28 20:45:40', '2019-01-12 20:45:40'),
('4615b47200d24d6df7710fb4cd70442ff60263f1d9539c9457f1de9de316395a47e71e541c9871fa', 7, 2, NULL, '[]', 0, '2018-09-19 07:19:02', '2018-09-19 07:19:02', '2018-10-04 00:19:02'),
('463a41fa14c6fb6ee0f94e0f212af366c5606658dbfcf88db7107cc0ebad68f58cfebc75a8570fb8', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:07', '2018-09-15 17:56:07', '2018-09-30 10:56:07'),
('4658c085bf8700c3d592e49b424935790c5496562ffd9e9b3e3abd2acfe3f6784211c55f4660e4fa', 4, 2, NULL, '[]', 0, '2018-10-03 22:57:01', '2018-10-03 22:57:01', '2018-10-18 15:57:01'),
('46650d28902c558ec3c413f56033de4b8c3ee4744c355a6662cf2c71647ac30de3ed1ee28c498200', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:22', '2018-09-15 17:44:22', '2018-09-30 10:44:22'),
('468077d2bbf79808376f85a0a9d041acbeca4d17f4e0f5efe4fe4c5b4c47232ead05f35a48ef0d86', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:57', '2018-09-15 18:04:57', '2018-09-30 11:04:57'),
('4715a4e15587d2a22e14bcaefa598ff66774a9ca12cf6c9e6865816a110b3e3ff96cbb88be85b774', 146, 2, NULL, '[]', 0, '2018-08-01 18:20:26', '2018-08-01 18:20:26', '2018-08-16 11:20:26'),
('47543d4121202b1ad56538007f860e87ffa60ea584d94550a96781a5272185ec0a8a984659dccce8', 1, 2, NULL, '[]', 0, '2018-09-19 22:51:42', '2018-09-19 22:51:42', '2018-10-04 15:51:42'),
('4780186ee9dc3badec7944527a7f93071facccb90215e0783a504a7539f8c6045c00a2490432fd73', 120, 2, NULL, '[]', 0, '2018-09-12 21:06:03', '2018-09-12 21:06:03', '2018-09-27 14:06:03'),
('47a1f3c50fd3f531e7ddf798d7a2aae27f71cff7f1604952cf4c063c17c3afc2e1f02d5612a84bcc', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:22', '2018-09-15 18:07:22', '2018-09-30 11:07:22'),
('47c127ee1a8ee83f8b15ece3ec7f0a71d4d467985ef6cf9c3c173170e6655334d47a48ba771e26b0', 152, 2, NULL, '[]', 0, '2018-08-23 18:47:26', '2018-08-23 18:47:26', '2018-09-07 11:47:26'),
('47e8b8114659d83a0737c1e14a642533f4b2224d7a925ab596315bb9418a09aaa52c965990877b8f', 122, 2, NULL, '[]', 0, '2018-05-23 05:36:57', '2018-05-23 05:36:57', '2018-06-06 22:36:57'),
('47f9641bf9f184e7bde4eeeadd73092a71083c25f4349d201a54310cddf86c0c1ea88bf58c324317', 150, 2, NULL, '[]', 0, '2018-08-11 00:19:13', '2018-08-11 00:19:13', '2018-08-25 17:19:13'),
('481e52cee68e505c84380c97b34e7bd54c0c2d0d496550e71d83523e8c1e949e369080f7d8650b0b', 84, 2, NULL, '[]', 0, '2019-06-23 01:49:10', '2019-06-23 01:49:10', '2019-07-07 18:49:10'),
('48516326e9b25c0335187b385fc249c3c47866fdba617c5711e779ffd8f98b5c5277ed25ce485395', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:12', '2018-09-15 17:57:12', '2018-09-30 10:57:12'),
('48a82bf8f6c9e48bcf9768b057f830a0490a9fbd1e4eb7a79083c8de9b37848d2a784b8e12ff65b9', 86, 2, NULL, '[]', 0, '2019-05-09 01:17:12', '2019-05-09 01:17:12', '2019-05-23 18:17:12'),
('48e76e3cdcd1d62202bebaca6384cda70eb274db7a33453c018d40381ce0eb0e113022aa5d71731d', 146, 2, NULL, '[]', 0, '2018-08-02 01:04:57', '2018-08-02 01:04:57', '2018-08-16 18:04:57'),
('493ebc86cfafcb8169964e592312711789460fefc9810a61e6c238c41bd5101ae1e21e4f4446b38b', 3, 1, 'socialLogin', '[]', 0, '2018-10-15 23:36:57', '2018-10-15 23:36:57', '2028-10-15 23:36:57'),
('499ce8f75991230ac797bbf8840b2fe040bf3041fa2c90ab1f474ce5bdfb8d3c2d858e171176edb9', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:52', '2018-09-15 18:06:52', '2018-09-30 11:06:52'),
('49cc4ae96a888c202b907e9fb50720169a8d86dc2fa942b1af32af470b492ae852fa28e07b2d3c16', 1, 2, NULL, '[]', 0, '2018-09-29 17:17:20', '2018-09-29 17:17:20', '2018-10-14 10:17:19'),
('49eecbfbd9156cf18be294141564bb95ae4b0196a7a4e93d2cafba77947a12f8c7bd94a31b2b5ad0', 1, 2, NULL, '[]', 0, '2018-09-20 19:42:42', '2018-09-20 19:42:42', '2018-10-05 12:42:42'),
('4a0395bc244af7f61263ca9bfb46dbd2eb0df1d7b68de9c986082b21289ac464e594a20a825514ba', 1, 2, NULL, '[]', 0, '2018-09-26 20:07:01', '2018-09-26 20:07:01', '2018-10-11 13:07:01'),
('4a04f088afd4495e3f6ceb75afca0fab074dc260f2f9a2c061881763c5d9fa36404639df267f36c0', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:28', '2018-09-15 17:44:28', '2018-09-30 10:44:28'),
('4a0a54259fee1c2a9c915db14724796742b002023346095c41591a5f4f8e83b150b4ffd364b6baf1', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:27', '2018-09-15 18:00:27', '2018-09-30 11:00:27'),
('4a84f53e7d801e352e15387cf140cf3eaa60eaecb279d775d6d15e907e79744ae3cf2203c4b49cf4', 146, 2, NULL, '[]', 0, '2018-08-01 21:59:27', '2018-08-01 21:59:27', '2018-08-16 14:59:26'),
('4b388e170bc4845bef94c2186318d58af2756d72091dbceaa9d73afe14e96382261f1b7976120f1c', 146, 2, NULL, '[]', 0, '2018-08-10 22:53:33', '2018-08-10 22:53:33', '2018-08-25 15:53:33'),
('4b9630c3a50ae772c37cd97629c040e7679e458f90b5a420a8b55acc1f926ce8d330bb9635116d6c', 5, 2, NULL, '[]', 0, '2018-10-09 21:26:52', '2018-10-09 21:26:52', '2018-10-24 14:26:52'),
('4ba646a7c0b1328cc68d1445da744fa7b0b88590c1727502797669c37e0e1806bb9d506ae26ac3f8', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:46', '2018-08-10 23:12:46', '2018-08-25 16:12:46'),
('4bc488918e975b0abb51007984118cb5787a50f4b74e2133dcfb77213f3bd7cf18f2f5c1f3737d8d', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:47', '2018-08-10 23:12:47', '2018-08-25 16:12:47'),
('4bd331b8a48af41f2261285479a54d9e2c4cb502bfb81996845593e9d0b6b9877e9cea484f9f38ab', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:32', '2018-09-15 17:56:32', '2018-09-30 10:56:32'),
('4be087722eb74f40e192525da1ba58e2ce6bc3af0421f7d5f9127c5a6ad9b5a4450093badc4f446e', 91, 2, NULL, '[]', 0, '2019-05-20 05:28:47', '2019-05-20 05:28:47', '2019-06-03 22:28:47'),
('4bf4520f27282b90dd450b293c709fbc2a50fd3d6119df3ebe5f09ed5771f3f5132629c37f0ea72b', 86, 2, NULL, '[]', 0, '2019-04-16 23:10:21', '2019-04-16 23:10:21', '2019-05-01 16:10:21'),
('4c13a25927b818fde833897b9eef5a0565a87d00089e1bfbe7d67273dbc47406ef36129cb3039216', 6, 1, 'socialLogin', '[]', 0, '2018-10-17 10:28:26', '2018-10-17 10:28:26', '2028-10-17 10:28:26'),
('4c3ec6ee152b7407ace4ad919b9b4f5cf1881c811599f19073ed07d085a5164c13917b27d4bb71f0', 1, 2, NULL, '[]', 0, '2018-09-28 19:39:06', '2018-09-28 19:39:06', '2018-10-13 12:39:06'),
('4cef7ec792f391cb872c4bec0713b58af81c7bfcc985ea130f43cce40b42ee67f931f26d0a38c3ae', 144, 2, NULL, '[]', 0, '2018-08-04 21:36:40', '2018-08-04 21:36:40', '2018-08-19 14:36:40'),
('4d28450361653da8e71c1e30189350c9d62d4d67ea91f585a1a49b2094687cb98bdb5e7b12c3f651', 19, 1, 'socialLogin', '[]', 0, '2018-10-21 16:01:00', '2018-10-21 16:01:00', '2028-10-21 16:01:00'),
('4d58dc2e8cc886fe2dac72a09cb6dc15e06d76c4e72509e525ab81382be4ab785ce86304d8f8789d', 3, 2, NULL, '[]', 0, '2018-10-06 03:04:58', '2018-10-06 03:04:58', '2018-10-20 20:04:58'),
('4dd8e9257be3950fc5be106b6f8a29d7df6b16c56d374cfcd2bce53b771e6aa4992f9a81bbfe9c2a', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:37', '2018-09-15 17:57:37', '2018-09-30 10:57:37'),
('4decfd19567aeea91472c0b5ca04ad79839b2d06c5526113dafbd533c95df7d6f4931df3083fa7b6', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:57', '2018-09-15 18:00:57', '2018-09-30 11:00:57'),
('4e23f7d10e0121cc2a22734ffb6199f51530349cecf458a31c3bc98b52e620b7582f93d13022bb93', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:17', '2018-09-15 17:55:17', '2018-09-30 10:55:17'),
('4e3f8e7b84e212e6302cff7475a522fb9753834e4250dec9ed76fe7ff0edd886d9645639504f1ba6', 120, 2, NULL, '[]', 0, '2018-07-27 17:07:55', '2018-07-27 17:07:55', '2018-08-11 10:07:55'),
('4ed252f3014421d3b1ea5808b956a4d0f327e4929081abec1b967c8f155b5431a6eed5cba4ff5a90', 25, 1, 'socialLogin', '[]', 0, '2018-11-27 10:43:17', '2018-11-27 10:43:17', '2028-11-27 10:43:17'),
('4f6701683d3b9eb74de1ebf5ddcce91b5da5d7baec6795fc9f3d73813712c2f96328bd2b7f460b27', 156, 2, NULL, '[]', 1, '2018-09-14 19:33:35', '2018-09-14 19:33:35', '2018-09-29 12:33:35'),
('4f967de779e3cc01c4e05488bbdb7085b947031fcf2e6e8dbfa296470bc1908842421f67e69828f0', 21, 1, 'Personal Access Token', '[]', 0, '2019-04-16 14:29:23', '2019-04-16 14:29:23', '2029-04-16 07:29:23'),
('506e1b3477ff9a0cb351eed3aea47949207ba95422d16b901eca58063f82266233e9a7f1cb49a67b', 7, 1, 'socialLogin', '[]', 0, '2018-10-18 10:37:28', '2018-10-18 10:37:28', '2028-10-18 10:37:28'),
('50bb03e324fd16d0b9f7d946ca1b8052963bc784c9f32dd8befdbc6417ccac6ede9ef67e6a075a4c', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:17', '2018-09-15 17:50:17', '2018-09-30 10:50:17'),
('50f93180b3d9179e3522a2a432f4d8ef01f60b574f87562f9fac9ef9db8d1f2919c8111c2f99d5a0', 132, 2, NULL, '[]', 0, '2018-06-13 03:38:20', '2018-06-13 03:38:20', '2018-06-27 20:38:20'),
('51038c5d4117e09ae2cfc9a84872c5a90f2a8988e1ca45c095692f352c2c046778beab5b929df056', 19, 1, 'Personal Access Token', '[]', 0, '2019-05-15 04:44:59', '2019-05-15 04:44:59', '2029-05-14 21:44:59'),
('510fbef827d6967c37cf7968ecf3dc5cccc4c7248252bc03964430f849fd2c66074c6faf56bff2d7', 62, 2, NULL, '[]', 0, '2019-01-22 06:29:13', '2019-01-22 06:29:13', '2019-02-05 23:29:13'),
('51428af1991f9aa091894279395dd322cdfb422f31a0cd331a8e4c52ed844eea0b07fa2d0220db04', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:52', '2018-09-15 18:04:52', '2018-09-30 11:04:52'),
('519ede73dcaac1d41d1487e360b1a2a045feddad33472e672af2378e8fc7548a4dc1f75a5949c51c', 1, 2, NULL, '[]', 0, '2018-09-21 03:41:49', '2018-09-21 03:41:49', '2018-10-05 20:41:49'),
('51a7868737d117bc97c6db116b35923865d8cb8622220deb06da3b892911ada901b772018310aacd', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:12', '2018-09-15 17:46:12', '2018-09-30 10:46:12'),
('51fd839155c5bdd543d346cccfb21d74ebde65c7cc3c017c1cce82420d50d75f5b3a415c52129415', 149, 2, NULL, '[]', 0, '2018-08-10 23:12:56', '2018-08-10 23:12:56', '2018-08-25 16:12:56'),
('5211d4acfe0722935e60611fa36a8d92d0504291c68ded5e6d13ac04c95d142cbf15d764475319ce', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:32', '2018-09-15 18:02:32', '2018-09-30 11:02:32'),
('522872e8131f77899b5c518914363e268ab4e7a3a226c966ea93e28920a758dd14b2886851b5382e', 120, 2, NULL, '[]', 0, '2018-09-12 21:09:17', '2018-09-12 21:09:17', '2018-09-27 14:09:17'),
('5279adfea615002af35843e0692b3d7838d78621e5145af12b9b885a940993c51b34b728f94bf888', 156, 2, NULL, '[]', 1, '2018-09-14 02:26:22', '2018-09-14 02:26:22', '2018-09-28 19:26:21'),
('5279d94123a8607a215a4a8b469ce0b621753465e42cc41131272d23b32b8689359bd1333a3ae0dd', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:57', '2018-09-15 17:52:57', '2018-09-30 10:52:57'),
('529448ca4e0df3a94d6c4d5aedadb9aad3c1b5a1241e24098b45a8a29c1bb90cca50e99d3f6f1579', 82, 2, NULL, '[]', 0, '2019-04-14 19:28:53', '2019-04-14 19:28:53', '2019-04-29 12:28:53'),
('529eb528bec8d3bb250f72807a6c66651b2b2dba75fdaee01d2603af0be34b0e9c72a62032713898', 127, 2, NULL, '[]', 0, '2018-05-24 05:22:36', '2018-05-24 05:22:36', '2018-06-07 22:22:36'),
('53565310142da395a3c3570aa661fbeaa4675fda3dc735393698a7d665e8b7b46ef1db6c730292e4', 156, 2, NULL, '[]', 1, '2018-09-14 19:18:26', '2018-09-14 19:18:26', '2018-09-29 12:18:26'),
('535dabf758e58c68a7c9d03fd4c5db4fc08d84f1d1dce1f4db92e018f10f9dde1af1817a6e6222e2', 9, 2, NULL, '[]', 0, '2018-09-19 19:17:42', '2018-09-19 19:17:42', '2018-10-04 12:17:42'),
('5360b98de55dd730ccfe9f8c4333d9baa87a0d8f2a7156295ee20e531cfed4faed2920cb260f235c', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:07', '2018-09-15 18:05:07', '2018-09-30 11:05:07'),
('5367dc4e0073f33348d58fbaa01ac0bde7dfffcfad1ddfd0a6d4a89a13ff07d03f2e90badbae4f76', 108, 2, NULL, '[]', 0, '2019-07-09 16:13:15', '2019-07-09 16:13:15', '2019-07-24 09:13:15'),
('53f68042ede89e252778636b9d2f98ce296b62a8094e1f75609cb4b206881a048bfb3501fc1f1d4d', 14, 2, NULL, '[]', 0, '2018-11-01 11:20:20', '2018-11-01 11:20:20', '2018-11-16 11:20:20'),
('5410d439c88cc6045e68c09420c94794cc132c7e916ea9c71b7f3f09162b1f0a68446462dd946346', 144, 2, NULL, '[]', 0, '2018-07-30 21:35:26', '2018-07-30 21:35:26', '2018-08-14 14:35:26'),
('542690feaf68a7feaf9e3d4b1e0baad60ecbd4d295151df8991091486363bf1e7750b3348cd5db44', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:52', '2018-09-15 18:02:52', '2018-09-30 11:02:52'),
('546241d0fd04b831958ffc30a69c80013f44ad22041b3266361388a7d3fce6729f8acb9114764752', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:52', '2018-09-15 18:05:52', '2018-09-30 11:05:52'),
('557fd6c371473aa637ae5269331f6c1977e2f1dc337c9657f0075bdd01f524498691820b6f20a351', 19, 1, 'socialLogin', '[]', 0, '2018-10-21 16:00:55', '2018-10-21 16:00:55', '2028-10-21 16:00:55'),
('55942106300e68e3a4517345b4a783a7951150dcd36901831ffc4a0d8c98c9105909fe7f42d28cc1', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:28', '2018-09-15 18:06:28', '2018-09-30 11:06:28'),
('55a0e43850afaf95c1ead58d54d7b46f9222dd609d24884615f49057e057882d85bf5629f3b0643d', 156, 2, NULL, '[]', 1, '2018-09-14 06:04:44', '2018-09-14 06:04:44', '2018-09-28 23:04:44'),
('55a3b452c3a513b6368c77131b00963de90240fb735e39cd0593221158515397da1a9c2384ce4fca', 17, 2, NULL, '[]', 0, '2018-10-13 18:57:13', '2018-10-13 18:57:13', '2018-10-28 18:57:13'),
('55f9ffa3b262c6a1e194f91229b10ddeb9f31c944f30e6ec7918b1d865d94261cd6dedcae9656160', 146, 2, NULL, '[]', 0, '2018-08-10 21:54:48', '2018-08-10 21:54:48', '2018-08-25 14:54:48'),
('5647f3cf556c4e250eb0616cd0227b04d2318a9f3d70d3540fd50c95d42621bf49ec0e3095457e0f', 120, 2, NULL, '[]', 0, '2018-09-07 00:23:11', '2018-09-07 00:23:11', '2018-09-21 17:23:11'),
('5653bb00058b7e489f9da54faf5d0bcf49b42693901db9292c06a34b89210211e690121db387e215', 4, 2, NULL, '[]', 0, '2018-10-04 18:55:38', '2018-10-04 18:55:38', '2018-10-19 11:55:38'),
('565e636b6b93f845df897629217a4598b4b38d58f1bfcc49eaa34557345486984d0f0082e1155cce', 146, 2, NULL, '[]', 0, '2018-08-10 22:31:56', '2018-08-10 22:31:56', '2018-08-25 15:31:56'),
('56a103c9515a9911cae46645494add9dd1cc4d343d4efc015ee509744c5f82365679e097d225e741', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:32', '2018-09-15 17:51:32', '2018-09-30 10:51:32'),
('5711c11358f34adeb4997aa771e98d9f4fdda0166fe1ada67115989035a33039f3e69a4e229a73de', 35, 2, NULL, '[]', 0, '2018-11-26 12:07:32', '2018-11-26 12:07:32', '2018-12-11 12:07:32'),
('57431a8f0b8bee817f7c5933cc3997ef032b0acd368ac2f6d45d2562352c5a3822fb7235860f72a3', 35, 2, NULL, '[]', 0, '2018-10-31 15:26:33', '2018-10-31 15:26:33', '2018-11-15 15:26:33'),
('576aa9dfec9fc7c9ab9598e4164338078e522180a2e97a78b3ce8cb701daaa0c1d577a6d83441c8c', 83, 2, NULL, '[]', 0, '2019-07-09 03:01:15', '2019-07-09 03:01:15', '2019-07-23 20:01:15'),
('579a0a61b79ce8df4da4835e1fc5cf5d746333264c7992fae140b1581b0fc8a81052469733030a2f', 2, 2, NULL, '[]', 0, '2018-09-30 03:43:52', '2018-09-30 03:43:52', '2018-10-14 20:43:52'),
('57afbfd39d1976fe05c7a9a28796eb2c414998a9c1803b27662cbf442d5a87eff659cdbda06eec79', 2, 2, NULL, '[]', 0, '2018-09-28 03:28:14', '2018-09-28 03:28:14', '2018-10-12 20:28:14'),
('57ba3d2f07144cde13e2dba623a7e142b3393e3b807d80c086be7b19b865160873d56dbdbc07eb8a', 4, 2, NULL, '[]', 1, '2018-09-16 06:30:49', '2018-09-16 06:30:49', '2018-09-30 23:30:49'),
('57d2e5d6db1452f77fcda8042a1a2931ebb622b756d8913724709f59eb24cca932c75a259fe0ffe4', 7, 2, NULL, '[]', 0, '2018-09-19 01:16:46', '2018-09-19 01:16:46', '2018-10-03 18:16:46'),
('57ef19b726e572706ec57e75e304d12776b289decf9c4b18a21a1d943f78dea6a28a0ed73c517046', 86, 2, NULL, '[]', 0, '2019-04-22 20:10:17', '2019-04-22 20:10:17', '2019-05-07 13:10:17'),
('581986598a8a2c1bdacea0c6ae03a6470ef32631627128eafb9e0c7913d6cfe05d89fd40314510dd', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:21', '2018-09-15 17:46:21', '2018-09-30 10:46:21'),
('588d2a73dd73dc2dfc35762723e46eac6169110a2c8f3a4e025547af5976890d6db292eb7850ca37', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:47', '2018-09-15 17:58:47', '2018-09-30 10:58:47'),
('5892d5c5224aa4a3f921906a56cbccf3b58103ef8064c272657d791f8234f81ae065d66a05b527f2', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:07', '2018-09-15 18:07:07', '2018-09-30 11:07:07'),
('592afa9042beadb7e5a2c64c449df7a402a4e76c3e6b001b9289cdd6acd09f973994cc60039cf8bb', 73, 2, NULL, '[]', 0, '2019-02-23 03:54:25', '2019-02-23 03:54:25', '2019-03-09 20:54:25'),
('5964868a3f885baacbb00ecada5f356366d1b46a2d461cdf7d583a7326e327f530c509a55fe09505', 4, 2, NULL, '[]', 0, '2018-11-20 02:16:23', '2018-11-20 02:16:23', '2018-12-05 02:16:23'),
('596ec3077a7cd361a63319a14dbdd94b8f690fe8ee0e9799bff62e1c7f42fbee71e5d0b4f88629fc', 144, 2, NULL, '[]', 0, '2018-07-26 00:20:34', '2018-07-26 00:20:34', '2018-08-09 17:20:34'),
('5971cc519305c18513a2c2ff5f6c274f70c181166bcdc6b3bca2e029ec4d6c56a82ec2b83968d260', 154, 1, 'socialLogin', '[]', 0, '2018-08-26 01:15:40', '2018-08-26 01:15:40', '2028-08-25 18:15:40'),
('5988c861db7e461be09172add5df047df7d3f14ff71707b5e2ede0b9307e5d96b2bd0b5b537a300c', 7, 1, 'Personal Access Token', '[]', 0, '2019-07-10 01:20:50', '2019-07-10 01:20:50', '2029-07-09 18:20:50'),
('59dece0713f97bc3c0b976f307e094e6d657522b2c5a3b69a6755622fa187182b58c420b124bc74f', 154, 1, 'socialLogin', '[]', 0, '2018-08-26 01:50:46', '2018-08-26 01:50:46', '2028-08-25 18:50:46'),
('59f1c4dd9fb485d2c7c73f037a733824b78c719ba4dce45a4bf95317f56a2368e20e91a3ac7b9132', 13, 1, 'Personal Access Token', '[]', 0, '2019-03-30 00:09:47', '2019-03-30 00:09:47', '2029-03-29 17:09:47'),
('5a0548396529037308f93415d5ba9fb7e6c2793402c9aa3817b3d0cf2e31bbad0d421d2d975c697f', 132, 2, NULL, '[]', 0, '2018-06-06 23:04:07', '2018-06-06 23:04:07', '2018-06-21 16:04:07'),
('5a16dd83196e35008cd8e8e830c808180ba5974520d099060391eb909c2fee09978f95c7c029e4f6', 150, 2, NULL, '[]', 0, '2018-08-15 02:48:31', '2018-08-15 02:48:31', '2018-08-29 19:48:31'),
('5a7c6f23a6750874f28c6863a2f8ee43ffd8e6233cb7db531abf1d76d39f60c5ba10d2914d7ad5ac', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:08', '2018-07-20 23:22:08', '2018-08-04 16:22:08'),
('5ab7242ba979bd311dcec7a42efa943cb6dd3ff29e4d75cabd5bf4f5871414c3b66aab5468151b62', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:39', '2018-09-15 18:02:39', '2018-09-30 11:02:39'),
('5aba46d7419df0360e3dd8ee2fb0fa7f6de36e4fb1b8c70fa553beb7501bcccd70b23ac61e587998', 22, 2, NULL, '[]', 0, '2018-09-20 23:23:57', '2018-09-20 23:23:57', '2018-10-05 16:23:57'),
('5ac6592ca6c2b7dabfb06826e0c7d22b94bb240abff1d910b309801fde1531a98512064fbc6219c5', 17, 1, 'Personal Access Token', '[]', 0, '2019-05-08 02:50:49', '2019-05-08 02:50:49', '2029-05-07 19:50:49'),
('5af443ae67a843588dd4302e5da53ba21be7da55f4af8292dcabbbe6d291dbc57bef3532054f73d0', 5, 2, NULL, '[]', 0, '2018-10-09 02:12:11', '2018-10-09 02:12:11', '2018-10-23 19:12:11'),
('5afc7b05b0ca987d7341e8a09fbf2febb7dfde4acdf8aab98fdee707c67c523b16a7e3940a41169c', 84, 2, NULL, '[]', 0, '2019-05-16 01:00:17', '2019-05-16 01:00:17', '2019-05-30 18:00:17'),
('5b2531ddd93dbb521c44c0dd5e5b8590f36edf0920fe741e8166412a6b2c635b98c8018e022d7b7c', 88, 2, NULL, '[]', 0, '2019-04-25 09:58:05', '2019-04-25 09:58:05', '2019-05-10 02:58:04'),
('5b816a0953ada3235b8f4645b55e6ba7004a04c944bef09e1a9061f53fe98d5f61f3a907fd650e36', 2, 2, NULL, '[]', 0, '2018-10-06 19:10:29', '2018-10-06 19:10:29', '2018-10-21 12:10:29'),
('5bf230e9262654cf7abdd1aaf6e2ead5ee5b4b6a30bef5e2d9d90669fec42821e59f2e74cfe8e1ef', 4, 2, NULL, '[]', 1, '2018-09-16 02:23:33', '2018-09-16 02:23:33', '2018-09-30 19:23:33'),
('5c255b291549aceacc94ec0a7c9611f638532fa21f8e010848dc2fa940cc648fd9b8130edbb5d432', 84, 2, NULL, '[]', 0, '2019-07-04 00:45:21', '2019-07-04 00:45:21', '2019-07-18 17:45:21'),
('5c3473668a67ee89c552604f2fafb465cf18a7f4c6119f374879b086a951da6a1515da012ccb91cc', 144, 2, NULL, '[]', 1, '2018-07-23 01:23:50', '2018-07-23 01:23:50', '2018-08-06 18:23:50'),
('5c391e4141f7d00221922ddf371a6cd8ac232de20e01d786b8a0f0ae6545c15f2ea6f5109aaf69b1', 120, 2, NULL, '[]', 0, '2018-09-06 18:43:54', '2018-09-06 18:43:54', '2018-09-21 11:43:54'),
('5c57101ed5f2670c41a3ca28e993aab8baa0c7e29735b35bdd95bcf4018c83d5f16e95880cf05d61', 7, 2, NULL, '[]', 0, '2018-09-19 01:10:46', '2018-09-19 01:10:46', '2018-10-03 18:10:46'),
('5c576c31b18a9e628e0c223eec40b5e43842af63a05e3f1ca85870731a9ffbbf36331f7b5d1a6cf2', 28, 1, 'socialLogin', '[]', 0, '2018-10-31 12:11:22', '2018-10-31 12:11:22', '2028-10-31 12:11:22'),
('5c60b245764305ce73ee95aa1368539ea3273a732cda6562a423605733c350ce516445cb3ac0187b', 108, 2, NULL, '[]', 0, '2019-07-26 20:43:38', '2019-07-26 20:43:38', '2019-08-10 13:43:38'),
('5c9c2c0edee3f960e6df33e16b65b66d89e1b2a4921561b30c4b12e1db81a9e7c0b9067564840ea3', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:19', '2018-07-20 23:22:19', '2018-08-04 16:22:19'),
('5c9cc1c1d43cd72267c67df737d99c2f6b5fe353998560e30caff715353bba402160a76cdcb5e58a', 7, 1, 'Personal Access Token', '[]', 0, '2019-07-03 22:16:47', '2019-07-03 22:16:47', '2029-07-03 15:16:47'),
('5cc4d64ff1733120c213927753af101d3fea13daeaf34670f95c38bc3efd0a9ac8ca9e38c876bbbc', 1, 1, 'Personal Access Token', '[]', 0, '2019-03-29 23:12:59', '2019-03-29 23:12:59', '2029-03-29 16:12:59'),
('5ce9bd2104ff36fdb391a6c6e7dbf2cb06a442a958a6a7b95da48ccdccb991071822cff1fb3108ce', 5, 2, NULL, '[]', 0, '2018-10-06 20:22:06', '2018-10-06 20:22:06', '2018-10-21 13:22:06'),
('5ced8e113907729c59ecdcfc982f40bb2b24146a13aff00e87bca2cac513a159ee6f721fdc53382a', 100, 2, NULL, '[]', 0, '2019-07-03 22:09:59', '2019-07-03 22:09:59', '2019-07-18 15:09:59'),
('5cfa5eb6b86168134f44799f6d5ff9f932973743a800d775e5c1451d321ccc507d22e9ea56714aea', 22, 2, NULL, '[]', 0, '2018-09-21 00:29:39', '2018-09-21 00:29:39', '2018-10-05 17:29:39'),
('5d119bfc7c7f710d4432e21aec49408f59074fbf93af7d2da8c9440c3957320662e3357773fedfd5', 86, 2, NULL, '[]', 0, '2019-04-16 22:56:28', '2019-04-16 22:56:28', '2019-05-01 15:56:27'),
('5d476e3f52202b5204f9a3537f76a0fc970ebcd23963a099bc50ebd9fc7e56579d39576ba4ae685a', 129, 2, NULL, '[]', 0, '2018-05-24 05:58:16', '2018-05-24 05:58:16', '2018-06-07 22:58:16'),
('5dc23ccffae7d02765e00fdd0a29e755e5d3de1b77ec0281af8cd7a8630c80d33fc6803636a21539', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:37', '2018-09-15 17:46:37', '2018-09-30 10:46:37'),
('5e2297ccb6896f4350c825e7ac0fd5f4249323a1da5dcb89448b9431e6b8e2fd02d675e69d377409', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:08', '2018-09-15 17:45:08', '2018-09-30 10:45:08'),
('5e3b6ced3965ac8c789ebfc783366700376392e3336403b963a21aed62af4e084593844e2d2efe3c', 14, 2, NULL, '[]', 0, '2018-11-20 10:59:27', '2018-11-20 10:59:27', '2018-12-05 10:59:27'),
('5e4592ff76f30a56507f9a6200af7aa7d4356f3d62f2ba39be2e92c3459db4531f62091883dd41be', 1, 2, NULL, '[]', 1, '2018-09-15 21:31:36', '2018-09-15 21:31:36', '2018-09-30 14:31:36'),
('5ea00b71ddfc453f85233f18ad5d997591042fd7d4fb4fe6de116019e21b0f1ba3864480f1341b26', 1, 2, NULL, '[]', 0, '2018-09-21 18:29:08', '2018-09-21 18:29:08', '2018-10-06 11:29:08'),
('5ea32608c9036023733bcac165438de3b8345c05f877402064b2162f0e7e399991991d46fc5164e9', 156, 2, NULL, '[]', 1, '2018-09-13 23:25:45', '2018-09-13 23:25:45', '2018-09-28 16:25:45'),
('5eb176796dec9dd465b9e4252523652f04087544b57329487210100d95ff90a210563541fb410586', 35, 2, NULL, '[]', 0, '2018-11-24 10:58:01', '2018-11-24 10:58:01', '2018-12-09 10:58:01'),
('5eca45f1316fe187b631d07d14f096e4ca81408defeed844907376a6f4dabeaa601ca3d9745507fe', 122, 2, NULL, '[]', 0, '2018-05-23 04:33:29', '2018-05-23 04:33:29', '2018-06-06 21:33:29'),
('5ed8c88b86f01a44ec1309f1a78107bf2c29b42c1764410308a5bbefb2a4e04fa2599bb7625c9465', 144, 2, NULL, '[]', 0, '2018-07-25 20:00:52', '2018-07-25 20:00:52', '2018-08-09 13:00:52'),
('5ee9c055a561cf19c3deaa67d87a39a201d1c86c314d1f2a26b95363b9610dfbb57631c5b5955d32', 120, 2, NULL, '[]', 0, '2018-09-12 21:09:21', '2018-09-12 21:09:21', '2018-09-27 14:09:21'),
('5f030e93432bbe8420bf0b13e8d61ab0a57ad953bfe0e2ca3537e1c1b9cd970fed6402028f113bc3', 120, 2, NULL, '[]', 0, '2018-09-07 02:41:01', '2018-09-07 02:41:01', '2018-09-21 19:41:01'),
('5f59f095f7acd033c750abf9dd197ca9e104e193fed0512b7ffa2a830db4f83d4708192326ee7666', 1, 2, NULL, '[]', 1, '2018-09-15 22:50:58', '2018-09-15 22:50:58', '2018-09-30 15:50:58'),
('5f65f2bf42476bf7a652c0c3befec0500526b83e7b5572f123a3837c3a3738ebc4dd1f1df0eeff9d', 146, 2, NULL, '[]', 0, '2018-08-06 18:30:30', '2018-08-06 18:30:30', '2018-08-21 11:30:30'),
('5fa01390dfb03fb9ad4891fb69df90fcb1ac7c4d7c3bf28f40c0b9d6a58f802dfe9e045f35e95a09', 6, 1, 'Personal Access Token', '[]', 0, '2019-07-03 18:58:37', '2019-07-03 18:58:37', '2029-07-03 11:58:37'),
('5fc74aa53673d46aa10ae93048daf4aae398808bbd14e0c32b6f2e41d73e4e6c7d6d06e8672acc10', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:22', '2018-09-15 17:55:22', '2018-09-30 10:55:22'),
('5ff1550f37df7224fb61a01876f54825cd328818c408757c4e6e3aad15a9c7be8059d199ca624707', 100, 2, NULL, '[]', 0, '2019-07-03 00:27:13', '2019-07-03 00:27:13', '2019-07-17 17:27:13'),
('5ff15980489acd0a32d69143a23d9a0a394d85cb3f8dee64d5872d36e613c220bb533d54f721784a', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:47', '2018-09-15 17:55:47', '2018-09-30 10:55:47'),
('5ff7776f6c52026d86a6d9d6f08a616e8876314913dfa0b31a66249cd12ba529454d7611665c9e89', 111, 1, 'socialLogin', '[]', 0, '2019-07-12 00:19:51', '2019-07-12 00:19:51', '2029-07-11 17:19:51'),
('60521b1aa5197583d69be143f5ce27bf78c2559e47aa330cd45b2ac73c3baaf4463e7ff981cbc90b', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:32', '2018-09-15 18:00:32', '2018-09-30 11:00:32'),
('6074d309003f7cd87d0587e94dc4556702fe62388d95b0ff31969c3cd3f76703693ca06fb4b62d55', 14, 2, NULL, '[]', 0, '2018-11-19 16:19:48', '2018-11-19 16:19:48', '2018-12-04 16:19:48'),
('60aa700fd0a551ad8486d9d2066572e4c68d00fa4ff852248d8702fc499b8a986f0e97d49016c8e4', 120, 2, NULL, '[]', 0, '2018-06-15 17:46:37', '2018-06-15 17:46:37', '2018-06-30 10:46:37'),
('6124b08f51eaa5278989ba560e1c925b9ed7019e397a382e9e4a7edb724b62e6568db16749547a4b', 122, 2, NULL, '[]', 0, '2018-05-31 04:35:03', '2018-05-31 04:35:03', '2018-06-14 21:35:03'),
('613b73d18eb9c375bd064187bc27f46f5051ddb49a79d90946aa0bd276763ee72583dfb0e22c8e47', 1, 2, NULL, '[]', 0, '2018-10-05 22:23:56', '2018-10-05 22:23:56', '2018-10-20 15:23:56'),
('6165b1521e6f9a61a4b400bb0ebd6bc628cb873c4cc887939bd5307fb9a3ce8d9bf96d38d353e851', 144, 2, NULL, '[]', 0, '2018-08-01 17:19:30', '2018-08-01 17:19:30', '2018-08-16 10:19:29'),
('61b8be4e30138ce084e5afb224b96d5697de4c2556e1f23d8a20dd31dc821d0ea1290b9222d01f74', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:07', '2018-07-20 23:22:07', '2018-08-04 16:22:07'),
('61c2ccb7b367cc5cb6c842c5bb4eb3f5410d060f707c36cf30f1861fe8acecf107c0278c203c694c', 14, 2, NULL, '[]', 0, '2018-11-26 11:35:25', '2018-11-26 11:35:25', '2018-12-11 11:35:25'),
('61d8509c594545f22767959c4bc672449f7308d23c93ca99c3b7833b95201e28d30e7c5c96bd421f', 1, 2, NULL, '[]', 1, '2018-09-16 22:37:52', '2018-09-16 22:37:52', '2018-10-01 15:37:52'),
('61f0833bf0a5098e9b5b8ec4482029d621eb182c7ab27d8baf0dac6dc2d57cae4bc9a9749a9cf2e0', 15, 2, NULL, '[]', 0, '2018-10-19 06:38:58', '2018-10-19 06:38:58', '2018-11-03 06:38:58'),
('6214281938d63a5d843dd48b70fe817d057b44c3a82b68e0d47c8c2912811e879964d0a05fa42cfb', 14, 2, NULL, '[]', 0, '2018-09-21 02:41:40', '2018-09-21 02:41:40', '2018-10-05 19:41:40'),
('627db15292ab8dc82beb817ad17ccfcaf690374b7d52109feba48541a2d84d0027eaffcd50cd2114', 13, 2, NULL, '[]', 0, '2018-09-19 21:58:23', '2018-09-19 21:58:23', '2018-10-04 14:58:22'),
('631539104c91238fa72d82ff59fdaa33dfb42044ce210c128b14de26ba10573b8faa430709613ebc', 83, 2, NULL, '[]', 0, '2019-07-09 02:53:57', '2019-07-09 02:53:57', '2019-07-23 19:53:57'),
('6366a2e1a3450cab35dc59ba33606862f84d42ad757ede330d7a30cc860ece7e1ca7ce92d7b924c6', 5, 2, NULL, '[]', 0, '2018-10-09 02:08:43', '2018-10-09 02:08:43', '2018-10-23 19:08:42');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('63cb25159aed16790f824866065f8792f5c937b051e3e04a67ae31055329461d94857d14f0c1bdca', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:07', '2018-09-15 17:55:07', '2018-09-30 10:55:07'),
('63d19bfb81ef1cab1251a23dc39dc40fbffdcf3859923c74ab58d0722875eea6be36e13efc5dec97', 4, 2, NULL, '[]', 0, '2018-10-06 06:26:43', '2018-10-06 06:26:43', '2018-10-20 23:26:43'),
('644f149b73438cfea98a733aa80fd5647ae44ab2766945551e9d589537169baf9548909c49de84f4', 14, 2, NULL, '[]', 0, '2018-11-14 19:13:16', '2018-11-14 19:13:16', '2018-11-29 19:13:16'),
('64c8a5c7b9c0f38b2d9116ede871bf0da0391217addc835c0c0d5e457cac4edab2da00b5891d6048', 14, 2, NULL, '[]', 0, '2018-10-11 23:24:41', '2018-10-11 23:24:41', '2018-10-26 23:24:41'),
('64d2f1cdeaa405c858d10f9b1b2fda6213c4a004d0851dc5f7e2b5699819874740918bd7a4e3cdaa', 2, 2, NULL, '[]', 0, '2018-10-07 20:29:04', '2018-10-07 20:29:04', '2018-10-22 13:29:04'),
('64ec3be49cccfa637e2745d9fcc3b8c8bc76c6c907f752213d827da60665ea1a718d3bc0ba5595a6', 4, 2, NULL, '[]', 0, '2018-10-05 22:52:52', '2018-10-05 22:52:52', '2018-10-20 15:52:52'),
('64fb039e543b74e7fcb84e3b98daed95ff2d7deaa284f586e51756cfe42895b943fd9239837b3a6e', 156, 2, NULL, '[]', 1, '2018-09-13 23:10:05', '2018-09-13 23:10:05', '2018-09-28 16:10:05'),
('6568a577d0be73855e77f6b6d2166255015d68168ae67a402ed1f7a63673722532b33b6a210e5f70', 13, 1, 'Personal Access Token', '[]', 0, '2019-03-30 00:06:27', '2019-03-30 00:06:27', '2029-03-29 17:06:27'),
('65699f2c2dda6107d24ec44639b65b1faba7c52a03bb43c5b17c8902b4f82906573c90b6f627cd9d', 80, 2, NULL, '[]', 0, '2019-03-07 04:38:08', '2019-03-07 04:38:08', '2019-03-21 21:38:08'),
('6576855a8cc19af6db4f491d69dc35c1fbbc01054a721cf2ffdb7e0fd33cbb2573e2e24b2bc81aa0', 1, 2, NULL, '[]', 0, '2018-10-10 16:29:33', '2018-10-10 16:29:33', '2018-10-25 16:29:33'),
('657e200240ebff5dea212dd081a7312b13a65bb1fb58b128ef83d07ec3ab6512cb813e6206bc0f5d', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:42', '2018-09-15 18:04:42', '2018-09-30 11:04:42'),
('658602f6f4a4893b3a5115d0ab7317fc6551f2cfa06cd38ac1066b255f38946dc15d79eeec2a9a3e', 2, 2, NULL, '[]', 0, '2018-10-09 20:02:59', '2018-10-09 20:02:59', '2018-10-24 13:02:59'),
('6596eb2ca3dd563247471587b6df888c131fe1880fe48ead9602217b48e8bd5c1a1a43aec0c58db7', 146, 2, NULL, '[]', 0, '2018-08-08 19:46:00', '2018-08-08 19:46:00', '2018-08-23 12:46:00'),
('65a73a9924ed4247c35d5f9939d5eb8e3288900df4af8a3cedc526b6388b09d0c699aefb9f54b783', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:52', '2018-09-15 17:52:52', '2018-09-30 10:52:52'),
('660d50084932798d6042ee157c2f5d89c9076c413e707f8b87db3f9a5a8deda5345a3af62f3c9644', 14, 2, NULL, '[]', 0, '2019-01-14 22:56:48', '2019-01-14 22:56:48', '2019-01-29 15:56:48'),
('6629a9db4530fd18f24e00406144bd8e0e3265467149e7fe4b76429e6603b6c96ff7ee8c3293059e', 2, 2, NULL, '[]', 0, '2018-10-06 02:19:54', '2018-10-06 02:19:54', '2018-10-20 19:19:54'),
('6639460074f10b4210c8a22a84f851f5a7307b19a6c224d13fb4bada242362da74e8e0793f512499', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:49', '2018-09-15 17:44:49', '2018-09-30 10:44:49'),
('66449b200109ce979b0d773e9433de131b244a9708d6b82d4a58693a4ad87b47eb65a5f836468c1a', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:48', '2018-09-15 17:50:48', '2018-09-30 10:50:47'),
('665ef48783a2b3fbebc74b62346165a3c474a4231a86720146bb12c42ef5946fe109e49eb3bf4c47', 5, 2, NULL, '[]', 0, '2018-10-07 01:19:22', '2018-10-07 01:19:22', '2018-10-21 18:19:22'),
('66a1aad96bdc4f30376138b6682a4fbf5b3937bd0840b0130ca11c081c6fc6b9095942dba48a6d07', 150, 2, NULL, '[]', 0, '2018-07-20 23:22:27', '2018-07-20 23:22:27', '2018-08-04 16:22:27'),
('66a1fd5f69fdb45bd1232f0a888694479f96e0ec1ed8617530a7326889a175ef945972678a580759', 156, 2, NULL, '[]', 1, '2018-09-14 06:11:37', '2018-09-14 06:11:37', '2018-09-28 23:11:37'),
('66ebd178f47de3d23addaf7f1a4585a733a156505d85b30809b802c8519840cd89b17c3f8cd67b58', 86, 2, NULL, '[]', 0, '2019-05-15 00:31:20', '2019-05-15 00:31:20', '2019-05-29 17:31:20'),
('66fdc36fa5064bd594030d89e344fcb9acb5e050aa5373b5b1cd483019db2ceaa2611034c18b46b4', 1, 2, NULL, '[]', 0, '2018-09-19 07:45:15', '2018-09-19 07:45:15', '2018-10-04 00:45:15'),
('672591bc36029799e82a4adcb0963b357ba3c9d374c250e7ecfc30f8003ec56225d112f08c9e4093', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:07', '2018-09-15 17:54:07', '2018-09-30 10:54:07'),
('673388baa1dec19bec3fc89d3edff3d10c8cadc53d8e3b005ca84f9631d157f30f401cfe8422db6f', 4, 2, NULL, '[]', 0, '2018-10-04 19:53:28', '2018-10-04 19:53:28', '2018-10-19 12:53:28'),
('677058aa04d368d70d966451eeec5f411cf494aa3987df2f1f26c4075fc52a4a198caa3f3d0927de', 2, 2, NULL, '[]', 0, '2018-10-11 10:31:27', '2018-10-11 10:31:27', '2018-10-26 10:31:27'),
('677277b7c11e1e3cd533b9a06c45cc6a47dd2c082c700e804a60021c64745673dad689791a492363', 120, 2, NULL, '[]', 0, '2018-09-01 18:15:03', '2018-09-01 18:15:03', '2018-09-16 11:15:03'),
('67ed741f13f343266a82bf287406477a7e4ffc1b6e9ad9a333d3c7905a7b6af3e11a8c58e6cc0247', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:42', '2018-09-15 17:48:42', '2018-09-30 10:48:42'),
('6838d3c29cdfed94daebba8b2b152ca80607f60702a66f8d72974b03973a0c96b19eb4e630e614e8', 83, 2, NULL, '[]', 0, '2019-07-10 02:47:50', '2019-07-10 02:47:50', '2019-07-24 19:47:50'),
('683cbd641018658ede0d260600d8e2b7593f0fd36413b8aef7ecae05083f5a050353750bb61cc116', 14, 2, NULL, '[]', 0, '2019-01-18 20:51:43', '2019-01-18 20:51:43', '2019-02-02 13:51:43'),
('6841b945ac69f28180201b8e61c8bc8af24b922990aadf92d4d60e6dd71af9283aabf281022c6cfa', 82, 2, NULL, '[]', 0, '2019-03-12 20:35:59', '2019-03-12 20:35:59', '2019-03-27 13:35:59'),
('68b45345f31c522654bc57a2a36da4c78bfe001e85a0dc5e8cf4f3671de801e283e2729edfe9db0c', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:22', '2018-09-15 17:59:22', '2018-09-30 10:59:22'),
('691bb9ad1b270e61715f6e970ccad232000c6256ab9efaee578a1a0d308aa5441db75b19c66b23d8', 25, 1, 'socialLogin', '[]', 0, '2018-11-14 12:16:34', '2018-11-14 12:16:34', '2028-11-14 12:16:34'),
('6927fe992db213045202c1b8efd14ca51364fae32b3ecccd2510241253da0cf18fa36dafa044b40c', 9, 1, 'socialLogin', '[]', 0, '2018-10-09 01:53:38', '2018-10-09 01:53:38', '2028-10-08 18:53:38'),
('6936b4605624500237fa324a0d5053c4dbeaa6c30a43035c82dfbf54e21f6987ccc34393678434f2', 1, 2, NULL, '[]', 1, '2018-09-15 21:46:36', '2018-09-15 21:46:36', '2018-09-30 14:46:36'),
('69766ee01de9977b7a843782235df4772070b3bc3e0152b8fa33309f56224b7d35260281d0f71ba1', 80, 2, NULL, '[]', 0, '2019-03-07 05:07:27', '2019-03-07 05:07:27', '2019-03-21 22:07:27'),
('69a664494825603ce76bd674e8ee4806311c9370358ff29d2fc3023f5d0f2d90b8b4bb8ae480ca4d', 6, 1, 'socialLogin', '[]', 0, '2018-10-17 11:16:57', '2018-10-17 11:16:57', '2028-10-17 11:16:57'),
('6a11b9a1a7b3114f23a6d095d55af09880a183c7218ea3b1b6358fd637ed20fe6ef057544763bca2', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:22', '2018-09-15 18:02:22', '2018-09-30 11:02:22'),
('6a198088d42ac8579cc7e337cd75a3e55ce607b929e49729722bbeaa21435c9df335801acc30ac28', 82, 2, NULL, '[]', 0, '2019-03-09 00:29:03', '2019-03-09 00:29:03', '2019-03-23 17:29:03'),
('6a3dfb99965fd64b61ac2eb3d819878a63c6e39253a3617415efde2f1921f10f18a053913defe856', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:41', '2018-08-10 23:12:41', '2018-08-25 16:12:41'),
('6a9aecbbca1728c43ae8fb2776fc6ab662917fd720692107eb84cccff5517dea7ca9443627c2d22d', 4, 2, NULL, '[]', 0, '2018-10-04 18:44:17', '2018-10-04 18:44:17', '2018-10-19 11:44:17'),
('6ac2da099a00276c369008b69a6fec0fc2b76cb08eec566432f6abbefe95e3f8e3b481e4840b9219', 120, 2, NULL, '[]', 0, '2018-09-08 17:28:51', '2018-09-08 17:28:51', '2018-09-23 10:28:51'),
('6b3c7b2f4f021e155519fc446dd32f366e0afb9d6d9732a44bb0a1ba989726195bfb2fe8f78b503f', 57, 2, NULL, '[]', 0, '2018-12-26 20:44:01', '2018-12-26 20:44:01', '2019-01-10 20:44:01'),
('6b4e545d6fcedd1b2eef9e31b712bd510a99fca8cef7ffd44361a5b64b59be4ffffd11b55c82f921', 77, 2, NULL, '[]', 0, '2019-02-24 00:25:53', '2019-02-24 00:25:53', '2019-03-10 17:25:53'),
('6b80eae3285d2e205bb2afb1e4a736de132ec9881da874b7426393da1f5c48f9bf48425c2a7a28bb', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:08', '2018-09-15 17:44:08', '2018-09-30 10:44:07'),
('6b9bc96c24e9f89699d8dfae81b946cb9b2beee9a347f5f0b8c29c3cfb379c8bf02a51d8056f324c', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:42', '2018-09-15 18:09:42', '2018-09-30 11:09:42'),
('6bb19388408696ec20d13198a599ab7a46137d0842ce8e0c52b157fa959b4c72350da006ec369f82', 7, 2, NULL, '[]', 0, '2018-09-18 23:51:26', '2018-09-18 23:51:26', '2018-10-03 16:51:26'),
('6c05e69ca01e5161f0202d09f663bf9c533b9a77c7b958484dd5f71472216c7dc58428ad632cef8c', 5, 2, NULL, '[]', 0, '2018-10-07 02:46:36', '2018-10-07 02:46:36', '2018-10-21 19:46:36'),
('6c9e9ff20fd3ce3b5756782e53c945e6e7b10147d2460551b2934f7902a6f8d008d6c707a1c17b49', 45, 2, NULL, '[]', 0, '2018-11-30 18:39:30', '2018-11-30 18:39:30', '2018-12-15 18:39:30'),
('6ca226de663d3413f5a1bed533c8ceff8dfb9a25249e1c5b14573b532057e5dcfe4a9bab6c9bf1b7', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:23', '2018-09-15 17:53:23', '2018-09-30 10:53:22'),
('6d35964f64f25f73151f2d1cb4bdb75e47c7c8c5f31e83ef41771d6661f06d4974052e5e8ab30ff0', 1, 2, NULL, '[]', 0, '2018-09-21 21:18:53', '2018-09-21 21:18:53', '2018-10-06 14:18:52'),
('6d5e69893936ce91c1ff1b3955e13039e141baa103cf2c0ff825332726969a591141ac09d2f50b55', 84, 2, NULL, '[]', 0, '2019-07-10 05:23:53', '2019-07-10 05:23:53', '2019-07-24 22:23:53'),
('6d7e430a764becbfc38270ecce65cd75996982ca723bc85f530428c32c5d9788f3fbdc73049bc2a4', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:22', '2018-09-15 18:09:22', '2018-09-30 11:09:22'),
('6d8b25b3a20d68ea68c1d98c852003bc7433092098c0fbf6f071799ea094deae6e102cdf1f7efdc2', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:12', '2018-09-15 17:56:12', '2018-09-30 10:56:12'),
('6de5eecf98d55a6164d78e3d27a488186724bd5fadea4789eb0cc9b0d0f62c16fd34868ea89aab59', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:37', '2018-09-15 17:55:37', '2018-09-30 10:55:37'),
('6e1f7ba33951f5a248efb172443bc898bdd5c6226cd987e96241f3271dd8f5ece48d1a4eca8f8c23', 8, 1, 'socialLogin', '[]', 0, '2018-10-09 01:25:54', '2018-10-09 01:25:54', '2028-10-08 18:25:54'),
('6e765b2534caf7d22e71ebd7199f90ac7de4cfdf728afc3552a316fe058234489d22cc90723db2bd', 120, 2, NULL, '[]', 0, '2018-09-07 17:14:58', '2018-09-07 17:14:58', '2018-09-22 10:14:58'),
('6e834f4054820c3b90cee8efe88eb61251654190777097ee1e25b3162b0d90810328b3149712077a', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:52', '2018-09-15 17:55:52', '2018-09-30 10:55:52'),
('6ea267e4fb0a86ba9cd59c8d8222244d5e8bfd91b347f44f1d0a9cd289990c54acbf4d8adf8e9faa', 144, 2, NULL, '[]', 0, '2018-07-22 15:09:30', '2018-07-22 15:09:30', '2018-08-06 08:09:30'),
('6ecb10173ba9a28bdf28c6721d34255d1e63b83d41f400f0bda5c1b3ad755bec1d282176c5ce7f44', 144, 2, NULL, '[]', 0, '2018-08-01 05:14:15', '2018-08-01 05:14:15', '2018-08-15 22:14:15'),
('6ed7af350863e672d407764b56be5d74a3c1b8397f3c9b5d95028ff4db8c095dc1c0eac17e607aba', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:37', '2018-09-15 17:52:37', '2018-09-30 10:52:37'),
('6f16fcfae7d7a72a82425ff9ef091bd466cafd53a1bce711c5c417cc62630e4ebc5f1418eac2c37a', 5, 2, NULL, '[]', 0, '2018-09-18 00:33:23', '2018-09-18 00:33:23', '2018-10-02 17:33:23'),
('6f36d056c38a07492c3a1181ab8482280733ef2b56002bb8b49bbf400574a0c48d05e480b2d91711', 3, 1, 'socialLogin', '[]', 0, '2018-10-21 16:03:06', '2018-10-21 16:03:06', '2028-10-21 16:03:06'),
('6faa88570bbd384a3609c7ccf79cd36782e7b7b4af76fd0117cac5817c5ecd0b899899144048ac81', 15, 1, 'Personal Access Token', '[]', 0, '2019-05-13 22:27:45', '2019-05-13 22:27:45', '2029-05-13 15:27:45'),
('700538e56e3fd552ca2373f7675ca7d281534e86cb84c57762d0b925c14388a830f71ee68f555ddb', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:17', '2018-09-15 18:01:17', '2018-09-30 11:01:17'),
('70115c27b9d6178252c72e58e4bc5c36051e1a9ccddb43ebb68d1f83bce6569981a1d45eabf89e76', 14, 2, NULL, '[]', 0, '2018-12-31 12:48:05', '2018-12-31 12:48:05', '2019-01-15 12:48:05'),
('70395fedf3a822421859e675ffb334adf42b859f2843ebcf41cbbcc08aed6ce048a01d8636101143', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:57', '2018-09-15 18:05:57', '2018-09-30 11:05:57'),
('707c1742b2cadbe0a2eaeebac9f7daa401d493fbb551796b96d027b660c9ca960d2129c37be87b13', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:02', '2018-09-15 17:45:02', '2018-09-30 10:45:02'),
('70c6b46e8f6148ca07ac707fd95818eb0392415a19ca0bc31e133110f8a8ae1fa793d1dd18c4c75a', 120, 2, NULL, '[]', 0, '2018-09-01 22:53:12', '2018-09-01 22:53:12', '2018-09-16 15:53:12'),
('712c3a3039eac7d27f73365e2c10a4c84971ae742a586c4ffc80e36098bbf7e41d8c7829fdb7f42d', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:25', '2018-07-20 23:22:25', '2018-08-04 16:22:25'),
('713defe6a487c03710ef25554334b1d4608b01116895c74b35e36915e61046c653ccf1bdd5e125fb', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:03', '2018-09-15 18:02:03', '2018-09-30 11:02:02'),
('7167405c11cbf95597cf7719d5df20e8751dca7dfe115cbd288cf2960872c7f9f4fcef2ab6f8fe02', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:12', '2018-09-15 17:59:12', '2018-09-30 10:59:12'),
('716bacbc6c55dfd33a626359623dc5000943875d97edff6da6eee68d76a5b5e286373dbc15be981a', 2, 2, NULL, '[]', 0, '2018-09-29 02:46:37', '2018-09-29 02:46:37', '2018-10-13 19:46:37'),
('71ad2e151688b048e0d37434ae9a39b5c0c197bc2bfcae0d03d5ba35ab58c45df5a222563453b652', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:17', '2018-09-15 17:49:17', '2018-09-30 10:49:17'),
('71c24457ac0b93fb32aa6e53d5f7f5c45d230f735180461dc3876b19f44c92c770806fb3721b3e01', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:42', '2018-09-15 17:55:42', '2018-09-30 10:55:42'),
('71c6e6337cbc862a9d24d3bb91ff25b667a6bb021e07eadafa4b1777a196f1fe4632be266b71b931', 19, 2, NULL, '[]', 0, '2018-10-15 01:13:48', '2018-10-15 01:13:48', '2018-10-30 01:13:48'),
('71da9e8eebc88cbdf522bdd46b52524d837e1c1ea3746f17cbfa0eadc4e738d87ef2870434cfb881', 84, 2, NULL, '[]', 0, '2019-05-15 04:49:43', '2019-05-15 04:49:43', '2019-05-29 21:49:43'),
('724ca86597eb63b55ca976f66aa3ba70f0bf3dee7bc147397ae4f3d59e2a7ccc0106d7d635a9c083', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:23', '2018-09-15 17:58:23', '2018-09-30 10:58:23'),
('7250a2a30f080505be26f6d9e63a0c2c2d393a64a2a7aa698e4118d9ee11e693a52c01baf5ebfdf2', 1, 2, NULL, '[]', 0, '2018-10-05 18:33:45', '2018-10-05 18:33:45', '2018-10-20 11:33:45'),
('729da8fb1d636f0d1c230630eaac25fd38b8c73f30cd103220b969dcb0b4a255e049a29675f3ddfe', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:02', '2018-09-15 17:53:02', '2018-09-30 10:53:02'),
('72e3e33b8270e5a247d8790d01e63ec1ccc009f9f1840451a7dd4d19b9cbaaff06034bf6b8b845ef', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:02', '2018-09-15 17:57:02', '2018-09-30 10:57:02'),
('7320643bcaeb6cadf3b56aa13e68624e1f8efc1d8bc598101eb5a0f29fc01d78523d6e9a72bdc1f6', 122, 2, NULL, '[]', 0, '2018-05-20 23:49:10', '2018-05-20 23:49:10', '2018-06-04 16:49:10'),
('7386c6d90ad59283c7e16b1d0188b3e208f6a0f037ab072442a7af0161ddcc71311442c9cb55694d', 13, 2, NULL, '[]', 0, '2018-09-19 22:09:17', '2018-09-19 22:09:17', '2018-10-04 15:09:17'),
('73fe2634521a5ded9de7fc9ab4ba95adb67c14e3d8585d079156679d72b24d857b3864c337764c0d', 10, 1, 'socialLogin', '[]', 0, '2018-10-18 11:03:03', '2018-10-18 11:03:03', '2028-10-18 11:03:03'),
('745ddc6c525f78396fd8473389f67df84855d892eb5b7d12c6db562f68c96f59c2ddd53cc07b1192', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:42', '2018-09-15 17:51:42', '2018-09-30 10:51:42'),
('74aac1691796b083829be470f4af20fe231170151d7d3c57abdcbf6f863392fb1204ffb407f6cb81', 82, 2, NULL, '[]', 0, '2019-03-08 01:39:00', '2019-03-08 01:39:00', '2019-03-22 18:39:00'),
('74b8dcbb65556aa6fc51ec1fd164ab00e400fb2ce15aa20a0b6c1f8e8a2c26f1ef6f6fc0c98c143c', 61, 1, 'socialLogin', '[]', 0, '2019-01-05 14:53:18', '2019-01-05 14:53:18', '2029-01-05 14:53:18'),
('74dc05b0f70fc6b66fb3231443cc0f8f2611ca3e033c7b57eba36cd57a36386fbdb391651fa2bd42', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:54', '2018-09-15 17:44:54', '2018-09-30 10:44:53'),
('75f03efe3d358559d517b9a7177bf0aabe8bf28b7407c7cf1ed6547be93004ad137fcb0ddaf94f9d', 1, 2, NULL, '[]', 1, '2018-09-15 21:47:00', '2018-09-15 21:47:00', '2018-09-30 14:47:00'),
('75fd337fe10db0a1b140547ca7a1a0c6e885a9fbc071a481997bb6a248d6d2bd416a96732acd04d1', 146, 2, NULL, '[]', 0, '2018-07-30 23:02:27', '2018-07-30 23:02:27', '2018-08-14 16:02:27'),
('7634b9e5d7b2c249c40a1d2e77f0cd3e270980ab36725cf68a67b436e79ce40aca380bde511a9056', 120, 2, NULL, '[]', 0, '2018-09-14 20:12:42', '2018-09-14 20:12:42', '2018-09-29 13:12:42'),
('7635ac5c17ae3bc0fbde4228ae5d7e03ca2398266f794ab8f758ca9296f85f671135ff1e8d18c53d', 63, 2, NULL, '[]', 0, '2019-01-21 23:01:31', '2019-01-21 23:01:31', '2019-02-05 16:01:31'),
('765c8aca1ffb805252595040ba539e43a6b30d539ea07b96238d4b52d3ee38a11e8b7102f7ab3289', 55, 2, NULL, '[]', 0, '2018-12-26 19:37:49', '2018-12-26 19:37:49', '2019-01-10 19:37:49'),
('7687aa3924a0580687938a130211c5d354e0d2079bb504276f691bd528e38796715c877a8833b67e', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:12', '2018-09-15 17:58:12', '2018-09-30 10:58:12'),
('768cdca65781998f3fdb1a6bcdef1dc406bc6118e55c3a74d82dcb6109c144e22f95f92bd0616ad6', 5, 2, NULL, '[]', 0, '2018-10-10 13:35:31', '2018-10-10 13:35:31', '2018-10-25 13:35:31'),
('771849a65409f479e6a041c7ed376f8d6cd79dd8f1828eab567b2a4864f37498860375257f0e925e', 120, 2, NULL, '[]', 0, '2018-09-02 02:05:19', '2018-09-02 02:05:19', '2018-09-16 19:05:19'),
('77373a4ae9a0c7c8c08b5043b85b3a4eaf64a750a959441d81a628f9edebda5b0e5e2a2d39892416', 120, 2, NULL, '[]', 0, '2018-09-15 17:02:09', '2018-09-15 17:02:09', '2018-09-30 10:02:09'),
('77395794e498c84241c613bd9263442aeb0a7e2b612fce618173f9ff15eca3390df838d0c6ae29a6', 2, 2, NULL, '[]', 0, '2018-10-11 14:49:46', '2018-10-11 14:49:46', '2018-10-26 14:49:46'),
('773cb823f961f516a0a8281d885f58a9dc3e07df009aeb2ba9086f07ff91d3d6b202e91583250a2e', 14, 2, NULL, '[]', 0, '2018-10-22 16:23:51', '2018-10-22 16:23:51', '2018-11-06 16:23:51'),
('77b7cdc27971ea99dd0b9a5a8fe77d52401797726a5c3e48305ab6cd0cc405e541e87407e38f8418', 1, 2, NULL, '[]', 0, '2018-09-16 02:45:26', '2018-09-16 02:45:26', '2018-09-30 19:45:26'),
('77bf3f4d9671bcaef21439bd39b826f838d8800c082c6935fe5b44e35d83410b2edd324a1dd5550d', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:49', '2018-08-10 23:12:49', '2018-08-25 16:12:49'),
('77f425a3dd386bafc150b66a2aba0599b7d1ab4908f5324942b66e94cabd758c234242af40b6d805', 144, 2, NULL, '[]', 0, '2018-07-30 19:06:08', '2018-07-30 19:06:08', '2018-08-14 12:06:08'),
('785000427b0c043b9f65ddabdd74ccb046236f7848eec26a6e29d361fa6c822754248aa880173e64', 147, 2, NULL, '[]', 0, '2018-08-08 20:41:39', '2018-08-08 20:41:39', '2018-08-23 13:41:39'),
('78d5529eaef2560d2c18bdae98397247b3c98ddc612b3c8d5dccfa741483a1c65b2e2807312ef463', 138, 2, NULL, '[]', 0, '2018-06-14 21:39:58', '2018-06-14 21:39:58', '2018-06-29 14:39:58'),
('78d6cadb98dc6d21b3ac16720c4579303a92065a8d2d7cc4560ec9b62dbbc6c5221c2de66c19390d', 110, 2, NULL, '[]', 0, '2019-07-04 20:48:47', '2019-07-04 20:48:47', '2019-07-19 13:48:47'),
('79836d468ea26b5ce552e836da261be63087e3f8f8f4497a37a0d2528d72b90bcaf76f64de9b4c26', 2, 2, NULL, '[]', 0, '2018-10-15 18:27:16', '2018-10-15 18:27:16', '2018-10-30 18:27:16'),
('798dc82e8d69f827197a2facc5bd474fd40cad86e6351259ae77a8c2d72670e34f0bc3b11a9dec07', 14, 2, NULL, '[]', 0, '2019-01-15 21:10:23', '2019-01-15 21:10:23', '2019-01-30 14:10:23'),
('7997502194043de3998fec33c494c38f078d678b483746e87db14305cee89e362c185d56d51c9b22', 20, 1, 'Personal Access Token', '[]', 0, '2019-04-16 04:39:30', '2019-04-16 04:39:30', '2029-04-15 21:39:30'),
('79da585a55322f084017bc839aa6bfcb8916ae9631d330b36f97b185e514728a4d01361fee946031', 20, 1, 'Personal Access Token', '[]', 0, '2019-04-10 05:12:18', '2019-04-10 05:12:18', '2029-04-09 22:12:18'),
('79ecd801cfe2c7876b3b5eceff4a619bd8b819801d532d77315f80049b95a2b57f00dd18942ca42b', 84, 2, NULL, '[]', 0, '2019-05-11 02:40:01', '2019-05-11 02:40:01', '2019-05-25 19:40:01'),
('7a1049f3816d6e71f0ad993f45cd0d72fb22c6eb4989b79c94915a3c6b97255df714e4c9c4176b9b', 1, 2, NULL, '[]', 0, '2018-09-18 23:01:31', '2018-09-18 23:01:31', '2018-10-03 16:01:31'),
('7abca72672f06ec03a0fef8a6a34a879749c270c2869436110b3c62c894ba24f50ac3b4272e0b122', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:57', '2018-09-15 17:48:57', '2018-09-30 10:48:57'),
('7abcb97877a54e412a850507e9ac6aaa313088c9c6203012ed332fa39bb6f1603795f8add3edb9d0', 95, 1, 'socialLogin', '[]', 0, '2019-07-01 22:28:00', '2019-07-01 22:28:00', '2029-07-01 15:28:00'),
('7ac82866775fd8b97235e24fe514740fdfc2b00ab90f4c6e41b2227ad5d8a767c1df9e2ac022d025', 150, 2, NULL, '[]', 0, '2018-08-10 23:25:16', '2018-08-10 23:25:16', '2018-08-25 16:25:16'),
('7ae23b7c60bc772fead08f0b61938419b6ddbd59931743f62ea09f2d45671569c031f6ad2c128c8b', 14, 2, NULL, '[]', 0, '2019-01-03 16:18:39', '2019-01-03 16:18:39', '2019-01-18 16:18:39'),
('7aea461c4d3f3ba2023d0133ef3f25348fc543a1cee22d355b1185d303a00795cd983d2f73a92749', 17, 1, 'Personal Access Token', '[]', 0, '2019-04-23 20:32:40', '2019-04-23 20:32:40', '2029-04-23 13:32:40'),
('7af206727940b7a9dd2082ce06c5406f17ef5bfb66a662afb2e025eb9ca066086994365bdc756c02', 1, 2, NULL, '[]', 0, '2018-09-29 01:57:58', '2018-09-29 01:57:58', '2018-10-13 18:57:58'),
('7b018cce4758833e61850fb12700361bd9bef0788bf619e3dc5fc249747a7a60dbab7cc5da963697', 13, 1, 'socialLogin', '[]', 0, '2018-10-18 11:16:11', '2018-10-18 11:16:11', '2028-10-18 11:16:11'),
('7b3346432521449ef1d09bc5fd1e13701c8181330ea460b7847a84c4fb989b05731b40c616b5e0eb', 14, 2, NULL, '[]', 0, '2018-11-19 15:06:19', '2018-11-19 15:06:19', '2018-12-04 15:06:19'),
('7b73c52a0f1436b9dccf302b6ad22d3e889f24a84f3fc571a99ed44c903d4a8dc4ce286fa4fdde98', 122, 2, NULL, '[]', 0, '2018-05-23 04:33:32', '2018-05-23 04:33:32', '2018-06-06 21:33:32'),
('7b7b324fcd1fb736392f85e7c56ec05f36463fe4ef99811ae85d5760cd004818fa0082b05a1f26c3', 70, 1, 'MyApp', '[]', 0, '2019-02-06 03:25:53', '2019-02-06 03:25:53', '2029-02-05 20:25:53'),
('7b9331349fe6221c2a8848009ca4e06dc6082faf3f9dbab0acfc698c12d0c04d53373da4ec7c9a0e', 19, 2, NULL, '[]', 0, '2018-09-20 18:03:01', '2018-09-20 18:03:01', '2018-10-05 11:03:01'),
('7bc40e9f806812e660014c32f0f06daa66755acec57d60fc4998257924c937a1f28acabb6bea426f', 120, 2, NULL, '[]', 0, '2018-08-10 21:13:18', '2018-08-10 21:13:18', '2018-08-25 14:13:18'),
('7bc73e53c1da350a8ca2df0efe17eec6651c58e5fe1405a5d95cc06c01f2de3e30fcb0e7dcafce8f', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:47', '2018-09-15 17:52:47', '2018-09-30 10:52:47'),
('7c01cfbbe203d2957cdd1fac68f9b312fa7539f30fa8a8e4e9b50d1e1db02b27ff6c57e04ca997a8', 3, 2, NULL, '[]', 0, '2018-10-04 22:03:53', '2018-10-04 22:03:53', '2018-10-19 15:03:53'),
('7c12ce670a56d50ad3405b0ddaee420593210d58029350da4a37b0a6fd90ef2ed928d3e63a5e678a', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:47', '2018-09-15 17:53:47', '2018-09-30 10:53:47'),
('7c5ee5922365b0a8ee5cf5b0edd8d057733ef25af5661b2dd3f234057dfce364def07dda22155abf', 52, 2, NULL, '[]', 0, '2018-12-26 18:57:37', '2018-12-26 18:57:37', '2019-01-10 18:57:37'),
('7c7d40d84e91cda82151fa37700acbd11274334d2808e318429a0235a7c2cc1bea6db1246050e2a3', 34, 2, NULL, '[]', 0, '2018-11-21 13:34:39', '2018-11-21 13:34:39', '2018-12-06 13:34:39'),
('7c83b33041546a28e6c58c4ef68c10560d3b156147225a0258c4a9defe6110ba3a9d052df800364b', 156, 2, NULL, '[]', 0, '2018-09-08 02:22:31', '2018-09-08 02:22:31', '2018-09-22 19:22:30'),
('7cc414821f6b42dc3bb037792042653315ddd5832bc1a6fc3f309f80b1feefef951b88aac441d249', 58, 2, NULL, '[]', 0, '2019-01-05 17:30:18', '2019-01-05 17:30:18', '2019-01-20 17:30:18'),
('7dc215e492f436f274c3cf1c661e593d8f615d796af92b4f972010f8a91fc295206f24dd334ef1f3', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:58', '2018-09-15 17:49:58', '2018-09-30 10:49:57'),
('7de8e560dc50b696a4f654ce75172a0ce0f3c160d190122245b1741a38daa697bf2e4c83e9852ad5', 144, 2, NULL, '[]', 0, '2018-08-01 22:56:35', '2018-08-01 22:56:35', '2018-08-16 15:56:35'),
('7e3cf3155f0fee858231be374ab20005dbe7aab09249aada246f07ce7f9be2dcb4a7c62e38cfdbcb', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:22', '2018-09-15 18:06:22', '2018-09-30 11:06:22'),
('7e5db83a115dd654cd36129e5117980e3feb81a4fc0c161fe1981cb5be47dbbf31e1e37cec3bde41', 1, 1, 'socialLogin', '[]', 0, '2018-10-15 19:16:19', '2018-10-15 19:16:19', '2028-10-15 19:16:19'),
('7ed2c830a095a1d886a39a54d1b88746537454aa6c6cbdeddba8180a135fa1cca0b2ec8a94cea685', 14, 2, NULL, '[]', 0, '2018-11-27 17:36:59', '2018-11-27 17:36:59', '2018-12-12 17:36:59'),
('7ee306b2337dc71e97331d095a35a75570d6ccbdafb50778275befff82071042662d7ad16e7e88ea', 4, 2, NULL, '[]', 0, '2018-10-04 18:35:52', '2018-10-04 18:35:52', '2018-10-19 11:35:52'),
('7fc4a89c2c998efe63ff0aa9dba41453bc87b4c27bd468d3cc5dbe185073116b3758cadb8619bcb8', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:38', '2018-09-15 17:53:38', '2018-09-30 10:53:37'),
('805ec2fb470a68c3558238ca4b87b63bd16bc9b17113e603b7eb1cc41aa57100e2ba6e5fbf6858e8', 120, 2, NULL, '[]', 0, '2018-08-31 01:13:02', '2018-08-31 01:13:02', '2018-09-14 18:13:02'),
('80edbd97e64a1e91f891a7d0a8e9a302793b4bac59a22c9c9e8bf9d883013cb269f17164257adae1', 122, 2, NULL, '[]', 0, '2018-05-21 02:59:47', '2018-05-21 02:59:47', '2018-06-04 19:59:47'),
('80f9719d8c213572da96b0d744e9327653168bc56f500843270d73559bd0fac3343682e656f74528', 8, 1, 'socialLogin', '[]', 0, '2018-10-17 17:39:45', '2018-10-17 17:39:45', '2028-10-17 17:39:45'),
('80fa28a92649d7fc654e06bf4e9157e0f96a27f1039c38ae122dbc34e08588ffd54bcb1b1dcacc24', 83, 2, NULL, '[]', 0, '2019-07-03 03:35:09', '2019-07-03 03:35:09', '2019-07-17 20:35:09'),
('812a69801fc5f3e29afa0b76ee14e986aa208fcfb3cce9d0f0869c73d46ad686bff66c8ae33aa2b3', 156, 2, NULL, '[]', 1, '2018-09-14 02:25:55', '2018-09-14 02:25:55', '2018-09-28 19:25:55'),
('812e1eb2e7a9525c2ddb9ffb766dfcd7fb3a0439f5e51527d202d89b04b1e9ffa2e2e90295e89727', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:53', '2018-09-15 17:56:53', '2018-09-30 10:56:53'),
('8163b714b807a44abee79f96c1064bd33355afa7ce0fd76e8ed85314fff8d929674822ae96c0cb38', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:43', '2018-08-10 23:12:43', '2018-08-25 16:12:43'),
('81c0a79b0f49a3ef04e78397d19e8edf5e9a1113f43b6732452be8109fb10e42301ab475bed64ad9', 1, 2, NULL, '[]', 0, '2018-09-19 01:20:38', '2018-09-19 01:20:38', '2018-10-03 18:20:38'),
('81eff1fb7128a611964ad8d986fbf8a4f8ff5c0bdcd6c61ae295ea168fc02be963c620d35f237683', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:34', '2018-08-10 23:12:34', '2018-08-25 16:12:34'),
('82837c8b1ce8d09ca6163315895012860cbf7a2b8a75fa22de6fef3486156fc3e6e6ce6b0b723895', 144, 2, NULL, '[]', 0, '2018-07-22 20:39:17', '2018-07-22 20:39:17', '2018-08-06 13:39:17'),
('82be114287193333c3ad8f60fd57ee8dc7e653af1b71f11acdc7fcd36c209e13d9d2d4b15ee063fc', 104, 2, NULL, '[]', 0, '2019-07-03 23:36:57', '2019-07-03 23:36:57', '2019-07-18 16:36:57'),
('82e35132f947c7f8af16d66bd4e2a5e771c10078551231ceee347ba923ab375b2ebd6ab4d7a15313', 39, 2, NULL, '[]', 0, '2018-11-13 21:39:49', '2018-11-13 21:39:49', '2018-11-28 21:39:49'),
('83000bd87d7e5633b64de7dd06143d5ba9cceaa82c1801a4e496d0750abae936500642c250d7e834', 5, 2, NULL, '[]', 0, '2018-09-16 03:28:36', '2018-09-16 03:28:36', '2018-09-30 20:28:36'),
('834df3a7210f03112beebb3725e7fa07f2438f016cfc202de93315077f347f513621ba61e63706f8', 1, 2, NULL, '[]', 0, '2018-09-19 07:19:51', '2018-09-19 07:19:51', '2018-10-04 00:19:50'),
('834e8b739713d50c048c432d378738490f2544e52c6e1700d18c208cb46f17cba775f3acda9f6087', 86, 2, NULL, '[]', 0, '2019-04-22 20:10:18', '2019-04-22 20:10:18', '2019-05-07 13:10:18'),
('83891b631fc8bab370327d8c2454f4a4c2d6f9bf7122506151553fe749fa1a6d86925e53153e4e06', 122, 2, NULL, '[]', 0, '2018-05-28 02:34:06', '2018-05-28 02:34:06', '2018-06-11 19:34:06'),
('83bac5e8ab22120139717ef7a58d9c3c089e4bab8485a928b6dee48f61e91a91ae42301e1fe2eaab', 108, 2, NULL, '[]', 0, '2019-07-04 20:50:17', '2019-07-04 20:50:17', '2019-07-19 13:50:17'),
('83bc5009549c95a05f42f6ce5bbd3e610d2ac57c03ecbef2652d5eb3a9b58e148eb7cb6d50ba274a', 105, 2, NULL, '[]', 0, '2019-07-03 23:41:51', '2019-07-03 23:41:51', '2019-07-18 16:41:51'),
('83cbf1635726440a98b2864adea1f62cc46145964a215a9652c2e3fffd81f722351d76a9500cec6b', 1, 2, NULL, '[]', 0, '2018-09-19 00:09:48', '2018-09-19 00:09:48', '2018-10-03 17:09:48'),
('83e467f6db79eb2c3c93344a0b6c7da68b43695ff08b6c08a34d0689814d445689d15726b97e00e1', 4, 2, NULL, '[]', 0, '2018-10-05 18:30:58', '2018-10-05 18:30:58', '2018-10-20 11:30:58'),
('841ac6449fd7b59e9b60e7c2d47eca9392de4c88681901d8c09a8d52e9180d95e647fdfa4e6d1b91', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:17', '2018-09-15 18:08:17', '2018-09-30 11:08:17'),
('84259b635132101d38beee35ac157d9e47b1d62037a72ff16cd4a45164048959aa6304312b21c373', 83, 2, NULL, '[]', 0, '2019-04-17 01:30:35', '2019-04-17 01:30:35', '2019-05-01 18:30:35'),
('8466aeef8fdcf7299f8bd413ca8db6737c86603eeb42ab5ecf0ac906b8f9ac53bd051f68ade36660', 150, 2, NULL, '[]', 1, '2018-07-20 23:21:56', '2018-07-20 23:21:56', '2018-08-04 16:21:56'),
('846eca9c724b1fc5eca12c691c495879266c42fe9e4a9cd862a721f1981e746d03e23628195122ff', 8, 1, 'socialLogin', '[]', 0, '2018-10-18 10:36:39', '2018-10-18 10:36:39', '2028-10-18 10:36:39'),
('84827b6631b716bc3020540f70161f276e6ecf57f77ee52932e4e54273934e0a594aa41f5eeeb7a2', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:52', '2018-09-15 18:08:52', '2018-09-30 11:08:52'),
('849163e0a5d400ae2edcd9ae2ba63974ed47b19d426bcf7cfb62aaa11b962e1dfc83a023812ebdd6', 156, 2, NULL, '[]', 1, '2018-09-13 23:10:12', '2018-09-13 23:10:12', '2018-09-28 16:10:11'),
('84a9d7f4fdfe44ed9c10ec73218b6bd5acc272efb14fcad62f39e600d471906f7154cf772bac2638', 146, 2, NULL, '[]', 0, '2018-08-06 22:45:24', '2018-08-06 22:45:24', '2018-08-21 15:45:24'),
('84c2d32ff7125939af78f72a004659e98a84b18e1dd14d2480b8f9cd0893124923950ec7c5af9e24', 6, 2, NULL, '[]', 0, '2018-10-09 17:59:21', '2018-10-09 17:59:21', '2018-10-24 10:59:21'),
('84ff34ff15c0b850b0c090040c574f803b886e5609c8386e870ed6f68c32f981287bc0525622cda9', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:12', '2018-09-15 18:00:12', '2018-09-30 11:00:12'),
('850b5f7bae89cb00e34d8d5905cf8608b4dc73c97c39c817f1bbf6db8e50232df2419656973e7d62', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:57', '2018-09-15 17:46:57', '2018-09-30 10:46:57'),
('8529642a815ba8fcf516d10b38290d0fd577fc7d6ed55237983c5fe390e048bc399563d5cb492f1d', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:17', '2018-09-15 17:47:17', '2018-09-30 10:47:17'),
('859fb3e5f7229ec259531efb86fe11352ef203657ed18b7903a1794b325fac8b0c43f63c89eb88e1', 120, 2, NULL, '[]', 0, '2018-09-05 20:55:44', '2018-09-05 20:55:44', '2018-09-20 13:55:44'),
('85e08aad627d252ee6d38633628fc2384461692a83ffacaea8f82de5a50ec81c8fe307b1dd8b9254', 156, 2, NULL, '[]', 1, '2018-09-12 21:48:05', '2018-09-12 21:48:05', '2018-09-27 14:48:05'),
('85ed9fc77143b06b04248b64c0e2a80eee45ebe36654da01f1ca66ad8b2c193549989f15618f77e7', 120, 2, NULL, '[]', 0, '2018-09-07 02:44:40', '2018-09-07 02:44:40', '2018-09-21 19:44:40'),
('860d46dc6ad5203eb6283282d563e19bcd01d311fe79827447bad9493d118eea63424887c9907fb6', 120, 2, NULL, '[]', 0, '2018-09-11 22:34:27', '2018-09-11 22:34:27', '2018-09-26 15:34:26'),
('8650d120132aecc1bf5f52f3e4d4f817f3850030484e8cc1f3e5104e26dd11764803c56b560ab996', 86, 2, NULL, '[]', 0, '2019-04-18 20:25:32', '2019-04-18 20:25:32', '2019-05-03 13:25:32'),
('8657f746150192913d3593eb45d345b8e52a0ccb8927e0666e4541c9bf432ef92918c6c6feff161a', 5, 2, NULL, '[]', 0, '2018-10-06 20:16:05', '2018-10-06 20:16:05', '2018-10-21 13:16:05'),
('865cf1ba3a28d4a1aa181b8cf0ededcc72539d503bed4bc3e616625e1f0245c4a8c685c8cf4e23f7', 1, 2, NULL, '[]', 1, '2018-09-16 20:43:37', '2018-09-16 20:43:37', '2018-10-01 13:43:37'),
('86ab5bf8c5ce770185bbb440c6c534659582f6fe19cad3568f51e9435a04e5ef4fdbab33a4f48a89', 1, 2, NULL, '[]', 0, '2018-10-10 16:34:23', '2018-10-10 16:34:23', '2018-10-25 16:34:23'),
('86b334ac6b3ad863a82418d422f7209793f0ca9df7d6c765436d29473aefa45a8b703a28a619b2d8', 44, 2, NULL, '[]', 0, '2018-11-23 17:25:58', '2018-11-23 17:25:58', '2018-12-08 17:25:58'),
('8713328f13135ea4793bcf189720647ed4f68e1a7671f0cd2ca33e0db80ce6160f3b9ced77c84c0a', 139, 2, NULL, '[]', 0, '2018-06-09 01:31:32', '2018-06-09 01:31:32', '2018-06-23 18:31:31'),
('871442372f10892e0d6a82097e692b6ef5860f94ca0e66ff4354b0dd0f8f57213ca602181535dc82', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:52', '2018-09-15 17:51:52', '2018-09-30 10:51:52'),
('872a0be760e387c94218b93d481abe19a5e0527fb9dcb22e522af28b2b2a2414bacaf56c1d622537', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:52', '2018-09-15 17:48:52', '2018-09-30 10:48:52'),
('8791b89e9e755aa299155fcb3e4750e1cc0ed4f4827e39e98aed93cc896fb04e117a2e8e62c66a0c', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:43', '2018-09-15 17:57:43', '2018-09-30 10:57:43'),
('879981635b143530f6ecce89ecdd3a76b5bd67559986abb136b0bee8466df6798d5b784a979db6dd', 120, 2, NULL, '[]', 0, '2018-09-07 21:33:11', '2018-09-07 21:33:11', '2018-09-22 14:33:11'),
('87b13dfc386e4e9e45e30df938b37d350012135de8a3ecb1b1003c75d77a59385cdd80e593c4b301', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:27', '2018-09-15 17:55:27', '2018-09-30 10:55:27'),
('87de64f70d24d67d94dd92be6dddc086e8f69f5396e0f4498e76cd4f30f34b8ab71cd5d667cf6c75', 5, 2, NULL, '[]', 0, '2018-10-06 23:48:43', '2018-10-06 23:48:43', '2018-10-21 16:48:43'),
('87e067b11400eb8bc7250e2dfa56e050b32aae3684523cf41c4f8bec7fced6056c7890fe2c8487d7', 5, 1, 'Personal Access Token', '[]', 0, '2019-07-03 00:13:47', '2019-07-03 00:13:47', '2029-07-02 17:13:47'),
('88a5582064109094860ff7d047c7a2dae980761f732c48035cd2d9ea6be091973a0989334b88e2de', 144, 2, NULL, '[]', 0, '2018-07-25 19:55:14', '2018-07-25 19:55:14', '2018-08-09 12:55:14'),
('892596eee80d2efd4d96a0f9f13898509af6fb6149be2b716f948d98fc00bc1521d1e5887975fc54', 15, 2, NULL, '[]', 0, '2018-09-19 22:54:52', '2018-09-19 22:54:52', '2018-10-04 15:54:52'),
('89272d32669f90fe5fe356364fadb97a0b6cea9de7d0518745f0011ad113c8be6121c33e514c89ad', 146, 2, NULL, '[]', 0, '2018-08-03 18:04:52', '2018-08-03 18:04:52', '2018-08-18 11:04:52'),
('89eba9c106063a2cc0a09a8f87971420bfbeebbc844601d3a74068d2c2b1f8d37c1daa3824db6be2', 14, 2, NULL, '[]', 0, '2018-12-28 18:27:13', '2018-12-28 18:27:13', '2019-01-12 18:27:13'),
('89f5f82e8ae87b164deea792bdd28c0cf32055dd6592da82c4cf3f5f6043fd7b1a0ab91e58efc9a5', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:17', '2018-09-15 17:58:17', '2018-09-30 10:58:17'),
('8a5020d0d23bc522a1e95e07e91528e9f76e7916cdaa6c8fa7cbc64ec406f3558091dced70c8f8e9', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:22', '2018-09-15 18:03:22', '2018-09-30 11:03:22'),
('8a703cbf5cfed57aad5b738a5458f8c25ccdb8d182dacf8b5aff0a61ec69f792b0cf889bb96c37fd', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:17', '2018-09-15 18:09:17', '2018-09-30 11:09:17'),
('8a815e421793ab5a5e32472a06e01da38f9f0c557288737a5b7a986d91b224cc8a56153ee3012510', 45, 2, NULL, '[]', 0, '2018-12-01 00:44:51', '2018-12-01 00:44:51', '2018-12-16 00:44:51'),
('8aa89ecb7f8b7b5a7e8933bf67459a651865932b130d5198038235b4d5588f1a8be53ac0bf654dcb', 87, 2, NULL, '[]', 0, '2019-04-16 20:19:56', '2019-04-16 20:19:56', '2019-05-01 13:19:56'),
('8acd5c6807081317d6e7028f590daa11b15331c55c747edb85ea9a95ed239d1db4549e4961d02f7b', 14, 2, NULL, '[]', 0, '2018-11-22 17:28:08', '2018-11-22 17:28:08', '2018-12-07 17:28:08'),
('8ae4426ca9b9192ca84bf5a189f07f7f6e96f5bccb3b5f95d01f2908300e3487a2bf2d5fe533d87f', 35, 2, NULL, '[]', 0, '2018-11-22 16:05:55', '2018-11-22 16:05:55', '2018-12-07 16:05:55'),
('8af00e9e45c12a15ca59ed172fe5b4beaada24158c03a4e6374bbabf66026a28200b505cc9a2936d', 3, 1, 'socialLogin', '[]', 0, '2018-09-15 23:58:29', '2018-09-15 23:58:29', '2028-09-15 16:58:29'),
('8af7d2473504ec28bf7c18d5e86024b1daece75d28e8de943c21a3060d3c061da0cc2f8aeab27f4d', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:12', '2018-09-15 18:04:12', '2018-09-30 11:04:12'),
('8b2f552546f43772241d3599dd84fa0ce7a2160144b4c9e5b26b3d456a7f63594df5b56d78d96608', 16, 2, NULL, '[]', 0, '2018-10-13 04:29:31', '2018-10-13 04:29:31', '2018-10-28 04:29:31'),
('8b5ab4debd1d966b19dcf16d0650547b29db3d889ff5a1dec7b951c70b8df4ed09f05475e1bb98f7', 14, 2, NULL, '[]', 0, '2018-10-27 11:30:56', '2018-10-27 11:30:56', '2018-11-11 11:30:56'),
('8bb2c3a20f13057b30e31570c7e7c82d595b3f6e8ddfa2ccc15994d3c3e94faf8876b81e935e80c0', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:37', '2018-09-15 17:50:37', '2018-09-30 10:50:37'),
('8bfd489e606a67f5acdc0fae5c7679698f6dc934d87b9016c62587ce2121f1e4745044080619c0cc', 145, 2, NULL, '[]', 0, '2018-07-22 20:38:03', '2018-07-22 20:38:03', '2018-08-06 13:38:03'),
('8c030d73f5a80f0ab7737ed1fdf3e84fa416463de222f45ed7b69ab411b3c826b9df3f0bed9b2d35', 14, 2, NULL, '[]', 0, '2018-10-22 10:48:53', '2018-10-22 10:48:53', '2018-11-06 10:48:53'),
('8c0c8f56ce1ee37b52e9e47da1875a25e2f81da82d971c334fb994d0b0c92bc984b9e226b291ed73', 156, 2, NULL, '[]', 1, '2018-09-13 21:50:58', '2018-09-13 21:50:58', '2018-09-28 14:50:57'),
('8c159424a82ffb3c0c1e573ea2948b30f57aa8d9da4deed92801453521dbb95cd3034f2ff5126df3', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:37', '2018-09-15 18:06:37', '2018-09-30 11:06:37'),
('8c39673686478b9d9fdf383703cf471248f0b373e473a9638fc527c1d9e9cceb3ee8a1fcb9a55662', 82, 2, NULL, '[]', 0, '2019-04-16 02:32:03', '2019-04-16 02:32:03', '2019-04-30 19:32:03'),
('8c4dfbf7120bf119c10302b956388206f4912bd3f028ef57112a0b8ab5bd740c75d290e5de72950c', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:42', '2018-09-15 17:47:42', '2018-09-30 10:47:42'),
('8d185bc05a02d42fad4492e7612a34d296c3c226bed2d971fd549efcb84f26466fefd22446469c8e', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:37', '2018-09-15 17:44:37', '2018-09-30 10:44:37'),
('8dd34c18fd0309c4769871374f7c472742696ed5b6a0b189efa2c8263479c59683e42e36ce07b1fa', 5, 2, NULL, '[]', 0, '2018-10-08 21:27:59', '2018-10-08 21:27:59', '2018-10-23 14:27:59'),
('8ed73684754052a865925f1e3dbb2417231329694f939091ec310738d1cd99b3f8fca8dae27b4ea4', 8, 1, 'socialLogin', '[]', 0, '2018-10-09 01:00:56', '2018-10-09 01:00:56', '2028-10-08 18:00:56'),
('8ef4e6bb3861b3c6b4df226bfdb8bc5f022856679ae6eeb6c6de089ee3f0390d5ca307dd5cdb64ba', 132, 2, NULL, '[]', 0, '2018-06-11 22:55:49', '2018-06-11 22:55:49', '2018-06-26 15:55:49'),
('8f589a2ecc7a9a56b32e7deeee90e7e85b4dd06136c90cffd4709d44dc79381eb72d07e5f47d43a1', 5, 2, NULL, '[]', 0, '2018-10-06 19:29:36', '2018-10-06 19:29:36', '2018-10-21 12:29:35'),
('8fa7bf9cc7fb955bf6b313bb32cc0ed30e0c86ad9bab4cf1f86db60a47f08d2859c660acca74d5e1', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:42', '2018-09-15 17:58:42', '2018-09-30 10:58:42'),
('8fb0b3aa1e6f8fe7a2d6b659182ed5f441e15ed9d4ce43a3a975590113acb9c14d2117848f7f33b8', 45, 2, NULL, '[]', 0, '2018-11-26 15:40:51', '2018-11-26 15:40:51', '2018-12-11 15:40:51'),
('8fc322f204321d7e7f8d5d5d36caa96b3a5ec69a4d978b0386d18220e896cfe378a6e9de3d327d88', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:44', '2018-08-10 23:12:44', '2018-08-25 16:12:44'),
('8ffa9d596d65481fef954d7801bd172fb3c4a67dd0fd5567d3a60651b0f189447707cbd8c3156925', 1, 2, NULL, '[]', 0, '2018-09-16 22:23:13', '2018-09-16 22:23:13', '2018-10-01 15:23:13'),
('9022dea74994d5dea18043aea9f30b8a2c779dcf0f766d66f5d136ae2f8ce8c6b7d499e544657d63', 15, 1, 'Personal Access Token', '[]', 0, '2019-03-30 03:28:58', '2019-03-30 03:28:58', '2029-03-29 20:28:58'),
('90426b11e9d4c52bf0f0e5548c87b09d673f14051ed0fafe168880054f6ee8d99c5885519edafb35', 4, 2, NULL, '[]', 0, '2018-10-04 19:20:03', '2018-10-04 19:20:03', '2018-10-19 12:20:03'),
('904952a88b10e331231a2331b1c6ba9c547c1861b9716c1dd1aab9fc3cae9c6e2db844949f48acbf', 1, 2, NULL, '[]', 0, '2018-09-19 01:22:18', '2018-09-19 01:22:18', '2018-10-03 18:22:18'),
('90524bc4102f2f01be6fc295eb62803ddc43646a92a72f83ef66e6e26fdfea40df18d64dd0024eb0', 4, 2, NULL, '[]', 1, '2018-09-16 06:48:22', '2018-09-16 06:48:22', '2018-09-30 23:48:22'),
('907857cd4b3d347a6cd72dbdb57e731f6a23202ed5f30b10fefd0f1f5b80447ae26b8314a7708360', 14, 2, NULL, '[]', 0, '2018-10-31 13:13:32', '2018-10-31 13:13:32', '2018-11-15 13:13:32'),
('90884bdbaff4a69e8180efa8fc049a6d5fd328ab8b443ebaedc7ce742200e988cc0f2bac50f7f667', 11, 2, NULL, '[]', 0, '2018-09-19 19:19:59', '2018-09-19 19:19:59', '2018-10-04 12:19:59'),
('90ab22cf1a819a7153378c35eb1fb220d818a6fc315e0f026ab04348477b8705027074c920336c85', 79, 2, NULL, '[]', 0, '2019-02-28 01:52:03', '2019-02-28 01:52:03', '2019-03-14 18:52:03'),
('90bdcf5cf89c9c3e7f97941cf966fe091e51c3d6f7c03f16bf94a7bfdb903ca5554fd722abcd64ec', 5, 2, NULL, '[]', 0, '2018-09-16 17:18:22', '2018-09-16 17:18:22', '2018-10-01 10:18:22'),
('90c70a298741a4a40426aa13dda6ea855e953d8adc0a7422b99d37e72f975d311f7f07eed2dfd5d5', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:52', '2018-08-10 23:12:52', '2018-08-25 16:12:52'),
('90ceeee0983b8c968ab326acdbe63025544666ce9bb4c04fdb794c52a6496c1b2e09deaf008c677a', 50, 1, 'socialLogin', '[]', 0, '2018-12-20 01:11:13', '2018-12-20 01:11:13', '2028-12-20 01:11:13'),
('91573f23ec3f153a9ac46867691a130a7869978c76b3e41e83946175485dea8612c1ff5c8ede1b15', 5, 2, NULL, '[]', 0, '2018-10-06 18:05:57', '2018-10-06 18:05:57', '2018-10-21 11:05:57'),
('91593bbf651cbbb5e78853ede62a97a78b7c2916f8ace6382f51b6e2cfc798d767e814f7e83e6ce5', 58, 2, NULL, '[]', 0, '2018-12-31 12:45:40', '2018-12-31 12:45:40', '2019-01-15 12:45:40'),
('91660843a025c6d3e9a690421ad481f0b8fbc12ddb56f2c16ee6ded5ae04afd2645b61f4d9b6a1ac', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:17', '2018-09-15 18:07:17', '2018-09-30 11:07:17'),
('919e0d7a72affef22a7ade4ac8ead551326d2475c8de059275a0d12286a930977499f2ecf58dcb17', 61, 1, 'socialLogin', '[]', 0, '2019-01-05 14:51:35', '2019-01-05 14:51:35', '2029-01-05 14:51:35'),
('91f42f2df488ebafd8e4027f84b915cd9480e7361bf8493d1ad1d98ff48ab0bc3d94887da2d82b8a', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:32', '2018-09-15 18:08:32', '2018-09-30 11:08:32'),
('923370418be78ad7ce833bdacc30aa346bed6c65326d76aea2eb4fd8e5b87922b3c3f802647ce087', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:27', '2018-09-15 18:02:27', '2018-09-30 11:02:27'),
('92e6c36d4f48c121bb47bdac6ce47ddc36a8884ac3499fdbfd73657c7553be9a026232c674b295a9', 3, 2, NULL, '[]', 0, '2018-09-29 18:58:07', '2018-09-29 18:58:07', '2018-10-14 11:58:07'),
('9304ac18b3b1e9a042c292c6c22c5b08a2a4eb480b9b77bf76010d8ceab0f78f21c40bf7ec9086b8', 20, 2, NULL, '[]', 0, '2018-09-20 18:59:24', '2018-09-20 18:59:24', '2018-10-05 11:59:23'),
('93b0733500eeb0ac5fe11421bfc382d6f20c5340f27329f3e0d12694d75eec262fa04cf95bb21876', 146, 2, NULL, '[]', 0, '2018-08-01 22:49:02', '2018-08-01 22:49:02', '2018-08-16 15:49:02'),
('93bbe288cac353cdf0abfe436994617f4b982f2fb8b0a25c51175f4105dbb617eb2074e53ec71836', 14, 2, NULL, '[]', 0, '2018-12-26 15:05:36', '2018-12-26 15:05:36', '2019-01-10 15:05:36'),
('9406b378953267908a566ae7dec83d7833c083af8a7fa3e61e99d6b403156976e2401413324deaa8', 120, 2, NULL, '[]', 0, '2018-05-31 07:21:23', '2018-05-31 07:21:23', '2018-06-15 00:21:23'),
('9412e32284f9487e9132b2442dd902c2a7ec800fa04c1a5bc336d06792bb942d269c67c90a5125ad', 84, 2, NULL, '[]', 0, '2019-04-10 06:46:46', '2019-04-10 06:46:46', '2019-04-24 23:46:46'),
('94a31d9511cfd5fb43e883f16cea952c607d687207bea0247ef1ea6526553286b62ca601bba4c72e', 8, 1, 'socialLogin', '[]', 0, '2018-10-17 18:21:59', '2018-10-17 18:21:59', '2028-10-17 18:21:59'),
('94dafd3886ddb67d0cf7fbd5ceb64d5ef046a4bfbd4d6506cc521e4b9380345323f425af716c9969', 45, 2, NULL, '[]', 0, '2018-11-26 16:43:03', '2018-11-26 16:43:03', '2018-12-11 16:43:03'),
('94f4247639f82765e7f776ddf599199ab7f34bb5537bcbd9cdc137793abe103b925830bef7227645', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:07', '2018-09-15 17:51:07', '2018-09-30 10:51:07'),
('955b26d2bf81e84f0f5a17cd536879cabf44e24098360c2a6608305e1ea313907e75db26556356e8', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:08', '2018-09-15 18:08:08', '2018-09-30 11:08:08'),
('955d4f4ad98cab30e2c0b708ab3873753db69033a8c569c0c16d6f6eac387104b3565531b29b0ce7', 120, 2, NULL, '[]', 0, '2018-09-07 03:12:08', '2018-09-07 03:12:08', '2018-09-21 20:12:08'),
('9573b5e01c954562de3fd56eb0fa5fd5a68536257a21672d9a0bf046ccddaba1b09ffaa66f43236d', 1, 2, NULL, '[]', 1, '2018-09-16 00:34:06', '2018-09-16 00:34:06', '2018-09-30 17:34:06'),
('95a02041d9ad5ab80acccf3528eae4929f1cd283f26c81e0de1c2b5aa331dbbefa7d923cd165b29a', 156, 2, NULL, '[]', 1, '2018-09-07 00:43:01', '2018-09-07 00:43:01', '2018-09-21 17:43:01'),
('95c6e73daea6792e2e29f7c27d464f2d007e990e730cc1f4bd1205fe62b3f7d935f3c8df8dce085f', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:12', '2018-09-15 17:47:12', '2018-09-30 10:47:12'),
('95e25fb473095b5ef00818c6b654d23cc7b78033849543fa8122f4572615b61e032bfe5c0e028668', 83, 2, NULL, '[]', 0, '2019-03-31 11:29:37', '2019-03-31 11:29:37', '2019-04-15 04:29:37'),
('95e85682e06bc830dded3b4b36b15a866e6ef625c2470f6eab839f3eeeaacfd8d612a2069737fa96', 125, 2, NULL, '[]', 0, '2018-05-23 05:09:02', '2018-05-23 05:09:02', '2018-06-06 22:09:02'),
('95eb3caa3db1b2be1966fdfd70fdc53dcc3fbca7f4fee57ae575155bb37f46f74dbef10dead33c38', 6, 1, 'socialLogin', '[]', 0, '2018-10-17 10:27:12', '2018-10-17 10:27:12', '2028-10-17 10:27:12'),
('95ed509fd8ce06c8ad2f4c3f2c8d050dcc5f4584caed33af4484488d5044d0f1fa9593656a9b413b', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:22', '2018-07-20 23:22:22', '2018-08-04 16:22:22'),
('95fdc489ab4b55d600a230f3b294f3b7aed1cfce13382a90fce956deff0e849684d080e17496f311', 5, 2, NULL, '[]', 0, '2018-10-09 22:22:30', '2018-10-09 22:22:30', '2018-10-24 15:22:30'),
('9607de8c993f45c4a5d5bba519ccae2d5e06f50d2ce52107d3bd1f80d788ee783f19dbff94390155', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:57', '2018-09-15 17:54:57', '2018-09-30 10:54:57'),
('96162f4568a21827b721559c01fe701d0f6f0adb35db115bf47c772de209e240dbcf7c76efdc773a', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:57', '2018-09-15 18:02:57', '2018-09-30 11:02:57'),
('961a99db0a841798d9964986383552a1c2ac34bbff7d1ceae95e2e52a32abf3c35944e83bde2b9c3', 150, 2, NULL, '[]', 1, '2018-07-20 23:21:57', '2018-07-20 23:21:57', '2018-08-04 16:21:57'),
('963a3adf55020222549ff7d219d9a5ae357ecc1b30d01ad68e1f4e91060121df4db8329186869381', 86, 2, NULL, '[]', 0, '2019-06-18 02:07:41', '2019-06-18 02:07:41', '2019-07-02 19:07:41'),
('964e306d73137b89b9f092007cf08c068a89f22cb32e891dcb02d6817658be2406105dae1f9427ea', 1, 1, 'Personal Access Token', '[]', 0, '2019-03-29 23:04:33', '2019-03-29 23:04:33', '2029-03-29 16:04:33'),
('96bce3ad7e6a34c09add25deaacef329bac4c1bd44ba669de353137dd99d9680bee81423e00497a6', 4, 2, NULL, '[]', 0, '2018-11-24 19:22:38', '2018-11-24 19:22:38', '2018-12-09 19:22:38'),
('97386c785deacc27a89c750defa2c300335998de3bd2b179d8ae3e0845b0a3dce32112efd55d74d5', 156, 2, NULL, '[]', 0, '2018-09-11 22:37:05', '2018-09-11 22:37:05', '2018-09-26 15:37:05'),
('977aed80b5d889add1e3f3d0e79bc453b0cc0592d310943ff59e168b0a16fa8d1f8e1167d2f8318d', 146, 2, NULL, '[]', 0, '2018-08-08 19:46:00', '2018-08-08 19:46:00', '2018-08-23 12:45:59'),
('977dae96144c70d76bd15415a2c948eb7aa9d88a97ac4065a88c0a82959e03fb12fa4a51c42a08b8', 60, 2, NULL, '[]', 0, '2019-01-04 22:05:58', '2019-01-04 22:05:58', '2019-01-19 22:05:58'),
('979781a6fae3939d2535d7d16bb6ed3dde39c881eb179a115bbb84c463020e27aa7292cdbe9269f9', 156, 2, NULL, '[]', 1, '2018-09-14 18:52:41', '2018-09-14 18:52:41', '2018-09-29 11:52:41'),
('97e8ae6082cba3401cfdf19a0c20106f096c6e143cf60c187196d1af0a400fff814ae7b91795e44c', 14, 2, NULL, '[]', 0, '2018-10-22 10:29:36', '2018-10-22 10:29:36', '2018-11-06 10:29:36'),
('97ee6c3042c71d658be3f94b37edf6e5bb95fabcbe8049d2beccc9f0445e3cdf30c8275027bb6c38', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:37', '2018-09-15 17:47:37', '2018-09-30 10:47:37'),
('9801bc8165fc051ebc116b48aec3e170b1e264a1384742ea29190d6f0342c82a8e91028bdfd20eec', 21, 2, NULL, '[]', 0, '2018-09-20 19:22:58', '2018-09-20 19:22:58', '2018-10-05 12:22:58'),
('98068a649cbcb2377d5eaa445b2c9bd23fd8827483bc73bc57f499130a163afb7f601a6caad6c332', 24, 1, 'Personal Access Token', '[]', 0, '2019-05-10 23:25:54', '2019-05-10 23:25:54', '2029-05-10 16:25:54'),
('981607158725c9d4b7444aa199cbbf31a026ebd90655ee6d4019ec1a751b4180f96460e64b3d27a6', 20, 2, NULL, '[]', 0, '2018-10-15 11:28:10', '2018-10-15 11:28:10', '2018-10-30 11:28:10'),
('986a5ecb6befd722c44a914b92943963e7d11a86b8cec734703318d48a7cfc3277f80e1174117bb6', 120, 2, NULL, '[]', 0, '2018-09-01 23:15:23', '2018-09-01 23:15:23', '2018-09-16 16:15:23'),
('98b1d5a8691619fa27a00a134569805f1115be5d270e602d33974c00fd0b343ffb82c7d6baabdc73', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:33', '2018-09-15 18:06:33', '2018-09-30 11:06:33'),
('992b18f3102fab8b907217d65a800b556b5cdbe582dad8f97902793f2a79ca9bfaa112f6637aa98f', 150, 2, NULL, '[]', 1, '2018-07-20 23:21:59', '2018-07-20 23:21:59', '2018-08-04 16:21:59'),
('993dcaeeb870620991ef788ba77338ad8970f48c1bee633d49d2ccdc884ebae2952185cb0f3b8855', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:07', '2018-09-15 18:02:07', '2018-09-30 11:02:07'),
('99563700051203356d06c281f7be63368ede8ed1e2783a9935b4f1e172ed1cb0f27770a792ab73b9', 81, 2, NULL, '[]', 0, '2019-03-08 00:12:54', '2019-03-08 00:12:54', '2019-03-22 17:12:54'),
('995910db629dedc4714f1fec5125ad34b6174c653af9130bf1e98d16f0e564b2f00326ef7d741e70', 17, 2, NULL, '[]', 0, '2018-09-19 23:32:15', '2018-09-19 23:32:15', '2018-10-04 16:32:15'),
('9965bb36d31688adc0e918b3ffab02d9a479f84be75c7f5dc6bf6f9f3bd7b4064e5a928ee4cffc0f', 87, 2, NULL, '[]', 0, '2019-04-16 20:29:02', '2019-04-16 20:29:02', '2019-05-01 13:29:02'),
('99ad80056aeb7d05c1ca2bdb4af747a82d188e48129d6423a83b055db7bb7c22a0f472d80e1d8c71', 36, 2, NULL, '[]', 0, '2018-10-31 23:30:37', '2018-10-31 23:30:37', '2018-11-15 23:30:37'),
('9a209b945401d967689056db8dbbeb9feef9b8af92162c1c72b3cff42979e9063197f1008c977638', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:55', '2018-08-10 23:12:55', '2018-08-25 16:12:55'),
('9a20f15210a4cca8a977f7fd3f91282f91925a60c67d74585d30d1ef1872825a71e5b6d241d5e687', 153, 2, NULL, '[]', 0, '2018-08-25 01:04:22', '2018-08-25 01:04:22', '2018-09-08 18:04:22'),
('9a36383a01c1ffb73df289c23e599636b52e86f0cc64a375ea5555ea8ee46b5e0803f96a2f6e6be1', 144, 2, NULL, '[]', 0, '2018-08-01 18:32:52', '2018-08-01 18:32:52', '2018-08-16 11:32:52'),
('9a81d56325d036d7d8b85e05dfd0b7331d801686739a78f2d216d751c7bb3c5b5dc4e6d7f2f0fef1', 35, 2, NULL, '[]', 0, '2018-11-23 15:05:26', '2018-11-23 15:05:26', '2018-12-08 15:05:26'),
('9a97c02a7c611b1dd700f93c3bc64335037dbf43069eed9f55fc04aecf04da43998882e408eb7a0e', 1, 2, NULL, '[]', 0, '2018-09-16 20:52:44', '2018-09-16 20:52:44', '2018-10-01 13:52:44'),
('9b0840fc548ff159bc7802c7db52b05f8e59693a1744fa0aa5265c195340d0bea27fd865d81b5cae', 15, 1, 'Personal Access Token', '[]', 0, '2019-05-14 02:36:54', '2019-05-14 02:36:54', '2029-05-13 19:36:54'),
('9b58fe1b6785e7fd158fd0967a05a8b2c2a58c950e49d93cc8f646cf35faff6c16c884152673a365', 4, 2, NULL, '[]', 1, '2018-09-16 06:54:26', '2018-09-16 06:54:26', '2018-09-30 23:54:26'),
('9b60736e39b78ed30b3598f3da4478f82db31b98512fd010d0db0707a2f18268be5d2661477cbbdf', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:37', '2018-09-15 18:07:37', '2018-09-30 11:07:37');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('9bb1f809d6e20d63f2df033c2c06f649a535781bd5796ba98fb8703a8085399355824f6623723cf4', 14, 2, NULL, '[]', 0, '2018-09-19 23:29:26', '2018-09-19 23:29:26', '2018-10-04 16:29:26'),
('9bc95cab90b7c9e719af624d2bc67f8eb2c4c07bb198cb7ae9a960ad8c239d942291ef021d9b00ca', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:47', '2018-09-15 17:57:47', '2018-09-30 10:57:47'),
('9bd17bd162635a4c07e1aa318f829cd2d9044ce34881fdab0e1c390798bd78ddc38ec293b80e7f77', 140, 2, NULL, '[]', 0, '2018-06-11 22:52:26', '2018-06-11 22:52:26', '2018-06-26 15:52:26'),
('9bf29322d0d6b1dae93f849743083d99fb330eb149772b152b36e6893c2d281a997b12a1554bc533', 7, 1, 'socialLogin', '[]', 0, '2018-10-17 18:22:31', '2018-10-17 18:22:31', '2028-10-17 18:22:31'),
('9c3f7e75747539883150c708180b228799200ada1bf9b058418ab3cf8d111564c85b671c54730f71', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:47', '2018-09-15 17:54:47', '2018-09-30 10:54:47'),
('9c75cabeb1edc1606324e901d6a35157e316e25f05149ebc0eb03792de6244e7f58d7755bc8c482b', 2, 1, 'socialLogin', '[]', 0, '2018-10-15 21:15:24', '2018-10-15 21:15:24', '2028-10-15 21:15:24'),
('9ca9a61153cafae389c7fe4c3b7184bdc1494637cb7d9e73aa57daed090fe83c9f75263be1a76c1b', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:27', '2018-09-15 18:01:27', '2018-09-30 11:01:27'),
('9cb7c7a654abce120991c5d46ec680fef713ebb8f828a8306601d6c96794f1724bfd3c43152d03be', 86, 2, NULL, '[]', 0, '2019-06-17 23:44:54', '2019-06-17 23:44:54', '2019-07-02 16:44:54'),
('9cd4daecbf0f096c4b796febb4a32360714e330e25a66fc03692f9335fbf75b6f56f243ea5a7768c', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:44', '2018-09-15 18:02:44', '2018-09-30 11:02:43'),
('9d7b139c64ea5b6be579d82cbcd0ac4f8831962d518fd47e6ac8b2c0233c7c62cdb10916a5626b3a', 5, 2, NULL, '[]', 0, '2018-09-19 02:24:47', '2018-09-19 02:24:47', '2018-10-03 19:24:47'),
('9d8276b25979be5480003acb0b573fa5bfdaa038954039342daaa1e8028e5cc0900f29ac0650dc6a', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:52', '2018-09-15 18:00:52', '2018-09-30 11:00:52'),
('9da60e417bccfc47be32db15bdc64a6919f680c90561c5e437b7f67841981d568e62a3cddce7a233', 146, 2, NULL, '[]', 0, '2018-08-01 00:42:20', '2018-08-01 00:42:20', '2018-08-15 17:42:20'),
('9dd1173dd91478465aa64ad9e057ad88317311c6a373345f05d9c76470e73c139f0de10a7de0bcb0', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:02', '2018-09-15 17:54:02', '2018-09-30 10:54:02'),
('9df9597126301736b9d02f36529ffc82855c80266eb9670ebbb2acea434e2ade3273ad350bb0ab4a', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:07', '2018-09-15 17:58:07', '2018-09-30 10:58:07'),
('9e2465b0824c941568af84420fe78e716df457146a2a8c0f9e25683f1346748eb6e668a969a12e0e', 45, 2, NULL, '[]', 0, '2018-11-30 18:46:26', '2018-11-30 18:46:26', '2018-12-15 18:46:26'),
('9e609b3759734bd39961740f5b7b11f4d8f672e2e1055ae8d1488989aea0deed9e02923ab9ca88ff', 1, 2, NULL, '[]', 0, '2018-09-29 22:22:45', '2018-09-29 22:22:45', '2018-10-14 15:22:45'),
('9e8c20ad75df7085d93c131e45c5945b678c33a3bd8e0274f00fb55c9a38545ed01baf7166649978', 122, 2, NULL, '[]', 0, '2018-05-31 05:05:54', '2018-05-31 05:05:54', '2018-06-14 22:05:54'),
('9ebb88f4bbad019f1b29eefc6444efa85b49a152bf2f91c0033b9362949bcc25b7739b127a8b0614', 1, 2, NULL, '[]', 1, '2018-09-16 00:40:23', '2018-09-16 00:40:23', '2018-09-30 17:40:23'),
('9ec5432eefbad835c9b8d661f4212dce23e182e54be6884ebb834d48c6672099d781bba2718be76a', 4, 2, NULL, '[]', 0, '2018-09-16 06:58:43', '2018-09-16 06:58:43', '2018-09-30 23:58:42'),
('9ed0d247e5bf53ef5de871662a94f8ae2d362c647701a0ec875a9fc4dc01008ab5b4bf419fc7b6a1', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:02', '2018-09-15 17:48:02', '2018-09-30 10:48:02'),
('9ef9820225d52c4d5ecd7712fb493f06268fb113b3b9690f73f1c3aa54c4044db3b5c6bdb2ac3433', 15, 1, 'Personal Access Token', '[]', 0, '2019-05-14 01:39:34', '2019-05-14 01:39:34', '2029-05-13 18:39:34'),
('9f130fb4ea6e000a0e3d63668210103e386b32408e30a5f008cf51e24763319c9b1f0a2f61385b34', 19, 1, 'Personal Access Token', '[]', 0, '2019-04-02 14:06:16', '2019-04-02 14:06:16', '2029-04-02 07:06:16'),
('9f3d99fe9d79f6d1f94f3e491b532e6fef61b92e5865c4a15a24a3aec190e2f6c399880669bcc513', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:42', '2018-09-15 17:53:42', '2018-09-30 10:53:42'),
('9f722eff9f8d303ba7563d30280c3348e8ea60e05c8bd8afeab111134e94f9a5fdc5bcd04b1e961e', 14, 2, NULL, '[]', 0, '2018-11-01 11:15:01', '2018-11-01 11:15:01', '2018-11-16 11:15:01'),
('9f808835edf82403a133657a7a64be0975d89a2ba7b356264f3e84b9d018d952cc744287e8417b53', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:52', '2018-09-15 17:50:52', '2018-09-30 10:50:52'),
('9f910fdf16e98032e7889bfebcd57ce7e41b44a4c7d93f5913bf1976f0dba0ac12a6c5ce95c79917', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:47', '2018-09-15 17:51:47', '2018-09-30 10:51:47'),
('9fbb42266717448bc425ccc88cb7358aba8b83252bf6632bb588977b0f8c4d021e7ea0e6717d24c8', 5, 2, NULL, '[]', 0, '2018-10-07 00:09:34', '2018-10-07 00:09:34', '2018-10-21 17:09:34'),
('9fd2f1377bf4accbfb5a2131687cef6cde819f1503c1f1fa85303f9b7da80996ea2b1f6fc625ccb0', 122, 2, NULL, '[]', 0, '2018-05-29 04:11:47', '2018-05-29 04:11:47', '2018-06-12 21:11:47'),
('9fe135fa6e5006f4328426ec09af6af172a0d6d9f4c276ee68503e61d5f3c4fdd3e05faa0c89478f', 17, 1, 'Personal Access Token', '[]', 0, '2019-04-01 23:13:20', '2019-04-01 23:13:20', '2029-04-01 16:13:20'),
('a0187c3b35c7b708ee27c31650399c864584862f79eff7591d12e45d6c382e3c4c522414f871334a', 5, 2, NULL, '[]', 0, '2018-10-09 22:04:49', '2018-10-09 22:04:49', '2018-10-24 15:04:49'),
('a03f64cbf135349f884fa6d0e32e1b0547e88559a3e3b8045f44ab7c19d46d313e3faee6414c6bba', 1, 2, NULL, '[]', 0, '2018-09-28 20:26:10', '2018-09-28 20:26:10', '2018-10-13 13:26:10'),
('a0541c3e6e88de02b08160397aa6fb5816cd6ba62907f41395b6483ee6cff6ffc5bd9a315c36252d', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:17', '2018-09-15 18:00:17', '2018-09-30 11:00:17'),
('a0e7a6477feb67de4280aeced5289e59fb99bad903dbe63b6b96c48c15796b1b37aa73ec757d99f5', 6, 2, NULL, '[]', 0, '2018-10-09 01:52:37', '2018-10-09 01:52:37', '2018-10-23 18:52:37'),
('a144a7165049cd52b2849d529d8c9869d19b1dbbc0bee4de19bdacb499af9861a7eaa58716648b57', 14, 2, NULL, '[]', 0, '2018-09-19 22:10:57', '2018-09-19 22:10:57', '2018-10-04 15:10:57'),
('a1823681dd22a2ffb4a117ebd4b2df54564aa8e250b91ce37ceb04002025c5a55e378db1bcf7deef', 120, 2, NULL, '[]', 0, '2018-05-23 21:13:40', '2018-05-23 21:13:40', '2018-06-07 14:13:40'),
('a18e6786f6153dc5ed40d1a71fb40bdef65da434dc64eebb516a74299b2f9dcaa4627bc62b11ca38', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:02', '2018-07-20 23:22:02', '2018-08-04 16:22:02'),
('a193e6941cf47437d1bef118d81d9b99bb354e17dc08be0e30b46059f6296d257690997af0a9c831', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:32', '2018-09-15 17:45:32', '2018-09-30 10:45:32'),
('a1f22c1027fbc56daeaf802ae274bed3363af255a979ba95f429a19b790d6f37e4a10ba59ba4ee4d', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:42', '2018-09-15 18:00:42', '2018-09-30 11:00:42'),
('a26b7aa262390663cdeb9f263fef68865a2feed2bfc7085b33dc7a940c9c9abe132d8c36bd4e0f09', 58, 2, NULL, '[]', 0, '2018-12-31 12:33:41', '2018-12-31 12:33:41', '2019-01-15 12:33:41'),
('a26d9f5cd11dda566be17e32e2e7515c67f423f334ac6b8e12cc69e4655719d607b3340fa51c7f50', 82, 2, NULL, '[]', 0, '2019-03-28 02:18:39', '2019-03-28 02:18:39', '2019-04-11 19:18:39'),
('a283112ec2e65f93e25f9766b9128aa5d506a0aace838810214a76ec503bdb1a66c81778e107998f', 156, 2, NULL, '[]', 1, '2018-09-14 06:11:01', '2018-09-14 06:11:01', '2018-09-28 23:11:01'),
('a2894319b88fae63e8dd2f33c32842cb6efeff64616031824896c1fd982e358c84052b51d954638e', 35, 2, NULL, '[]', 0, '2018-11-13 13:01:45', '2018-11-13 13:01:45', '2018-11-28 13:01:45'),
('a2e1c80635b01533a1ea7d95748fefc95c5c333f97209021c46cd55b8cf18cabf3aa2e924a5eef32', 35, 2, NULL, '[]', 0, '2018-11-19 15:03:44', '2018-11-19 15:03:44', '2018-12-04 15:03:44'),
('a300fdfbdc7d70ca258de80d9df07563e42a450edc8b3deb5f799f5d6bab4cb3508f9ba34f4b31ed', 7, 2, NULL, '[]', 0, '2018-09-18 17:12:22', '2018-09-18 17:12:22', '2018-10-03 10:12:22'),
('a3746a6c646fe9c2425fb0984ccadf671ffc239f76ec6dd5ddf220ece3fa31d7710c8b032247843c', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:28', '2018-09-15 18:08:28', '2018-09-30 11:08:28'),
('a3753557a68959fc305bb3f51c7edca64d2e639fa1d481212e17affc35fadfa3cfec87c9f2693f7d', 4, 2, NULL, '[]', 1, '2018-09-16 06:50:43', '2018-09-16 06:50:43', '2018-09-30 23:50:43'),
('a37be619e06f344c1fcb58b95feef07e9d082d5562743411fdeb766f9f3b805fac2ba2128d0fd4af', 156, 2, NULL, '[]', 1, '2018-09-14 19:33:50', '2018-09-14 19:33:50', '2018-09-29 12:33:50'),
('a39442bd1452b667dfa3ebfb5c8de8391f8aa96b5f929f6ecdc6f3c7ac3f4f4ec61ad919766c8c06', 5, 2, NULL, '[]', 0, '2018-10-09 21:59:53', '2018-10-09 21:59:53', '2018-10-24 14:59:53'),
('a3f098bc92941ebcebb335c5ff893781c09b2194b734071ec1f214eb12828cc917eb82f614dfcb13', 150, 2, NULL, '[]', 1, '2018-07-20 23:21:56', '2018-07-20 23:21:56', '2018-08-04 16:21:56'),
('a474163661188b2ce2083dcb16a30011c9da55b69d9c7e5593fb33df4867992d739878f8e736415c', 13, 2, NULL, '[]', 0, '2018-09-19 21:51:30', '2018-09-19 21:51:30', '2018-10-04 14:51:30'),
('a48232c915d05ec2520ffb150ea94d3fb88c19120face1df2ba45bdf8e472c7039491d7d0461b1a7', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:02', '2018-09-15 17:44:02', '2018-09-30 10:44:02'),
('a4991ced5374001902167f88f27f8cd803655bceafb0d495b36deaa7ad3b3afcf3bc6bae56b79cd6', 18, 1, 'Personal Access Token', '[]', 0, '2019-04-02 09:33:57', '2019-04-02 09:33:57', '2029-04-02 02:33:57'),
('a4a9d24c4f8afefb9c06e3a1362018eddd9c4568fbaa03d375881320b34b1f43da885e0bb582e760', 49, 2, NULL, '[]', 0, '2018-12-18 20:25:27', '2018-12-18 20:25:27', '2019-01-02 20:25:27'),
('a4ac59990148774a8636ca1b0608387eaa0d8942d75bf1662498a46996ee648d73826545eec64a16', 2, 1, 'socialLogin', '[]', 0, '2018-09-15 21:35:51', '2018-09-15 21:35:51', '2028-09-15 14:35:51'),
('a4cb3b4bc8a8bf50ede7b69a0b21595d8c4a59ee5bcb6dcf1c6e2df9f97dc89d3906336807eadc95', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:47', '2018-09-15 17:46:47', '2018-09-30 10:46:47'),
('a4dacb251f1b99efc54d9d992c519189eb745a53f8968c4393ec041a6c1595ad135831e4d98f1cf6', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:37', '2018-09-15 18:01:37', '2018-09-30 11:01:37'),
('a50b671289896a84105d73aebda7baf8ffd67189794f2a71daa582b0b2147741072663a2c490668e', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:21', '2018-07-20 23:22:21', '2018-08-04 16:22:21'),
('a52950969059397e0b936bcba7fdbdf488b021ef96e1435d78397c1024732b3e4ade5e06b5577a65', 9, 2, NULL, '[]', 0, '2018-09-19 17:08:25', '2018-09-19 17:08:25', '2018-10-04 10:08:25'),
('a583fab1dbde0719e40f1f5e03d52427fbb7df46b2e7487206d36f15a1946d6047e93384799e1197', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:02', '2018-09-15 18:08:02', '2018-09-30 11:08:02'),
('a592b2a57f147c5bdc0bd2b5e567787567021b00e00430eab4fb62bae4f52105952419d0f8a1b5a4', 156, 2, NULL, '[]', 1, '2018-09-14 19:20:07', '2018-09-14 19:20:07', '2018-09-29 12:20:06'),
('a5b285194f30941cc1b58d5f79875c6b81b61733ce84a099bc09a16b81b0cbc89b5b97e60e3ce181', 144, 2, NULL, '[]', 0, '2018-07-27 01:45:20', '2018-07-27 01:45:20', '2018-08-10 18:45:20'),
('a60c104cef2db52f047577c0572a91ebdc395ed4d78462a5288e06e4aeb944b917626ccfecf98fba', 2, 2, NULL, '[]', 0, '2018-10-12 10:35:10', '2018-10-12 10:35:10', '2018-10-27 10:35:10'),
('a63bd2314cbff7917a907950ea2155767098929cd2eef0583d2d6178af3a93fedaaea47bd0e10635', 156, 2, NULL, '[]', 1, '2018-09-13 23:25:56', '2018-09-13 23:25:56', '2018-09-28 16:25:56'),
('a6549f041a83997e2b8cd5e2ea29090c8172e65109a5793c14c8171dd4dc63360dc5cba0d0641957', 122, 2, NULL, '[]', 0, '2018-05-20 23:50:05', '2018-05-20 23:50:05', '2018-06-04 16:50:05'),
('a66f51ea7e5e15e414dfeb55cb7744559ba1e9b9af32bcb19176d044cc29b02f008649a83c4b4495', 14, 2, NULL, '[]', 0, '2018-11-01 11:25:19', '2018-11-01 11:25:19', '2018-11-16 11:25:19'),
('a675621c1bd2078c41d23d5052ba4cc92e6379c8d07ed462cb864ce6567df71a892da9f86f8de448', 45, 2, NULL, '[]', 0, '2018-11-30 19:19:03', '2018-11-30 19:19:03', '2018-12-15 19:19:03'),
('a770922fff65671a9501e0d6b5dc1f4c13af9f482132197e71e1b26a7334a8039412b8de793bf248', 13, 1, 'Personal Access Token', '[]', 0, '2019-03-30 00:39:16', '2019-03-30 00:39:16', '2029-03-29 17:39:16'),
('a7aa792abe0891a6e363a19f42c789efd45194559f6fe189d8811b6e0ecc654a3b93d06cc8a2d182', 4, 2, NULL, '[]', 1, '2018-09-16 06:50:41', '2018-09-16 06:50:41', '2018-09-30 23:50:41'),
('a8092a4d11645edd48d2d7e136458beab2631f9c1c5ba8b72eec5785a543e1ad2120eaa148df25b5', 144, 2, NULL, '[]', 0, '2018-08-07 07:32:18', '2018-08-07 07:32:18', '2018-08-22 00:32:18'),
('a85886437f6aa2b53c398fe17db0c53a07ab70ac6e41f849eb5c36fa474e571a95919911eeb89df9', 120, 2, NULL, '[]', 0, '2018-09-12 05:45:32', '2018-09-12 05:45:32', '2018-09-26 22:45:32'),
('a85cc33c1505caba450b2824c25ec96b26e6d0c2c98128b3ae7e11edeafcc72c9f54421dec0936ee', 7, 2, NULL, '[]', 0, '2018-09-19 01:12:45', '2018-09-19 01:12:45', '2018-10-03 18:12:44'),
('a86542ab0ed9c29103d12fa8bf3c19c5b6a347ad128bf596857cce3180b4289f60fffc5c21082f9c', 144, 2, NULL, '[]', 0, '2018-09-12 06:02:09', '2018-09-12 06:02:09', '2018-09-26 23:02:09'),
('a877a37f2a215ebfffa6f1469d1dfd01d30f7fb505184bf6b1183d3b26f3ddfb9fc2e3631fdf7735', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:32', '2018-09-15 17:57:32', '2018-09-30 10:57:32'),
('a88f2b3f256f1a436172d97fa5ff515669b5485994f2a55faa7b70a84020bc406b2addb373f32a4b', 14, 2, NULL, '[]', 0, '2018-11-14 10:33:51', '2018-11-14 10:33:51', '2018-11-29 10:33:51'),
('a898f7f95b3ccb27e4596759e0399a5186f9c79975044a2d22f7ac955bc0f393f52dd9fbb5fa17bf', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:02', '2018-09-15 17:51:02', '2018-09-30 10:51:02'),
('a8ba8840ce3d88cd22dc8760299c6afd46d3f1b317da4c1d29de425b665013b0ea04e8a49d94fd8f', 92, 1, 'socialLogin', '[]', 0, '2019-05-30 07:56:25', '2019-05-30 07:56:25', '2029-05-30 00:56:25'),
('a942b95075d3a3031581280e6a6f7522a474aa01e17af857f41155abc5e716857686982b91401e3d', 73, 2, NULL, '[]', 0, '2019-02-06 21:42:16', '2019-02-06 21:42:16', '2019-02-21 14:42:16'),
('a9f0aafb7172e8d6885304351d7ebfb4e681c7b96947288f0063c8c3c68831a8ffa84802eb6f0359', 156, 2, NULL, '[]', 1, '2018-09-14 19:18:25', '2018-09-14 19:18:25', '2018-09-29 12:18:25'),
('aa4a8c9362356b07838f6c351109410d82175cde56145df1af375e41e3f1f33af177c1a7ede7d777', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:52', '2018-09-15 17:54:52', '2018-09-30 10:54:52'),
('aa5316f364d88577cc8d0175fbf561b31426e8d2528c21ff5eaeb6c0ec8e4fcea5873d9ccc2268c2', 156, 2, NULL, '[]', 1, '2018-09-13 23:26:11', '2018-09-13 23:26:11', '2018-09-28 16:26:11'),
('aa55010a8c9af3ca8f05eb6c51e2fe81af945cad915f621bcf1f78e9c76a9193db5337c439511db0', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:37', '2018-09-15 18:04:37', '2018-09-30 11:04:37'),
('aa9d2e0bc74c7c6c02c080a6f0ac4bb36a3b2f5b23a19da7f90854629c8ed7685c0a7e1060187656', 14, 2, NULL, '[]', 0, '2018-10-23 19:20:44', '2018-10-23 19:20:44', '2018-11-07 19:20:44'),
('aae550a44b272e2734ac5490baa00fc97fe10eefcb99e76cf5579ec0efc945ebd81e458a4c9c10c2', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:17', '2018-09-15 17:44:17', '2018-09-30 10:44:17'),
('ab28641e0ddfa9338b3aacc581e63ebbfbd590ebc97dc711e297510775810cd0a1c15cfcddd40d5d', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:47', '2018-09-15 17:49:47', '2018-09-30 10:49:47'),
('ab41419cd27c6c512450923c3186a910600d79a5822a6008512a4b394f0d5187a03d9039c7307472', 14, 2, NULL, '[]', 0, '2018-12-28 21:21:30', '2018-12-28 21:21:30', '2019-01-12 21:21:30'),
('ab44f8b5d9149bbd6dea741224a560a0296f23c145bb667d1c2ed0b56063e3222b017059dd13643d', 6, 2, NULL, '[]', 0, '2018-10-09 01:25:30', '2018-10-09 01:25:30', '2018-10-23 18:25:30'),
('ab50e7598816c1aa998d43b098a22daa4fcaa16695216efebf28a011624ed2dd5af3762cdd0dd957', 1, 1, 'Personal Access Token', '[]', 0, '2019-06-25 09:16:41', '2019-06-25 09:16:41', '2029-06-25 02:16:41'),
('ab594d35269a2ef18c9604d2068399a8668bdace8e7c0be2ca232f780a65f227654694da73952c3a', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:27', '2018-09-15 17:45:27', '2018-09-30 10:45:27'),
('abb34fb3db58e88b61e621a545af2f0f959c42ddfb9dd1164fca6c5f1a659ddcf825246b63b73d44', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:09', '2018-09-15 18:01:09', '2018-09-30 11:01:09'),
('abda0d35adf51053b64df6efd8782a1c8bcfe9901870618ede09a113fc4e19f3e59fc5c152f87d1a', 113, 2, NULL, '[]', 1, '2018-01-26 09:26:45', '2018-01-26 09:26:45', '2018-02-10 02:26:45'),
('abfba1ebf1f4c3afcf39aebdd0807fc401b9d8bdd9ce952d69607551d6990f3ccacb8ab64be32fa9', 4, 2, NULL, '[]', 1, '2018-09-16 06:50:50', '2018-09-16 06:50:50', '2018-09-30 23:50:50'),
('ac3a71abff56c35a9d0991eb5d78c9181543f0cfd5cbc55c7c46df9b09185cdfe80ddbb4d1eecb2f', 1, 2, NULL, '[]', 0, '2018-09-15 21:50:51', '2018-09-15 21:50:51', '2018-09-30 14:50:51'),
('ace0b76ca51b904ba301ae10f50bb9d68ffd97927d0002aa544a041486d68b15dece31699416d4c9', 120, 2, NULL, '[]', 0, '2018-05-22 22:53:10', '2018-05-22 22:53:10', '2018-06-06 15:53:10'),
('ad04d72983767cd30411c60cc7f749682dbe8dd5cf7fc4bcbc67414a3d4a120808a7d8d82fb11f02', 58, 2, NULL, '[]', 0, '2019-01-04 20:33:31', '2019-01-04 20:33:31', '2019-01-19 20:33:31'),
('ad162c3a3e14af5dfb09f628e8029a70217c9e318b413dbfcba515d3c12c0fe02cb221c24996397a', 1, 2, NULL, '[]', 1, '2018-09-15 22:25:39', '2018-09-15 22:25:39', '2018-09-30 15:25:39'),
('ad1a52a67289a775c673bc1b21d851ca997d68ac6dd7c1b3ee73d994e570694a969b448b37967e87', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:11', '2018-07-20 23:22:11', '2018-08-04 16:22:11'),
('ad6230d54912002dd366b3edb27ff86f6cd48cf9da8044b826331822c0423648822678fa6dce2beb', 89, 1, 'socialLogin', '[]', 0, '2019-05-08 02:44:47', '2019-05-08 02:44:47', '2029-05-07 19:44:47'),
('ad9a26ffaf596d7bc36993e2df3d8db547f92023ec44e97ee51b13331a1d3cb4f2ca607d9538f344', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:32', '2018-09-15 17:47:32', '2018-09-30 10:47:32'),
('adcd1cd37f4a63562bd1bd75445cd04cc52818c10673b5964755625b42aaa5f9fd123225f0ded2c3', 5, 2, NULL, '[]', 0, '2018-10-10 00:09:40', '2018-10-10 00:09:40', '2018-10-24 17:09:40'),
('ae0eb201879e246c85cac5bdc9a272ca97f0479c09a26249a446a875ee83aa5f5bd2856f83e8865e', 1, 2, NULL, '[]', 1, '2018-09-15 22:21:01', '2018-09-15 22:21:01', '2018-09-30 15:21:01'),
('ae2db2a6c883a7953cb7f091a74f5ce1c88a95a79ec425efd42a40f5a3228e4e39c9b3b0b747060d', 14, 2, NULL, '[]', 0, '2018-11-19 16:21:27', '2018-11-19 16:21:27', '2018-12-04 16:21:27'),
('ae7751db1b41c7edcb05d1083181d5f391ed8d8a6e4cd80911c4f5e8d0f454405335c6167cfdb37d', 150, 2, NULL, '[]', 1, '2018-07-20 23:21:59', '2018-07-20 23:21:59', '2018-08-04 16:21:59'),
('af12e221530c35f88548dbee7710404041e87b4c8a23618b2edb87a6581062ecfc281cf055c8292e', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:07', '2018-09-15 18:06:07', '2018-09-30 11:06:07'),
('af16fc1e3046254e4b6348188ebc9923676168b9a63cb137322b85cc752f59b1e303e536a4ec22d1', 156, 2, NULL, '[]', 0, '2018-09-15 18:10:14', '2018-09-15 18:10:14', '2018-09-30 11:10:14'),
('af2a7118ac56502a45cbea0d93ae69c58c7913b0274190cc18ca1863b688e145d6374fd19137a62e', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:37', '2018-09-15 18:00:37', '2018-09-30 11:00:37'),
('af4097df53913cc18270091b17925207457dcf14c923a0c7fb0919f01c224744b32539ecdb342d00', 17, 1, 'Personal Access Token', '[]', 0, '2019-04-16 02:39:46', '2019-04-16 02:39:46', '2029-04-15 19:39:46'),
('af620d426d8d3a2bc7431a8acc9bd3bcf3e7fb6fd0a0213dc8623f87f8dbafc9bdb2cabebace7e1f', 144, 2, NULL, '[]', 0, '2018-08-01 19:18:17', '2018-08-01 19:18:17', '2018-08-16 12:18:17'),
('af671fcaf49400d3e9a273e44744b9b7295b68e6c20f887396fabaf00922317f58244346882a6caf', 132, 2, NULL, '[]', 0, '2018-06-11 19:47:38', '2018-06-11 19:47:38', '2018-06-26 12:47:38'),
('af83cc4716ab71485d29fa3a85a2062023986f1f15dd073afa9a237c6c9a003d32e6f5a8565e1cfb', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:04', '2018-09-15 17:46:04', '2018-09-30 10:46:04'),
('afbb846d1291499ecaa4931019d7a1dba99fd850977ec236a51a9103ff8d3f419dd323df5c4e2255', 19, 1, 'socialLogin', '[]', 0, '2018-10-21 16:03:55', '2018-10-21 16:03:55', '2028-10-21 16:03:55'),
('aff9465c7783c8d3fccc7b462bcfcc9fade1550da958ae5a15c94867a6abc4dffae89cc9cd98522a', 156, 2, NULL, '[]', 1, '2018-09-14 19:30:55', '2018-09-14 19:30:55', '2018-09-29 12:30:55'),
('b019d535948034999498a03cf46647c352fbe8e6985deaa21cce0745efddf2777f48dc5d9a967c29', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:07', '2018-09-15 18:00:07', '2018-09-30 11:00:07'),
('b0f6781d35036e85cb7c9b452854aef40cda1cff9e644b2c0e180e18e1393bab7f3a483e03ee762a', 146, 2, NULL, '[]', 0, '2018-08-06 18:21:15', '2018-08-06 18:21:15', '2018-08-21 11:21:15'),
('b0fa2599b4b7e83b8402b8beb5ee9cd67b71f4ad78c5eed19ad17f33132512319e68e2c48d45b867', 14, 2, NULL, '[]', 0, '2018-11-19 16:11:55', '2018-11-19 16:11:55', '2018-12-04 16:11:55'),
('b1054c11997d3c2f38573ede42a26e02d06bb022b48fd73dfa708e161713bf28c6ba83c126468682', 14, 2, NULL, '[]', 0, '2018-12-19 20:38:37', '2018-12-19 20:38:37', '2019-01-03 20:38:37'),
('b13ba6c1ce5c2246eec9deba25038f0d92fe17ae3896517793beb98ae384420ccc20a56e4ed2154a', 4, 2, NULL, '[]', 0, '2018-10-04 19:26:53', '2018-10-04 19:26:53', '2018-10-19 12:26:53'),
('b1945db316318fb060e3c507a421cfc212e2f92217667e8576325d501de9ce13abad5801e24cc846', 17, 2, NULL, '[]', 0, '2018-09-19 23:52:51', '2018-09-19 23:52:51', '2018-10-04 16:52:51'),
('b21d7d5756cb5b619f6131bd0136986e5585978819c0a7469735bc795afcec86dacdbc4cdc88146e', 2, 2, NULL, '[]', 0, '2018-09-28 23:41:20', '2018-09-28 23:41:20', '2018-10-13 16:41:20'),
('b2209076e12af65999a9179ec863641a2f8b25a3184354f223bbd1662e039be2f9522913a09974e5', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:20', '2018-07-20 23:22:20', '2018-08-04 16:22:20'),
('b238c284b5e05ac6a34686c863a7a77996f022144c8a583deba7c3cfc9b84f52a9df1bf2e6b82b2c', 3, 1, 'socialLogin', '[]', 0, '2018-10-15 23:50:25', '2018-10-15 23:50:25', '2028-10-15 23:50:25'),
('b25b9072fc973c2b6671cdf8c99d89ed3c9f0389726ca9fe96a845908ac7f6869806ca5cb65d96bd', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:32', '2018-09-15 17:55:32', '2018-09-30 10:55:32'),
('b28e1bda9691d6d7611287630f097c2df56aef4a675b7ef9da1cc0cf1d56c11b7b15614518b08add', 51, 2, NULL, '[]', 0, '2018-12-26 18:49:59', '2018-12-26 18:49:59', '2019-01-10 18:49:59'),
('b2a1fe597c8a4a125216e96040c499e4ee875a837f6738074d0ee66506abd9da5db820ef61291599', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:27', '2018-09-15 17:59:27', '2018-09-30 10:59:27'),
('b363692ce0e70d328792f4969c88c0e6c0533e5ee29a447af16a52d9dea7a9930518616953a0a4c6', 58, 2, NULL, '[]', 0, '2019-01-04 18:49:14', '2019-01-04 18:49:14', '2019-01-19 18:49:14'),
('b3cad929bd0ba5f36621ee3e51c0cda8ff63a2b900d9b1935daf8a585a94eab09414cd6cc2abc84a', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:52', '2018-09-15 18:01:52', '2018-09-30 11:01:52'),
('b472323bf520d4ab031eec9408dab11ac06111e4c48ddee2866ebee6d0cfb8d82b05cbe3729e5175', 100, 2, NULL, '[]', 0, '2019-07-02 19:42:08', '2019-07-02 19:42:08', '2019-07-17 12:42:08'),
('b48dcd37a898d382aad295faa46213e64535ec323acb062d549ca69029c72591cf0c23c85dfdb42a', 146, 2, NULL, '[]', 0, '2018-08-03 20:02:47', '2018-08-03 20:02:47', '2018-08-18 13:02:47'),
('b4bfc97b1415ac9edc5526e1676295e45beb38a8e7ef0848bbd30ede966b3444cfebf089c10703e6', 156, 2, NULL, '[]', 1, '2018-09-15 18:02:13', '2018-09-15 18:02:13', '2018-09-30 11:02:13'),
('b4ce1364ae7ec9516164f173abdd31372b3b0ef85d0eb5dd9320a189ad2c6a5475cd4b34277308c6', 14, 2, NULL, '[]', 0, '2018-11-19 15:07:35', '2018-11-19 15:07:35', '2018-12-04 15:07:35'),
('b4ce6cf80402761cd9e391d9e1e30b9ba2b94a2f2d3ccac8803387289c0a1f2d18388ca3ad87ed8a', 5, 2, NULL, '[]', 0, '2018-10-09 22:13:55', '2018-10-09 22:13:55', '2018-10-24 15:13:55'),
('b548b06d3861e3ce9441aca801222adac330f40c8bfb4f2baf3fc51f01288510edfee06bc4209f89', 5, 2, NULL, '[]', 0, '2018-10-09 01:53:04', '2018-10-09 01:53:04', '2018-10-23 18:53:04'),
('b55acacf7bfa2eaa672d6eb622475f752f923cbeb447825b380a2c4206acba8e1044d29c813b08b6', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:23', '2018-09-15 17:57:23', '2018-09-30 10:57:23'),
('b56d8625163ba91eba3ae8ff383dc32cba492a431a917cb4a00dfc0d8c624330fa98dcdb00550008', 14, 2, NULL, '[]', 0, '2018-11-19 15:08:19', '2018-11-19 15:08:19', '2018-12-04 15:08:19'),
('b5766b16242bb68e6f77cc1bd19948cc9a2bd1838a5499c708a457afbe491b224421181270756bbc', 117, 2, NULL, '[]', 0, '2018-02-03 12:55:34', '2018-02-03 12:55:34', '2018-02-18 05:55:34'),
('b58f899b49ffc0a52cb8761814c8ac6381a25b211811245b432ba85031937bf5b27b65983f56c5d6', 144, 2, NULL, '[]', 0, '2018-07-31 07:15:35', '2018-07-31 07:15:35', '2018-08-15 00:15:35'),
('b5be919528cf3b8afe9be37b6849bee4f6b79ead8556b0e5092d97d3f1e0b2b7c915255afa565187', 40, 1, 'socialLogin', '[]', 0, '2018-11-14 19:33:42', '2018-11-14 19:33:42', '2028-11-14 19:33:42'),
('b61b87c3940ceb7ea03cc7fe8183e6ab40cee80ef298106f80cc26b403676c32ed3efc0b48f9b778', 12, 1, 'socialLogin', '[]', 0, '2018-10-18 11:10:55', '2018-10-18 11:10:55', '2028-10-18 11:10:55'),
('b66ab1fe3370482afd414cc21d6838295c016b6c3ef2770111d2f2e4d935cc4cd836070b31a87c76', 59, 2, NULL, '[]', 0, '2019-01-04 22:26:42', '2019-01-04 22:26:42', '2019-01-19 22:26:42'),
('b68bc1f0b16e0821a5444d33bc15f237c8dd4634794672db34ac7736e247c37fa23995335266e767', 114, 2, NULL, '[]', 0, '2018-08-30 19:54:27', '2018-08-30 19:54:27', '2018-09-14 12:54:27'),
('b6e69ba5b5c08f2fb323a637d560660c5445b39eb0736f0d333ffd7dab2868769683487181a98654', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:33', '2018-09-15 17:59:33', '2018-09-30 10:59:33'),
('b70f136022603842579f53aafe8bc4e073e2192591a7f8c7e95690e50941a0311467fa6eaa8204db', 86, 2, NULL, '[]', 0, '2019-06-11 01:45:25', '2019-06-11 01:45:25', '2019-06-25 18:45:25'),
('b72694cfb0008ede28bae720e00db16f8059d8753eaaa52c65e1e0cf63bdfa1ed1418d188f9fed7c', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:01', '2018-07-20 23:22:01', '2018-08-04 16:22:01'),
('b7588078da7890120b0dcf1b67ec5dbee2e4a91efdf26f75d8cf8ea9b2d471cdc87c11eb5ed8af61', 14, 2, NULL, '[]', 0, '2018-12-26 17:19:21', '2018-12-26 17:19:21', '2019-01-10 17:19:21'),
('b76a8a47146b563d430e21c50378c70600da06ab05ff2061228076628e64cffed58ea8c355c53cf1', 19, 1, 'Personal Access Token', '[]', 0, '2019-04-02 14:04:05', '2019-04-02 14:04:05', '2029-04-02 07:04:05'),
('b77632f54ae13769d4038006b05869350297b80d5c3111f8e6d996b7a55c00769ba976b222f27105', 82, 2, NULL, '[]', 0, '2019-03-08 22:18:21', '2019-03-08 22:18:21', '2019-03-23 15:18:21'),
('b7a026493d35a0fd5a1a089bbdc68c0f2e79be369a037c6324659e06c8b27fe5eaa759e72c04d799', 146, 2, NULL, '[]', 0, '2018-08-08 00:40:34', '2018-08-08 00:40:34', '2018-08-22 17:40:34'),
('b7b06c81ddc3438737c8c8bce8467b0082d14393d0fc406e5e3f34e776c40cf3520e3666c891c6d7', 156, 2, NULL, '[]', 1, '2018-09-15 17:43:57', '2018-09-15 17:43:57', '2018-09-30 10:43:57'),
('b7bd53095dd16cfc1435452be0c1995be6285fe9126a74c123d7d7f2a2cebf217e43bf8dea38f0f0', 5, 2, NULL, '[]', 0, '2018-10-09 02:13:37', '2018-10-09 02:13:37', '2018-10-23 19:13:37'),
('b7f5883c65fd3e5f5782eaf011b09557abfccd4abd42a48adb701ab43056cd9ca48b93d99b1ec283', 83, 2, NULL, '[]', 0, '2019-06-18 03:51:31', '2019-06-18 03:51:31', '2019-07-02 20:51:31'),
('b7fb31b975016e8dd25b26c15b67812aba180cf7ca442d07765cfe02dcb90353dc8a7cf41f7f7645', 120, 2, NULL, '[]', 0, '2018-06-13 17:15:34', '2018-06-13 17:15:34', '2018-06-28 10:15:33'),
('b822962e0e1f6a6d577fd6f12dcf47659a07c24d2748bc4df4a4e1862ebd5ce25f0e8902ca59be71', 113, 2, NULL, '[]', 0, '2018-01-25 22:05:06', '2018-01-25 22:05:06', '2018-02-09 15:05:06'),
('b8375b10159910e856cacf12c2bd09313c96a5907558a84b7754a6248c0b05cfa747a2dd95b5e6a4', 120, 2, NULL, '[]', 0, '2018-09-14 21:46:28', '2018-09-14 21:46:28', '2018-09-29 14:46:28'),
('b89cb689159b93e218bc812b2fef89d70dcef93578672a616876d1b199eb4dbc6589471097143815', 25, 1, 'socialLogin', '[]', 0, '2018-11-30 17:52:00', '2018-11-30 17:52:00', '2028-11-30 17:52:00'),
('b8b676603a4763832fe1fa4a55f674ba7bf0813a3b085b98470aa1aebecf900497982efc09d3cbd9', 24, 1, 'socialLogin', '[]', 0, '2018-09-21 20:25:46', '2018-09-21 20:25:46', '2028-09-21 13:25:46'),
('b8cfeb1d1d846a5323720256c9cbe0a9da8932b51fc4caa82dd5d7e07bd59e426d5e2b8816228e8a', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:32', '2018-09-15 18:03:32', '2018-09-30 11:03:32'),
('b8f26547f5936f995ad734e2faaefdde94cd2358dab38a7c6d52f7689364aef2e7b3dc5064c23a6a', 82, 2, NULL, '[]', 0, '2019-04-02 20:21:16', '2019-04-02 20:21:16', '2019-04-17 13:21:16'),
('b91de0f3472423088aadaeb2d6d28dbd892acbc9ec0e9965799e8e1f08fc236160886ce03fe3d609', 146, 2, NULL, '[]', 0, '2018-08-06 18:21:15', '2018-08-06 18:21:15', '2018-08-21 11:21:15'),
('b939473da6e8fb08adbc10a4f9f462634aab779ec615408b90287dbc3691a14bcbcd4f92bb5f50e5', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:02', '2018-09-15 17:49:02', '2018-09-30 10:49:02'),
('b9470cd055b55192bcf358284b062f257a2016a556109a602e9f45c1e65876585b054cfd8e95c617', 73, 2, NULL, '[]', 0, '2019-02-07 02:43:45', '2019-02-07 02:43:45', '2019-02-21 19:43:45'),
('b9a9aed4109f0a1d6653a9db15f750e2e04cc415916a6f8001d1cca58ef4948d9fe9354b4d0f91cd', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:37', '2018-09-15 17:48:37', '2018-09-30 10:48:37'),
('b9bf4b64ef61da07846bdec1ac415004442bc4970c6992b00e820c265af079197ee84471919006d3', 11, 2, NULL, '[]', 0, '2018-10-10 17:26:41', '2018-10-10 17:26:41', '2018-10-25 17:26:41'),
('b9ea16bdc19df1e7480c43b3026999fbda36fbff5ac8dd04c1c265ccabe6566d011ecc01588b455e', 73, 2, NULL, '[]', 0, '2019-02-20 04:03:14', '2019-02-20 04:03:14', '2019-03-06 21:03:14'),
('ba5499f252b663404039adf4081cd8ef7e206aef0058eb750cd2828953ffa5556d6bd6da30be469f', 144, 2, NULL, '[]', 0, '2018-07-22 01:14:02', '2018-07-22 01:14:02', '2018-08-05 18:14:02'),
('ba60d4f7a49b1fb938628edad0532e669e8928a48b7ba82515ccb46053f3a8bcc5c20a9308ce336a', 7, 2, NULL, '[]', 0, '2018-09-18 20:00:11', '2018-09-18 20:00:11', '2018-10-03 13:00:11'),
('ba8a83f77a8f1d31540b0fc5d0c491d9ecbf0752bc987d2866a7f3d3557892ec12739cc5cde62014', 1, 2, NULL, '[]', 0, '2018-09-23 00:25:34', '2018-09-23 00:25:34', '2018-10-07 17:25:33'),
('baa8dce538d0f6b54a93bd865bdffa5e3c92105eaed32ca4e69deb9f21034fc9f56b65ef046007ca', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:37', '2018-09-15 17:58:37', '2018-09-30 10:58:37'),
('bab7fa5a3e2a5fbdb9fd23103f4f85b4ddfb5a9e1f8406ba0bf832c2831c51cc96bcae801684b411', 120, 2, NULL, '[]', 0, '2018-08-30 20:03:01', '2018-08-30 20:03:01', '2018-09-14 13:03:01'),
('baf1cf0aa788c0a5a3b85e0f5dd0663d99076e6d79248fcd5895a6ce441e12fba0951b68daeea228', 1, 2, NULL, '[]', 0, '2018-10-10 16:14:25', '2018-10-10 16:14:25', '2018-10-25 16:14:25'),
('bb36a745211b4b3be743c0180f6e6f59a8e9cc436c197c3f53f3603bfa0c1a31dde7e60fbfe5ba26', 2, 2, NULL, '[]', 0, '2018-10-11 16:12:35', '2018-10-11 16:12:35', '2018-10-26 16:12:35'),
('bbefb751728b7c3f5d5a49e4f6a5f023ccd8d0d843a86039a3c573faf0af2f2e80eecffba661f797', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:12', '2018-09-15 17:45:12', '2018-09-30 10:45:12'),
('bbfb1322e8c5890db32df4e1367aaea3e68da6fed50b33bb370ef0f085fe8761610a892f5323362c', 4, 2, NULL, '[]', 0, '2018-10-05 21:44:04', '2018-10-05 21:44:04', '2018-10-20 14:44:04'),
('bbfb4b7ee39ec8bbb3f088a2634ad3fa801c2cc88371b3c4cc9a97633e843f1ee75fd2062086c48c', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:47', '2018-09-15 18:03:47', '2018-09-30 11:03:47'),
('bc3f27bfb33de2a7ca51f024cf9ad8b5332729f9cbc5d8093f1ff413f9fc3d22974a1d787620a148', 156, 2, NULL, '[]', 1, '2018-09-11 22:37:05', '2018-09-11 22:37:05', '2018-09-26 15:37:05'),
('bc576b4443718f16e6b0d7438f28bb3ee37cd0ada312e04bfa8849ca7f7b5800fc1ba7fc4a354a64', 3, 2, NULL, '[]', 0, '2018-10-05 01:45:54', '2018-10-05 01:45:54', '2018-10-19 18:45:54'),
('bc990fb84c3fe3b99e4c0a85b82c51042a737d67473bc57bab48010f442b0038e278c2f8f4217b15', 156, 2, NULL, '[]', 1, '2018-09-14 02:25:35', '2018-09-14 02:25:35', '2018-09-28 19:25:35'),
('bce890acfd5e875572f40fdc71993f9670dd25f20242f8340a6633dc5f0f3875ad7b67d0a6362583', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:01', '2018-07-20 23:22:01', '2018-08-04 16:22:01'),
('bceca02f3082ef12ccb2a9a368770bdf634d78352efe89a2d7dd5614d524cf4791a0704044340f1d', 8, 1, 'socialLogin', '[]', 0, '2018-10-18 10:49:54', '2018-10-18 10:49:54', '2028-10-18 10:49:54'),
('bd0fd1d1c3c97bf58385009ef00669d41e0e048dd7fad6d7dbf19c12b9922dae73b6c13770a577bd', 3, 2, NULL, '[]', 0, '2018-10-05 01:39:11', '2018-10-05 01:39:11', '2018-10-19 18:39:11'),
('bd445a8de2734420b94dfa7c3f2cc100994ca68f525da99aa53dc610aef0d115169d38d7545c71ca', 120, 2, NULL, '[]', 0, '2018-09-14 17:21:53', '2018-09-14 17:21:53', '2018-09-29 10:21:52'),
('bd5f8e089524f03aecd3f87b1ffeb6125c0e5dab5f3f4a603ba98cf24b012bfdd1c08e71d57b7adc', 137, 2, NULL, '[]', 0, '2018-05-31 18:35:58', '2018-05-31 18:35:58', '2018-06-15 11:35:58'),
('bd625162debfa1f9006b5953ba5536ea3873f9ff94cdd218132939747cd2597d0ee915b71c7a721d', 122, 2, NULL, '[]', 0, '2018-05-22 05:37:52', '2018-05-22 05:37:52', '2018-06-05 22:37:52'),
('bd85e781a9312d9e82353d5c8a07aada31077357948afd3203080a54b4e4999228e7b34b159f0127', 58, 2, NULL, '[]', 0, '2019-01-05 17:32:07', '2019-01-05 17:32:07', '2019-01-20 17:32:07'),
('bdc437d9bf00f1e15998a5036072b883610d6f6df6929c78663ff0f643cc4ec290788eb5377a6d06', 20, 2, NULL, '[]', 0, '2018-10-15 10:42:27', '2018-10-15 10:42:27', '2018-10-30 10:42:27'),
('be0bc9e1088f48fedb04f22a91eb1ea2520c21056bc6271adb290800697ee12906ab25b7a71382c6', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:23', '2018-09-15 17:49:23', '2018-09-30 10:49:23'),
('be1296499b0fbf09be609e1eec6a34d8bd5e4693758492554ba2e749c2b3a60a329a4b69ea48bc74', 21, 2, NULL, '[]', 0, '2018-09-22 18:12:24', '2018-09-22 18:12:24', '2018-10-07 11:12:24'),
('be2a542c7f8ae6327d3785a5813a6d2d3758d2a92a5358f8532bfe423a3f2d5793d4021bcb0c2b45', 6, 2, NULL, '[]', 0, '2018-10-08 22:26:30', '2018-10-08 22:26:30', '2018-10-23 15:26:30'),
('be4878b6a746fceb1cbe7c73bcef44928f7033b534df662897188706087222f4e0a9d848051f0876', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:02', '2018-09-15 17:59:02', '2018-09-30 10:59:02'),
('be50f5a4fe976f91050b585a4102a6fdf34bc4ffa2e9c2a2e161858c7227fd203c80a17a5559d881', 1, 2, NULL, '[]', 0, '2018-10-04 22:04:49', '2018-10-04 22:04:49', '2018-10-19 15:04:49'),
('be543dc335a2cb996308910a5263e58ebbb2469c9f1fabd5e718539afefc5cbd839c278bada4775b', 108, 2, NULL, '[]', 0, '2019-07-09 01:11:51', '2019-07-09 01:11:51', '2019-07-23 18:11:51'),
('be8476824e8e8d3c07d2a163b2eb5961c83186db6cc1a893af48b206ce84ab722034e662143d44a3', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:12', '2018-07-20 23:22:12', '2018-08-04 16:22:12'),
('be890ab8799e43d1997b2cb5d6290b3b2bb0534fdd9c5fcbc3a1122a77a0b5beb7d0b5a026b29004', 1, 2, NULL, '[]', 0, '2018-10-11 19:26:31', '2018-10-11 19:26:31', '2018-10-26 19:26:31'),
('beacf7dc1e962e2d37589b951731140ba4c46c1d7355f753cb948a4d5190369782d40f318abea141', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:57', '2018-09-15 17:44:57', '2018-09-30 10:44:57'),
('bec46864a35795974bb13e0d19264c8311848d3e910738b73f6e1cfb2ee6b97a34b6fd5117630606', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:42', '2018-09-15 17:45:42', '2018-09-30 10:45:42'),
('beca1770b492cbc62b4bb6ea5bca0e97fc7a7fbe472f4838f1aae3a09702ca0029ff21045e409606', 122, 2, NULL, '[]', 0, '2018-05-24 05:32:03', '2018-05-24 05:32:03', '2018-06-07 22:32:03'),
('bf921f97ef700c3380a5d5d0aa0f0fb4c1d291dbe98ef02a9af473cbbe7dee72a6675bca7cb058ba', 4, 2, NULL, '[]', 0, '2018-11-27 18:20:58', '2018-11-27 18:20:58', '2018-12-12 18:20:58'),
('bfb40413e0e64159b068d7f7cee2e0a87b259cd919312f126ae0af424129537096bc87488b863f84', 146, 2, NULL, '[]', 0, '2018-08-06 22:44:00', '2018-08-06 22:44:00', '2018-08-21 15:44:00'),
('bfcc8d9078f2af9e3d5b9cf10bf134b2ed2839c941d024e7d6a4f7fb555345315b0ab84dbac7d4ac', 20, 2, NULL, '[]', 0, '2018-09-22 18:25:38', '2018-09-22 18:25:38', '2018-10-07 11:25:38'),
('bfe07dad87d147e8987e402ea2a0a86b9e3ab8e72927305888b62929e3f602b41ce14a44665c912d', 87, 2, NULL, '[]', 0, '2019-04-16 20:20:28', '2019-04-16 20:20:28', '2019-05-01 13:20:28'),
('bfe69ee05074f7ddc3729b79f66870a7f984e4d008b5ecef9edb878b2b28fe8178281ba20e9392d0', 2, 1, 'socialLogin', '[]', 0, '2018-09-15 23:34:54', '2018-09-15 23:34:54', '2028-09-15 16:34:54'),
('bfea06cf544d6316013726dcfc45f37142d4fa15721a88c978fbd2eabe39354262de2c214bc9d1c9', 1, 2, NULL, '[]', 0, '2018-09-21 17:27:16', '2018-09-21 17:27:16', '2018-10-06 10:27:15'),
('c049896ddf9949cb5fdb0b3632d2f2590cb1b3c2be987b05cb77643abbf0381bedfb0f74fff8bbf9', 111, 1, 'socialLogin', '[]', 0, '2019-07-05 00:32:19', '2019-07-05 00:32:19', '2029-07-04 17:32:19'),
('c057082ac1de81848cf29d57616b73825a5e30ee6712805f04f2fe538c2e35255d79911c1288d74e', 4, 2, NULL, '[]', 0, '2018-10-04 20:14:04', '2018-10-04 20:14:04', '2018-10-19 13:14:04'),
('c0d16e2740752b6269718df8ee04194253369d58c5c6b8e0ebd3073f40020fa7dcc31afb3c832385', 85, 2, NULL, '[]', 0, '2019-04-16 06:40:56', '2019-04-16 06:40:56', '2019-04-30 23:40:56'),
('c0e6f717fa127fc41ac1c0aa3ee15d1740f3d14a59bac8416e2cdc377b7326b596301717e9cc295c', 83, 2, NULL, '[]', 0, '2019-06-18 01:28:59', '2019-06-18 01:28:59', '2019-07-02 18:28:59'),
('c10a656a61fd24a8afa17e98aed82cb3e528954fedf40d7c726cff591d75b243c6597ccfc9bda65c', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:32', '2018-09-15 17:50:32', '2018-09-30 10:50:32'),
('c115f4ca437da0364b4caccbd98dd90d7a3495a552fd2c2341791b5636d9d1e6a9803f85cb414cd1', 7, 1, 'socialLogin', '[]', 0, '2018-10-18 10:53:37', '2018-10-18 10:53:37', '2028-10-18 10:53:37'),
('c1467dad14ee993f8bd6c66c8b0ec3f8bbe67391f94bdac1dd40f6aceb52d95c44c976cb068ad531', 120, 2, NULL, '[]', 0, '2018-09-12 21:33:38', '2018-09-12 21:33:38', '2018-09-27 14:33:38'),
('c18609ab704b7906127cf5fdc5c71a2a71be385052513bab766447b7e3243373773596f854ee6f02', 154, 1, 'socialLogin', '[]', 0, '2018-08-26 01:02:33', '2018-08-26 01:02:33', '2028-08-25 18:02:33'),
('c193ea176f7587bacb6630bfb60425dfc32dc83e97ec2a90e2c55ad5f5df0563aa083f369c1cb31d', 62, 2, NULL, '[]', 0, '2019-01-25 20:45:41', '2019-01-25 20:45:41', '2019-02-09 13:45:41'),
('c1d0cd6ecf33d3837f5af7adb5fc1429ffee0e4c797c32166842808ae351d523d93a6edc1037507d', 100, 2, NULL, '[]', 0, '2019-07-02 22:54:33', '2019-07-02 22:54:33', '2019-07-17 15:54:33'),
('c251ac4099aa6cd6c43c086b9c0552b32796fd2d99e41866a67a9e544aa33cbfcea92072a51398ee', 9, 2, NULL, '[]', 0, '2018-10-18 10:34:34', '2018-10-18 10:34:34', '2018-11-02 10:34:34'),
('c2f84dc1209f4f7841890f98368e4a3dc689f4c60cca2b99c6eb93f41c3d2a0fe4c9b2cc1bfe98f9', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:52', '2018-09-15 18:07:52', '2018-09-30 11:07:52'),
('c3351ab960235fadbf91da1682a9ed986b63150c29bf5ed7e423d77fe63f750d741e3f1c359d7cb4', 4, 2, NULL, '[]', 0, '2018-11-24 22:15:54', '2018-11-24 22:15:54', '2018-12-09 22:15:54'),
('c33e7b65dc2db3a5ca326fd24e92109ea384c160b282f0c74538cae6276c6c11615ade25839c9691', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:14', '2018-09-15 17:45:14', '2018-09-30 10:45:14'),
('c3754a0a777386612c4cc7fbdabfe0ecdfdd2821161d3b30431feb20cf1428e567ce9e447a76a940', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:33', '2018-09-15 18:05:33', '2018-09-30 11:05:32'),
('c37939d38a4914cb46f85e15b0f41ecb88d103dc6c536dfabf7063b85ed9cf281bfdc43f3bba602f', 86, 2, NULL, '[]', 0, '2019-04-16 19:42:41', '2019-04-16 19:42:41', '2019-05-01 12:42:41'),
('c3bd74a295ec4e5aa5f477f5019fd48164ede319ac2f3bb3c7fb42470b4c8e8ae714f44f6623edc9', 1, 2, NULL, '[]', 0, '2018-09-29 02:02:33', '2018-09-29 02:02:33', '2018-10-13 19:02:33'),
('c3cd30feeeeaaefc127d16ef7a888268882766de6aa6fed0f0eeac1e1f798ccbb6900d095735c897', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:24', '2018-09-15 17:45:24', '2018-09-30 10:45:24'),
('c3e8c6fe2ef37086ba1e3ca90db3eb25ca334efa0a4e3c242d87559df73f839b6485e1537ee874a1', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:47', '2018-09-15 18:05:47', '2018-09-30 11:05:47'),
('c448e778be8548a4335227dd8decb8ad4019cf485a647fcb8538f432fb6a038f8419f4f154746b12', 90, 1, 'socialLogin', '[]', 0, '2019-05-09 00:39:37', '2019-05-09 00:39:37', '2029-05-08 17:39:37'),
('c450d97549ee236745f6ca9029e3e72354233a150581b141c6169c3dc0225a48410650e8abf789b9', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:32', '2018-09-15 17:54:32', '2018-09-30 10:54:32'),
('c48d5d2eb85e078989d58152485fa05d1a884de9b6eb86cd4871fa2420c7f50d6608c5d45e93dbfa', 7, 2, NULL, '[]', 0, '2018-09-18 23:55:41', '2018-09-18 23:55:41', '2018-10-03 16:55:40'),
('c533bd26efa6f10db8ffbbb4952e53a024840b3f4203e26932d6f10c503482348f6b47ab13bf5907', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:32', '2018-08-10 23:12:32', '2018-08-25 16:12:32'),
('c54df40ba4d8bb1538661bfdd2390720b8092c75e83d1426bdd6b2d37d8ff03cebb394f396f56dea', 156, 2, NULL, '[]', 1, '2018-09-15 17:43:46', '2018-09-15 17:43:46', '2018-09-30 10:43:46'),
('c57579ac15dd2e0ff50cf40487a698b34abb1fb53cc5592a3af387f07d3ecf098562552d14147835', 19, 1, 'Personal Access Token', '[]', 0, '2019-04-02 14:25:06', '2019-04-02 14:25:06', '2029-04-02 07:25:06'),
('c5bf2137e2ba514fc6ef3a99e93a9bdfe7e48629ff6032922415cbe588d2f381fbf309b4ff4f12fd', 120, 2, NULL, '[]', 0, '2018-09-01 23:13:12', '2018-09-01 23:13:12', '2018-09-16 16:13:12'),
('c5ebb710f25d294c6a1ed01a0e7ec5cf915e75406f6d4f00e1b52a38c0c9e1c08a7bfafec1f1ca3d', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:29', '2018-09-15 17:48:29', '2018-09-30 10:48:29'),
('c603651fb024c8b0dd43e9e443ffb814e4112f6687415b1fe07bdf26cc646c98bbf7fc7deae1d289', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:22', '2018-09-15 17:48:22', '2018-09-30 10:48:22'),
('c60f13f432340411ae1c281c03e4ec930e5e0dad0f9e6715b4a6765aca041fc7ab1eae68ab2baa45', 1, 2, NULL, '[]', 0, '2018-10-11 18:08:50', '2018-10-11 18:08:50', '2018-10-26 18:08:50'),
('c66c3c9aac25fd8e8456c9979faa51d115e38e0b536bf912261568113f60f378201dbf64c07a4370', 17, 1, 'socialLogin', '[]', 0, '2018-10-20 19:22:05', '2018-10-20 19:22:05', '2028-10-20 19:22:05'),
('c66e0cd0bb4a78058b46868f2a25d0768eab9b05f04bb494fdcf0c17fc59de38d36ffc1bdf58dcd7', 111, 2, NULL, '[]', 0, '2018-01-29 07:19:50', '2018-01-29 07:19:50', '2018-02-13 00:19:50'),
('c67c0bde92b6010f24d20d4090a2acab29c627186215e849b0783cb6253dfcf0a704ecbd99e0f57e', 156, 2, NULL, '[]', 1, '2018-09-14 06:01:03', '2018-09-14 06:01:03', '2018-09-28 23:01:03'),
('c6c6acddd4d2d230cfe2aba06deb220d5496105fac91ac8a44e8a7fd1e0bf8987f2a7004c0506754', 25, 1, 'socialLogin', '[]', 0, '2018-11-14 12:20:40', '2018-11-14 12:20:40', '2028-11-14 12:20:40'),
('c6f03266a34f3eb659ae82d622e1ef79a17aed4149d61d1577235b34f8919aa7c02845e5cebca92d', 70, 1, 'MyApp', '[]', 0, '2019-02-06 03:26:06', '2019-02-06 03:26:06', '2029-02-05 20:26:06'),
('c746b22cf7838167045ad77686d08a1cdaa88db01243467d9652f735916e5741bbd93c0466accfc5', 14, 2, NULL, '[]', 0, '2018-11-19 15:11:09', '2018-11-19 15:11:09', '2018-12-04 15:11:09'),
('c75840f546280b4813a49ea196890041dc70d45487d8ad2ad863dd84bb35b061ace34694d5b50a8a', 84, 2, NULL, '[]', 0, '2019-06-12 12:05:31', '2019-06-12 12:05:31', '2019-06-27 05:05:31'),
('c7938fd47ef563e5bd4b1f5414d0acfb595e51d7ef3020a8a2a792d14991d64126c7ab4d52a35765', 73, 2, NULL, '[]', 0, '2019-02-22 23:45:30', '2019-02-22 23:45:30', '2019-03-09 16:45:30'),
('c79c82f2b5005960b558638a1ad7a60a069ce6873c64dee3412e3f0a97ab5eb0ac74e4f6a00f84b6', 144, 2, NULL, '[]', 1, '2018-08-07 07:32:17', '2018-08-07 07:32:17', '2018-08-22 00:32:17'),
('c7ace4cbc7add390a28c40a3c25a57f056c8c0552038e02a958c4b7a6a2a6bf1d59f6910843f2e2f', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:37', '2018-09-15 18:09:37', '2018-09-30 11:09:37'),
('c7fc656b85e99506664fd926b17e167ff55d0f597c02aaa831e0329a88a449c8a0ea2978d53e7988', 82, 2, NULL, '[]', 0, '2019-03-27 20:05:36', '2019-03-27 20:05:36', '2019-04-11 13:05:35'),
('c80e6a94cabc39ffe3862a6a7e01a114ed5bc6cdd0b334df69830e6b093f0142ff02f6d33f48d16d', 31, 2, NULL, '[]', 0, '2018-10-31 14:28:06', '2018-10-31 14:28:06', '2018-11-15 14:28:06'),
('c8347573a122d3e5e8abbe1259b6422fee68751bbe73a17bfbc76f793625aa665696dab8c696a067', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:38', '2018-09-15 17:49:38', '2018-09-30 10:49:37'),
('c845363efd778d14983d864e05701b6a6e5baa81a40fbe7dce2922ab8aab4e6a56395de0ecba1651', 7, 2, NULL, '[]', 0, '2018-09-19 01:21:41', '2018-09-19 01:21:41', '2018-10-03 18:21:41'),
('c846d1125ec766af8ea63778c2e747eb0cc6717778f057290fc166b3630bbeb042e7ed7f95ab44ac', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:32', '2018-09-15 17:49:32', '2018-09-30 10:49:32'),
('c85471923fd7d7dd9dbc1cf300f55f9d82845c2258600f954a08ac6f6ab2d78c6481ad6111e68240', 108, 2, NULL, '[]', 0, '2019-07-09 02:23:42', '2019-07-09 02:23:42', '2019-07-23 19:23:42'),
('c8567b91715c4a29b364bd2fdf6057ab6a198364a3c81fceb391a36b5f5fe050c8329a884192218b', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:32', '2018-09-15 17:46:32', '2018-09-30 10:46:32'),
('c8926ff78213d2ce7862e1fa657de3afb9dd831ca75ac08062db38b0e499da58e6e39ab0ca842680', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:43', '2018-09-15 17:44:43', '2018-09-30 10:44:43'),
('c895cfee36689f9094c9f5d2a70bd9a6b34ebbe76d81247eeb96694a72e9e381cf6cce8fc54a98fe', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:42', '2018-09-15 18:08:42', '2018-09-30 11:08:42'),
('c89791364c53d8a527b41830f36d1937c183a654f0c94efa2651e26ad862baa45074b91d5ed0978c', 19, 1, 'Personal Access Token', '[]', 0, '2019-04-10 12:38:07', '2019-04-10 12:38:07', '2029-04-10 05:38:07'),
('c907c41bd457f116aa0984e92cb98698093202efeb9c499d91a5882db3d8cba94a7ca05b950c0e80', 142, 2, NULL, '[]', 0, '2018-07-20 23:26:05', '2018-07-20 23:26:05', '2018-08-04 16:26:05'),
('c917b8ddcb0dc4e99637f6ac35c2d6a59aed764dcfac8975c7df11e557bae2cedbc07e975795d3b6', 4, 2, NULL, '[]', 0, '2018-10-03 17:38:28', '2018-10-03 17:38:28', '2018-10-18 10:38:28'),
('c9257086d42727d02c9f6ba1d33b7088d5fed3354d712de4d6c33fd23e3b2115ebbe64610bf60876', 1, 2, NULL, '[]', 0, '2018-09-16 02:48:03', '2018-09-16 02:48:03', '2018-09-30 19:48:03'),
('c92d9975b22bdba86a60b34112ecc7bd8d847a0269873a7c63aad9fdfb0add422c23468753e997e7', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:32', '2018-09-15 17:52:32', '2018-09-30 10:52:32'),
('c94d892925995a0dcffe1497e5cf50f9807d34dfe1461a2b25245327eab49b31901bbf7394d059bd', 132, 2, NULL, '[]', 0, '2018-06-15 22:13:45', '2018-06-15 22:13:45', '2018-06-30 15:13:45'),
('c9e47d5ad551cf144a165c23b0e1c2ca3772e7b5daf41b1831b3c8ef3e39d3018f2ce4d84186f1c6', 86, 2, NULL, '[]', 0, '2019-06-11 01:18:01', '2019-06-11 01:18:01', '2019-06-25 18:18:00'),
('ca12d022368d2c92c414f87f5ee4a4e45694ccb157d8315936c2a899cd27d712fd38e93aea541c24', 5, 2, NULL, '[]', 0, '2018-10-09 02:10:41', '2018-10-09 02:10:41', '2018-10-23 19:10:41'),
('ca2900dfca3291c69d7acb31dcb87b129d8a5731e608081070505f3d1017ec9a4a7923714fb99a61', 1, 2, NULL, '[]', 0, '2018-09-29 17:17:20', '2018-09-29 17:17:20', '2018-10-14 10:17:20'),
('ca32444c4de1e1480cc3b368ea4ddaf7c11365bbf147e0c3db76b23f22947fcafe2f2fc73d3e9939', 35, 2, NULL, '[]', 0, '2018-11-15 17:22:33', '2018-11-15 17:22:33', '2018-11-30 17:22:33'),
('cae3ac8db68cd0efc1ae279dfab2003c1fe6af70f1ac3794fd34d376608b095ee37de60d41c16466', 120, 2, NULL, '[]', 0, '2018-08-30 21:58:52', '2018-08-30 21:58:52', '2018-09-14 14:58:52'),
('cbdfbc3ab7b582e8ca6dcf8c45957a9b2f470ffc366fef3715c1f44be2f19f7e9b90e8f61399c23c', 110, 2, NULL, '[]', 0, '2019-07-04 20:49:01', '2019-07-04 20:49:01', '2019-07-19 13:49:01'),
('cc37bdff0bab8a1cf0ebf50c0db9ae99b234e51700cdcc90d501d55ae4bc6978b6a37cb12f16e3f5', 120, 2, NULL, '[]', 0, '2018-08-30 19:55:31', '2018-08-30 19:55:31', '2018-09-14 12:55:31'),
('cc3eeca5f715c4622f175010853764c5082566168172dcaee9d4b6dfaedfb8aa0ed645a55c0cc759', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:22', '2018-09-15 17:52:22', '2018-09-30 10:52:22'),
('cc5cb5d07642e4bac26c977607e5611948c51bdb2131b01fa0f54f5361bdfd8d467c6a1c1a7eda2e', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:37', '2018-08-10 23:12:37', '2018-08-25 16:12:37'),
('cc6736635e1a4e707d3bb106f2fcc36df1fefbe5d26b446d703c2557cd7a80bcd90fa50a61106413', 156, 2, NULL, '[]', 0, '2018-09-15 17:45:42', '2018-09-15 17:45:42', '2018-09-30 10:45:42'),
('cd08455e6c124959b734c76c293a240958f0319da685ac7e3d96f49114724a253f52b28a1db76a50', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:47', '2018-09-15 17:44:47', '2018-09-30 10:44:47'),
('cd1f63404b0264ea21d5addf6c9ce436d4a4cdd63fa46649b0ddd5f92c636deda6c4f78a7c64d411', 1, 2, NULL, '[]', 1, '2018-09-17 07:59:44', '2018-09-17 07:59:44', '2018-10-02 00:59:44'),
('cd234fc816fd8be16c89042681c834dd391fae1c5df9551446fd1267c4d42ad18af3883b5ae6ee71', 14, 2, NULL, '[]', 0, '2018-11-20 16:22:16', '2018-11-20 16:22:16', '2018-12-05 16:22:16'),
('cd785c94cfe386ac0adec745e709d99473d2f46f64d9f9af775fb568ff8d32335d7ba06f81bf91bc', 7, 2, NULL, '[]', 0, '2018-09-18 17:22:04', '2018-09-18 17:22:04', '2018-10-03 10:22:04'),
('cda6bdaaa51f402e99382d53a3c8ae0bf3d338ad553367387c66f0481de280bf343867397844eecb', 120, 2, NULL, '[]', 0, '2018-05-31 07:21:23', '2018-05-31 07:21:23', '2018-06-15 00:21:23'),
('cdbc64c2cf81a0695539adf671e3e9cb0ff7755432b3633b2fae33fa7fda16bf3fd2c8711992bf5c', 120, 2, NULL, '[]', 0, '2018-09-14 17:21:53', '2018-09-14 17:21:53', '2018-09-29 10:21:52'),
('ce49e6147194520d27f8deb0c198041522c031bf03b8cee116600c5b0cd48f0520eda1115bd15fca', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:02', '2018-09-15 18:07:02', '2018-09-30 11:07:02'),
('ce9ce9ebf9288c473dae787450ac7df24e6c935041799bde47b603ee9925407a427d1906612fc935', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:19', '2018-09-15 17:46:19', '2018-09-30 10:46:19'),
('cea72a70703c8ecb53229fcba22668499a84a491035ee0f52a45c2dd0d5807df6f79754171afa5f1', 156, 2, NULL, '[]', 1, '2018-09-13 04:33:43', '2018-09-13 04:33:43', '2018-09-27 21:33:43'),
('ceadfc3350bec8161f66d0dda08d9088a84155b8a3fa7248f5dda3d5747e1626c6fb7d107fff943d', 144, 2, NULL, '[]', 0, '2018-07-30 19:16:59', '2018-07-30 19:16:59', '2018-08-14 12:16:58'),
('cecfd288c1c504e24a9662bb0aec126698c93747d6449684fc17ef5117047586adea1ac85f6b7326', 14, 2, NULL, '[]', 0, '2018-11-13 19:24:17', '2018-11-13 19:24:17', '2018-11-28 19:24:17'),
('cef8734ca807d0d5626370aef3344b8a5fbd7a7f03da5b538237ba8d0a929801525cf7a9f4e774b7', 14, 2, NULL, '[]', 0, '2019-01-14 22:14:55', '2019-01-14 22:14:55', '2019-01-29 15:14:54'),
('cf2e608b9d65ec149cb1349859b9bcd0e85b39f7a366b766c30e7acf322443358919de6cb7f53222', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:57', '2018-09-15 17:47:57', '2018-09-30 10:47:57'),
('cf367136cc1a1dac7610f82aee91357410ab0801108885085e5e89a417a827604998eb21d69b078c', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:57', '2018-09-15 17:50:57', '2018-09-30 10:50:57'),
('cf536988417b8f18c1edc90ba658edf12b5608494c221e6a1c6950fa5fc9c0d3e4f5803ad329c46c', 5, 2, NULL, '[]', 0, '2018-10-09 23:07:34', '2018-10-09 23:07:34', '2018-10-24 16:07:33'),
('cf5f9b0278fd1b0f9be0a565e108f58d047cee71af64df03bb4cdb09df8b2f8e01e25eaf411e6cdd', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:52', '2018-09-15 17:47:52', '2018-09-30 10:47:52'),
('cf8f39cec8c20ea45277d67c0c20ae9dcb2e696c5a687a8e4533c3f9584a42e2e2644806892e4c63', 73, 2, NULL, '[]', 0, '2019-02-14 21:12:53', '2019-02-14 21:12:53', '2019-03-01 14:12:53'),
('cfaa8110b60f1943fce59d0091cdf4a729783b71af9031c42ff5fe8a6fe9c5b413056173f477836c', 14, 2, NULL, '[]', 0, '2018-09-22 23:20:54', '2018-09-22 23:20:54', '2018-10-07 16:20:54');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('cfc15a87047671ed6c7518c5cfb18f7791e0beacab6447b5960aa8d5b47097c494548416a35a768a', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:09', '2018-07-20 23:22:09', '2018-08-04 16:22:09'),
('cfea9fb5cebbfd9f6c15bf544108c3110ec35f006f0d4f493dc15d1db8bb09ec44866a709685c0b9', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:37', '2018-09-15 17:45:37', '2018-09-30 10:45:37'),
('d06c33f874514566f53b42342c5d77caabcbd3362b5d84a1bdf77f0d7254475a9243b03d787f1b58', 7, 1, 'socialLogin', '[]', 0, '2018-10-18 10:36:49', '2018-10-18 10:36:49', '2028-10-18 10:36:49'),
('d0b8a2b4690353a89364f138e982dd5e5cd683dcf57d61cef22fb93f4ea4919ca0724dbf9527a2c4', 120, 2, NULL, '[]', 0, '2018-05-23 21:17:54', '2018-05-23 21:17:54', '2018-06-07 14:17:53'),
('d0cc9d77f2dcdb2f4a212e2cb81e82c4ab072c9ce0f3d9a0a6bc279bafd6de5c8c4b7780ef1fbce6', 11, 1, 'socialLogin', '[]', 0, '2018-10-18 11:10:42', '2018-10-18 11:10:42', '2028-10-18 11:10:42'),
('d0e5673c748341f69d770dc3f29ba28097f55c7c4304eddc017c973d0438e94b6afb198aaa1360c6', 144, 2, NULL, '[]', 0, '2018-08-01 21:22:20', '2018-08-01 21:22:20', '2018-08-16 14:22:20'),
('d12f23622b95a96020a25410556ad9e73edad513dec67add4b7a078a3ea27b148d795140f4a6d020', 122, 2, NULL, '[]', 0, '2018-05-28 02:34:07', '2018-05-28 02:34:07', '2018-06-11 19:34:07'),
('d144ef0003a5051110ec1fbadd367c9f4c0b3fb4dd5c0ac15378c3c937ec40bc438e8cee5f7cf08a', 156, 2, NULL, '[]', 1, '2018-09-15 18:04:02', '2018-09-15 18:04:02', '2018-09-30 11:04:02'),
('d173969a26f674042181a7fcfe30af35dbecd641733ff43649e31e6da9966c37756d018fbeaaa12e', 113, 2, NULL, '[]', 0, '2018-01-27 10:23:36', '2018-01-27 10:23:36', '2018-02-11 03:23:36'),
('d195a10d823025ae910d8fcda12fe1afcfdcd7bfbf351b4028064af57a3d3405d90a6c3f3d434207', 1, 2, NULL, '[]', 0, '2018-09-16 02:52:31', '2018-09-16 02:52:31', '2018-09-30 19:52:31'),
('d19d16954304ed9b17d0bc8ac642d3bd16f4bf14494707dc93e62ed2cdfb9f93a9db68c37eb85e82', 47, 2, NULL, '[]', 0, '2018-12-10 05:09:51', '2018-12-10 05:09:51', '2018-12-25 05:09:51'),
('d1b087c74437b243761f8181955ba84de7622aed2b1fd5790fcfe83e896e815d45aba2baa1dd1f9c', 1, 2, NULL, '[]', 0, '2018-09-28 01:51:56', '2018-09-28 01:51:56', '2018-10-12 18:51:56'),
('d1c6ba25fa06b43295106d31cba8d807aa1b50c056643dbb36cda80e5cd1b8f68c8d8950fc16450d', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:32', '2018-09-15 18:07:32', '2018-09-30 11:07:32'),
('d1cdcf75bfc38562b49a7e44f3f5f3a101bd7f54aaa270c00278e04eba202330e52a57d687babe07', 1, 1, 'Personal Access Token', '[]', 0, '2019-06-25 09:16:18', '2019-06-25 09:16:18', '2029-06-25 02:16:18'),
('d26ab7801c2beb935f5b5fcbae6d4f07f73c851c8d2ed8d61941dac5b14aeddc144e83a75f3c70ac', 5, 2, NULL, '[]', 0, '2018-10-06 23:52:34', '2018-10-06 23:52:34', '2018-10-21 16:52:34'),
('d2bb5e151f2e11d859734c76407438747e03be2d94fe3efdde1c9b8377b8d6670294be27241c237c', 130, 2, NULL, '[]', 0, '2018-05-25 02:44:47', '2018-05-25 02:44:47', '2018-06-08 19:44:46'),
('d322e60107f55982c1bb92360c875102fc83d3d08ef7d70ef9879504ac722991ff1d8d5ad6b7200d', 93, 2, NULL, '[]', 0, '2019-06-23 09:48:42', '2019-06-23 09:48:42', '2019-07-08 02:48:42'),
('d34beca53f5d1bc8aedbe1e7f82d3d900ec5b0565b143574a9ef0fc82bc3123bef25c43492764392', 82, 2, NULL, '[]', 0, '2019-03-27 21:06:15', '2019-03-27 21:06:15', '2019-04-11 14:06:15'),
('d354f4ecfd51e696d6b61094d1f13e716ee1c2671ed56316cbcd0716e77a81ba25ccd39436ad7037', 18, 2, NULL, '[]', 0, '2018-10-20 21:16:51', '2018-10-20 21:16:51', '2018-11-04 21:16:51'),
('d38439d43e8cb27c4b971c75f19c7b2a4fd673a3fe6757a4e1ab3edfed7065326119455ec7172b4d', 4, 2, NULL, '[]', 0, '2018-10-04 19:16:26', '2018-10-04 19:16:26', '2018-10-19 12:16:26'),
('d4042edbdfebf6440de5ef48fcedd0903472dc83ef12608630a16cb1fd8233035bf8f2e89ad01100', 1, 2, NULL, '[]', 1, '2018-09-15 22:39:45', '2018-09-15 22:39:45', '2018-09-30 15:39:45'),
('d412c07c50b13756d1c7e9877fc21c8d2683d751bf9b3a370dc165b34893d365f2726450f03e6b61', 13, 1, 'Personal Access Token', '[]', 0, '2019-04-01 19:43:44', '2019-04-01 19:43:44', '2029-04-01 12:43:44'),
('d42a8b07cbf00b9946aa23ff267169f170d7f822dad4d50d3f40e05250025b6b362c991a200fcd51', 156, 2, NULL, '[]', 1, '2018-09-15 18:07:12', '2018-09-15 18:07:12', '2018-09-30 11:07:12'),
('d4aa9adda542167846a1a524b7d4d2a012b5783f4134d9c3d59002e3dedceb1d9d4e2905a4ebbf00', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:03', '2018-07-20 23:22:03', '2018-08-04 16:22:03'),
('d4b41fcb98f8f619eb243df0d957dddbf11b728d2b34cccd9d2fea74b957c2dca30271fb08468bef', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:57', '2018-09-15 17:58:57', '2018-09-30 10:58:57'),
('d4ed0da39d9aa91cd8ec9e47fa6e613eebed8141bb4e825171466c6b7494bbfca5d5c70fd201e263', 13, 2, NULL, '[]', 0, '2018-09-21 19:46:10', '2018-09-21 19:46:10', '2018-10-06 12:46:10'),
('d4ff654c186e27a356b4de7471eebeb9ee5ee87daae24105e18805ae60076e3571e65ca2a34967b2', 1, 2, NULL, '[]', 1, '2018-09-15 22:21:06', '2018-09-15 22:21:06', '2018-09-30 15:21:06'),
('d51e97db0eba115f07b8cd6b13de8d669898e97d488cbb0ccb4b8d5a96bd12d913251cddd43b5504', 1, 2, NULL, '[]', 0, '2018-09-16 03:02:10', '2018-09-16 03:02:10', '2018-09-30 20:02:09'),
('d579fb7d25bd9ce2a285f3b57c46b7fb5f70f6fab691f28131203c72667e0e59a683a6a07d9d109c', 1, 2, NULL, '[]', 1, '2018-09-16 22:21:24', '2018-09-16 22:21:24', '2018-10-01 15:21:23'),
('d57c3f9510494a05d59b2c9991dc59ffdaf1896b07d9a719630caec7c4532902cef27fc711f5ac0a', 6, 1, 'socialLogin', '[]', 0, '2018-09-16 07:09:13', '2018-09-16 07:09:13', '2028-09-16 00:09:13'),
('d5b9a0434656e0baf4be2584a37615d57c3b09a644634925632b6d5e45b12fc50be08dbc2c74442e', 14, 2, NULL, '[]', 0, '2018-12-19 21:01:21', '2018-12-19 21:01:21', '2019-01-03 21:01:21'),
('d5c72d3659ff8c5173d4451e428b09c553330ca528787a1fde86b5863208b8f143c3ea310641735f', 1, 2, NULL, '[]', 0, '2018-10-10 14:42:54', '2018-10-10 14:42:54', '2018-10-25 14:42:54'),
('d5f0e78a7a640abe5be774705ff4972103670c9d706020e0e9fe2372c8a575355fec27445f3e1e5f', 3, 2, NULL, '[]', 0, '2018-10-05 01:48:08', '2018-10-05 01:48:08', '2018-10-19 18:48:07'),
('d645b9bee8fd2cd7133a417e687e9c4eaed889c605aaa313d3126da17e24f5126b75e23af26831ef', 156, 2, NULL, '[]', 0, '2018-09-11 22:37:05', '2018-09-11 22:37:05', '2018-09-26 15:37:05'),
('d6923ce45afee26905a35bface2dc3b722f2ca6a714a8c1846342d85d36c5d9926153ac424ee3a06', 4, 2, NULL, '[]', 0, '2018-10-16 02:23:20', '2018-10-16 02:23:20', '2018-10-31 02:23:20'),
('d7100d3fd932005cbae9ff27def0fed0acfaeac317274641f1c016c5b8c95e5f157eb94208a3b1be', 4, 2, NULL, '[]', 1, '2018-09-16 06:30:51', '2018-09-16 06:30:51', '2018-09-30 23:30:51'),
('d76c5272d1039eec883ea687168b728ca95a37bfd6f26ea77221a6a27d83092cdb04449a28fb9172', 120, 2, NULL, '[]', 0, '2018-06-02 19:38:21', '2018-06-02 19:38:21', '2018-06-17 12:38:21'),
('d7acf762f22fbd025243a42b70c8a81f50414da510325062deee45f4bb404bbf14c373aaacde361a', 4, 2, NULL, '[]', 0, '2018-10-04 19:39:03', '2018-10-04 19:39:03', '2018-10-19 12:39:03'),
('d7d37bdc984153ebbb4d4bfe088165cfa90feee40745f797dcd9adf8dfd6cda252047b5a6771a95d', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:57', '2018-09-15 18:01:57', '2018-09-30 11:01:57'),
('d7fc8ab3ba54621945bbc6cbc1af7f25f1c6b285c4c2f96204b3e1df08a53781ede986527e809c8b', 5, 2, NULL, '[]', 0, '2018-10-07 00:48:19', '2018-10-07 00:48:19', '2018-10-21 17:48:19'),
('d837c6ee07a0afb09ba2e4c88248a5a6351844be79eb844f15f7ed9beb5567272fe74f81255e43af', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:57', '2018-09-15 17:57:57', '2018-09-30 10:57:57'),
('d857a45a50ed0962beeff59071e01219752023df057d2c1e92f578d6904801589e93eb7ceb5ca069', 156, 2, NULL, '[]', 1, '2018-09-15 18:05:42', '2018-09-15 18:05:42', '2018-09-30 11:05:42'),
('d88e27acfcb2cfe471771d572af2877cbd7a6aa581b990e525d74df853c6e6198584645ed7c64247', 156, 2, NULL, '[]', 1, '2018-09-15 17:44:35', '2018-09-15 17:44:35', '2018-09-30 10:44:35'),
('d8a22a6f83deba2333a8a86e0be696af82eb2bf3d2d4de5ce46587834fde4accd9e2af2505c4be22', 4, 2, NULL, '[]', 0, '2018-11-22 20:14:32', '2018-11-22 20:14:32', '2018-12-07 20:14:32'),
('d90a620038a74bdfc4edafd46bb9b75d51995e3b5623335cf939d9388805ebbc6a588331fe215a06', 1, 2, NULL, '[]', 0, '2018-09-28 17:03:29', '2018-09-28 17:03:29', '2018-10-13 10:03:29'),
('d9311afe99606cffee4715c7e954754fd2aa32213cd3ed36476a67e607c6e71a698b16786d790b83', 54, 2, NULL, '[]', 0, '2018-12-26 19:31:15', '2018-12-26 19:31:15', '2019-01-10 19:31:15'),
('d98c83529c5d77d045d0510674aeaf5969a3409c5161c22a8eef2e68dfec40bdb6bddfaf996ef52e', 73, 2, NULL, '[]', 0, '2019-02-22 01:50:22', '2019-02-22 01:50:22', '2019-03-08 18:50:22'),
('d99257d397cca9ffbca40da284d64b648f815110e5cfd7e4544ef41b08065abece0f29eb6060436f', 120, 2, NULL, '[]', 0, '2018-05-24 21:25:13', '2018-05-24 21:25:13', '2018-06-08 14:25:13'),
('d9b8df764ed5b3019aa5ac5f914bc9104a081a15cdde66590aadb6f0e56fe84d461ee99839ff6c09', 117, 2, NULL, '[]', 0, '2018-02-03 12:55:36', '2018-02-03 12:55:36', '2018-02-18 05:55:36'),
('d9d09cf465742d84b1cdc87e377ba34057091800c14cdcf218fa849b17fab32d5adc08b07e21f87c', 108, 2, NULL, '[]', 0, '2019-07-04 20:01:45', '2019-07-04 20:01:45', '2019-07-19 13:01:44'),
('da05ce68401082eb8d18cc658048e510f5789fae1e7281eceed46a9071c7e24caa33f98b8eb34afd', 150, 2, NULL, '[]', 0, '2018-08-12 15:28:05', '2018-08-12 15:28:05', '2018-08-27 08:28:05'),
('da55e667f71166cd87b4d124b12669f52e7abe9185f39d35f768cd06a0e623bc045451a56c2dbe6a', 20, 1, 'Personal Access Token', '[]', 0, '2019-04-10 05:13:05', '2019-04-10 05:13:05', '2029-04-09 22:13:05'),
('da911c1953034e0ee1639aa9a44c5eae788e06d06b56446d9e09e6f3acf7b7bcad2db840c9c01012', 34, 2, NULL, '[]', 0, '2018-11-22 16:07:44', '2018-11-22 16:07:44', '2018-12-07 16:07:44'),
('daa2a4942149f0a2167bbf420343890e49310c0bf51ee12ce4576e03a8d6e3a2428a65645862c0ac', 58, 2, NULL, '[]', 0, '2018-12-31 13:04:27', '2018-12-31 13:04:27', '2019-01-15 13:04:27'),
('daa9bd9000c8943075d8876b595dd175969d6bf9ad9b0122893a0effb00871a266fd7e7fe72195b1', 1, 2, NULL, '[]', 0, '2018-09-19 07:16:08', '2018-09-19 07:16:08', '2018-10-04 00:16:08'),
('daf0aad4e35e0bcf173a5e52f8043c43aa284dfc8b3dbfe88a3ea952f69702f4103741735cedd7a1', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:02', '2018-09-15 17:47:02', '2018-09-30 10:47:02'),
('db4bdb52d054e3548c8086405fa46c3258f065a06593713f4cd6446467b89e93528f79890aa00ca8', 144, 2, NULL, '[]', 0, '2018-07-25 19:51:39', '2018-07-25 19:51:39', '2018-08-09 12:51:39'),
('db8b1c7f00693e82e2c7c777ce40b82f0ba15daebadf02f5717f2540b4f989c409d4752005e8f035', 85, 2, NULL, '[]', 0, '2019-04-16 06:35:05', '2019-04-16 06:35:05', '2019-04-30 23:35:05'),
('db8f5754dee29f8945e242cbf3c45d0f5e2858d0b7b05f0e84c15da310ee40bebe7ebd073994d4e8', 141, 2, NULL, '[]', 0, '2018-06-11 22:54:56', '2018-06-11 22:54:56', '2018-06-26 15:54:56'),
('dba2fcc1e0dae8e57d9f23a5c970d3172b8d01939069b0b06b069a8ca1404b434aabeeac715d4bec', 1, 1, 'Personal Access Token', '[]', 0, '2019-06-25 09:16:25', '2019-06-25 09:16:25', '2029-06-25 02:16:25'),
('dbe05aa548e59f3c4fd27f0a4f82de6ee8bceb399f8389a2ba351bafb85e2660eff2d6218bd02d6e', 15, 2, NULL, '[]', 0, '2018-10-12 13:05:58', '2018-10-12 13:05:58', '2018-10-27 13:05:58'),
('dc7343e0b65c76276d7ffbc19920a0b32fa3acb31f056faedbd377a0ddb58ff3c7de34b2ce8657cd', 14, 2, NULL, '[]', 0, '2018-11-28 16:32:12', '2018-11-28 16:32:12', '2018-12-13 16:32:12'),
('dc9f4f7ad52618832f83c641025d16b57c1e61dd82350b6939f7f92c39049e42ecdc714ff8ef1f28', 156, 2, NULL, '[]', 1, '2018-09-15 17:49:13', '2018-09-15 17:49:13', '2018-09-30 10:49:12'),
('dcac319265c442597ba947d80c8e4042752e5999396ea71543fdff69cbf6ff7284a4f88c71f6edfd', 86, 2, NULL, '[]', 0, '2019-05-14 21:12:36', '2019-05-14 21:12:36', '2019-05-29 14:12:36'),
('dcbc27bd0abef46ff81739f358af64b2407ef5257652147373f9f0f8f108ce4a8a553c257f6ae0d5', 21, 1, 'socialLogin', '[]', 0, '2018-10-24 13:16:41', '2018-10-24 13:16:41', '2028-10-24 13:16:41'),
('dcd9ae31d7e60eb0f08ed7852cc95f45f31e7f3d1fa6559426fe7e1038cdfab22efacb6d2b668b2e', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:57', '2018-09-15 18:06:57', '2018-09-30 11:06:57'),
('dd2fc6adf7d0709ed641f8811b2a23e8124147775cca242fbbb865d8dd97a59112d411ddf3fe385f', 86, 2, NULL, '[]', 0, '2019-04-16 19:43:03', '2019-04-16 19:43:03', '2019-05-01 12:43:03'),
('dd68c77aab30e1e5c24c6b32f0ea7def7a325c4d97094888921bf50e57a3634132c088fddb4ecb67', 14, 2, NULL, '[]', 0, '2018-10-18 19:21:12', '2018-10-18 19:21:12', '2018-11-02 19:21:12'),
('dd80637e5ae350728e617d6da6964fb6101b429973b2a3e4a537f636f7aeb8d11c2cc32d4322d6a6', 14, 2, NULL, '[]', 0, '2019-01-14 22:14:56', '2019-01-14 22:14:56', '2019-01-29 15:14:56'),
('ddae8d6bf334d3349010c70765778a0b307e200b9771e2031d49e512413f25e5ba556643d0fd1d47', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:56', '2018-09-15 17:45:56', '2018-09-30 10:45:56'),
('dddd8af404d8cd4ebae47d4034757e2011704f91c2092d154bb2bdc0f410cdb44aba4c75042599a8', 156, 2, NULL, '[]', 1, '2018-09-15 17:53:12', '2018-09-15 17:53:12', '2018-09-30 10:53:12'),
('de0f0c22b3472aa9a22aadf6abe2b61933a9229f976620322cfd7024dd04f9f794a9f95ed9408653', 86, 2, NULL, '[]', 0, '2019-06-11 01:38:26', '2019-06-11 01:38:26', '2019-06-25 18:38:26'),
('de119ce1bf1ded70ab907044b96013eb0047e50c2d92e93a4b1f124506978ccaac2f41e02a8dcf22', 84, 2, NULL, '[]', 0, '2019-06-23 01:45:27', '2019-06-23 01:45:27', '2019-07-07 18:45:26'),
('de196771381235538f819d0467a8af75f09d4c7db68b47163ba5821edd8f501deecc091ce52a1c8c', 156, 2, NULL, '[]', 1, '2018-09-15 17:51:37', '2018-09-15 17:51:37', '2018-09-30 10:51:37'),
('de48d20e1b9e6f556a5d5efc091e13e7cfb360958fd87d2bc0aad7ecd590bd7d20c8999883a5f825', 86, 2, NULL, '[]', 0, '2019-04-17 02:47:44', '2019-04-17 02:47:44', '2019-05-01 19:47:44'),
('de4e75047f35e596b76a1e177bdd257d64a9779a653016e1b3976f55561eedfe9914e4e039a89cfa', 1, 2, NULL, '[]', 1, '2018-09-16 00:19:25', '2018-09-16 00:19:25', '2018-09-30 17:19:25'),
('de5dc72e8e4f2b642e1df089f4c71c8c704dd197f548230fb00e1441578f8b500d51ede416e2ce38', 14, 2, NULL, '[]', 0, '2018-11-13 17:23:58', '2018-11-13 17:23:58', '2018-11-28 17:23:58'),
('defa877b1f8eec77d5e829bffaf3ef66a1f640d481e900730caa35f16a63aa763bd3569f53a0d5c8', 7, 1, 'Personal Access Token', '[]', 0, '2019-07-08 23:57:01', '2019-07-08 23:57:01', '2029-07-08 16:57:01'),
('df16e85aedd7345979eb4a6888cb67ba82556c2d916ad23a3aa5e51d65bbcc52d79aee739b4afcb3', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:07', '2018-09-15 17:57:07', '2018-09-30 10:57:07'),
('dfdfad4d04576e721941c082b837375b3e2261af57e467182b280a05e7f1a5ddfb202bea193120bb', 156, 2, NULL, '[]', 1, '2018-09-15 18:06:17', '2018-09-15 18:06:17', '2018-09-30 11:06:17'),
('e017a2c3c859365108b05c134087914ae467e1dd8a2752a5e84baa2b4554010451bc0ce741a1ffec', 5, 1, 'Personal Access Token', '[]', 0, '2019-07-03 19:45:17', '2019-07-03 19:45:17', '2029-07-03 12:45:17'),
('e0326335f779e16b3ec5204f88141811fce25d17126534c51fcd9157e528b66b6fcefa8dbacc2ea0', 4, 2, NULL, '[]', 1, '2018-09-16 06:54:27', '2018-09-16 06:54:27', '2018-09-30 23:54:27'),
('e0649d30752b2014ef2aea251ac48c5ebcde287347a670d816807ee6b08ef2a89b185fe935013d4d', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:47', '2018-09-15 17:45:47', '2018-09-30 10:45:47'),
('e094fbeb94c81cd7125ec906e06a23e279265a89bc8f0fea99d561c6d38124f3dfe9164e72238995', 3, 1, 'socialLogin', '[]', 0, '2018-11-28 12:22:24', '2018-11-28 12:22:24', '2028-11-28 12:22:24'),
('e106878c0e58b15804e4ee96bcebfdd24b17a01c57291d066bb031f2535550720da88110cc616f8f', 156, 2, NULL, '[]', 1, '2018-09-13 23:25:33', '2018-09-13 23:25:33', '2018-09-28 16:25:33'),
('e13aa193e7b9bb53b4391c7c485eb2cd319f38241e09dc767c44c38f16f622bf70db0f8c37e66e34', 156, 2, NULL, '[]', 1, '2018-09-13 18:41:48', '2018-09-13 18:41:48', '2018-09-28 11:41:48'),
('e1855d21c653629bcd4b2836589f3a5a6e85ab40dbda2f8600cea818af12b6343a8fc6587eb76098', 156, 2, NULL, '[]', 1, '2018-09-15 18:09:52', '2018-09-15 18:09:52', '2018-09-30 11:09:52'),
('e19aa3b69eb11798c3ebd47a36a7f5df92c99266c53eb153b7e65c9b643fcfe4080928d8ca12a03f', 5, 2, NULL, '[]', 0, '2018-10-07 00:01:22', '2018-10-07 00:01:22', '2018-10-21 17:01:22'),
('e1ea6b19a003a1d5ab273760d2d286c29f6dd87e52bea00978994c2a99afaf867bbffb8d4c866f3e', 1, 2, NULL, '[]', 1, '2018-09-15 21:47:08', '2018-09-15 21:47:08', '2018-09-30 14:47:08'),
('e21e8f8de4f166a93db8205c7ec80feb2ca307143d0768731ea29592cb7d601e72d3933538211a66', 122, 2, NULL, '[]', 0, '2018-05-30 05:03:55', '2018-05-30 05:03:55', '2018-06-13 22:03:55'),
('e232df07df065e886a0217ca4dfa0da14384d8685eac85327f81b59d8c4dd30c473370add1329350', 103, 2, NULL, '[]', 0, '2019-07-03 22:33:47', '2019-07-03 22:33:47', '2019-07-18 15:33:47'),
('e240272a38f67c00e8c4c9016ec07bb2a59d2616cbe7550bd0e318729d42c9fbe4b4138b9ca60133', 146, 2, NULL, '[]', 0, '2018-08-01 17:58:59', '2018-08-01 17:58:59', '2018-08-16 10:58:59'),
('e2aa87795719eca065c1414bd83838b0e5dbd1a84909fdeae9c148c186c9b4e9fd084457bceeb5cc', 153, 2, NULL, '[]', 0, '2018-08-24 19:44:27', '2018-08-24 19:44:27', '2018-09-08 12:44:27'),
('e30b6e79485aaa2f60c53f019b64aff1c95358561346d7b6ac9515379f4777e1a0cda6a5b8c5236c', 83, 2, NULL, '[]', 0, '2019-03-16 02:53:14', '2019-03-16 02:53:14', '2019-03-30 19:53:14'),
('e39aaacf495ff83fed0fefef8124e822c26fcdc34e8db325e7300a7d6e924002f4a827521405196b', 14, 2, NULL, '[]', 0, '2018-09-25 21:59:03', '2018-09-25 21:59:03', '2018-10-10 14:59:03'),
('e3b285c0a20f37766a5f7fc3243c3941f0c7225c3ea51c6b63f850b1e32baab0dc8d73a618e33c28', 20, 1, 'Personal Access Token', '[]', 0, '2019-04-16 21:45:44', '2019-04-16 21:45:44', '2029-04-16 14:45:44'),
('e3ba2b90b9aad7479b5280a5d7281c6c80201cbf01b0328f6ae2c5e1150952a3b0b8d79c4d0e7b23', 150, 2, NULL, '[]', 1, '2018-07-20 23:22:17', '2018-07-20 23:22:17', '2018-08-04 16:22:17'),
('e3d33758f8db2aff6a86de907f457c541a450e87a8c8e9473e6899979d3514e34ab468497a6af0e9', 79, 2, NULL, '[]', 0, '2019-03-07 02:10:38', '2019-03-07 02:10:38', '2019-03-21 19:10:38'),
('e3ec4baca841c10a41649f0706dc28bf046072db57b02d2a40246b75c9d6d7671bbc767c5f147b90', 156, 2, NULL, '[]', 1, '2018-09-15 18:08:12', '2018-09-15 18:08:12', '2018-09-30 11:08:12'),
('e4110b030e7f67bf5c20f3bff9997407684e0f92d0267ee042f682aefcbf63f0706f3e3cf8034e10', 156, 2, NULL, '[]', 1, '2018-09-15 18:03:37', '2018-09-15 18:03:37', '2018-09-30 11:03:37'),
('e41806827e0aa882a0dc0557c3037f261026e355a86e1e802d4a3794a2d2dabf7de585dbb25c5564', 2, 1, 'socialLogin', '[]', 0, '2018-09-16 02:01:53', '2018-09-16 02:01:53', '2028-09-15 19:01:53'),
('e429e3d0c43664502b5072a2b206107afe2f76f19288913ce22651ff79bb2efb6691326bfe13598e', 13, 1, 'Personal Access Token', '[]', 0, '2019-03-30 00:27:36', '2019-03-30 00:27:36', '2029-03-29 17:27:36'),
('e42da8623279f670a56a824053169d5e4d3c7643342147719410d9ce6f27586ee69b4ee6122ef0e7', 120, 2, NULL, '[]', 0, '2018-09-13 16:50:47', '2018-09-13 16:50:47', '2018-09-28 09:50:46'),
('e4897e76cbed6e947a8db8f2e0de3d299315747a0b5e5ea39c51bc0e187a625f56f63aff07f06187', 1, 1, 'Personal Access Token', '[]', 0, '2019-03-29 23:08:11', '2019-03-29 23:08:11', '2029-03-29 16:08:11'),
('e4979cfb6e20566e8a6075501512989bbd9306ba9018c2cc1bd9653e46b6b1669b33fb24212bef71', 144, 2, NULL, '[]', 0, '2018-07-22 22:52:05', '2018-07-22 22:52:05', '2018-08-06 15:52:05'),
('e4a0128596284c4c1a31fe92935c5c0b6950c4a7501be5ffb2ce328261219e87a705184db0981f66', 5, 2, NULL, '[]', 0, '2018-10-12 10:28:19', '2018-10-12 10:28:19', '2018-10-27 10:28:19'),
('e4ba60f6d26dfcb060e5862d161b58f680192ebe7a6424fdf8d5c9e6635db3482da0ef7cca33e475', 144, 2, NULL, '[]', 0, '2018-07-21 23:31:44', '2018-07-21 23:31:44', '2018-08-05 16:31:44'),
('e4bec015a75528dc9009009a3476a7fd567717cad442f0bdc4e2e1ea227a708cd34184a782d17888', 17, 2, NULL, '[]', 0, '2018-09-20 04:29:37', '2018-09-20 04:29:37', '2018-10-04 21:29:37'),
('e50157b48d2d904decff91be8720bd17e981dd36352919e6a33c891c01655eed9d9118abb97cdaa4', 15, 1, 'Personal Access Token', '[]', 0, '2019-05-08 02:49:23', '2019-05-08 02:49:23', '2029-05-07 19:49:23'),
('e533a7e5c59a2405f012c5972acaad1d042607d3f8777690e2c2cdeb97cee720dbaadb386664cfd1', 7, 1, 'socialLogin', '[]', 0, '2018-10-17 11:16:22', '2018-10-17 11:16:22', '2028-10-17 11:16:22'),
('e54018ddfd729f3774882bdb52000b341b434ddbff8e55367fa4b828b31135ea9bdebbb38dbf7da9', 62, 2, NULL, '[]', 0, '2019-02-05 22:17:22', '2019-02-05 22:17:22', '2019-02-20 15:17:22'),
('e56fea12d3156944b2a9297c32570db3c1d3318cd1bb141deee6184c0c796306ae931b5b961d5073', 5, 1, 'Personal Access Token', '[]', 0, '2019-07-02 20:01:23', '2019-07-02 20:01:23', '2029-07-02 13:01:23'),
('e571f2cbba31655fc830f7df9cb9ff73a4c8d51d418cd70e46c0c1dd64ebfaec69cfed770f34865b', 120, 2, NULL, '[]', 0, '2018-09-13 19:53:34', '2018-09-13 19:53:34', '2018-09-28 12:53:33'),
('e61fe35f40a14e996c35783e210aa29c6a5bd8cadf830b92e75540bd9a2e73e8b6dbd9c1bb2bdb31', 156, 2, NULL, '[]', 1, '2018-09-15 18:01:22', '2018-09-15 18:01:22', '2018-09-30 11:01:22'),
('e679ae2b9fd84f7f7aa0fdb82478a732774dcf23ab402b6beea2b854e5eed48485533a2b233e2f5f', 127, 2, NULL, '[]', 0, '2018-05-24 05:27:35', '2018-05-24 05:27:35', '2018-06-07 22:27:35'),
('e6abc56b04216c0ba2d76e3088f1b64f303d0bdf9df088ef3a76b970e8121583d68a42ce7851699a', 1, 1, 'Personal Access Token', '[]', 0, '2019-06-12 05:13:09', '2019-06-12 05:13:09', '2029-06-11 22:13:09'),
('e73d94e7d93f1c9f3bae9aa10aa7e0981c9fa6437c0843b1cb2e95d38f7a10e3f1677ebc2d86b8bc', 1, 2, NULL, '[]', 0, '2018-09-17 07:59:48', '2018-09-17 07:59:48', '2018-10-02 00:59:48'),
('e771d61dc9bb96cf1633f27617233525a99da86501aa77eef265ab79c6297f938e2bf8024d8496c9', 13, 2, NULL, '[]', 0, '2018-09-21 21:17:29', '2018-09-21 21:17:29', '2018-10-06 14:17:29'),
('e7b9b9b5e065cbcf822361b1d3900ce7447076ba47e466f7a3a4074f36530fde0c3315cb97164feb', 58, 2, NULL, '[]', 0, '2019-01-05 15:52:37', '2019-01-05 15:52:37', '2019-01-20 15:52:37'),
('e7ee825d51f9f15a290e04f896e584262d401c9d2fdbf462ed15662c9ee66cec89365a4959a10109', 1, 2, NULL, '[]', 1, '2018-09-15 22:50:57', '2018-09-15 22:50:57', '2018-09-30 15:50:57'),
('e8154fb0255773116af6cd34d0678c49dbd1b46fa6b11f1b8302d895af713b2babf2b717e62b2b54', 108, 2, NULL, '[]', 0, '2019-07-04 20:50:08', '2019-07-04 20:50:08', '2019-07-19 13:50:08'),
('e821d0dda00bbb0035b1611c065c1c29a82debfa50146a54854fd00bc7d087ac04aa00dbc335ca46', 19, 2, NULL, '[]', 0, '2018-10-15 11:21:34', '2018-10-15 11:21:34', '2018-10-30 11:21:34'),
('e84555b42df3fa9fdcd2c8bc1a2feae627781703d7674e6ffe0b9ebc83a6c8e3490cf042607d3ff6', 17, 1, 'Personal Access Token', '[]', 0, '2019-04-02 01:54:05', '2019-04-02 01:54:05', '2029-04-01 18:54:05'),
('e869357363e8e04c7d673bee9eaaf6c9b3bc997e40f7f832a1d2b8b3a625e07d2802ee3268023137', 146, 2, NULL, '[]', 0, '2018-08-02 00:51:49', '2018-08-02 00:51:49', '2018-08-16 17:51:49'),
('e8ad0e719e5f04061a69af1e11f4046b330aa0a17fc4478f1b7a6b74b49c5c627881daeaef0a2eda', 5, 2, NULL, '[]', 0, '2018-10-08 19:28:32', '2018-10-08 19:28:32', '2018-10-23 12:28:32'),
('e8c7c2de2dcfb15b6d1cd6f9a02ad9142930e748eafd0c6ee660326eb35ba40fab1b549616907843', 150, 2, NULL, '[]', 0, '2018-08-12 15:28:04', '2018-08-12 15:28:04', '2018-08-27 08:28:04'),
('e8f01b315feeede424e8ff825aa63073642f47b5b977c51db3c966db1929780a232f2008ceac172f', 5, 2, NULL, '[]', 0, '2018-10-08 19:09:18', '2018-10-08 19:09:18', '2018-10-23 12:09:17'),
('e8f821968d440e9a4bd917b9e3b4631b7a7392693aec6501cc4c663f70f09f314f329bc55823359d', 1, 2, NULL, '[]', 0, '2018-09-15 19:27:51', '2018-09-15 19:27:51', '2018-09-30 12:27:51'),
('e9a0ea916d09b8e104d44b91b58edc5b338fdd92459ede59755c3960caef6b72f42956345e52b025', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:52', '2018-09-15 17:57:52', '2018-09-30 10:57:52'),
('e9bad87d529a5fd15b9d0e8578bcb526c6f57d00a09710bacfe2165d9732af2de166a5d872e22272', 35, 2, NULL, '[]', 0, '2018-11-23 15:01:40', '2018-11-23 15:01:40', '2018-12-08 15:01:40'),
('ea1be2ddb5e415fc73e65b86560f6a04dd83bd632e56f42f422c9a6008c7e73069d498c1ce736bca', 14, 2, NULL, '[]', 0, '2018-11-15 16:42:44', '2018-11-15 16:42:44', '2018-11-30 16:42:44'),
('ea24bfc07ae8b6a695e99d28b8fba634ccbdea5f07645d8165453be2ec2d6b9106a35d286844463f', 132, 2, NULL, '[]', 0, '2018-06-08 22:15:59', '2018-06-08 22:15:59', '2018-06-23 15:15:59'),
('ea4cacbfdf2f61733611bf0689e669c636579cdb727c2874b4c097a5cae82201f1c53cb06913ad9b', 120, 2, NULL, '[]', 0, '2018-08-04 18:20:20', '2018-08-04 18:20:20', '2018-08-19 11:20:20'),
('ea508a81d6cd588c479295d45c6bec8f0559d5bcdd6c36ac422ce9965705293336299b25dcd5d941', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:22', '2018-09-15 17:54:22', '2018-09-30 10:54:22'),
('ea64c7f9e313483d3d4f5477c84248a7d7d35d37ea2b78325cc6c18ab1cee2c14f96aa42e2a9d238', 122, 2, NULL, '[]', 0, '2018-05-29 04:11:47', '2018-05-29 04:11:47', '2018-06-12 21:11:46'),
('ea90193f9ed3866cdd844fb7525fd488cc9bccee7639ef96e2ac71a177bc7faa3236a63bf683e3ed', 19, 1, 'Personal Access Token', '[]', 0, '2019-04-10 12:46:26', '2019-04-10 12:46:26', '2029-04-10 05:46:26'),
('eb25369a42a8c67f03809fecc48b2afb877de59f7912959c839c6f568faeaa75694a82e77ac2cd6d', 45, 2, NULL, '[]', 0, '2018-11-30 19:03:23', '2018-11-30 19:03:23', '2018-12-15 19:03:23'),
('eb51a5617bb4b950cf288cf1a8ac5beffa2d60790aea4373df4bb668a2b2340ce122c9515595cd8f', 5, 2, NULL, '[]', 0, '2018-09-16 06:32:26', '2018-09-16 06:32:26', '2018-09-30 23:32:26'),
('eb9629bd07c4b953ad0e39c5a083d5e0d11ddf6ab97319087943de3eaf9a0add9cbeb6a49d4006f2', 2, 2, NULL, '[]', 0, '2018-10-15 18:27:12', '2018-10-15 18:27:12', '2018-10-30 18:27:12'),
('eba10ee6839ad3f3c03407b8877518806534fef0102993d2aa4f2284bb759332f96bedce20b0b9bc', 120, 2, NULL, '[]', 0, '2018-08-31 01:15:35', '2018-08-31 01:15:35', '2018-09-14 18:15:35'),
('ebaecdaa991b4771ecb1bc9f87d4ba5ff6c14543315b4df1ad93085eadb15a70be4b85a07cee361c', 2, 2, NULL, '[]', 0, '2018-10-09 02:10:05', '2018-10-09 02:10:05', '2018-10-23 19:10:05'),
('ebb377bf44663446f081600274a24d31693708bf3895d1f937dcfe683ae0585f592fc8ac399e7553', 86, 2, NULL, '[]', 0, '2019-06-11 01:34:45', '2019-06-11 01:34:45', '2019-06-25 18:34:45'),
('ebfcd311c25ad94bcf8dac2d208d38f55f97b604a061b18ca8717d4de60d127a8c52afc4735e6716', 13, 2, NULL, '[]', 0, '2018-10-11 16:32:42', '2018-10-11 16:32:42', '2018-10-26 16:32:42'),
('ec08244f8fb5b28788d47c0e9ac35b015358ae4325904be242d275ac42b9e90de448aacfb4721739', 2, 2, NULL, '[]', 0, '2018-10-09 19:47:58', '2018-10-09 19:47:58', '2018-10-24 12:47:58'),
('ec1b488be0ad08dce8405b510ff3b496ce6d936cd72bd54093845b6e68a889d7c379c7bfbd2afd36', 5, 2, NULL, '[]', 0, '2018-10-06 20:22:09', '2018-10-06 20:22:09', '2018-10-21 13:22:09'),
('ec39ab5e57e30ecaddfc1aeaf996eb4ddeda3fe6538d47ee6d42393af2aea3643680bb9aa866d294', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:24', '2018-09-15 17:46:24', '2018-09-30 10:46:24'),
('ec44f2535ec2fc46b5bd5596dac4ae3627bb7cb1ead524f94e04670e2e90051aaf7e81bc7e123e5d', 149, 2, NULL, '[]', 0, '2018-08-10 23:07:23', '2018-08-10 23:07:23', '2018-08-25 16:07:23'),
('ec8bd73f8e5b25be991b589f306c47367f9a83f0f56f003bf0b442348d951fb14dc91cfc2217fb68', 70, 1, 'MyApp', '[]', 0, '2019-02-06 03:26:48', '2019-02-06 03:26:48', '2029-02-05 20:26:48'),
('ed034aa96060936549ae6d783988dfa79f8f833277382524c187f7f6bcb1701b14018fe40523c79a', 4, 2, NULL, '[]', 0, '2018-10-04 02:14:44', '2018-10-04 02:14:44', '2018-10-18 19:14:44'),
('ed0e4ed217c038a494a039957928cd5710f5e867751baa4c8121c4d612dbc5a9ffd371e30c768ec9', 1, 2, NULL, '[]', 0, '2018-09-27 22:12:15', '2018-09-27 22:12:15', '2018-10-12 15:12:15'),
('ed269f21185a28ba8833f2661a11adbf34d71e3e5f48fc19da698fce62e720542f104ddd4aabc174', 37, 1, 'socialLogin', '[]', 0, '2018-11-01 03:43:46', '2018-11-01 03:43:46', '2028-11-01 03:43:46'),
('ed671c81400108f7af01041a7ebe3857e905478c06a4459c9bd0a323b5b24937ba0980c47d0a82b7', 7, 2, NULL, '[]', 0, '2018-09-18 23:49:22', '2018-09-18 23:49:22', '2018-10-03 16:49:22'),
('eda4f94c1454a527d87cc8df4d0d4b32007a44c67b9cc73e38ed435364d69d5cdece6a475953e739', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:08', '2018-09-15 17:59:08', '2018-09-30 10:59:08'),
('edb0df58b2275d23854e7d3b676c1db7007422c2e51a6362f01eb40cb9158784e01fdbbe7539d3a5', 82, 2, NULL, '[]', 0, '2019-03-08 21:37:29', '2019-03-08 21:37:29', '2019-03-23 14:37:29'),
('ee3a754acd3081a953b9317740be10223f193f06521a512917d9899741af7d1d45f125900252d7ee', 14, 2, NULL, '[]', 0, '2018-11-24 16:35:46', '2018-11-24 16:35:46', '2018-12-09 16:35:46'),
('eefe31578e04aeec9a6a48598eb8d88c2f112ded01803a05f0bf0365d23aa7f9d635127af23304a1', 12, 2, NULL, '[]', 0, '2018-09-19 21:49:10', '2018-09-19 21:49:10', '2018-10-04 14:49:10'),
('efe7cca9d771a1c8f29223378091d5f30a17f2ef3c356471fc0fbd8f91a049b76a2e46358fb91efc', 132, 2, NULL, '[]', 0, '2018-06-14 22:41:17', '2018-06-14 22:41:17', '2018-06-29 15:41:17'),
('efed43064490ca11fc1dbc814a212d4d4b027501b6d18a3a533a7b9dc86102e7cefd6a3e66c878dd', 22, 2, NULL, '[]', 0, '2018-09-21 19:41:25', '2018-09-21 19:41:25', '2018-10-06 12:41:25'),
('efee06bb7d332ee85cdaa158d840d2f8b33cd1766f0269d49607869b410c897572a2530c7dec2c15', 84, 2, NULL, '[]', 0, '2019-06-06 00:30:46', '2019-06-06 00:30:46', '2019-06-20 17:30:46'),
('f01951950729720725c8f77038d9f1712378e25a69256572b868ccbee36294aa1ed7397b76c25c71', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:48', '2018-09-15 18:00:48', '2018-09-30 11:00:48'),
('f03ff313061f50eac0164a82f6a8925644b826435f6485942b2b796ca51be3d70058b32a46b0f0b3', 1, 2, NULL, '[]', 0, '2018-09-18 22:50:27', '2018-09-18 22:50:27', '2018-10-03 15:50:27'),
('f081da02b94587cc41c03a17074896d427655b9196446cee9870f6ffef8aa871ee76b6923207fad2', 3, 1, 'socialLogin', '[]', 0, '2018-10-15 23:35:04', '2018-10-15 23:35:04', '2028-10-15 23:35:04'),
('f14060d9340ca5a79a264dfbec1c914c7b052205035567506f0dd7f888ea6cbe955272ce87116643', 144, 2, NULL, '[]', 0, '2018-09-12 05:44:11', '2018-09-12 05:44:11', '2018-09-26 22:44:10'),
('f15bf7f830a1d114c24b6928691e1d9c5f211b57283241a6a0013f3a3b69b3536f0db97eb432d6eb', 156, 2, NULL, '[]', 1, '2018-09-13 17:32:37', '2018-09-13 17:32:37', '2018-09-28 10:32:37'),
('f16df5dcb8fc9ff1ff16f48c2fb5696b054276ff600a7d09036e924527e5b434972ee3c98c3d221f', 120, 2, NULL, '[]', 0, '2018-09-12 23:45:54', '2018-09-12 23:45:54', '2018-09-27 16:45:54'),
('f18d55a72f04f74a87c4cfbc8751fbf36c2de3aa8c68ddff6e794c023487a2e1704142fff164f2bc', 58, 2, NULL, '[]', 0, '2019-01-04 13:02:16', '2019-01-04 13:02:16', '2019-01-19 13:02:16'),
('f1fa47ca6bb83d1c880a9c617a81247abafc1f74e262c05839c023d1fe6d3de8d9b111d324a58174', 1, 2, NULL, '[]', 0, '2018-09-15 18:34:57', '2018-09-15 18:34:57', '2018-09-30 11:34:57'),
('f250e2b64eb00431b4290473d4e32c11540bd2412d3828f55434eb100db02d47fe974aca9250f2c2', 156, 2, NULL, '[]', 1, '2018-09-15 17:57:27', '2018-09-15 17:57:27', '2018-09-30 10:57:27'),
('f2847c1597b94cdc291deb5ebde4c08831114e919f6ecce503319600ceb370a834387e063e237cc9', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:03', '2018-09-15 17:46:03', '2018-09-30 10:46:02'),
('f2aae4894a41cc2dc2bb6ef32d03104c3b6ccb15af865030055e5d8e8e858d83d8d246c7abde3001', 14, 2, NULL, '[]', 0, '2018-11-27 17:47:44', '2018-11-27 17:47:44', '2018-12-12 17:47:44'),
('f2d60e0b99dde47874dd31ae7b1a6e99c7d7f08ad631ed15d7d45d590bb77c3e05a702dd8afe0004', 5, 2, NULL, '[]', 0, '2018-10-09 23:10:54', '2018-10-09 23:10:54', '2018-10-24 16:10:54'),
('f2e54bd5504e1331962522446a5f438472cec923c804847c3a011f64132ccfdbb9e2900277c8bf12', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:20', '2018-09-15 17:45:20', '2018-09-30 10:45:20'),
('f3055cd1bf6af38a7d20d2eb1c4e2f9ee8de76991d168480210d76ca364550bcbeeb60c1b793510e', 1, 2, NULL, '[]', 0, '2018-09-18 17:07:11', '2018-09-18 17:07:11', '2018-10-03 10:07:10'),
('f31e0af8099a0460f4f4c6ffdfb8a359feda04b57c508522fc3744b4de578a1fd93ae6e7d47a53a5', 5, 1, 'Personal Access Token', '[]', 0, '2019-07-08 23:44:16', '2019-07-08 23:44:16', '2029-07-08 16:44:16'),
('f333670155cac13a188303951cc633a6b52e87a3b641dc1a5cf3bfc2d517e174bb6cf24d9a3bbb3f', 149, 2, NULL, '[]', 0, '2018-08-10 22:46:45', '2018-08-10 22:46:45', '2018-08-25 15:46:45'),
('f333bf4a2d4ad63c41513016e577d9fa76027e272b1c0c7e9822984f13b0cc2829213a4f3abfb792', 4, 1, 'Personal Access Token', '[]', 0, '2019-06-17 23:57:34', '2019-06-17 23:57:34', '2029-06-17 16:57:34'),
('f33d9337aa204c0dc46930df8990b1c59e898b160ccf65e9154ff29d917e8d3495965df1851d1d04', 1, 2, NULL, '[]', 0, '2018-09-18 22:06:11', '2018-09-18 22:06:11', '2018-10-03 15:06:11'),
('f3a95164ede88635f6bc6c8d4bc08e520dea29fd631143307c3f22a6ee88e7bb4e43550983ed9685', 156, 2, NULL, '[]', 1, '2018-09-15 17:55:02', '2018-09-15 17:55:02', '2018-09-30 10:55:02'),
('f3bda17fb4bfa8c40f046ea7f5168944e13b768c2fe2451c6594691f0c68bc95b3d76a4b64f72407', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:38', '2018-09-15 17:56:38', '2018-09-30 10:56:38'),
('f3caf35f07e29d2290d204b0bfd937cf055f0dfa2c43833c34af47b9e8af0281711003278f6d767f', 5, 2, NULL, '[]', 0, '2018-10-09 02:08:58', '2018-10-09 02:08:58', '2018-10-23 19:08:58'),
('f465629bb6e3076cc21e94626101b67bf4c22011d5f599b5b7c06625a6a07261a9577b3b5adf921e', 131, 2, NULL, '[]', 0, '2018-05-25 05:48:59', '2018-05-25 05:48:59', '2018-06-08 22:48:59'),
('f47042030f04068c175970400f6762b62bf5805fd79d8bd980fd6d3c4d1e08c03ed19d0b89ea8d0e', 146, 2, NULL, '[]', 0, '2018-08-04 21:28:55', '2018-08-04 21:28:55', '2018-08-19 14:28:55'),
('f501c012d873608335da7115dbed59126399850d978fb10456105a06ca80b06c264f2881b46be257', 3, 1, 'socialLogin', '[]', 0, '2018-10-17 11:21:24', '2018-10-17 11:21:24', '2028-10-17 11:21:24'),
('f52c0ef742229a7a39a48e87a21d19baf7c7836d3421b22785b7b48ee3c60d542715c0c9297dbfbd', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:12', '2018-09-15 17:52:12', '2018-09-30 10:52:12'),
('f55dd0b1c7147f5d4e841044da2d2b917da049bab0a7623b5be3854945a47c56f532bdfa6ee6da9a', 17, 2, NULL, '[]', 0, '2018-09-19 23:55:19', '2018-09-19 23:55:19', '2018-10-04 16:55:19'),
('f58cc12690a4f2248f7ded74d1de735651b4748f0bf02c834ac404774e58facad0e0a13769075548', 156, 2, NULL, '[]', 1, '2018-09-15 17:48:17', '2018-09-15 17:48:17', '2018-09-30 10:48:17'),
('f5ae19299f48ae307d861e2aa17e3976460ab7820eee82729a2b8fb950204581b8716e1d03532f8b', 1, 2, NULL, '[]', 0, '2018-09-18 19:34:56', '2018-09-18 19:34:56', '2018-10-03 12:34:55'),
('f5b62a7cf08920f2b2776d426acb56fdb9878ba885d747a5348dffdfd98aa23676d4536a0c28627a', 51, 2, NULL, '[]', 0, '2018-12-26 20:41:13', '2018-12-26 20:41:13', '2019-01-10 20:41:13'),
('f5c6ff21106d7ecf09e2ff379cd11cd886e017af0a358cdeb2a8726499e3ac2eed128a4d1c4a38b5', 62, 2, NULL, '[]', 0, '2019-01-21 22:03:22', '2019-01-21 22:03:22', '2019-02-05 15:03:22'),
('f5f5cdf5cbdcd77b06b5a034e0bffe66955e28a84ae4b48a8605ce255416c4ab392ffbfacd9403e9', 21, 2, NULL, '[]', 0, '2018-09-20 23:21:50', '2018-09-20 23:21:50', '2018-10-05 16:21:50'),
('f648122904ca181132dedd15f0a1f2a6a44d5a9d6fb21ab451b3b69de598108283fb9c7f3d32b554', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:02', '2018-09-15 17:58:02', '2018-09-30 10:58:02'),
('f6bf86d98bcadfe98d6ed7c2e2fd89d392d184071015b8487b6e7577f8e6220a56a5867e266556e9', 113, 2, NULL, '[]', 0, '2018-02-13 12:32:28', '2018-02-13 12:32:28', '2018-02-28 05:32:28'),
('f781b7c6b72bfa97878a3efa7e5718f413cd54f6fe6fa3360a3b20aeabf8c9cbf9460998591cc24d', 4, 2, NULL, '[]', 1, '2018-09-16 06:30:54', '2018-09-16 06:30:54', '2018-09-30 23:30:54'),
('f78224ad817e1f96ef77445c1aaab014c429a6c91d1103f41ca308355ab869b15b760f62f12e44f6', 7, 2, NULL, '[]', 0, '2018-10-08 01:18:36', '2018-10-08 01:18:36', '2018-10-22 18:18:36'),
('f7b8bacd9532c780bf69d3cbbb499772f25a6eaf0806ea398855fe332d26f2936546f4a85759a788', 156, 2, NULL, '[]', 1, '2018-09-15 17:56:22', '2018-09-15 17:56:22', '2018-09-30 10:56:22'),
('f8772fdeaf77df9403d5f2883feb59f305992ae368336753a387bd349ac7837dcd01ae82fb25a0a6', 1, 2, NULL, '[]', 1, '2018-09-15 22:49:32', '2018-09-15 22:49:32', '2018-09-30 15:49:32'),
('f94bab837b11d935f223c44e2096f5f135ba18aeb98d56ee688ca80221cc8c2aee56aa57550938ca', 51, 2, NULL, '[]', 0, '2018-12-26 20:21:40', '2018-12-26 20:21:40', '2019-01-10 20:21:40'),
('f997c0548fb5a3c7ebc286cb38b471c897029e3968429a33f1cbc0b37c5af1eb0bf1f00ef00e9a53', 149, 2, NULL, '[]', 0, '2018-08-10 22:59:03', '2018-08-10 22:59:03', '2018-08-25 15:59:03'),
('f9a59f62e018ec51e43938b83aca29b1c056c8832aea861a9d63c00a32fe0cfdcd34dc5e21685993', 73, 2, NULL, '[]', 0, '2019-02-06 21:36:19', '2019-02-06 21:36:19', '2019-02-21 14:36:19'),
('fa26aecb3b08e260fdc5b629bbd4dd460411dedd6d2093fbd48b04706228fda13e6505b8ab4c5089', 45, 2, NULL, '[]', 0, '2018-11-26 16:44:16', '2018-11-26 16:44:16', '2018-12-11 16:44:16'),
('fa2e684e71b00ba317912306e4829e3257ac4d43a6d304855a65b7103ea55145563670e9eaf9bb12', 14, 2, NULL, '[]', 0, '2018-10-30 10:49:43', '2018-10-30 10:49:43', '2018-11-14 10:49:43'),
('fa3c97927b669cf71d8138bdd0cca100acceff423f025ae57d86c72a7d78f4fa12b455157b065a56', 1, 2, NULL, '[]', 0, '2018-09-18 21:14:24', '2018-09-18 21:14:24', '2018-10-03 14:14:23'),
('fa761f16994ea71be36460b1301ec9a79cb7d5d3cde1cb103001003e5e35439f8a0f8875e82bb04e', 4, 2, NULL, '[]', 0, '2018-11-26 22:20:10', '2018-11-26 22:20:10', '2018-12-11 22:20:10'),
('fa81fd2eba085a7ab1b48b202e5a405703e0dcfe3484a88d8572ddbcb3ede2fa5dfe24bc5dee5ab2', 1, 2, NULL, '[]', 0, '2018-09-19 07:21:46', '2018-09-19 07:21:46', '2018-10-04 00:21:46'),
('fa8f8692bd2d19476dedb99539f8b145e0b3df394e2b10c23ac689f6826322fade6c44242cf8cfac', 156, 2, NULL, '[]', 1, '2018-09-15 17:52:08', '2018-09-15 17:52:08', '2018-09-30 10:52:07'),
('fa93b9b1380c84b6d386f349ddbca27b3cd233a9601803a61abc49f64a421ed95643fa11e2db04d4', 49, 2, NULL, '[]', 0, '2018-12-20 13:10:28', '2018-12-20 13:10:28', '2019-01-04 13:10:28'),
('fa99f0ff54861ee16b82debc31fffb8a9105a556662b1c34d01af98b6914483bd4dda57ac11b6afe', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:48', '2018-08-10 23:12:48', '2018-08-25 16:12:48'),
('fb3590c12352fb448e513062d70d7a1b77884f90175c57e087eaa4c2ab58c21ce3902dc7bad05a87', 156, 2, NULL, '[]', 1, '2018-09-15 17:59:42', '2018-09-15 17:59:42', '2018-09-30 10:59:42'),
('fb5fc6fd369123d3bf559c49ddf9ef74bc94168ac079dff510efe28a8c90361ecd0f0dec61446721', 12, 2, NULL, '[]', 0, '2018-10-10 23:39:42', '2018-10-10 23:39:42', '2018-10-25 23:39:42'),
('fb7de539d0859c15514a7838bdaba8ea985617401a4fee55243c74a04a9b569f297ea7bc74ec5f4c', 156, 2, NULL, '[]', 1, '2018-09-15 17:58:52', '2018-09-15 17:58:52', '2018-09-30 10:58:52'),
('fb8ca52a3de053b7c0b0f7cc728e4de3d829c50620bd23ce589f255de7b5aa60012d05b38b4b9478', 120, 2, NULL, '[]', 0, '2018-08-12 00:16:38', '2018-08-12 00:16:38', '2018-08-26 17:16:38'),
('fbdca35537d5158b44e7e7287db918be5d7837ce145cd32e6b08c8365c576c97a596f8f750df7658', 5, 2, NULL, '[]', 0, '2018-10-09 21:26:52', '2018-10-09 21:26:52', '2018-10-24 14:26:52'),
('fc1b21358575dc863483d317b49fd1eff818740a99c73be1307767d84ca923cbf0990bee6dd4ca73', 122, 2, NULL, '[]', 0, '2018-05-20 23:53:33', '2018-05-20 23:53:33', '2018-06-04 16:53:33'),
('fc7f63e3776b6104ce9a21b3a96e598deaa81cb7715984e750fa46392fe16bd8a0494e4332ad2bc7', 156, 2, NULL, '[]', 1, '2018-09-15 17:54:17', '2018-09-15 17:54:17', '2018-09-30 10:54:17'),
('fca3ea216eb900cf5074ccfdc602127e31e3a6e84c505762b2a6f6c57b0590439a23c653c162e1ed', 85, 2, NULL, '[]', 0, '2019-04-16 06:33:56', '2019-04-16 06:33:56', '2019-04-30 23:33:56'),
('fcd935e07b79acbff1db34ab216b4eb66ba7edc17e8b6e7514758c6ed94d1269589043228f71c031', 108, 2, NULL, '[]', 0, '2019-07-09 00:14:26', '2019-07-09 00:14:26', '2019-07-23 17:14:26'),
('fcf70d7057a112e0f8840d15425860fa3396fa6374ffa1df252229901174f13fbcaf5f2e8afc0b5f', 156, 2, NULL, '[]', 1, '2018-09-15 17:47:22', '2018-09-15 17:47:22', '2018-09-30 10:47:22'),
('fd146110f4bfd393e445b2ec698693cfd27fc0c3764657957ff32e5c37902e4d637019ed9a082641', 5, 2, NULL, '[]', 0, '2018-10-08 17:25:54', '2018-10-08 17:25:54', '2018-10-23 10:25:54'),
('fd2fc3e84d4a4f619ff6db9db8405c83d8ee1d5c12591463d06d26f65a8bdf66c40021c9c016640e', 1, 2, NULL, '[]', 0, '2018-09-16 02:12:31', '2018-09-16 02:12:31', '2018-09-30 19:12:31'),
('fd8c9e8e9ff180359eccae94b914cdd955fed9d64fa8980927ef411a7cf82b26e836b8922bbc4971', 156, 2, NULL, '[]', 1, '2018-09-15 17:45:06', '2018-09-15 17:45:06', '2018-09-30 10:45:06'),
('fdbff26a63db7b4b368866c9ef4656b421c05b7594940bfec95258cf0da9ab7d28556c776dcfc016', 60, 2, NULL, '[]', 0, '2019-01-04 23:28:44', '2019-01-04 23:28:44', '2019-01-19 23:28:44'),
('fe03f476f63cf8e21f87109b808ff87e2a24e1dae801c9c20f4527bab9d20f66e869a105641bc9af', 156, 2, NULL, '[]', 1, '2018-09-15 17:50:07', '2018-09-15 17:50:07', '2018-09-30 10:50:07'),
('fe17bc78b0680e09683be26164083bf30ca6d5f1e66783e2371a57037692c76fa8c88dbd30466e23', 149, 2, NULL, '[]', 1, '2018-08-10 23:12:39', '2018-08-10 23:12:39', '2018-08-25 16:12:39'),
('fe39bdff582a4f2885d10e32decbe5dbe1d08e973031d18b2a741f59dbbb3e9d4f2b4687aafabc47', 5, 2, NULL, '[]', 0, '2018-10-07 01:51:22', '2018-10-07 01:51:22', '2018-10-21 18:51:21'),
('fec5cd3c672f3c73b48d6d8c6045e64c70f0d9969087f1f541ac477a78fbf7b4112c1f89583710bd', 156, 2, NULL, '[]', 1, '2018-09-15 17:46:28', '2018-09-15 17:46:28', '2018-09-30 10:46:27'),
('fee4d86f2030dd58d399c8e852a4cb98e1613086d91a1777eeb3704360e794b74a525b669636f155', 21, 2, NULL, '[]', 0, '2018-09-21 19:40:46', '2018-09-21 19:40:46', '2018-10-06 12:40:45'),
('ff195ca96666d1592d0180d29e9b770585e24e3f79df94f41861804a2eb57d950e7f17b2aedcb194', 1, 2, NULL, '[]', 0, '2018-09-18 21:14:19', '2018-09-18 21:14:19', '2018-10-03 14:14:19'),
('ff545007008080272cedcd28e4a27c5dc5cec37933aa9a6d110587fada7c5978b931c46f652e0137', 156, 2, NULL, '[]', 1, '2018-09-15 18:00:22', '2018-09-15 18:00:22', '2018-09-30 11:00:22'),
('ffcaee727926262a41c56a37682ea6e03a704fef7682ecf9320003899d16b1fbad02c81916e614b1', 17, 1, 'Personal Access Token', '[]', 0, '2019-04-02 19:17:55', '2019-04-02 19:17:55', '2029-04-02 12:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'RideShare Personal Access Client', 'NvTN1CeLtNygzZFNPixRuUkDAo4knyz8RBqaNisS', 'http://localhost', 1, 0, 0, '2017-12-08 20:52:36', '2017-12-08 20:52:36'),
(2, NULL, 'RideShare Password Grant Client', 'WifS1rMi3LvuorP1G2UdtKZairUNSH2iMqrKivPf', 'http://localhost', 0, 1, 0, '2017-12-08 20:52:36', '2017-12-08 20:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-12-08 20:52:36', '2017-12-08 20:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0011bacc34e11017579d8b6f247b80cfb3d284bdcb65f6a34ef685258a10c5dc907fdb1732b6264b', '2bf147673f4db2917f7df9f21ff2497b2ef74f2360f8a82644c868e3eae14202d8d1996d86e1d54e', 0, '2018-12-18 16:17:47'),
('003637e604651f7814cf78e26683e82bb4062784d50875bf642855ab7a142f5f9c4026e55943a336', 'be2a542c7f8ae6327d3785a5813a6d2d3758d2a92a5358f8532bfe423a3f2d5793d4021bcb0c2b45', 0, '2019-01-06 15:26:30'),
('0066c83402a24e7e3fa38f87251b818918d7e0733be941fe3df7cdd935dae0a20130b20b54cffe3d', 'cd234fc816fd8be16c89042681c834dd391fae1c5df9551446fd1267c4d42ad18af3883b5ae6ee71', 0, '2019-02-18 16:22:16'),
('0085554f6d73e7085194d533a80af65bda6207f6d0e2ad70f04eeec4978e703a87423d2db26ea0e1', '84ff34ff15c0b850b0c090040c574f803b886e5609c8386e870ed6f68c32f981287bc0525622cda9', 1, '2018-12-14 11:00:12'),
('00d85eea6d4513fd02eb884f19283a65ea709b71f38340d3f85600ee3b43923b26302e6f81a47517', 'c7fc656b85e99506664fd926b17e167ff55d0f597c02aaa831e0329a88a449c8a0ea2978d53e7988', 0, '2019-06-25 13:05:36'),
('00e78d04cc2f8bc5e8a57cef9d75d464c016082fdac14c3383801ca1179ca3816b1707efe1cf9aba', '91f42f2df488ebafd8e4027f84b915cd9480e7361bf8493d1ad1d98ff48ab0bc3d94887da2d82b8a', 1, '2018-12-14 11:08:32'),
('0127c8d795a820f243a1d16ba180da7ae611d6c3a145d621162e919c421987c3b87ecac35e3c4139', '2e51eca2380488cdb617d2186adb738266b935510d42398d9a647fb37518f24f1e5b2b45ad7eca7b', 0, '2018-12-15 03:23:11'),
('01404ea0bccd2823320b4347bf74a098eb01263596c317bca7a70e8e42b907a5ec885166a73465b0', '923370418be78ad7ce833bdacc30aa346bed6c65326d76aea2eb4fd8e5b87922b3c3f802647ce087', 1, '2018-12-14 11:02:27'),
('019c3889a8b355df5216287e0844d293c81f5a5b0734dacafa9ae97255a642fda1c42a7ff7959696', '707c1742b2cadbe0a2eaeebac9f7daa401d493fbb551796b96d027b660c9ca960d2129c37be87b13', 1, '2018-12-14 10:45:02'),
('01b72566947351189a8b614b32be32496a7461f1138116133826373fc1243f62325015cf323cbc9c', '30de9ad43245cd69d50151aad8f3e673e7e58d75e54debafa7c98fb719fc5d3ab0f301a033e25d42', 0, '2018-12-05 16:34:57'),
('01c982ae93ed5c4145da0fdf1e6d032f1cee04b59febd8329f3ec5e2999b21d3eb55b54de35c5460', 'a6549f041a83997e2b8cd5e2ea29090c8172e65109a5793c14c8171dd4dc63360dc5cba0d0641957', 0, '2018-08-18 16:50:05'),
('0238fbcf0b3f7e22e94c18b685f26ffee0566c3fa648f0c110a614b7a3536f80f7607f351788f173', 'c10a656a61fd24a8afa17e98aed82cb3e528954fedf40d7c726cff591d75b243c6597ccfc9bda65c', 1, '2018-12-14 10:50:32'),
('02801577bc77a91377917e24a6b3703863ec3b0517f84dbd646198361a85042f39dfcf9a17f274af', 'e771d61dc9bb96cf1633f27617233525a99da86501aa77eef265ab79c6297f938e2bf8024d8496c9', 0, '2018-12-20 14:17:29'),
('02f39c1aa100b15aad7925014d149f981694528412f8b2b2b0639f5ef160c1afad278bac80137e7c', '4f6701683d3b9eb74de1ebf5ddcce91b5da5d7baec6795fc9f3d73813712c2f96328bd2b7f460b27', 1, '2018-12-13 12:33:35'),
('037c2c75e3afb8c851e33321cdab8604dfd93d2de7ecf1fd9e9ccb9785f12715cb9cbc15ee192452', '1a1a026467edeb80e66d51f92ed02195daffdb99d58d40b6673eefdb77fda1f81248be2e4d1d746a', 1, '2018-12-14 10:45:22'),
('0380417c13945b4ce87e6c3c1c47ce3e436ca8e7d15865d7b5447cbd6047efd4ac4bb7232cef69e4', 'bbfb4b7ee39ec8bbb3f088a2634ad3fa801c2cc88371b3c4cc9a97633e843f1ee75fd2062086c48c', 1, '2018-12-14 11:03:47'),
('039e5137df9e1946c0862e23d6179082c7f0ce0c4ca9c3c6e51183a7811e2bee3256a0eb5bd4b493', 'fe39bdff582a4f2885d10e32decbe5dbe1d08e973031d18b2a741f59dbbb3e9d4f2b4687aafabc47', 0, '2019-01-04 18:51:21'),
('0408ee887418684173ae29fb79bf593789d31b79f7f3bc58d93a5d50f6353e58ee4f449d4e9c56c3', '1d0caaf95110fe160b7e2f3d1b69dd14f76d2ee4648234b39cac44daf59cb19f6d6b7a1279942b89', 1, '2018-12-14 10:47:27'),
('04152a842b7629b60100cb183659ec7e885178dccfe5ab85d721445da00df2529b70406919f2c756', '412a02563bbfa291e1cd0e007d1d865502ab1a46501cacde2bd74e4980427b7f72572489d101eeb2', 1, '2018-12-14 10:52:43'),
('0440c44ba9b09a632c1009fc4f49103df93eed679e3ee898ad628cb1144e116d55dd543f20b1a5bd', '3cc03350481328446fe7df90249e14030c9521ce75595c71fdcdbe79d335463ccd202b60d7cdc1ba', 1, '2018-12-14 11:04:32'),
('045e8d0a025347b3e6a99ab072baeaa900d69144f51d8e12744d769be1244f9158a7ec5ea043dc81', '1e44e03d48b4b0034f7bc379720551e43173baa3dc00ad69746a0a8e250bee51c1b350f2a0a4527e', 0, '2018-11-28 18:26:08'),
('04ae350522d97bd207c504d581e3332669483be53eff00dcc16104cb005abcbc1aa7d9dc64d3a2a2', '9f3d99fe9d79f6d1f94f3e491b532e6fef61b92e5865c4a15a24a3aec190e2f6c399880669bcc513', 1, '2018-12-14 10:53:42'),
('04cd42a20ec62974f355d0190a95d86cca3d97d0ab4cfebda76eb3a1c348132c748d856e787e3d49', 'b55acacf7bfa2eaa672d6eb622475f752f923cbeb447825b380a2c4206acba8e1044d29c813b08b6', 1, '2018-12-14 10:57:23'),
('04d2ab4be05c44661e0c167705230169fdf93e8ffc9137451d10909d172684701b00b7faeff36535', '185d29313e781f1dfd577aff92419bc2aa3a656903ea488792ecb97115ef9ee1999403598fd50c94', 1, '2018-12-14 15:30:50'),
('04d47c436795b59f01023465c12996e7fc322c547f7477a80790dc08bab6988d961e90caf3eb6260', '90524bc4102f2f01be6fc295eb62803ddc43646a92a72f83ef66e6e26fdfea40df18d64dd0024eb0', 1, '2018-12-14 23:48:22'),
('0503a3ad255a99117a1247e6423cc3062d1389d911d238684fc0ac9b1897070a833a06b369b77f51', '5ff15980489acd0a32d69143a23d9a0a394d85cb3f8dee64d5872d36e613c220bb533d54f721784a', 1, '2018-12-14 10:55:47'),
('050bd52cf50a9dc99d08fc582101c77dec12ff53db74a1cdc8cb180a826ccdd1a7b8400daaafb224', 'de4e75047f35e596b76a1e177bdd257d64a9779a653016e1b3976f55561eedfe9914e4e039a89cfa', 1, '2018-12-14 17:19:25'),
('055a1fc4975c7b542ff5e1b98f39f8977881bae6fd21cf0faaf0801f71f8f0094023dabb32280efa', '57431a8f0b8bee817f7c5933cc3997ef032b0acd368ac2f6d45d2562352c5a3822fb7235860f72a3', 0, '2019-01-29 15:26:33'),
('055b9578c21b96917c779df01765f55c2cfbc21feb3ba5e89ff30e1f035604a3e1ac8aa39dcb587f', '9da60e417bccfc47be32db15bdc64a6919f680c90561c5e437b7f67841981d568e62a3cddce7a233', 0, '2018-10-29 17:42:20'),
('0563082d6330f1d1a6c0e25a4e24d895944d7ff35b6f694747602dffd0cabd31bafbc9e5556a9245', '104d49386e25110514df5416f6eb1a1eff648ceb52f547a70e92c61a03aeddb7b59df0be4e5e6eca', 1, '2018-12-14 10:51:22'),
('05a5140dc0c14c28b60e43c1bcbfecc3347ce2f653cf890884eb462666c404d9698acddd58b6c625', '9e8c20ad75df7085d93c131e45c5945b678c33a3bd8e0274f00fb55c9a38545ed01baf7166649978', 0, '2018-08-28 22:05:54'),
('05c255222b8b442682df1a5a6a24e029ee6c774962fbf7b6ea25f60108a645e2445aca9c357679be', 'bce890acfd5e875572f40fdc71993f9670dd25f20242f8340a6633dc5f0f3875ad7b67d0a6362583', 1, '2018-10-18 16:22:01'),
('05dc70c7bd5a23ea13412ce15ade23182b7371a917af7009fe58dde51682a62c8e91369b198ee526', 'ba8a83f77a8f1d31540b0fc5d0c491d9ecbf0752bc987d2866a7f3d3557892ec12739cc5cde62014', 0, '2018-12-21 17:25:33'),
('05f9363c3c6099153a9f2a3951c5b72233a0a38457e0c66eea6bf1ec29cc0365f5e6889a20e048d0', 'c3754a0a777386612c4cc7fbdabfe0ecdfdd2821161d3b30431feb20cf1428e567ce9e447a76a940', 1, '2018-12-14 11:05:32'),
('0640c13621cc1b5c6ae505549ea91303fab079daf6f466122f681a7defa32a9d4f9f1ce16e40f521', '4471b8408f0ea3839d908d60fd8b45675fe4e4bfcd1f698cc7a07a80ac60b5122da503e46b61872e', 0, '2018-12-07 10:28:51'),
('06507d6eb213552a2e89eede7e673f57cf80842af2b73349f8ee21f2447c419e234b08021f2548e3', '35f1d5cc69a754caabeda540f171553e46586afd005658089f014a3b54ee393db5c9ba02578ab7d1', 0, '2018-11-04 11:43:12'),
('066bc0b7a1a45dfdeafaba5d4ec262a753ace0f54407dc40433e8b3cf1eca3aabb1028b3a46705b9', '426852b88596ebec41c86babfdb274f3b18050903e6005683a9e22a293a421c9a21019c19fe73cda', 1, '2018-12-14 11:01:42'),
('06d05b319cc51e955c18e0415469ebb6d3389e607de2646ec7cd87e7443456737606558e97fbf278', 'cdbc64c2cf81a0695539adf671e3e9cb0ff7755432b3633b2fae33fa7fda16bf3fd2c8711992bf5c', 0, '2018-12-13 10:21:52'),
('06e55592435dd0fd544d79428b3a9fd1c1527bde5ee8abbbab1c9f7772ef8b3a4570f3adbcf8483c', 'ce9ce9ebf9288c473dae787450ac7df24e6c935041799bde47b603ee9925407a427d1906612fc935', 1, '2018-12-14 10:46:19'),
('06f2a7f73b8a8a7c49a926e7e38eaeb0b11157f8ba76864ed96c71fe46661c55235be1cf318eb1d0', '2191884c969c3e7f8c4d315091dd4bb8287aa905b189a5e1d71da13c05a3fb1dd4111341598fc6e2', 1, '2018-12-14 10:44:12'),
('0737bce5890f59d55811f8959d5150f228774ea3f7767147a81b2708815905b38847646f260e95bb', 'cf536988417b8f18c1edc90ba658edf12b5608494c221e6a1c6950fa5fc9c0d3e4f5803ad329c46c', 0, '2019-01-07 16:07:33'),
('077a0aec827a2fce5bfdfc095f5e2cba4ddd09a59bd32fd1197e98b1d742c2e45e411dda28198fc3', '95fdc489ab4b55d600a230f3b294f3b7aed1cfce13382a90fce956deff0e849684d080e17496f311', 0, '2019-01-07 15:22:30'),
('07a627422dab75a87ed2f324394ca982525f168e4c1e920e9d0ac677d5b7cf48c3f8b80b615e462a', '9801bc8165fc051ebc116b48aec3e170b1e264a1384742ea29190d6f0342c82a8e91028bdfd20eec', 0, '2018-12-19 12:22:58'),
('07cb55d51183398ca669085c161a60914326bf2c0aa4430cf347a87e07e978cb75caed8e7715f898', '135e2e10a7bc25a49d2bcc27cc9ca539f355c343a5315b5532ed812a91a989a922d9059d25b44780', 0, '2019-01-04 17:48:16'),
('07e8e365f626d509235a7e813e0a8208a32b89efbf65c5250b08dc78a566b8435ef8a06788e2721e', '6629a9db4530fd18f24e00406144bd8e0e3265467149e7fe4b76429e6603b6c96ff7ee8c3293059e', 0, '2019-01-03 19:19:54'),
('0807257eabd64b10f0a0d2b99704ee8b915324ecbda7ff1ce4a5b0c58f2540769c2c1bb7a1105dc8', '2c0e24a58bc2a40519d720c305a8b0d72697563f999d634be403953bcd4caf1a41736cbf7727238d', 0, '2019-02-20 16:54:54'),
('0811345f79089eed5645738de08f5b0fbbf3d6f53c013f7c27d7a7a248a9af2724cbed61f7954502', 'a300fdfbdc7d70ca258de80d9df07563e42a450edc8b3deb5f799f5d6bab4cb3508f9ba34f4b31ed', 0, '2018-12-17 10:12:22'),
('08193931ba8c476ed851632fc959fa7a5b2ced320877593240ffb85fcbb8c83b16b17f487a59fbc1', '66a1fd5f69fdb45bd1232f0a888694479f96e0ec1ed8617530a7326889a175ef945972678a580759', 1, '2018-12-12 23:11:37'),
('081999242e2018cdd283b2545b9883c078b1ca7de7f0d3ae25502e2d7623442c711057fb8b462605', 'fa26aecb3b08e260fdc5b629bbd4dd460411dedd6d2093fbd48b04706228fda13e6505b8ab4c5089', 0, '2019-02-24 16:44:16'),
('082301bdb9bf576eb80d82fff9b49bc0be090701a7d9eae88586338de2e05b6fa45e5e37abce56f0', '34ca8bc924bb02b4560cfffb58ce078c5f90bb17cf5df825ce73f45bdaebf3eae42af707a6b86bcc', 1, '2018-12-14 23:43:05'),
('085d1c56130b5b7900db33f9f9ffbb9606fd79e377a01c28bb69a74ced9a6f84d040694510b3b1d0', '3ae315c70d3865877c0a6ffa72ecc9335710309f0c7c98d484bc5d0595c384814729191edddba4ed', 0, '2019-01-20 10:39:03'),
('085d5f55a92ac07b2dd874749140c38fbf16c1f42390e682579da8af560204e87d64829b38fedbd5', '069a1667435d2b24c181bec35b8512f8f7ca2356a60617053c787ae73ab12d65d5b5fdb2452716b3', 0, '2019-08-07 23:03:58'),
('086750ff9bce116f370a2d3668a6737bfeae8a478f0708b29a0a5bf0b928b98bf60185ccff23adcd', '55942106300e68e3a4517345b4a783a7951150dcd36901831ffc4a0d8c98c9105909fe7f42d28cc1', 1, '2018-12-14 11:06:28'),
('088b3508d627982f09ae72fceaf7fb284af85fe51b8ef6a2216349e94300057211aca8b52ff844d4', '5653bb00058b7e489f9da54faf5d0bcf49b42693901db9292c06a34b89210211e690121db387e215', 0, '2019-01-02 11:55:38'),
('08b44a64e3d3fa4860c8a179864bd022b51a81bfe1c040667df436dd4e69f4bfac8f1f91dbdd7c70', '1f269deff4515bb3ba19dca69657c68010060f32a44d91396f1af3cbfcbe987cc3fe757d04b03dba', 0, '2019-01-01 21:28:36'),
('093fa814c9760e42b4f1e8e77464391d80bdaaa560a847bbe662664dbd4139899812e230448cfc27', '6d8b25b3a20d68ea68c1d98c852003bc7433092098c0fbf6f071799ea094deae6e102cdf1f7efdc2', 1, '2018-12-14 10:56:12'),
('0950df6ff5ec2291d7477300ef01d5a7a9ac1b1f51e150d995e3d6a1bab80c8b27895086c3e12029', '8acd5c6807081317d6e7028f590daa11b15331c55c747edb85ea9a95ed239d1db4549e4961d02f7b', 0, '2019-02-20 17:28:08'),
('09923063e8451f53cae2ea34eade7ed82d3fac89cc011ff0e56ae5279f372d99fdf2b74d11fe79c0', 'c057082ac1de81848cf29d57616b73825a5e30ee6712805f04f2fe538c2e35255d79911c1288d74e', 0, '2019-01-02 13:14:04'),
('0999d8c4dedff322f178b43ab9428c043f4e1c986d3932608e68bff8fa8dc16029ae4b69f719a9a9', '5711c11358f34adeb4997aa771e98d9f4fdda0166fe1ada67115989035a33039f3e69a4e229a73de', 0, '2019-02-24 12:07:32'),
('0a4c349d875290c471001cee24498f866400dcaa083942ed3c126e9865e053f1ca5710361c29fe68', '871442372f10892e0d6a82097e692b6ef5860f94ca0e66ff4354b0dd0f8f57213ca602181535dc82', 1, '2018-12-14 10:51:52'),
('0a8193899bd65028d23a4ad39399e199c3e22d5592925feb7e57bb0cfb6ae4109f6ee4cb11ed0d56', 'b0fa2599b4b7e83b8402b8beb5ee9cd67b71f4ad78c5eed19ad17f33132512319e68e2c48d45b867', 0, '2019-02-17 16:11:55'),
('0aa00df36eed90060e2a1ca007bddfd7e7beaaf356cbd709208d51845ace0e2e895d9c4157286284', 'ab28641e0ddfa9338b3aacc581e63ebbfbd590ebc97dc711e297510775810cd0a1c15cfcddd40d5d', 1, '2018-12-14 10:49:47'),
('0ae36da0ed38f76043865c9b2f4ec96f992e030d722e01a1e1baa8d50a90e51f3abe86d6361aec2e', '29c56eac40da7f60e77b7a59ccfc389fc0b51e13feb372976c6a2e9c23369cc1cfc789a0886e6ec7', 0, '2019-01-30 11:21:43'),
('0ae4e3f7145e0d2197785ae978ec8865f4a9ab17ada7b2ca9ee037548271d0950a691ec050ce6bc3', 'a85cc33c1505caba450b2824c25ec96b26e6d0c2c98128b3ae7e11edeafcc72c9f54421dec0936ee', 0, '2018-12-17 18:12:44'),
('0b01f6b43987a4c341f22a8ec1cac0bf2df1002469483b9236a22375ad88507893c0f4d2a4e7c13a', 'e232df07df065e886a0217ca4dfa0da14384d8685eac85327f81b59d8c4dd30c473370add1329350', 0, '2019-10-01 15:33:47'),
('0b0daf36d39431c51491f5b96a5525389f788fe5c0c3bfb9e5b2d0318c08fccbce2005a248ee9b7e', '433c3a9008bd334260df1169a2506bd2f7e409eb392ddc88d958ff0e2be752324f3fa89e6ee68bee', 0, '2019-01-12 19:17:09'),
('0b2e93ab58ee2dd5f19088930402f910c9698a5342a6833da93b98692194d5d48475388b6cceebe7', 'ab41419cd27c6c512450923c3186a910600d79a5822a6008512a4b394f0d5187a03d9039c7307472', 0, '2019-03-28 21:21:30'),
('0b5e36fb5c4d4b7afcfacbfb765c652b013b397f0a548f7ebb43deb21043a83b61e58bca5fbd3b8e', '2ab5061576cfefcf37b6bd1743dff983b79014e9f8ff55f2c924028caa468032ed5116e20faf88f0', 0, '2019-02-17 17:37:18'),
('0b72e9428604c46d0a67be929b4987cd6737bbc1aedfe94143ba0c9faf938c5d682f0aab7fe5ed67', 'bd0fd1d1c3c97bf58385009ef00669d41e0e048dd7fad6d7dbf19c12b9922dae73b6c13770a577bd', 0, '2019-01-02 18:39:11'),
('0bb7af0a690af7aaf5ec70c09685559930977548bef1eb51e2c9c0c5fc9a47170336d4d56276f231', '43903e403d7fef50cea9c76ac97d34694dd560acb801f34026551d9ee7464c88a8f1beba1ac8aa18', 0, '2019-08-11 15:30:39'),
('0bf7def8b0e7d7accff2e667a6646fc4fdd4e9c20cdac3f9584f285eef8bf610726d99dcdde3bb29', 'c5bf2137e2ba514fc6ef3a99e93a9bdfe7e48629ff6032922415cbe588d2f381fbf309b4ff4f12fd', 0, '2018-11-30 16:13:12'),
('0c0d281c8d50e76f9572f8a1cc8c3dd6c5b943633c353dd298340873bac9a864199d7364f653a05b', '768cdca65781998f3fdb1a6bcdef1dc406bc6118e55c3a74d82dcb6109c144e22f95f92bd0616ad6', 0, '2019-01-08 13:35:31'),
('0c1d6e8a28fde6af06a7231089586fd6018151e69c6605d59b6688c7c24f92270f5c1f75ac95fc3e', 'fe03f476f63cf8e21f87109b808ff87e2a24e1dae801c9c20f4527bab9d20f66e869a105641bc9af', 1, '2018-12-14 10:50:07'),
('0c986cf72951cf3818d87b9ff104a4c04f22082d9ab7b4eb3db93abe477a3fbc00460be4e744d2ea', '51a7868737d117bc97c6db116b35923865d8cb8622220deb06da3b892911ada901b772018310aacd', 1, '2018-12-14 10:46:12'),
('0cc13eab3f21cbe583c98d0e5a70cf3b77e9120f31cb4e58482e74dd72c40bd6c1302796259bbe55', '71da9e8eebc88cbdf522bdd46b52524d837e1c1ea3746f17cbfa0eadc4e738d87ef2870434cfb881', 0, '2019-08-12 21:49:43'),
('0cf8afe3870d990e62c8b40df312d9cefb888078fe1021dea1dc4db16b4043804efdde4f5d9e0066', '5e3b6ced3965ac8c789ebfc783366700376392e3336403b963a21aed62af4e084593844e2d2efe3c', 0, '2019-02-18 10:59:27'),
('0d4d7b7fed1d4b0e919fdefd10692cc3f2c696cc6a0f4cb656f2fb4091d2ca21785c36dd1d8fbbaa', 'f2e54bd5504e1331962522446a5f438472cec923c804847c3a011f64132ccfdbb9e2900277c8bf12', 1, '2018-12-14 10:45:20'),
('0dcee8f48eef85237abe2c443d4173623cbd38f4bb0e76c902d1b2b6285ebaa7d434408cf34fe464', '0c6a1dbc1cef7d1ef3d74a7e799885fa49037b72e588eabba57ba2797f71427673b7365e696f8faf', 0, '2018-11-29 13:51:32'),
('0dffb257a6ca252d327893d24d18474c3e8111c8909b22793289538c8b13607e12167c4bf569cc42', '3195c6953299f5dded0c8e9e3e545c6e88e20cb195d557c70178db3a80b784b398d618f0ae2d9cd4', 0, '2019-01-03 15:29:27'),
('0e1239682a7657bfa01ed8a744402b33b0f9b4543e3bcad3e2af4a18dbee4ae092752390f504d5e1', 'af620d426d8d3a2bc7431a8acc9bd3bcf3e7fb6fd0a0213dc8623f87f8dbafc9bdb2cabebace7e1f', 0, '2018-10-30 12:18:17'),
('0e33b69ff3387933b460a611591f718e5448bb08e9a1e2b93164c5be96a3d1ea0054c8f8131846b4', 'dfdfad4d04576e721941c082b837375b3e2261af57e467182b280a05e7f1a5ddfb202bea193120bb', 1, '2018-12-14 11:06:17'),
('0e4e45196d3d7c064995ed998f95757404a2c7ea7c23d7cce29026c6965a6ce80ceaf8dab16ddc8f', '369b41858b7ef2568ef2fdee38ca98805f70de1635d0d0c2b31885c72a7865a8c5f6e9cf9da72e13', 0, '2019-01-02 18:52:19'),
('0e5211b5ecfedbce7c9726e7ff24869c6d4c55a190b322c06844dcf674c1903a2ee2983d1354789d', '3a7db092a9e8fd05ff1c1021b318d9a0935899e726bd8a7b32f22b951824a59706a243eda6b76c36', 1, '2018-12-14 23:48:25'),
('0e92ca9e0eedcd018c4d1fd2829b066d97d82e03c6e22ea135d67ec98e31677870d820bd740d40fd', '32c4e3e060ac502a32262291728045eb2db01487afba4a5c632e5a1283bba4cb12b852e263ed4af1', 0, '2018-04-27 03:07:25'),
('0ea16f33d2787c4bb1fbcec132b79414aab2ee09ecd5738fc64898374486749036d6d65a02ad5e17', '765c8aca1ffb805252595040ba539e43a6b30d539ea07b96238d4b52d3ee38a11e8b7102f7ab3289', 0, '2019-03-26 19:37:49'),
('0f105a5666b165b7bc59e1bed33f93e2267c34524f6aac838d588eb171b76ca5348830bbccdc0553', '2427b7f3d0409ef36c35c7927bfef8c283bdfc136cc9a9653af1005505186a6b286c0fa944ff42ed', 0, '2019-03-14 21:17:50'),
('0f4c9d3ef339166319cfd160179a4a7b9d1e53c5a9e31e013b2194a572bda6e6955e72d9ab20c1be', '4615b47200d24d6df7710fb4cd70442ff60263f1d9539c9457f1de9de316395a47e71e541c9871fa', 0, '2018-12-18 00:19:02'),
('0f7dccb5108642a80d3f02a41cb14539b6a06a51c6c4af8b26190ca61e0b628db2bd061220cfa84e', 'eba10ee6839ad3f3c03407b8877518806534fef0102993d2aa4f2284bb759332f96bedce20b0b9bc', 0, '2018-11-28 18:15:35'),
('0f897f92622c7291f49ae60c2f1c1790ff6948b5efcfae908acfa6bf250c9ca8c4c3084009aa4bcb', '879981635b143530f6ecce89ecdd3a76b5bd67559986abb136b0bee8466df6798d5b784a979db6dd', 0, '2018-12-06 14:33:11'),
('0ff4ad1a9beb81f9edd86b62710a1dd358023fa7506d9a9beeec39de1fad75652c0873e480be8ef2', '5647f3cf556c4e250eb0616cd0227b04d2318a9f3d70d3540fd50c95d42621bf49ec0e3095457e0f', 0, '2018-12-05 17:23:11'),
('0ffb64e2a1c82075f68fe1380d1a49216b0af5a24b3fe3416be5766a339d577bf1670058b30ac5bb', 'c846d1125ec766af8ea63778c2e747eb0cc6717778f057290fc166b3630bbeb042e7ed7f95ab44ac', 1, '2018-12-14 10:49:32'),
('101ed5157ed26198fc07857ac8f760010c7a0cdca8ecd968da11dbc6dbb33165ea83f274ce91b365', '90884bdbaff4a69e8180efa8fc049a6d5fd328ab8b443ebaedc7ce742200e988cc0f2bac50f7f667', 0, '2018-12-18 12:19:59'),
('10acfb8adcffe6fb12af66c359297fb9d911d9bb076bc826c13b08c721b623675f5ceaf8a860b31f', 'f01951950729720725c8f77038d9f1712378e25a69256572b868ccbee36294aa1ed7397b76c25c71', 1, '2018-12-14 11:00:48'),
('10bad9de3b9c5345445471a4dbc11739ddd797482223ae8c6edb4e8ae27e94ec2c196361c4fca38f', '2fffd6c042448264eca3a0cd980620356aa640fe784272fddca5428cc3d8697d6e4a3964b102c69e', 0, '2018-11-28 12:58:59'),
('10f449449cad702832f8981a9e7977ceb51a5c55a38fc111e85fa8287b29eb8c89cabbdceea8ec2d', '5c60b245764305ce73ee95aa1368539ea3273a732cda6562a423605733c350ce516445cb3ac0187b', 0, '2019-10-24 13:43:38'),
('1193a407ca605ea6ce8ddb78e39922ee4d9a97924d09f9e9b53668789091c124fe9fb2d280ad10ba', 'e3ba2b90b9aad7479b5280a5d7281c6c80201cbf01b0328f6ae2c5e1150952a3b0b8d79c4d0e7b23', 1, '2018-10-18 16:22:17'),
('11ca07be9897c3d283c7d8ddbaa32db22191fe1e796a2bc6e674a66b0a9bb5078f0a8de442ab0383', 'dddd8af404d8cd4ebae47d4034757e2011704f91c2092d154bb2bdc0f410cdb44aba4c75042599a8', 1, '2018-12-14 10:53:12'),
('11db0c8d64fcf9b4cd8a2950f3f0c34ab9381abe3aaecd5a710ce13d9b0e80f206ebf5ec85d902f7', '1a1cf8f12f5c80c8b0d159289467632df0f378d3c91557cded5590bc51507461bc4a18e7ec45934d', 0, '2018-12-17 18:54:23'),
('11ec19f276089b4b2536691a4d76e1cba02023b15e77d8cb1995bb5cad19773115439cbf8cff5acd', 'd645b9bee8fd2cd7133a417e687e9c4eaed889c605aaa313d3126da17e24f5126b75e23af26831ef', 0, '2018-12-10 15:37:05'),
('11fac353ca9d5eb33f01dd65a472e2550997d0714c2df0d52eaebe63a92202ac52c08d6a6540e2d2', 'a0187c3b35c7b708ee27c31650399c864584862f79eff7591d12e45d6c382e3c4c522414f871334a', 0, '2019-01-07 15:04:49'),
('121369b7e224e0043c8bf83e82a49ba681b5b31e2b48662221a386f4fdda95812d450d9e81633617', 'e1855d21c653629bcd4b2836589f3a5a6e85ab40dbda2f8600cea818af12b6343a8fc6587eb76098', 1, '2018-12-14 11:09:52'),
('12a852305acddbfdd8a53506693a448df5b81d284e5caffec983f3ca0b0bcfc8d8e0862a131c234b', 'edb0df58b2275d23854e7d3b676c1db7007422c2e51a6362f01eb40cb9158784e01fdbbe7539d3a5', 0, '2019-06-06 14:37:29'),
('12ceedb2f2d2fe49857d44f548f7f850519a1d6d444c127438db3d746e25256aaf44a0ed63cdb710', '83cbf1635726440a98b2864adea1f62cc46145964a215a9652c2e3fffd81f722351d76a9500cec6b', 0, '2018-12-17 17:09:48'),
('12d01e6fa3b786a07bbe3f20073bb70f72a4f4d9a8b947f0baac6c4945d300dc642734544009d42b', '3f074cbb9b0471ef96b221f941a7ae4880150b60c94b1fa49c7ec787269fffb599978227c588ea79', 0, '2018-11-09 16:57:58'),
('12e2776e874055cfe88d778c26163fb3d5214ea4ba7a10800b6ba9d7f8edca60bbcb9a3aa3a0b459', 'cae3ac8db68cd0efc1ae279dfab2003c1fe6af70f1ac3794fd34d376608b095ee37de60d41c16466', 0, '2018-11-28 14:58:52'),
('13010c40f87b2bcdcccf96bcea9a7ae46daf83d89d99b5ebfe44d93b773e870bd461b1cba75258fc', '61f0833bf0a5098e9b5b8ec4482029d621eb182c7ab27d8baf0dac6dc2d57cae4bc9a9749a9cf2e0', 0, '2019-01-17 06:38:58'),
('1316d0ed7fb7008233c1eaea4e3896053788b5efa2f9adc7034b09d6e3c111ddfe9f91b6bc568172', 'd26ab7801c2beb935f5b5fcbae6d4f07f73c851c8d2ed8d61941dac5b14aeddc144e83a75f3c70ac', 0, '2019-01-04 16:52:34'),
('1330069120be8ea337c3c8616e2eb4cd17242f2342b012dd2090b7747df39e24ad7a49d04506278f', 'bfe07dad87d147e8987e402ea2a0a86b9e3ab8e72927305888b62929e3f602b41ce14a44665c912d', 0, '2019-07-15 13:20:28'),
('13d26d893b02f6c1ad2b1653fbcc2063eb61fc9abafe59e701b4970e437792cb7027b27b21c83a60', '53565310142da395a3c3570aa661fbeaa4675fda3dc735393698a7d665e8b7b46ef1db6c730292e4', 1, '2018-12-13 12:18:26'),
('14394d882c98ad95994f1950df339f0d5f481f2e77af7d5f7e6482b6a1f8097c9164b8ac11590757', '85ed9fc77143b06b04248b64c0e2a80eee45ebe36654da01f1ca66ad8b2c193549989f15618f77e7', 0, '2018-12-05 19:44:40'),
('145251d6028d44f0bffbea6ef839d6e2cb4808b358b4b0d3067f184f352ace6370e9fef3cb0ebc43', '713defe6a487c03710ef25554334b1d4608b01116895c74b35e36915e61046c653ccf1bdd5e125fb', 1, '2018-12-14 11:02:02'),
('146d61f7c40a14db7818bbad35635bb288f6d6fa5b324497b42f1725668fee522893d38cb52302eb', '977aed80b5d889add1e3f3d0e79bc453b0cc0592d310943ff59e168b0a16fa8d1f8e1167d2f8318d', 0, '2018-11-06 12:45:59'),
('14e5a5666442b675fcb4af32b4f4a3616e9df45b7f09b0c9c415fe38560545dc20513f5b24a6d7b9', '95e85682e06bc830dded3b4b36b15a866e6ef625c2470f6eab839f3eeeaacfd8d612a2069737fa96', 0, '2018-08-20 22:09:02'),
('15185ca4040d4e2e9f2cbd1d0d16ce06997111b750652cdfebbad795ab504e5d2a0ff9ce86862c53', '86b334ac6b3ad863a82418d422f7209793f0ca9df7d6c765436d29473aefa45a8b703a28a619b2d8', 0, '2019-02-21 17:25:58'),
('158f612f033e806d3f021f15323fda5cb2810c0ec9989301f69c70cdf9ac18497e08548f779eb4bb', '357410ad36088382774ce2bff7d61850370d7b95f238718727661aba659e65ed5974d0d6f0a323fb', 1, '2018-12-14 10:49:52'),
('15c64842b59b6837075a9748f17d381024756cbdb8887ac35b9f9adada355302052ae948bcbec2e5', 'e0649d30752b2014ef2aea251ac48c5ebcde287347a670d816807ee6b08ef2a89b185fe935013d4d', 1, '2018-12-14 10:45:47'),
('15d4a4e5374b3f1236891c807ef84083a923cba640154aa78b30cf38541c0cd9a7cab466587baf5b', '5360b98de55dd730ccfe9f8c4333d9baa87a0d8f2a7156295ee20e531cfed4faed2920cb260f235c', 1, '2018-12-14 11:05:07'),
('164734edd20de1535f4b9b62746967014c28c461a30bd728142b310568ba59b3d3730b593e956181', '90426b11e9d4c52bf0f0e5548c87b09d673f14051ed0fafe168880054f6ee8d99c5885519edafb35', 0, '2019-01-02 12:20:03'),
('166a964b3e1851f3a35da3fd295507c20176e5c0024f37d296aa3c0bd14af0675e33d334145d1d1e', 'b1945db316318fb060e3c507a421cfc212e2f92217667e8576325d501de9ce13abad5801e24cc846', 0, '2018-12-18 16:52:51'),
('1671b5ab11d944335d96040b20cb3b17e95356b5da19d02ff3aea549ada86d649661142c88fe3392', 'fa99f0ff54861ee16b82debc31fffb8a9105a556662b1c34d01af98b6914483bd4dda57ac11b6afe', 1, '2018-11-08 16:12:48'),
('16b6810d2db3ddc276c5ccb6e49bfd5aca8da4bcd4a4b509d2e6ae9ccc627b62ea2591617012c2ff', 'bc990fb84c3fe3b99e4c0a85b82c51042a737d67473bc57bab48010f442b0038e278c2f8f4217b15', 1, '2018-12-12 19:25:35'),
('16beb06713ba714a5778979b79e4997f5ecbc77550d899a2b0306126a01f8d943aa12b60a824a9fb', '048995b356d0107bc573decbb96340ea6ce48c6cd68609346e092184407bd57301e328220eb51d9c', 1, '2018-12-14 10:50:43'),
('16d611dfdfe97ec08136301db160b25e8833001a211b95b3e3222dd6c65e7f5308eebd3d3c89ecd7', '5dc23ccffae7d02765e00fdd0a29e755e5d3de1b77ec0281af8cd7a8630c80d33fc6803636a21539', 1, '2018-12-14 10:46:37'),
('1779a94662834a10c829de7078ecb89c89d53fd050c7a38c71b9f4218649da6080da277a0c0905d3', '2558deca3b66832609f0d910f0e2f674cb66199b5c2043296bb4876561e3efe45ace40acd93b8cd7', 1, '2018-10-18 16:22:14'),
('17935033d09127ff8ca4923007cb4a087de75a4d8b1c0531f45c1990af1efc39e862ea5b7afdd2f5', '75fd337fe10db0a1b140547ca7a1a0c6e885a9fbc071a481997bb6a248d6d2bd416a96732acd04d1', 0, '2018-10-28 16:02:27'),
('17a1175b6cbe1c8bcc2b17aca69d742bdeb69aba2cc3a21ab0d9778d9308ce9fef624bb9d86a863d', 'e4110b030e7f67bf5c20f3bff9997407684e0f92d0267ee042f682aefcbf63f0706f3e3cf8034e10', 1, '2018-12-14 11:03:37'),
('17bea242644e34e9a51e9ff9be65d3bbdc8f0e492222cd9cd20b0d03e576ed53547395d8b6e1ac8f', 'ad04d72983767cd30411c60cc7f749682dbe8dd5cf7fc4bcbc67414a3d4a120808a7d8d82fb11f02', 0, '2019-04-04 20:33:31'),
('17c0de719a4b6fa897909f5887e9fab5e4ff5ccd0f0c7d76fd99e3b97d9bf24f32da22aa2371fb28', '6d35964f64f25f73151f2d1cb4bdb75e47c7c8c5f31e83ef41771d6661f06d4974052e5e8ab30ff0', 0, '2018-12-20 14:18:52'),
('17e603560b3ea8cd5691d75fe8d5c84df4ae5b83cfdb031062cd7ec3d10a7287068629c7e254d36e', '3d2a54fb0c7bbee4569a7682cebfd762f3ea5806e1312eb7d31fa314f8c65329d879c40d3ef9755c', 0, '2019-01-02 12:00:38'),
('17e66c20d84128b698dc8a3828eef75c3a140384392d9b4aa5fb0ee2bfe6490050d2340f58871272', '48516326e9b25c0335187b385fc249c3c47866fdba617c5711e779ffd8f98b5c5277ed25ce485395', 1, '2018-12-14 10:57:12'),
('1853276dadaf999c47de4398eb9380f9b52579687fcba9f9d6783af154ef3c0fcea9b6eb42205b82', 'be50f5a4fe976f91050b585a4102a6fdf34bc4ffa2e9c2a2e161858c7227fd203c80a17a5559d881', 0, '2019-01-02 15:04:49'),
('185a08f72cd559c7f6bda294cce7f7a6f93bf2a7a65db2fe3bf4b8bd55ac0c3019307812bad6092a', '29b45b3ec278911d2cc02af114db30dcbe2ef70dac48c55d5ed9a9aacb3ab675c64f63f8946e87bc', 1, '2018-12-14 10:53:07'),
('1866d2f7adc70562a76b98fea0546a8943d371c4c0a70cdf0ac54ed09ff65e497db0697f4c85f624', '4b9630c3a50ae772c37cd97629c040e7679e458f90b5a420a8b55acc1f926ce8d330bb9635116d6c', 0, '2019-01-07 14:26:52'),
('18adba2c35f9e586ea018a79c1929baa36d19ba0ba9edea30e811a8eb8217ae59dad46cb6083ac61', '860d46dc6ad5203eb6283282d563e19bcd01d311fe79827447bad9493d118eea63424887c9907fb6', 0, '2018-12-10 15:34:26'),
('18cbed4b4c6b7be1238a31b714a94e6763ff56a0db928faf3f0318061827e00ededbecde903e57b0', '28e57711b3f78f8843a9fb16ce64a14ef6141205b603ecf85fac0dc1647b3840ddca0162a76356fe', 1, '2018-12-14 10:59:47'),
('18d08010a188a4231a7db98c9c7be8b7fb3b52472816000f186e6999d53e0bb2af23f57442263eb8', '81eff1fb7128a611964ad8d986fbf8a4f8ff5c0bdcd6c61ae295ea168fc02be963c620d35f237683', 1, '2018-11-08 16:12:34'),
('19404b6e3aefc43056422841fdec29f858d7f1a99d366d938be1763afead069de9e1c9a275bd3a0c', '596ec3077a7cd361a63319a14dbdd94b8f690fe8ee0e9799bff62e1c7f42fbee71e5d0b4f88629fc', 0, '2018-10-23 17:20:34'),
('1956e1c8688964e2b71a56c3f28f70d8fa1f34b73ffbfdf9a3f20949de24c30e40d8c5b2bb020e31', '1353db6fc6a5a0bfad0be6ccf4ede9ad2a76635009b4c261277a3a5891745989232f5cea3532177a', 1, '2018-12-14 10:46:42'),
('19645401114c1db94e1f7a0a651c78670f9c123814b6b5641a453c26f6f827224a7dc99232a54825', '2aa88117cb94f5959d37063fe52f6ac4be6002c252cbf7acad6ae34c8e6fa0bb1726e58eed59b849', 1, '2018-12-14 10:51:12'),
('196fc5a8d03bb4fb0ec4a857c7893b01c4b5552a33c769a27dc86c34392e746eb9fcc9afb31bcec8', '5ea32608c9036023733bcac165438de3b8345c05f877402064b2162f0e7e399991991d46fc5164e9', 1, '2018-12-12 16:25:45'),
('197fff026ff6dacf77edd86c61eed08dea3ad2ab5f1000f9ddb634d8387fa561685d711d35b4f403', '221c03b5b954bb782da4647b6432c885f0e13df3cc0b0e1dcbebb60916df1e6dc84dea6bc1cec463', 1, '2018-12-14 11:04:47'),
('198d7975b08c03c5e37db9f7595653e698330b898bedd3c3383a74bd36f12c64387752b35c40b1a8', 'bb36a745211b4b3be743c0180f6e6f59a8e9cc436c197c3f53f3603bfa0c1a31dde7e60fbfe5ba26', 0, '2019-01-09 16:12:35'),
('19d086d8254c607fff3aadfd12d2bb66d3ae432b53e618312957217bff421fe16a80714d2cd0cadf', 'db4bdb52d054e3548c8086405fa46c3258f065a06593713f4cd6446467b89e93528f79890aa00ca8', 0, '2018-10-23 12:51:39'),
('1a2c52baf1991e4e8e48152b5d23e897e3c955d097a46bab7d20180c486974215e00f9241d5fc126', 'e13aa193e7b9bb53b4391c7c485eb2cd319f38241e09dc767c44c38f16f622bf70db0f8c37e66e34', 1, '2018-12-12 11:41:48'),
('1aa2ad743aaead35908f51088d27d9dc730f25084bb41bfa6cd1697444d7552daedcbcf200456fb6', '7de8e560dc50b696a4f654ce75172a0ce0f3c160d190122245b1741a38daa697bf2e4c83e9852ad5', 0, '2018-10-30 15:56:35'),
('1acb442c8afa6cab23219541af6ccc1fd9d74f27541a014e5ae6082ca960070f136bec85e545f55d', '6c9e9ff20fd3ce3b5756782e53c945e6e7b10147d2460551b2934f7902a6f8d008d6c707a1c17b49', 0, '2019-02-28 18:39:30'),
('1aee59ddae87ca32d78e2147056c70ee63113444aa61ba262d7be70a4cd6bc44e9ef275061a5603c', '38b371abfb92f06964c82bf91c1539e40ffded2aa8d98fa4b4472ae0a86f330a9baf4b142e4eca3f', 0, '2019-02-20 17:07:05'),
('1b12cfb30e7623b0c1d43ba3bb555004010271c43d5635434c0c2ae19388b899303638af2a4ff783', '1b7bfb485f87b4e43503bfe382c4050618d6e60e02b6206ab2d294cd8d765c5e854fb485db3d8644', 1, '2018-12-14 11:09:54'),
('1b494ba443cb9981fc630b1408a27e9c11373703509e180b542715c4cfe937ca3c652edeecc99a94', '0f88dff5b1b8a937983d9c80ad550a7cac0042957f38aeee287cb981ec71c5f67902f3e999155b36', 1, '2018-12-14 10:56:42'),
('1ba77147fa1a6b5ee0b8b66936215e670598c305902f820b750ac8c9ce334c6e0fc4f411d619b7bf', 'a4dacb251f1b99efc54d9d992c519189eb745a53f8968c4393ec041a6c1595ad135831e4d98f1cf6', 1, '2018-12-14 11:01:37'),
('1c7ffe1e423fdb55d5699f189d5499664204dbc9a7b2e09a326171f2a429b9ad55cf9d464b084aba', '798dc82e8d69f827197a2facc5bd474fd40cad86e6351259ae77a8c2d72670e34f0bc3b11a9dec07', 0, '2019-04-15 14:10:23'),
('1ced6782cabe92ba0e45a506f53f94af8759b6d1af4e057542899ec59eaf26e2e2da88830b240a83', '9a20f15210a4cca8a977f7fd3f91282f91925a60c67d74585d30d1ef1872825a71e5b6d241d5e687', 0, '2018-11-22 18:04:22'),
('1d456a6fbc88d52539ffa2f74d810805f5e54250f023cc593950ba13a2bad3f3a831ac54db3d6f33', '432603e616545dd8bbea3df23b9d132be9b6a3c2a80ee20abcd52e7d7a0bc683d49d0e72fdb5cfd8', 1, '2018-12-14 11:03:27'),
('1d5bc68c8c7321777b173b0887072ec970eb081293bd731157a1df3a1eef0bc726321389ad2213b0', '66a1aad96bdc4f30376138b6682a4fbf5b3937bd0840b0130ca11c081c6fc6b9095942dba48a6d07', 0, '2018-10-18 16:22:27'),
('1d6a198bf294462d82928db3bf02c5983a0743ce38915a16bcf816e9242bd9b63e3bf45e3b91d677', '57ef19b726e572706ec57e75e304d12776b289decf9c4b18a21a1d943f78dea6a28a0ed73c517046', 0, '2019-07-21 13:10:17'),
('1e39e37016acd6934539ce6213149a46f71f5a97ab339229ad445a1c93747fec34f304561968ea3a', 'ab594d35269a2ef18c9604d2068399a8668bdace8e7c0be2ca232f780a65f227654694da73952c3a', 1, '2018-12-14 10:45:27'),
('1e98091a9cff04a002d96b5f4ab2c49a7b16712848217fd6fead65c25e1229123a7320c752e9fcc4', '193e58699c1c30b2df8f9ffe3715e09343114cb2be3af4e8878512fbd70924e715d874b9eada2e20', 1, '2018-12-14 11:05:17'),
('1ec062e0382fdb6f6d99a5055cf4840518c3a1b28fedc1b263d2af575948e223d2ae6485f5de50c3', '75f03efe3d358559d517b9a7177bf0aabe8bf28b7407c7cf1ed6547be93004ad137fcb0ddaf94f9d', 1, '2018-12-14 14:47:00'),
('1edd966dd831b9aec72bd690a45d7da3a77cb7e5e20f1f7a78a58a28079b34cd8a5f1fec10dfd10b', '4001a346cb942f05cf36abb828025758586bd65fd6d22647b9c09aaf6ede9f8087d9a2cd93d6b20a', 0, '2019-01-23 12:52:23'),
('1ee4b5acdaa60b2f10ca107a5252316d7595edc19af6ed126eeabe8faa7fe910f07345aa8a39cabf', '0f01b17140f4a5c0928df2b7799a31f8cd34e04d3f4b2bede205965008bce456dfcb4aa52407045f', 0, '2019-06-04 16:55:43'),
('1f18bea8acf816156279dac65d5e8acf6df12cec76c92d744e9322b8ae8798fdaf5c58953406b737', '83000bd87d7e5633b64de7dd06143d5ba9cceaa82c1801a4e496d0750abae936500642c250d7e834', 0, '2018-12-14 20:28:36'),
('1fae503355610584cd9a0f421e363eccb88cd32c43c5203c27fe92c7fb25d569cd407feb074fa072', 'ca12d022368d2c92c414f87f5ee4a4e45694ccb157d8315936c2a899cd27d712fd38e93aea541c24', 0, '2019-01-06 19:10:41'),
('20bbe1990d5481af2a069410dfa4ad08c59499f9108a384ea06a17e9874a13dde1307813d6c549ca', '262c7ddd771684e180d5e296ac9e61d615053dc12694ae6819b587a4a4914496ec01af40152d4a80', 1, '2018-12-14 11:01:04'),
('20bce46a1ffb4ec4823515648b0eac0e847f1632f6d6a98cfee0eb173497b9ecaf362eae0851c18d', '7c83b33041546a28e6c58c4ef68c10560d3b156147225a0258c4a9defe6110ba3a9d052df800364b', 0, '2018-12-06 19:22:30'),
('20fca57af0a67e96cd8cdf5e516a23fb6e5fa272255307416887cc17b4e6f59e90f5bc7d1e07cf6f', '1df6b739843c816a89a490ba78a4f9638dddfb68c47e43786494a759a11af8d548e58d7749e7f3d6', 1, '2018-12-14 15:20:56'),
('2144a71ed8c4d110ae3a3c9662cf9f2fa0b07fce1ec98c677b7eadf2c926ee79d9e8268ce0a1a80b', '84827b6631b716bc3020540f70161f276e6ecf57f77ee52932e4e54273934e0a594aa41f5eeeb7a2', 1, '2018-12-14 11:08:52'),
('217fa41680312589d7015d24455132b8819e1cf3c7e8e7bfaca6ac0c2c80d3e08c0483622d7ac7e2', '32ef46fbc1222e392e1f95a48bc93d90ae483542d69a3d03a1e8584f56194a741a2a7870752a8edb', 1, '2018-12-14 14:46:52'),
('224196f82aafc332c28882a70ac647c86d0192654cd1a1ffb65227a68e63efb0a9a552d0ad8178cd', '5f65f2bf42476bf7a652c0c3befec0500526b83e7b5572f123a3837c3a3738ebc4dd1f1df0eeff9d', 0, '2018-11-04 11:30:30'),
('226e062261252c4fe237c8cee87a8bacdffa523285d07352e36a9364ea5976582dea44fb9f146dc8', 'cf8f39cec8c20ea45277d67c0c20ae9dcb2e696c5a687a8e4533c3f9584a42e2e2644806892e4c63', 0, '2019-05-15 14:12:53'),
('22a07de1498055bc498911e8ff497b6ae65fccba1fdc2c1c04bcea796e07cabd9dc9084db7cac51c', '7b73c52a0f1436b9dccf302b6ad22d3e889f24a84f3fc571a99ed44c903d4a8dc4ce286fa4fdde98', 0, '2018-08-20 21:33:32'),
('231f18298e15ccee407edc4f728382600afb641edbd87189397792db374241f749abbdd43b946cdc', '99ad80056aeb7d05c1ca2bdb4af747a82d188e48129d6423a83b055db7bb7c22a0f472d80e1d8c71', 0, '2019-01-29 23:30:37'),
('23b9b168664734c1fb2c48f958bc410175bb9b3a3ccaced16d906ed6900924beee22de05a8e12321', '079e8645ee29a677928bf6b4b8bd99b80f27eb2aede5703e7efa227e337899994105d25859dba3bb', 1, '2018-12-14 10:57:23'),
('23c498f2fbaf0b19b6bd7232202f946e5db7ad83fafc19cd9c7eca257b663f1631a68bc946243a6c', '83bc5009549c95a05f42f6ce5bbd3e610d2ac57c03ecbef2652d5eb3a9b58e148eb7cb6d50ba274a', 0, '2019-10-01 16:41:51'),
('23dff6be353ddf0e0c1e7914c84f9be329c60a42e4a3bef8f55ed9284738c4a1c4b4924481e21ded', '38988d3e8a450635febce017cab0c8462d9970f2064ca36accc124b005a90411de2a8dacba7c2a53', 0, '2018-12-19 16:20:56'),
('2420bb78d6f90bc4b67d780d9a7c1ec99593596cfa2cf865a3c17831b218f067ca670283ee947a92', '5c391e4141f7d00221922ddf371a6cd8ac232de20e01d786b8a0f0ae6545c15f2ea6f5109aaf69b1', 0, '2018-12-05 11:43:54'),
('2425c24a7561ecbb543be262b3617119ac1b1560a71a3f6b50107a2be9d65f17ef0f7a8ca3d4c37b', '993dcaeeb870620991ef788ba77338ad8970f48c1bee633d49d2ccdc884ebae2952185cb0f3b8855', 1, '2018-12-14 11:02:07'),
('24a6863902a6fa6a139a0186f7092d137a501183273d85d1dabb761f23b02ba3578e521c22dd1f48', '7167405c11cbf95597cf7719d5df20e8751dca7dfe115cbd288cf2960872c7f9f4fcef2ab6f8fe02', 1, '2018-12-14 10:59:12'),
('24c83940d2e43b1f0f22000967ac0631743dde289f6a97b055999802fea817d895d3ab1d09cef1ee', '977dae96144c70d76bd15415a2c948eb7aa9d88a97ac4065a88c0a82959e03fb12fa4a51c42a08b8', 0, '2019-04-04 22:05:58'),
('25711b8dbda07fc81f67d4780acc9f41ade648fc6671cbfb444284463af7b60d038cece25182f087', '9f910fdf16e98032e7889bfebcd57ce7e41b44a4c7d93f5913bf1976f0dba0ac12a6c5ce95c79917', 1, '2018-12-14 10:51:47'),
('2579fc78e239dd84e8f862f8e16f4f5ced970e781c07e46f3a61b9e187ca53fabaa9cc9d8af50d4f', '2364b0e8bc259a939d8019772cb624349b5ec95f8b6473c023f1f654fe89e8bd35f36fc6962e5808', 0, '2019-07-16 15:47:07'),
('25b1e4160672df0dbab314fe0cdc6e5ace062fe541585f11a167bade369584e562c1cde1d7b7effd', '79836d468ea26b5ce552e836da261be63087e3f8f8f4497a37a0d2528d72b90bcaf76f64de9b4c26', 0, '2019-01-13 18:27:16'),
('262afa506856306c322f6f46b97609965bbd5f3f26bbf619a3efeaffa61a86aede2dbdcb42218679', 'ae0eb201879e246c85cac5bdc9a272ca97f0479c09a26249a446a875ee83aa5f5bd2856f83e8865e', 1, '2018-12-14 15:21:01'),
('26375cdf32fbefe9119c290933a36159facaa2522e9bc474ddc401a2a41f714fc9d4569084e0d758', '1c4dfbf26d967cabe984fcd71ce2cd5f22846cb3af69065fec2bf5597ac5f0f13993186ad8590f7e', 1, '2018-12-13 12:30:46'),
('26553ff33ac92b17a6edf6d77fcda83c726517fce5d6eac992892d87d8f924b483cd3cccafc409a5', '03360177f7ac1b29cd8473cc8c6d87d696a401bea0ea9b7bbd80c1daa51ad2bec7b720c9224baabb', 0, '2018-12-14 19:55:06'),
('2660e45d094fd9c2eaa417f2071562273ab30bf3415155239caaaa9b3859bc2db041fcd34a04d2c1', '91660843a025c6d3e9a690421ad481f0b8fbc12ddb56f2c16ee6ded5ae04afd2645b61f4d9b6a1ac', 1, '2018-12-14 11:07:17'),
('26b9b8fe30b4fe50a8d89fb072c92f15128e0e278cceb60fd3385ed366c49ea3c368aec459f86c03', '17548c3b3cfcef82e85687a9cb0bd0968906f19c4b3034cf86bf5d2b355de00aceeb739ff528a42e', 1, '2018-12-14 23:30:56'),
('26cf18e7d1b75e29308b455641f9ceb3b1c7d811be62a1969c57841c6518aa20f7e765c5c96aa7f5', 'f3bda17fb4bfa8c40f046ea7f5168944e13b768c2fe2451c6594691f0c68bc95b3d76a4b64f72407', 1, '2018-12-14 10:56:38'),
('26eb1424372ea3a2b77a4e43cbb1c454c37e173b3ebc9388a66c0490bbc6d57a5ef9dbc80dc81168', 'c7ace4cbc7add390a28c40a3c25a57f056c8c0552038e02a958c4b7a6a2a6bf1d59f6910843f2e2f', 1, '2018-12-14 11:09:37'),
('26f3a7ad4d5ab3da085fd963a5625e8fb0af4a2992d49d402ab457a8a8d04f33770f8ec815dc04e6', '64fb039e543b74e7fcb84e3b98daed95ff2d7deaa284f586e51756cfe42895b943fd9239837b3a6e', 1, '2018-12-12 16:10:05'),
('27475b788a1423f0a59a51c136e6b5bfc8fef488713973c7c414562a2f5991fa8178a3965ab5e1c0', 'a283112ec2e65f93e25f9766b9128aa5d506a0aace838810214a76ec503bdb1a66c81778e107998f', 1, '2018-12-12 23:11:01'),
('27916bc0e69a6891e78ace84d1d3f53f89d77c250b6e4da42e8c1fdf9921529c6cc7daa3fb8b0998', '8f589a2ecc7a9a56b32e7deeee90e7e85b4dd06136c90cffd4709d44dc79381eb72d07e5f47d43a1', 0, '2019-01-04 12:29:35'),
('27aded7cfc7460bcd5a4a146d7620f61fc151b81d2a63e578ae2ebfe962daf1264d89d4747282bff', 'a3f098bc92941ebcebb335c5ff893781c09b2194b734071ec1f214eb12828cc917eb82f614dfcb13', 1, '2018-10-18 16:21:56'),
('27af9efedfc92e3c2d5065c66739efc68f279b15f5385f95b576465eb2d75821f4443d2b0bff2228', '055cfa948bd3ea5ffc864e856a52a3fa4f6124d952d5d954467a9f0914e0e4328a0cbb8e217a092c', 1, '2018-12-14 17:27:20'),
('27c18e184ce3f50f4a204ae5448129ac0e64834cfe8c92dcfd076667ca44d0216cbd0eb93b2e43cc', '6b80eae3285d2e205bb2afb1e4a736de132ec9881da874b7426393da1f5c48f9bf48425c2a7a28bb', 1, '2018-12-14 10:44:07'),
('27e4abd50d36ffb4f8a93e38ea3192210f3ad176a6c842152afe20e16ffff77e2c67bd5915363e35', '12f4aba5c98ad24a31a7a9fddaf2b73015b625cd95bd1b6e0f30156d65d1ba88acce010290f2a4eb', 1, '2018-10-18 16:22:18'),
('282f5906f11198a339c92c4f76c762f80e9a03e4711806d6c3fe99d2ea1079c51b3cc4741615b6fb', 'cd1f63404b0264ea21d5addf6c9ce436d4a4cdd63fa46649b0ddd5f92c636deda6c4f78a7c64d411', 1, '2018-12-16 00:59:44'),
('2861e160fbe1fd2521675d6ae735f490aabfee5d764c28b9179a17fef550b35fbbf832a9941789fe', '043bb6e5948df4bd0abf4e6b31744b367ea01a6d4666bc194265b7da898f2f5fb87aa859314a2cdb', 1, '2018-12-14 11:03:57'),
('289ace8389722b4cea07ffa1e375cdd586b2990323360ed037fb705cb170cc366d12203f237658d5', '185ba493c8d6650bba510bb210edc69b70e66a9cd246601f7d3275960874633b403a2197792c02d1', 0, '2018-10-31 00:42:20'),
('28c56e6c57610a4f38d26cd81de068ea7fc207c599779a827f0f824c2fc27826d96b2ca302b3650f', 'af12e221530c35f88548dbee7710404041e87b4c8a23618b2edb87a6581062ecfc281cf055c8292e', 1, '2018-12-14 11:06:07'),
('28dd958c0702c7ad21ce817b9b1ef8aed85d443d7ae93cfae8ee8b1c11ab8493c52f34e230691c55', '1c6145139973ef820c6c75ae44597f7f3a76aa4f86cc8630269f3e5b5b2b1418ce50f3615261fce0', 1, '2018-11-08 16:11:19'),
('291b41e9c14efed6432183bdb2632e7cc73c5798260faa6d848fa62edb87d7489aac7ee3d3d8f023', 'dd68c77aab30e1e5c24c6b32f0ea7def7a325c4d97094888921bf50e57a3634132c088fddb4ecb67', 0, '2019-01-16 19:21:12'),
('2986d0fb0959b9af41bbc1596dad5502ee78c8e8b4b2544dcef3547ef128febbd7c7c265a0d37361', 'c9257086d42727d02c9f6ba1d33b7088d5fed3354d712de4d6c33fd23e3b2115ebbe64610bf60876', 0, '2018-12-14 19:48:03'),
('298cdef475d525debf49f960e31f5ddf7f3f515b97ceccfd4f524dc9c056f90c83a0c577d63f8631', '36f66802ffddc5a4f77b04e23e0e73e6157251d3aad78869dd4514dcfcde257cb5680b33e49085a7', 0, '2018-12-25 10:55:58'),
('2a0f3096c05766a7522e90fedde1564bfc740247930a128981adc069eb190e52708c2b9f982c4914', '416b9025e9b10a8f4254d54c84b2e9133531837daaead9b5494731cf98c0103041f98f58d934b702', 0, '2019-08-06 21:30:24'),
('2a626c98577859965a0c28d515da2cb4f3ef2c1bd3a8b9c14fa65b5d95a88a569040a5403f878dbb', 'f6bf86d98bcadfe98d6ed7c2e2fd89d392d184071015b8487b6e7577f8e6220a56a5867e266556e9', 0, '2018-05-14 05:32:28'),
('2ad5aab93218a4914e66e6ff4a427147a780e1a40cbe9eb5cbc5d3afa1f77049be1ab0f9037efc78', '25d93d3c24b6d94bb7af15b77da76bb4ce6ccdc7efb78cf04010b95575826d8f43c0bbcec37fcefe', 1, '2018-10-18 16:22:02'),
('2afaf157577c0e570a3ec9b27b6f2483da55d8ee03401d20060d04370c91460d963126e39cd55568', '97ee6c3042c71d658be3f94b37edf6e5bb95fabcbe8049d2beccc9f0445e3cdf30c8275027bb6c38', 1, '2018-12-14 10:47:37'),
('2b3f6e2e5e47d1167c39a4beb1dcf28baf8c467e765b31b0ae0028673eda2a79d213d4eea448ff49', 'b7bd53095dd16cfc1435452be0c1995be6285fe9126a74c123d7d7f2a2cebf217e43bf8dea38f0f0', 0, '2019-01-06 19:13:37'),
('2bb164163e9336f1bbb1a78660250c672a9d7351c63da12404178efd5a4450fd6f41d89d7c54fcfd', 'e30b6e79485aaa2f60c53f019b64aff1c95358561346d7b6ac9515379f4777e1a0cda6a5b8c5236c', 0, '2019-06-13 19:53:14'),
('2bd048b05400e1e9e70ff5152be6bbdbe853b6f5a297fe1df42fc53860e119e6493aa83deea02c29', '95c6e73daea6792e2e29f7c27d464f2d007e990e730cc1f4bd1205fe62b3f7d935f3c8df8dce085f', 1, '2018-12-14 10:47:12'),
('2bd8b18ae9746d72f5493bfabda5e714aef847b1a7c187e228590497eafff121e0487abea4726b02', 'bfcc8d9078f2af9e3d5b9cf10bf134b2ed2839c941d024e7d6a4f7fb555345315b0ab84dbac7d4ac', 0, '2018-12-21 11:25:38'),
('2be46962ab94a56dbe8f083b5b4669038792ab2cb5c568aba79271bb6eb0c2bbb1512ccce95e9720', '665ef48783a2b3fbebc74b62346165a3c474a4231a86720146bb12c42ef5946fe109e49eb3bf4c47', 0, '2019-01-04 18:19:22'),
('2c18d0931c1c292fdb462833224e4b40ea3f45128e899c719e4dadadaf525481557742b2efe175bc', '0c11810c5de5e1f726f20e283eb2bab2da07f543e906562851db996faacf98cb22257127d2cf1af5', 0, '2019-02-18 10:29:55'),
('2c6ece00a8abebee3ef8279c37e657eacc5fd02df5b80386aa05fd7ae42ac8d5e449ad55fd4ba179', '054cdfebd03af5ada8bcb22e3f6a9b2599221f4943c9b5933f94ece177c9239372adc49d8ea4210f', 0, '2019-01-07 12:54:25'),
('2c71c062a61eeee16e7f9087571ff077390d1121b4deb8d96779e2a4e3883cf99e0bd4228e055b8a', 'efe7cca9d771a1c8f29223378091d5f30a17f2ef3c356471fc0fbd8f91a049b76a2e46358fb91efc', 0, '2018-09-12 15:41:17'),
('2c7b10cbe6a6ea128cf7a2c3b90e0bb8b4455b36e2b6f684720efda18d35f4163296b2418ae30a7c', '77b7cdc27971ea99dd0b9a5a8fe77d52401797726a5c3e48305ab6cd0cc405e541e87407e38f8418', 0, '2018-12-14 19:45:26'),
('2c9a0cd3380dc9aec9237541917fdf510b71eefa43496fe85c2b32b490350f9f21a99f92b492550f', 'c907c41bd457f116aa0984e92cb98698093202efeb9c499d91a5882db3d8cba94a7ca05b950c0e80', 0, '2018-10-18 16:26:05'),
('2cbb41c858d6aa67dae52b1bd06d39dcd8e2ff8c50d787069722671449361d43f346e4af9638ab2f', 'f3caf35f07e29d2290d204b0bfd937cf055f0dfa2c43833c34af47b9e8af0281711003278f6d767f', 0, '2019-01-06 19:08:58'),
('2d1e40bf7a07e5827b2836842b2da2a7e45d425b1bafc7fe2ceb5b1982cb6636a7255131068a7f70', 'e106878c0e58b15804e4ee96bcebfdd24b17a01c57291d066bb031f2535550720da88110cc616f8f', 1, '2018-12-12 16:25:33'),
('2d7bb4002796daa120df19b1c080c1447b502506d89c432d34292baea6f0bdf8496c9a05b2e43500', '961a99db0a841798d9964986383552a1c2ac34bbff7d1ceae95e2e52a32abf3c35944e83bde2b9c3', 1, '2018-10-18 16:21:57'),
('2e105b6fda1db50df0ee7ae5392707b5f66a7ab785cf8a84f2430d3b9cedd0bb54677160b220bf45', '0f1237400ee23f9fd940e6f6983d33ad21c3d588ca5860513266b0893c4396e6777f48ae2906d0b7', 0, '2019-01-08 13:00:39'),
('2e73bff0bd30f13b4b98b827f6100e52fbc9bd36d5df2ec6f2dba6b0307d7a8edb8d960cb8441ee6', '0569eb7b4f839d611e827080ce761e1894183af5158f4ea25ad52ff7b5e3d2863c553fc05f1460ad', 1, '2018-10-18 16:22:04'),
('2e96a982a017d1b94e0cc93f6c8e1d1f2650aef33598d43fa1be8496d884d08512c1bb043439e477', '8d185bc05a02d42fad4492e7612a34d296c3c226bed2d971fd549efcb84f26466fefd22446469c8e', 1, '2018-12-14 10:44:37'),
('2efebcd7ce0f3e76b288d840d8848d12a1bb089c50e312e660f0fea5c630a550bdd0622aed1b5a36', '673388baa1dec19bec3fc89d3edff3d10c8cadc53d8e3b005ca84f9631d157f30f401cfe8422db6f', 0, '2019-01-02 12:53:28'),
('2f2e9b9982430b966344516e793e68a990a2801f6f3a8f82a167fe2db6a6621fe0cd444a031d2fd4', 'daa9bd9000c8943075d8876b595dd175969d6bf9ad9b0122893a0effb00871a266fd7e7fe72195b1', 0, '2018-12-18 00:16:08'),
('2f46358daf821ff7bc2dfdb6bb54d882707e482e04ddc4f5f95cf98173ed9be9e98b9c7a4a73f403', '2792331b88daeb1afeadeea2719e38de2391ea6673673cedd31f34f7d1f36b4f73b6bd9a892637b9', 0, '2019-10-02 13:48:29'),
('2f8177f83535c469ae3fc1f1cb1483fe02dc1eba58039e2f0ca2734f1a7025cdcb9731b97101fc24', '5b2531ddd93dbb521c44c0dd5e5b8590f36edf0920fe741e8166412a6b2c635b98c8018e022d7b7c', 0, '2019-07-24 02:58:04'),
('2f9f3a57453cf3fefb2e4abcd9e3818290f44eee8591449f207ddb7804c486f0fede4cbb02fb161c', '09d7d97de9c90a5bbd6e8b206eed842c1906142b603f35b7002560f22824ae4e736869b2e7bc3a79', 0, '2019-09-15 19:47:19'),
('2fb9ebbba6cf7af365efd35dd8b6fa1aa0e3fff5d9f430c6cde0c03503a7b146e41a38eaceea1e56', '85e08aad627d252ee6d38633628fc2384461692a83ffacaea8f82de5a50ec81c8fe307b1dd8b9254', 1, '2018-12-11 14:48:05'),
('2fc0f50685604827a731340e67ef9d398dd35abc6fc63cb59e5420690982df99ebbd4b772564b232', '1fb2f74b0ab39a0205481a71140faaa90905e0ae12d427ee0128b1e28ef2bf3677ca4ae540ebbb5a', 1, '2018-12-14 10:54:37'),
('2fc95a678b483e0b4bdb710b82699dcee5b11cdbbb5f674c374df1a6f9ae0ff0db53d9d709353b0a', 'a26b7aa262390663cdeb9f263fef68865a2feed2bfc7085b33dc7a940c9c9abe132d8c36bd4e0f09', 0, '2019-03-31 12:33:41'),
('2fee433cb576633f98e3775d9df5d58d795dc9984c37fb474f787be84ada0a762559395ae45ec0fc', 'b4ce1364ae7ec9516164f173abdd31372b3b0ef85d0eb5dd9320a189ad2c6a5475cd4b34277308c6', 0, '2019-02-17 15:07:35'),
('309465bf568245c0b7b2daa28b387e56ff1c071cd0aa511ac4e1d99318e9da0fdfd6056678a93719', 'af671fcaf49400d3e9a273e44744b9b7295b68e6c20f887396fabaf00922317f58244346882a6caf', 0, '2018-09-09 12:47:38'),
('310a0716375458ff5170d2d2e7e8a207ce73ec60c37cf280acc91d10c0509aa7440b2d68e569fe4d', 'aa9d2e0bc74c7c6c02c080a6f0ac4bb36a3b2f5b23a19da7f90854629c8ed7685c0a7e1060187656', 0, '2019-01-21 19:20:44'),
('31234c8fb2341d516e08fb35a5c9ed286ed70663803df5c88c477801e751bd24aa75e34418520479', '0c1be1a42cd95011f049fd60c43b0b6b01a425541540ede9da620c005225930664e5c715bae537b4', 0, '2019-05-15 13:53:02'),
('322be20b173515f9a8b1b768bebd4f6a2bb6b53fbe8153171fb7f17d33468347b35cdadd16da5ace', '0d00836f4d333ce3216693cca8131caab7b6c555cbf5f5e3769e740a158f131d31918053ef1791ec', 1, '2018-12-14 11:07:42'),
('33268f3044f58845eeb85f8104f1f669332a03db2a8785a59a86a0d23cf07571b4c7ba836ecf3177', '15d39901a458ce05a6ab140fd834c00a758179e60192d1a95b548c09dc0c36409a8b4544f82270ae', 0, '2019-01-03 19:12:48'),
('332fdde1788bd447673ff2fbc3bb8266b2449e71304e50ec744d51d6a56377ab43247fc28dd10868', '6c05e69ca01e5161f0202d09f663bf9c533b9a77c7b958484dd5f71472216c7dc58428ad632cef8c', 0, '2019-01-04 19:46:36'),
('333ce4f23dc8682d4825325091ec147d338536e3796c56073770dd02aecdb8a24d0cb288437b6d1d', 'c85471923fd7d7dd9dbc1cf300f55f9d82845c2258600f954a08ac6f6ab2d78c6481ad6111e68240', 0, '2019-10-06 19:23:42'),
('33b45438de360f29215d17eaba07e7710b79ec6bf5264d7d12639cb45ad260151201b5eb341338e1', 'b77632f54ae13769d4038006b05869350297b80d5c3111f8e6d996b7a55c00769ba976b222f27105', 0, '2019-06-06 15:18:21'),
('33f1aef71a74ae2d4e49f6a11d4f599a6cee9647748d2b565db42e267e122b23f9b53018b856aa08', '08afe9180986503bf7632d61b7c07ef643032ab20ebd5807bf8024fa08ed9a72018cf0cdf44ad4ef', 0, '2019-05-07 16:23:52'),
('3447341d0d55bf98f2f834ca15f6d2c548124e6772edb27bcd28f4da91392959f0daba30b5fd2897', 'aae550a44b272e2734ac5490baa00fc97fe10eefcb99e76cf5579ec0efc945ebd81e458a4c9c10c2', 1, '2018-12-14 10:44:17'),
('3462a626a61f5f26ced8c2939d68e19269b9c34a43084cf73c6d4d8509c194c8ccbe329833025ac0', '57ba3d2f07144cde13e2dba623a7e142b3393e3b807d80c086be7b19b865160873d56dbdbc07eb8a', 1, '2018-12-14 23:30:49'),
('34653b306f43b8c5b8481373b8ff0d0df7b215c67d722f1b41b512d2c73a99e9fbd400eb284330c8', 'a85886437f6aa2b53c398fe17db0c53a07ab70ac6e41f849eb5c36fa474e571a95919911eeb89df9', 0, '2018-12-10 22:45:32'),
('3479f796636711d52e4ad72e97551453af31dd83c5d4749533197bdbcbebb1e1f719c3a0e15819da', '3a92d87d99c270ad258060e305a69260e6627e743866a4153a8831e3ce898a5044ac2ecad87004dc', 1, '2018-12-14 10:56:02'),
('3495dbfcb1bb7eb5e2a9b70f9bfedd4419d86ad51408bdc410f7411a28e93bf4fef8ba2bb74bfd66', 'dd80637e5ae350728e617d6da6964fb6101b429973b2a3e4a537f636f7aeb8d11c2cc32d4322d6a6', 0, '2019-04-14 15:14:56'),
('34a55fd493bc45ff6cda311662a396b5c9a5119c00429bdb4768c45b875b80dcbf73e37e78f25818', '08a79e330a999e69018ab9dd8fb2682c88cb1b7d7ac2c750d0654fc541c2e9b7024163fa14451723', 0, '2018-11-08 16:45:00'),
('3504251787bcab91fe487a633fb68641076f691a4c03cee87c2dc091040d1188e52534193e470d87', '57afbfd39d1976fe05c7a9a28796eb2c414998a9c1803b27662cbf442d5a87eff659cdbda06eec79', 0, '2018-12-26 20:28:14'),
('352e7a2a3848e053e3038576ac7f6fc1287987ec0f928841f6cfcb167fafb63a9adefd164bd1220e', '63cb25159aed16790f824866065f8792f5c937b051e3e04a67ae31055329461d94857d14f0c1bdca', 1, '2018-12-14 10:55:07'),
('354e35513e33539d08354899f015f6df1f70eeec5145788507565bd0db8c2ad56b1b504620b0f13c', '34513a111f218ff583744d0ee908011c83a4d09e5282fe11e6e9827edca8a57dc821475626b8ca8b', 1, '2018-12-14 11:03:42'),
('357bc62ac12af063e25af21a9d3e7dca535a2e1270f0b19a0cc48ab19cc2647748016ffce7eee0b6', 'b4bfc97b1415ac9edc5526e1676295e45beb38a8e7ef0848bbd30ede966b3444cfebf089c10703e6', 1, '2018-12-14 11:02:13'),
('3596e6dde6876575be6a93e5894ca954a9274a67d4fff6fe3b0b1b9e56e26b84f1cd44c62dab3958', 'c92d9975b22bdba86a60b34112ecc7bd8d847a0269873a7c63aad9fdfb0add422c23468753e997e7', 1, '2018-12-14 10:52:32'),
('35ad6369108f15dd6d14df0e04cf555fd702b3f8ad84bf73992485936c8ad6e6255ab415b48289d3', '40101a0ff49a13e6738c89732d898bd68581f25ddfd24529bdeb5238904def3a9bea6f03e339da59', 0, '2018-09-13 10:46:52'),
('361d0894df172700b853c430593174177f4e26c90fb1f1fb1d72fa1b5070467427713ed861a5f8b2', '02f9877ddce03d620285ce57da2f49f786c89b05aef466ddaba45aa6f825cdadc1103960b593435c', 0, '2018-12-14 10:32:14'),
('3661f3131a1adcd8c8f37a850fd86f2bc6d7d33c3f99d4651cf61093d13eabbc30e17ec8e30b8655', '82837c8b1ce8d09ca6163315895012860cbf7a2b8a75fa22de6fef3486156fc3e6e6ce6b0b723895', 0, '2018-10-20 13:39:17'),
('36761c8f821cb7c56457ba947e5fb1392c6bf39c17491536815c3d25cfd1a2142736692f148847c9', 'f14060d9340ca5a79a264dfbec1c914c7b052205035567506f0dd7f888ea6cbe955272ce87116643', 0, '2018-12-10 22:44:10'),
('36a322cd738767cfdd5ec2217c82da209b656bc11b3c9d20c0361e2c946ffbe60b53cf13e7a8c3e5', 'de119ce1bf1ded70ab907044b96013eb0047e50c2d92e93a4b1f124506978ccaac2f41e02a8dcf22', 0, '2019-09-20 18:45:26');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('370c898d8e742e40ceb51e9226cd11e013434ad2f967760fd00de255599b2703a76ba7699f7545de', 'ce49e6147194520d27f8deb0c198041522c031bf03b8cee116600c5b0cd48f0520eda1115bd15fca', 1, '2018-12-14 11:07:02'),
('371f48473638c7fd94f874efe84d3d47f2626310e493b07a839f2a3d7932067c39fd5119ea3924e4', 'dd2fc6adf7d0709ed641f8811b2a23e8124147775cca242fbbb865d8dd97a59112d411ddf3fe385f', 0, '2019-07-15 12:43:03'),
('37491c0827d60de6fdec6771d13710910ff51f3d53135a69f0a4ff95163c0224b0bdd7a8bdba832c', '61c2ccb7b367cc5cb6c842c5bb4eb3f5410d060f707c36cf30f1861fe8acecf107c0278c203c694c', 0, '2019-02-24 11:35:25'),
('38014b1bdfa9a96d51f7a330b04995a370d238eb6c148477b2954155fc6f8d1221b84cdcb51a36df', '4b388e170bc4845bef94c2186318d58af2756d72091dbceaa9d73afe14e96382261f1b7976120f1c', 0, '2018-11-08 15:53:33'),
('381ca3bd3a8847d3598a3e5c119c44da53593be5312966c9e8f6c41cf69885a862f76b935ea7f5f9', '8163b714b807a44abee79f96c1064bd33355afa7ce0fd76e8ed85314fff8d929674822ae96c0cb38', 1, '2018-11-08 16:12:43'),
('388bdefc9b2d2db8a4a1e01a7fcec4269a557d890765c992e5332c53a2e7a30cc3994fd20e56f2a6', '5a0548396529037308f93415d5ba9fb7e6c2793402c9aa3817b3d0cf2e31bbad0d421d2d975c697f', 0, '2018-09-04 16:04:07'),
('38ddb73136c099c7fa78848868605b6f070aed17a16732198e84cabcacc9c1b0e1fd0f368fd58be3', '01d4a85248e4ec0266c95433062cc0a40cc5dd5e46b17cf59372e9e412078847a095c33447bcce22', 0, '2019-02-20 19:28:37'),
('392d2f9cdaff4e7504f067ce9da997cbf1feb2d3f47c6772f1e2920435d203117a69c7b91089affc', '42844375bc8ef0d5bb8b7d72e98791f42d366b9a604816ea93fc3f590be8692acefbdf911911016a', 0, '2019-01-06 14:42:33'),
('397417c41757cbf2c655e47b3c32657fc681630cde8b8a4abe4ea276e32c57beafefc78b078ea051', '0a9e9cd719afa430d492f39a79d5a0771e9a36c171a406c6142fd6a6c285cc0891a273f0a869cf1e', 1, '2018-12-14 10:50:23'),
('39fc51c9a22651e5c74fbc3811b8adc505804fefc73ab97616804ead4a98d275751bbb84c1303a4f', 'cc5cb5d07642e4bac26c977607e5611948c51bdb2131b01fa0f54f5361bdfd8d467c6a1c1a7eda2e', 1, '2018-11-08 16:12:37'),
('3a0fe910f5349de82237cb40213ac299632ea96c7a71e307363ef99fc93a51092811f95b972e0bca', '2782a5a0666c2e555e0ea27191e75eb55f453ee81cc76d3484c93d1485f67e80901998367846d8f0', 0, '2019-04-21 18:36:28'),
('3aa1f6c5ad4781a8d73a375a6da404f17732dfa009fc1fecee17f61dbd359e91f62f77ddb95e2ba7', 'ba5499f252b663404039adf4081cd8ef7e206aef0058eb750cd2828953ffa5556d6bd6da30be469f', 0, '2018-10-19 18:14:02'),
('3b08ff63e49ac7f5944c467dd49ce94eee8674349d1ae14218085fb32758de193c4ce307c227b53c', 'fd8c9e8e9ff180359eccae94b914cdd955fed9d64fa8980927ef411a7cf82b26e836b8922bbc4971', 1, '2018-12-14 10:45:06'),
('3b6fd97a1ddc2a9bac943c16de7f8dd2c0ceb0b4ed297fed478ad3603fa264abae28295c497ad270', '91573f23ec3f153a9ac46867691a130a7869978c76b3e41e83946175485dea8612c1ff5c8ede1b15', 0, '2019-01-04 11:05:57'),
('3bed9eb594ed37aa853ec838b18b562029165b4ae2bd6fd56d3eee45d9492005c047c9112b66f755', '805ec2fb470a68c3558238ca4b87b63bd16bc9b17113e603b7eb1cc41aa57100e2ba6e5fbf6858e8', 0, '2018-11-28 18:13:02'),
('3c09f61e29e63204e7a5d9777ad80948c44b138f8fd7e7114cd1d32e5b32ecb23241f4debb256ded', '785000427b0c043b9f65ddabdd74ccb046236f7848eec26a6e29d361fa6c822754248aa880173e64', 0, '2018-11-06 13:41:39'),
('3c49a7f359ed1f71f4066ea362d4bdf5ec6b096eb48a6f7e927a28c44896aa1623537ed1cdc1acce', '40d3e325ccb65c5c409b3da7b1e698ebf9c1744a2804ef10ab1d81a66c96246b04e06499c87ac574', 0, '2019-01-04 11:33:09'),
('3cd0d1a70aea005071fa8df476e85dec646ca69a608640fb4060fdf0dc4d57d5cef01b9ef99c3902', '10e734c883a74da4920c0c7b14fa50355711ce3db7089eaa1f9b532d9166d0a72191c73b8e4fc6ce', 0, '2019-01-07 14:55:35'),
('3cfebe7d2d47fd9e714927737aa177e99e79eb5cf3bc800e48d8f1b57894cab3c704dba06d47799d', 'd7acf762f22fbd025243a42b70c8a81f50414da510325062deee45f4bb404bbf14c373aaacde361a', 0, '2019-01-02 12:39:03'),
('3d626925aad033a7ef878d8f1c46789a83b1a54f7732a757a298105bd1f7dd5d52d86c5bc20a2318', 'abda0d35adf51053b64df6efd8782a1c8bcfe9901870618ede09a113fc4e19f3e59fc5c152f87d1a', 1, '2018-04-26 02:26:45'),
('3d98646b3f1827f20338941197285d7ffa6f2a6142f0dd3eb622d81c2a53887d4aeb9c779969802b', 'fb5fc6fd369123d3bf559c49ddf9ef74bc94168ac079dff510efe28a8c90361ecd0f0dec61446721', 0, '2019-01-08 23:39:42'),
('3ddc109746ee62b181d62edcf2d6914035851ca3b69744dcc6d8c6878050213d01c283ea3b638575', 'ebfcd311c25ad94bcf8dac2d208d38f55f97b604a061b18ca8717d4de60d127a8c52afc4735e6716', 0, '2019-01-09 16:32:42'),
('3df8e251759ba1a964548dd259e1f2c855a409cdf6ad0adb9507f384fc7112e8edd51c74c3496740', '995910db629dedc4714f1fec5125ad34b6174c653af9130bf1e98d16f0e564b2f00326ef7d741e70', 0, '2018-12-18 16:32:15'),
('3dfd4526678a00d71aa610f55e662eb2a69457eafc6d4c18e1026737be6198625f47dd7e06ddb6f6', '6366a2e1a3450cab35dc59ba33606862f84d42ad757ede330d7a30cc860ece7e1ca7ce92d7b924c6', 0, '2019-01-06 19:08:42'),
('3e58e22d5db9dc06a613cbdb83f06b607ed4e3363cd30ebec15e242ace550166577c043c50a6891e', '4501c07a2c3f5880be877dd014c565ae5e6688d3c4ffb4092069f93813b33e2b805c07a7ff00408d', 1, '2018-12-14 10:57:17'),
('3e615fd8398347a34bfddb236d4a6c51a3ab0e53fbb647e59cb7ca8a88a4fa3a9f8a0b3f93260801', 'd354f4ecfd51e696d6b61094d1f13e716ee1c2671ed56316cbcd0716e77a81ba25ccd39436ad7037', 0, '2019-01-18 21:16:51'),
('3e8a5d7dc55ec0275ab9ea9cbe2e360fff0eed37d412df98061ebdd467f4164f272c359fe92159d3', '6e834f4054820c3b90cee8efe88eb61251654190777097ee1e25b3162b0d90810328b3149712077a', 1, '2018-12-14 10:55:52'),
('3f135d801a8be40c95ad376b819099a89b1cd2fbe9a3faab764cc398ae8b8893d412dc4bc32c4790', '9304ac18b3b1e9a042c292c6c22c5b08a2a4eb480b9b77bf76010d8ceab0f78f21c40bf7ec9086b8', 0, '2018-12-19 11:59:23'),
('3f7569eae94f2c9f9f1cd5a2368d397a1688987da0c36ae01e94847615aaeca358fd7c7bba71fc9a', '2b83b6b6ce62646266a0b38eeef628e2c3b8f4f000ca98c90ed52c07c3291b686d2fb8bfe0f0ff0c', 1, '2018-12-14 11:08:47'),
('4005ac17028242241cef0624a4fa4d20595cf95600691abd8eef8c310dda5a565e98bfd320965155', 'e54018ddfd729f3774882bdb52000b341b434ddbff8e55367fa4b828b31135ea9bdebbb38dbf7da9', 0, '2019-05-06 15:17:22'),
('40180bc468538fa00534680b8d2d7f2c1897145097dfbdeb8d2451767545d5a7f44570c37831f4af', 'b548b06d3861e3ce9441aca801222adac330f40c8bfb4f2baf3fc51f01288510edfee06bc4209f89', 0, '2019-01-06 18:53:04'),
('4020357606bc0a793822e3fde1fc3715272d5ec0a69d37e80f34a42be5752885449d281274571203', '78d5529eaef2560d2c18bdae98397247b3c98ddc612b3c8d5dccfa741483a1c65b2e2807312ef463', 0, '2018-09-12 14:39:58'),
('4056132dbe9085d32b21a13c54180976241e3f26836210557470bbfd113d7582687c5f510e584a8d', 'db8f5754dee29f8945e242cbf3c45d0f5e2858d0b7b05f0e84c15da310ee40bebe7ebd073994d4e8', 0, '2018-09-09 15:54:56'),
('407e714e2f014fdbf369a87d298a99b33388778ebe1dbbb00831244c13b3581bf6c58874e9d6e204', 'df16e85aedd7345979eb4a6888cb67ba82556c2d916ad23a3aa5e51d65bbcc52d79aee739b4afcb3', 1, '2018-12-14 10:57:07'),
('409777083416fb8ae8017479d3b2d563a5851104e5f6912b94ae28977db44ac12edfe870ed8e88ec', '371f699cba0da1cdd0cd7650517a1b4197729881d82787164f03991723fa5e12efe73ca013fcab8d', 1, '2018-12-14 17:19:29'),
('40f3152f8b48d3b3b21530f34e3ea127c01e8141de7d62a9dae9a76c41c8ec0c2c516a24b00cb9b7', 'f2847c1597b94cdc291deb5ebde4c08831114e919f6ecce503319600ceb370a834387e063e237cc9', 1, '2018-12-14 10:46:02'),
('416178a7342b71c3ea1fad0f035bbf5f2bf82dd4afb55ee59c973ecfb4fd971904967de439d2ed96', '724ca86597eb63b55ca976f66aa3ba70f0bf3dee7bc147397ae4f3d59e2a7ccc0106d7d635a9c083', 1, '2018-12-14 10:58:23'),
('417a4912a7158aee300514c6b77c550bc4ef468a4e937f4ca3c51191ed99445c36071dff0a977457', '030ff2faa5bfd856bc1b95675698dc6370d6bd17f1290edc1ac473ccb9ac5ff0f0f72929e7c06f4a', 0, '2019-04-21 16:09:29'),
('41d9b764a54214a0d29f9061fe66d2315c894292c9e37c50b250ec124167c03e758f92c19b2c27ad', '61b8be4e30138ce084e5afb224b96d5697de4c2556e1f23d8a20dd31dc821d0ea1290b9222d01f74', 1, '2018-10-18 16:22:07'),
('4258c2f4a824ac0cd3830960dbd61f344047512a09e090bc6ce2bf9ef7a0d3eec4fde57b05a4a894', 'c3e8c6fe2ef37086ba1e3ca90db3eb25ca334efa0a4e3c242d87559df73f839b6485e1537ee874a1', 1, '2018-12-14 11:05:47'),
('42bb22570dfb9ead8ddbd725fab82f48ac55e3cd99fc73e0bf58f6cc783f692a2d8b8e542dfcfdf2', '24721bd0ced3c94317c3fc77e1d7e727195e37293021c0fb5b53bd5b31c504ba8e13a652561ac75e', 0, '2019-02-20 16:09:55'),
('42fbeb85632608cad247ebeab5b63e8622e734acec71df705c340185a3e89f7b00c62bcce3659673', 'ad9a26ffaf596d7bc36993e2df3d8db547f92023ec44e97ee51b13331a1d3cb4f2ca607d9538f344', 1, '2018-12-14 10:47:32'),
('432e5e8bc1751dd9b2ce8fa397372ab602f3cc5d5e277d1d194c033a60ff664807234bcadccaf2da', '30764fa992b3735608f9382666eea3ccf123be40017450127d59cea33d1390b6456e18b4d774feaf', 1, '2018-12-14 10:43:52'),
('439b078537c463bccf8d11cb5667b77eb072d1f1fa8b79c3b9d0f1e41e396aaa452ff03c6c714bd6', 'c8567b91715c4a29b364bd2fdf6057ab6a198364a3c81fceb391a36b5f5fe050c8329a884192218b', 1, '2018-12-14 10:46:32'),
('43c42b7ac9ae8eb7c64a00210d4f16f82c1a486197e4de771a98e2541e2babcfcc95a20e13fc6619', '592afa9042beadb7e5a2c64c449df7a402a4e76c3e6b001b9289cdd6acd09f973994cc60039cf8bb', 0, '2019-05-23 20:54:25'),
('43ced136609fd22d9645ac754c4381dd9a75883b18011c223d6b070277f9a9b5850c87204f985751', '5c255b291549aceacc94ec0a7c9611f638532fa21f8e010848dc2fa940cc648fd9b8130edbb5d432', 0, '2019-10-01 17:45:21'),
('43dd278ef01d885a6d9b04a427571685054a95a41ddc8ee1c1e1ad6fcaf06a601407d716561f11ae', 'd19d16954304ed9b17d0bc8ac642d3bd16f4bf14494707dc93e62ed2cdfb9f93a9db68c37eb85e82', 0, '2019-03-10 05:09:51'),
('447b074ceed46d41d23716256a0b7bbbbe0350d5ec025bc788badc032a3c2869e1ae139d46cb267e', '6ecb10173ba9a28bdf28c6721d34255d1e63b83d41f400f0bda5c1b3ad755bec1d282176c5ce7f44', 0, '2018-10-29 22:14:15'),
('44d2730300fdb7d31fb25f54e4a9fb6714a3121698a626003acb7a0f2e7ddf21db6f51ddaf100e83', '2ca4e4d169e6954e8dedc30bfcb35ddc63cac0ed50e0f85e0f0e8599e3630bbabf1f579f9832edd6', 0, '2018-12-17 10:21:21'),
('4530db9f3b6d3c4c33ddb2da35614c5680b750ae46addaeaddd96d78b21e74dd8908a0f2e7d15db8', '1abcbc250b84de9a337f20ab7b5c6a82b32340ec1aa5ff06285801f7b8e938bac1f86627874fba6f', 0, '2019-03-21 21:59:01'),
('454acbaf29b991dbd2eed0e547545a2e0cbe432801575266fc5ebac00bea492a7c1af16878a2b80b', 'd5c72d3659ff8c5173d4451e428b09c553330ca528787a1fde86b5863208b8f143c3ea310641735f', 0, '2019-01-08 14:42:54'),
('45b4e971ef33ab34cdb74fe6363b15593267045dff1032d77f17d4efc9e19ceb9c3df9b01e772f83', '5ed8c88b86f01a44ec1309f1a78107bf2c29b42c1764410308a5bbefb2a4e04fa2599bb7625c9465', 0, '2018-10-23 13:00:52'),
('45be89b543761e5105516a00462769983194be0d7082046e1f4f0066091287d4ea8361124b12c709', '8a815e421793ab5a5e32472a06e01da38f9f0c557288737a5b7a986d91b224cc8a56153ee3012510', 0, '2019-03-02 00:44:51'),
('45cf166349ce8b97b94abb2f1ec6646675c4fd9d9b8f4cb0430ddbab184c00a912f3f3cecbc28d8f', 'bdc437d9bf00f1e15998a5036072b883610d6f6df6929c78663ff0f643cc4ec290788eb5377a6d06', 0, '2019-01-13 10:42:27'),
('45d3ef27fcbac07ef321c710c7af1413118922d5ed22dc9d74fbdcc691be7fcaa43e7d25514cd266', '7ae23b7c60bc772fead08f0b61938419b6ddbd59931743f62ea09f2d45671569c031f6ad2c128c8b', 0, '2019-04-03 16:18:39'),
('4646cd94630c278bd426a740c4f7e89e291ed86b3e468c2aa65ce2b2db3d6eed8c4fd6ca3aa7d67b', '3b28622c69677dacb22cd3886727c8f2e93efba57cb6b6c965841469ed69c6bc2d7b22a255d0d560', 0, '2019-05-24 01:57:33'),
('4672cc68ea66bc484a1195390b1af5babfe736dbab8ae6f7d4118a70c48679e8b5cd6e319fc0df2b', 'f5ae19299f48ae307d861e2aa17e3976460ab7820eee82729a2b8fb950204581b8716e1d03532f8b', 0, '2018-12-17 12:34:55'),
('46beab4355919270c0dd9ce6838faaa9226e851b03d14c5fcc7efd0e2fb15c2c58e54a5a39ebeb0f', 'b2209076e12af65999a9179ec863641a2f8b25a3184354f223bbd1662e039be2f9522913a09974e5', 1, '2018-10-18 16:22:20'),
('46d249ea3fef49b753b0c8360a442c7eeb9aa995feea155b91997c7b85344c9c7239a25d66a557fe', '04e68b57140b0ca092d61a2f5c1a680a13f45496f7ddb4b4bde1beff05a34bd0d334adc6b21c487f', 0, '2018-11-30 16:21:47'),
('4738fb650fdbe026b4d56a5f326ec8a75cd953e79950cfa8a0a6805a4cadaea86fc262e868de4133', '0fc45fa2cd88236a6f265491ce139b74c41db32c71c840e17e8db80885711fdb4a94846640da7522', 1, '2018-12-14 14:46:53'),
('47b0dd92e2901cd642773e3f2318237df113b3c62687da04ba38dfcf55258c8da9871789c828aef2', '4decfd19567aeea91472c0b5ca04ad79839b2d06c5526113dafbd533c95df7d6f4931df3083fa7b6', 1, '2018-12-14 11:00:57'),
('47c38bdf5c93c952e953c3852a933afb3a70196748f3c6884d11d993f11f3cf1643f04e9939a40d3', 'b363692ce0e70d328792f4969c88c0e6c0533e5ee29a447af16a52d9dea7a9930518616953a0a4c6', 0, '2019-04-04 18:49:14'),
('4838684984dc34385182651381dafec9369e08d43b6d1c25ae77acc5b3bcff7c01eeb7fa1bf113b9', '3404eaf623ddbf5fc3efcc1378672857ae6337b184dd48c33a0acf9efc513690328ecb87e64127a6', 1, '2018-12-14 10:48:07'),
('4849e0b92e836b413ae85ba7c51c5e72526eeda1dfac42496cf4ebc0eee407fb5e63d170d4cbfc63', '5a16dd83196e35008cd8e8e830c808180ba5974520d099060391eb909c2fee09978f95c7c029e4f6', 0, '2018-11-12 19:48:31'),
('484e08e55453e529b6d3635e12a133910655d3b271e3525afcbbc4b192087d76c7a72f2ab1cffe5d', '0f35e27843c73edcc07a7df1450a82a2b9e75fd4ea92363fc1c09a36fd7c533d6e7fc242ac748cab', 1, '2018-12-14 11:02:17'),
('486499b47e4875f2ea939de01dbf99f69a7a725684520bc1704fa0cb7cffec80d24406ccd47a76b4', '6576855a8cc19af6db4f491d69dc35c1fbbc01054a721cf2ffdb7e0fd33cbb2573e2e24b2bc81aa0', 0, '2019-01-08 16:29:33'),
('4895b6c632f0ff798ebfde456a368e7d760a995918840977f7d32ccc84f46608a3716592955185b7', 'fa81fd2eba085a7ab1b48b202e5a405703e0dcfe3484a88d8572ddbcb3ede2fa5dfe24bc5dee5ab2', 0, '2018-12-18 00:21:46'),
('491bf8774c07f3eead8e13f732fab0d880b8b733a5cbf760333b92d342506d8ccb8a165f5207f01e', '71c24457ac0b93fb32aa6e53d5f7f5c45d230f735180461dc3876b19f44c92c770806fb3721b3e01', 1, '2018-12-14 10:55:42'),
('492331950f8f2b3b2ec855a1d2862d7f50149d025a37321eb077ea14339f8cee73403385fa2f475a', 'ae7751db1b41c7edcb05d1083181d5f391ed8d8a6e4cd80911c4f5e8d0f454405335c6167cfdb37d', 1, '2018-10-18 16:21:59'),
('496bcca8b32a16d81dc8b35e04dc439c0ae5433ff8dc6686896f8d9f4b173fb05de5e77799e9ff53', '28933a5a1989f6e34b2aaaf5c3862e30d0f97b4c5504a5fac6e4e32798103ad399f3f307b1e35136', 1, '2018-12-14 10:48:47'),
('49cbdc1abcacfa0db405cf19ebb56913cfe67f6812ee922ef79c9eea4fea6c02b3823a8807f218d0', '8b5ab4debd1d966b19dcf16d0650547b29db3d889ff5a1dec7b951c70b8df4ed09f05475e1bb98f7', 0, '2019-01-25 11:30:56'),
('49d3631e4c3d23d2e9f75f625b8d8a234f22c5c99cf5fb19a16da864e9835df40332248682f7216a', 'c917b8ddcb0dc4e99637f6ac35c2d6a59aed764dcfac8975c7df11e557bae2cedbc07e975795d3b6', 0, '2019-01-01 10:38:28'),
('49d6c8a2d21d7cb9385867864f53bcb351c44af36f27187940865cd6843b83f0863be1b4c174646a', '200164d1bccec09311a613d6ab5847c5faaff6b9512d2689890cf3b1116cad772834f5aadcdd651b', 0, '2018-12-05 01:48:21'),
('4a5d75b4d86c7cec524cba8cb76f1e6af68889c0f365ee1d69892bbe59ad457bc515897fe00aff52', '0afccab79c480df1f70cb480da15b2bba5e584d327f653885d026c3099ebc6853776a2deb49da370', 0, '2019-05-06 15:14:28'),
('4a793f9df301defeaecc6ef10ccd1be96b7de23d4e13f8a43291c1120091302b5fa9914e8f89f676', '075b40bc2a9abbfdec000386ca00b011c198143ec656f0a98d795d0f3ba7f29ab2c63aafe46f1ae5', 1, '2018-12-12 23:11:00'),
('4b274ba8b1b722c1de83d6c20cad74a46c7d7b9fc1f796b93ffc5a1c49cb182e40e6ad6220dbde7b', '8af7d2473504ec28bf7c18d5e86024b1daece75d28e8de943c21a3060d3c061da0cc2f8aeab27f4d', 1, '2018-12-14 11:04:12'),
('4b519f91f5c9be72e7c7ef5eb182ef613373015a5aff7397eec48f6c27203dbda044781be541ca30', '365e3b87177eabb27dc81887a8f81b09c1dff685c68f87158c4b6707594b9e51e297df83e39205d2', 1, '2018-12-12 23:00:04'),
('4bf489b890637d54b937b6058b80dd532a4500fc5ea9f1ca069a0f0fdb62d29d9bf0b7185149695d', '1af28bbf2561bb0e357c681d6af6774792899f049f38820fc1fa1f971b07a179aebd2a8b7f855262', 0, '2018-11-03 23:00:28'),
('4c168bfc274f66ce177475b5a24f9276fc4a2db106f7b5e4c0694eeb0e36eab5855ccf413db65c89', '7bc73e53c1da350a8ca2df0efe17eec6651c58e5fe1405a5d95cc06c01f2de3e30fcb0e7dcafce8f', 1, '2018-12-14 10:52:47'),
('4c1cc3aa0526e52275a40d2fe10ddd6ddbb7ff0b2d24e6737d6395881388b2f37ffaebff6a258548', '189485a5bd40481c94d4b4bb7c768aec82a6e67f1d3c20daaddaf01fd98d8e06c16aa8deaf94b1ee', 0, '2018-12-12 18:14:59'),
('4c33200b27e531cfabaab8f7fa3a721cc7046351632894cf680224c8d891ed57973456239347b004', 'eb51a5617bb4b950cf288cf1a8ac5beffa2d60790aea4373df4bb668a2b2340ce122c9515595cd8f', 0, '2018-12-14 23:32:26'),
('4c452e74b291977cc78458ad1d9fb2019144ee45f4324c778f2a4c00b2b36c0b6fb5cbd760ebaa44', 'b1054c11997d3c2f38573ede42a26e02d06bb022b48fd73dfa708e161713bf28c6ba83c126468682', 0, '2019-03-19 20:38:37'),
('4c61b5d44443b280b12db985d9c852b9f54d779a26c94ec355696166e22e77741a058e02b90b5931', '865cf1ba3a28d4a1aa181b8cf0ededcc72539d503bed4bc3e616625e1f0245c4a8c685c8cf4e23f7', 1, '2018-12-15 13:43:37'),
('4c6720da16bc15f057c1588366bc3bd8cef405fa293c9bbbe744a59f3312766d5e92e931c5fe3edd', 'baf1cf0aa788c0a5a3b85e0f5dd0663d99076e6d79248fcd5895a6ce441e12fba0951b68daeea228', 0, '2019-01-08 16:14:25'),
('4c6da01728591f2c23bf8f30b3f00884e16c520dae7fe8098adff8bd884152eb98d5c52b656176f8', '1811cf0b30c807d38678fe186339dc389df8281ba2c750f63aa1b42c58522381831ff6a9138c5baf', 0, '2019-07-22 18:06:24'),
('4cf700da016a0079b24361888d01fa1a0fc680f5f2a024fdfa4187cd245efa48fe94965e03d92105', 'e240272a38f67c00e8c4c9016ec07bb2a59d2616cbe7550bd0e318729d42c9fbe4b4138b9ca60133', 0, '2018-10-30 10:58:59'),
('4d44a0d0abea02a8ec29a63825ad97ef900894a61518fb54a5d062ba24c3972abdd92eac6257528b', '10e1d3a6517845b4b77769102b251f1e30d5f8c82f29988702e29766077cb6db56d1bcc939574038', 1, '2018-12-14 10:53:28'),
('4d4f25e308ce052fefba76c6e182b7c17ad25e4aacf593f7a7a1daf70a553f48acaf86054a1647d5', '5bf230e9262654cf7abdd1aaf6e2ead5ee5b4b6a30bef5e2d9d90669fec42821e59f2e74cfe8e1ef', 1, '2018-12-14 19:23:33'),
('4d9f3faa799b3121e9bd69e8523fb6aa8aef4a0dca57e0a2be2c819963f2c47b7508fefdaeaf265d', '188b04549815f766f2b0549a1b41b9ce8041c2abe3d07db0b51f53117b2cef9214197095f3bee242', 0, '2019-01-17 15:58:52'),
('4e1adfdf7ada247cffc245fa562e8dc0ee0fc1d495f646ca1de9cd57c4c31b839cce1f0d74965f56', '1d83e53d9de9acbdd4cef886cd544fdaa2946e33760a2e09475682d375ea54fc5e8158e28fa96681', 1, '2018-12-12 23:11:06'),
('4e6ab41b4e4a51e4d579750944d8b5119ce65a304de481074adc1d7129808c3416c984a463fd4728', '0811e8546c0823c49d07a7a9f11cc32192f15f078d3aa8f4d50421e5fb9ce3b1d7dec366641797cf', 1, '2018-12-14 10:59:57'),
('4e75c9aacc26fdc34c2680e6f244657c7adc96c101590068f5d93d385f1c8002501cdd9a1d78b687', 'b91de0f3472423088aadaeb2d6d28dbd892acbc9ec0e9965799e8e1f08fc236160886ce03fe3d609', 0, '2018-11-04 11:21:15'),
('4fb220eb9ecb07ae2691eb8eed8163d4f9145cab0e1eb244d36a48de12ef4aa35e3329fec93c7377', 'bc576b4443718f16e6b0d7438f28bb3ee37cd0ada312e04bfa8849ca7f7b5800fc1ba7fc4a354a64', 0, '2019-01-02 18:45:54'),
('4fb62acca9d05354efea6221660f8afb615586dc54d33d7c8cd42056bff792b35526412d3150c162', '2f1ea74ec8d8645092d32daad50bf35a56679626bb4bda32701c25db8511e49ac4deb0489960d2b7', 0, '2018-08-18 12:59:23'),
('4fc24caa5bd86baba6b9f02333a451177264fd070b8e99a34d4071ba13153de5760696abd7fa39e7', 'd579fb7d25bd9ce2a285f3b57c46b7fb5f70f6fab691f28131203c72667e0e59a683a6a07d9d109c', 1, '2018-12-15 15:21:23'),
('500f20094e0a57f92416c8d32ab2e9c6e489a725f4c39735faf47d5ca53666ac13f60cd4be8a2e8b', '9965bb36d31688adc0e918b3ffab02d9a479f84be75c7f5dc6bf6f9f3bd7b4064e5a928ee4cffc0f', 0, '2019-07-15 13:29:02'),
('50aeeb1a83320a2e5cff5d59427851592c02e9bd2cf1ab2dbe54d8c1ba108bca1538132faeceedbf', '17b0ba2908124389d261b6c47bb56c5246fd79179025d177b4696db6bbd8e8dbdf5abd04e4aa72b2', 0, '2019-05-07 14:51:08'),
('50b998d44aed43d80033f7f54148e395efb966f3d477b88663c78f7b95a01a7b9e5ac31e92ae4373', 'd90a620038a74bdfc4edafd46bb9b75d51995e3b5623335cf939d9388805ebbc6a588331fe215a06', 0, '2018-12-27 10:03:29'),
('512004ace57c2dd0df67a2dc352c5763ec26be4faf5a1503733bf5195ce14f130cb0116579f46976', '15269a4b0c607068cfab69c815c18d3c3be0a0b2cb6aee1e8116749c648b693894b6437a83c62680', 0, '2018-10-29 21:34:46'),
('51435b916165e187eaf2eb99731e2ddcca872a678f8f1a4653e104a0ca903155880daca0708addf1', '5367dc4e0073f33348d58fbaa01ac0bde7dfffcfad1ddfd0a6d4a89a13ff07d03f2e90badbae4f76', 0, '2019-10-07 09:13:15'),
('5191b39ef9c6ae584ab2822a3047d5a401b9fc1ada2a819fcd31170b9eab8b00e11059808ea3a4b3', '107cfd5c52903e490c6c6d5f1c242cafcccf383a5a7703b2b34229adf76342a23ba7232a00b10459', 0, '2019-03-10 04:51:42'),
('51f0b89d017325e837bfecbfb6570d436b01a6793bcd06d2aadcb60fb725f053a003e0c130602709', 'cf2e608b9d65ec149cb1349859b9bcd0e85b39f7a366b766c30e7acf322443358919de6cb7f53222', 1, '2018-12-14 10:47:57'),
('51f14532ca78bbc4424e43d02a1c9a72a7165506fa44cae23ac332c67ec328b2b37464819148eace', '14d21a325e501d2742fbeed02872753b48225dd4cc7454fb832a4540868c66da21aad5e7cd712a5d', 0, '2019-04-05 14:10:30'),
('522e8a361f943edf9df7d4fadd4abfdfa49791f59948023b3c12accd03eb18d342e6f5e615e75743', 'c8926ff78213d2ce7862e1fa657de3afb9dd831ca75ac08062db38b0e499da58e6e39ab0ca842680', 1, '2018-12-14 10:44:43'),
('5254ad3debbaaca562417a6dca74e81266a9899e78b9c8816f4658c39cba94cd3d006e1f97604337', '5ce9bd2104ff36fdb391a6c6e7dbf2cb06a442a958a6a7b95da48ccdccb991071822cff1fb3108ce', 0, '2019-01-04 13:22:06'),
('52ed4fa19cbeaace11c36f9b2e83769ca2511ea9ea542fb9721349828ef34642b7b62b8b055e265e', 'a26d9f5cd11dda566be17e32e2e7515c67f423f334ac6b8e12cc69e4655719d607b3340fa51c7f50', 0, '2019-06-25 19:18:39'),
('52f832e0039321632f4496734f0258a1b0cbd6e2906dad0fb9d0f91c2608a8398daa20318efd2bb2', 'd195a10d823025ae910d8fcda12fe1afcfdcd7bfbf351b4028064af57a3d3405d90a6c3f3d434207', 0, '2018-12-14 19:52:31'),
('53325f6e3c18b8a07cdd373469769a9889c4f8bb511e898b304e58f878258d19798746726237d65f', 'de48d20e1b9e6f556a5d5efc091e13e7cfb360958fd87d2bc0aad7ecd590bd7d20c8999883a5f825', 0, '2019-07-15 19:47:44'),
('53349104f0673fb7185c1dae3e8577dcc10646ce101a564128f5e3e7df1b50ad468def38f0920410', '6a3dfb99965fd64b61ac2eb3d819878a63c6e39253a3617415efde2f1921f10f18a053913defe856', 1, '2018-11-08 16:12:41'),
('53557bc751af2dd80aff3f60c6e02df72ec6a8f4e21705e0ec76e23180cbe3141f7186db66a1d35e', '84259b635132101d38beee35ac157d9e47b1d62037a72ff16cd4a45164048959aa6304312b21c373', 0, '2019-07-15 18:30:35'),
('536a73332217acb6f6cf651c311e2865cdf387af6abc36e22cebff296bbb630832a9df76676830cd', '30e9d700d3091c8bacd90e7f80bd10f25d471a3a9d49eeb4e48bc1f1f7ed0c2773fd015016a14445', 0, '2019-01-03 19:05:06'),
('536eb231f861a2c9d79042f31ae7e5dd51dc1abebe797f47e15a05706d4dc3caaeb9f2162918b677', 'd9d09cf465742d84b1cdc87e377ba34057091800c14cdcf218fa849b17fab32d5adc08b07e21f87c', 0, '2019-10-02 13:01:44'),
('5390c6f46f659034d8263a317761cf143ecc0a5e3bb98e741a11510d760a15f0920b002255940bf8', '28e19293252d1c04b7372357e4f277c3cdf242d23e6b8b3b3ab15de781166d9fd2ddefedb5491a81', 1, '2018-12-14 10:59:37'),
('53a98e71052672552aadb7275ba79ba88aa9e1f390a25df60b7d31b0a58a5eb357c41ed58dbe9f90', '6ed7af350863e672d407764b56be5d74a3c1b8397f3c9b5d95028ff4db8c095dc1c0eac17e607aba', 1, '2018-12-14 10:52:37'),
('53c609bb04193cf6ae844160932aa6e85d6672e8e3089edc4980e77c488f022d49c01eaeb89104bf', '2bfd702e0db7a8d0504a18f1bc928c1f089327d8e2be3a73de14285a52fbc193a2ce1cd55f0d48e8', 0, '2019-08-07 14:53:19'),
('53c911a3cbcc83b98829b75896a14bb2aad39b15590f940fe546b7be4a0d4465258d5072e2e9d957', '3c91e3c50116b44a78ad08ef3aec9d1e968fff8e0df3a6fd33b3c322877d133a8d7d269cb982c879', 1, '2018-12-14 10:44:44'),
('5428028232441d4028653e0bfbb9721ddc5c229cd0fcba0e8c67ba5bb9f6977dcd0851454aef6157', 'dcac319265c442597ba947d80c8e4042752e5999396ea71543fdff69cbf6ff7284a4f88c71f6edfd', 0, '2019-08-12 14:12:36'),
('54454028477a4a75f68b3b709305e370d4a8e0e02720d250777434b37b3739ceca04467a33cb8f3f', '2bb819e5dd4727aedfe3043e2ad87bf5935eab9ab8542ba5a370cf01d55dad687673622db2bcd63e', 0, '2019-06-05 17:15:43'),
('546d1ee0f0b296a117c6eaeced28401c48a38d9c5e23db2f443289bf8b70f0b6ba3ee0d1d5a07bf1', 'bd5f8e089524f03aecd3f87b1ffeb6125c0e5dab5f3f4a603ba98cf24b012bfdd1c08e71d57b7adc', 0, '2018-08-29 11:35:58'),
('54718eee2a89e25ecb8e290e0ed3c19e8f3eb429f2b154b7c3e6af87a1c26c7502cabb0c38d81833', '80fa28a92649d7fc654e06bf4e9157e0f96a27f1039c38ae122dbc34e08588ffd54bcb1b1dcacc24', 0, '2019-09-30 20:35:09'),
('54b1947103fab15fc10734f116637399ffab597ff8770f889ace9c7705739cccc3da91e88e774144', 'f94bab837b11d935f223c44e2096f5f135ba18aeb98d56ee688ca80221cc8c2aee56aa57550938ca', 0, '2019-03-26 20:21:40'),
('54c97abef7ec94b048e63b54ce770ca09f220efb9f7f33bc5aff71a6de57142c33b3cd0764a238b8', '89eba9c106063a2cc0a09a8f87971420bfbeebbc844601d3a74068d2c2b1f8d37c1daa3824db6be2', 0, '2019-03-28 18:27:13'),
('54ca2e4c4606757dc29772d8e8a75e63fb28db95bf77a9fd3b3a8807ff6ea05b26a06a336a4de9a0', '468077d2bbf79808376f85a0a9d041acbeca4d17f4e0f5efe4fe4c5b4c47232ead05f35a48ef0d86', 1, '2018-12-14 11:04:57'),
('54f65608e3bd3dff356094cbd4008ac271fc9ac0c99afab9d1ca8f3f4269a69d160ca78f7594b614', 'eb9629bd07c4b953ad0e39c5a083d5e0d11ddf6ab97319087943de3eaf9a0add9cbeb6a49d4006f2', 0, '2019-01-13 18:27:12'),
('54f6757b823db79b062d3a3ef41e647bfde419d76375bc22c8b7508e58cec0f4e1c599671c30a409', '69766ee01de9977b7a843782235df4772070b3bc3e0152b8fa33309f56224b7d35260281d0f71ba1', 0, '2019-06-04 22:07:27'),
('5500366b3e2bfab5b93fb1d8d69ac9a4c0365e5f83de80dcc3c051d4763dd2b2813fd798d7660359', 'ff195ca96666d1592d0180d29e9b770585e24e3f79df94f41861804a2eb57d950e7f17b2aedcb194', 0, '2018-12-17 14:14:19'),
('554cfefa5f871251d2eb57b486d126284b7bd43b2f45b7183fce7ab7ce5e369fd2aad33ae0f60a9e', '0cabf5e5e4c5844af4df1a6bcd1b6addcb78e5f11208596c4a4664198ad0a0043bef6f0c849468ec', 0, '2019-02-11 17:00:02'),
('55655d11562daad170de3e0fcadc1459c74fbc5af53ee97996e6d444b1eb43b544c9bb38c8ceaffe', '771849a65409f479e6a041c7ed376f8d6cd79dd8f1828eab567b2a4864f37498860375257f0e925e', 0, '2018-11-30 19:05:19'),
('55955a2430f807f17fc25890c41765a552801cce1bc7b86c4a9b7927bb6b1910504e1b2c58858dd9', '849163e0a5d400ae2edcd9ae2ba63974ed47b19d426bcf7cfb62aaa11b962e1dfc83a023812ebdd6', 1, '2018-12-12 16:10:11'),
('55c7301f4222b83f84c8e735e870c921619e63739fb70f424045eb620e0700bdba7f94ef3b329a50', '21e921c1d69a75487bfc453be3b1580b431fe39b995f27c7966386787c64fa022011e914cd3cf1de', 0, '2019-01-07 14:37:30'),
('560eec23339fdecbb8e7bc88eef7ddd2ed688eadd1ceab64d65790526eb87bd9ffd512c74993e3e4', '6e765b2534caf7d22e71ebd7199f90ac7de4cfdf728afc3552a316fe058234489d22cc90723db2bd', 0, '2018-12-06 10:14:58'),
('560faf7a6aff201ea4a64bed038508f8c3d75ef6e0c7a9351114dffcd7dec1bf8b0e32b09b1da230', '3ed7493e8c05fc8e96ed03066099850da3edcc7779d27e6dc1e906c175411951769b9ebdc5a10e1f', 1, '2018-12-13 11:52:32'),
('565eda15a3444284bd41ce39d4ecb6cdf0488dcb1c4c920be799391cc6ca78b1f348cbccc9deed78', '00ce99a27b100edbd9d7f30f6d6263e532329d3e1c740850fced532dffc6ca249c30de35de72db63', 1, '2018-12-14 11:08:07'),
('56880aadf6a3015e8a3f0389730284c0cd3f1c62734a4fee88aefc4a7cd23ecceb95598c0c212f55', '4c3ec6ee152b7407ace4ad919b9b4f5cf1881c811599f19073ed07d085a5164c13917b27d4bb71f0', 0, '2018-12-27 12:39:06'),
('56a40d5f45b8e30211712387dd5e1abebef58a43f2ec4213158cbe8d185b93743ec6063fb433d2c6', 'd322e60107f55982c1bb92360c875102fc83d3d08ef7d70ef9879504ac722991ff1d8d5ad6b7200d', 0, '2019-09-21 02:48:42'),
('56fceaccf5288986f494eb7b94fe358b8fb1841facf4ca421ad19da89770a5e0ea92022fa3c21bc4', 'de0f0c22b3472aa9a22aadf6abe2b61933a9229f976620322cfd7024dd04f9f794a9f95ed9408653', 0, '2019-09-08 18:38:26'),
('57475caa7efd62f544fcc23c153c13443c58264302cdf78f30de27dd123a53de626141bed5374903', '1d95f3e102bdab18aa651011d9f5ab89ef1e4c8a05ca25029f3bb76a3c06f15bc8ae1873f9fd3b58', 0, '2018-12-26 15:06:34'),
('5756fcc67e397747bf15c587fb871f8e8b9db38179008863defa37f643c160d7816f896abd685f3b', '9cb7c7a654abce120991c5d46ec680fef713ebb8f828a8306601d6c96794f1724bfd3c43152d03be', 0, '2019-09-15 16:44:54'),
('576e0c294a20044108d89c500b66f2e50b60c48bdcc5ddb7c0cb618223a45c2052706fe15300d8d2', '2d1a6ea866d58d658a90428ebb267c05ba652d814f0b50c44f6742d00f1ae6af895ad65fab281e0f', 0, '2018-08-21 22:33:27'),
('58191cf9ba275166a4b55d8713498f514c0a649f0deaaffe151c4361835218eef12877f1b6a82071', '37420e96c6e806391d769e8adb230733b37eb01c2c7a0e578c04c82ef38b8ce41c2578f0e27cb356', 0, '2018-12-21 11:13:31'),
('589b7a507176d359a397e2c6dd425eb245af3f6a5b47b54d8550cea412d57282af33c42b519859e8', 'be890ab8799e43d1997b2cb5d6290b3b2bb0534fdd9c5fcbc3a1122a77a0b5beb7d0b5a026b29004', 0, '2019-01-09 19:26:31'),
('5937f2f7539673d3968cbc525f495c2f2f951f1d565fb2e47f373df530f3b33b0626f5eb227660d2', 'b7588078da7890120b0dcf1b67ec5dbee2e4a91efdf26f75d8cf8ea9b2d471cdc87c11eb5ed8af61', 0, '2019-03-26 17:19:21'),
('597804854347e4658da6060b28ed0dbc4604dc143856bba7610953ab2b0122e99c4f7c36648cc606', 'ddae8d6bf334d3349010c70765778a0b307e200b9771e2031d49e512413f25e5ba556643d0fd1d47', 1, '2018-12-14 10:45:56'),
('5987e0afa12ab2890056d2b223a868278273ac27f10d027545b7bd2bfd634dc93ccf27b4bd4c9a37', 'f9a59f62e018ec51e43938b83aca29b1c056c8832aea861a9d63c00a32fe0cfdcd34dc5e21685993', 0, '2019-05-07 14:36:19'),
('59a906f91cdfcbc76ee0a6a8dbe18cca01ba730d86faec70147abf3667d4f707a81a94a6896b55d5', 'f5b62a7cf08920f2b2776d426acb56fdb9878ba885d747a5348dffdfd98aa23676d4536a0c28627a', 0, '2019-03-26 20:41:13'),
('5a7ab53da9ffdb8644ae36f2069ecafa63a1580a387db9935ed4af32c08b8655a5aff1446d1d1968', 'c193ea176f7587bacb6630bfb60425dfc32dc83e97ec2a90e2c55ad5f5df0563aa083f369c1cb31d', 0, '2019-04-25 13:45:41'),
('5a97217d46c5875369ac52d40ca6a94f1f16a311857245cab44475b55772488b2bbd169a66b2f10b', '8657f746150192913d3593eb45d345b8e52a0ccb8927e0666e4541c9bf432ef92918c6c6feff161a', 0, '2019-01-04 13:16:05'),
('5b0f7e297ffa6fc684b8c01d6eb60585a573335b3abcfa6c357d7a40eaec8e1ae1924ff7266a0d9f', '5c9c2c0edee3f960e6df33e16b65b66d89e1b2a4921561b30c4b12e1db81a9e7c0b9067564840ea3', 1, '2018-10-18 16:22:19'),
('5b8075edc8884bab92940a34133535d008ebea6ec3babb9161c8c49e6e3dbc5cfd4cf7a9594ae9e4', 'fca3ea216eb900cf5074ccfdc602127e31e3a6e84c505762b2a6f6c57b0590439a23c653c162e1ed', 0, '2019-07-14 23:33:56'),
('5b901a319e8bf36dcf52ec960e81aa6ede2c5e8f1e4d2ea20e83c6a6717b2217b2b2391be24df737', '3ac727d7b5ccdbb68d6a98ab60eac224dd7c67e4332302eb9c1a53d4fa6d32c268b4783f9b8fc8cb', 0, '2019-01-03 14:47:25'),
('5c0152faca5b82a1b011a8e8594aa2460dda5ca6b21115479c5f08e44dc2717c7afe47c8ab4f2cd8', '2ffc2d336e34e0c53977de08511a3924dd80d16d8f2fff6be59d7f3bbebbc9dc41add17b479422c8', 1, '2018-12-14 10:58:32'),
('5c03ba236c33c6ad8e26d083b74593dbf7c1ef9d23a2e81f1c0c8602ef1dd16999771e7be6c3ed04', 'ed671c81400108f7af01041a7ebe3857e905478c06a4459c9bd0a323b5b24937ba0980c47d0a82b7', 0, '2018-12-17 16:49:22'),
('5c52628ebf5e7decccbbf0eb3233c0b3e9737baa681a077020df83a7df37ccd08b421a3ea714d641', 'fb7de539d0859c15514a7838bdaba8ea985617401a4fee55243c74a04a9b569f297ea7bc74ec5f4c', 1, '2018-12-14 10:58:52'),
('5c611dc49d5b6a3b0057a4c4c46dfdeacb56366fe0d60aab33c7778b48b0a1bbfe14f42e0df4c810', 'f1fa47ca6bb83d1c880a9c617a81247abafc1f74e262c05839c023d1fe6d3de8d9b111d324a58174', 0, '2018-12-14 11:34:57'),
('5c72a59552b263a0dace9f36d65ca1c278d4b9d406dc9165753c2f77dd00b6eebf95f96e3826b9f8', '0c9efa0082748052ba8ef74e17c9f7f956ee68500b97bd1b65f5fe22161c3456239e4829047f7a60', 0, '2019-02-17 15:44:58'),
('5c7edea29aea9e9433f60a27ff6dd9280f4b1f49c200b3f90709cb7f17c83b0fc48ccfb9597fd1d0', '74dc05b0f70fc6b66fb3231443cc0f8f2611ca3e033c7b57eba36cd57a36386fbdb391651fa2bd42', 1, '2018-12-14 10:44:53'),
('5c8d2999570a9e0ddac5be1c893b4836eeb5111678597eb8cf4381da41771e52693eb639295519d8', 'a48232c915d05ec2520ffb150ea94d3fb88c19120face1df2ba45bdf8e472c7039491d7d0461b1a7', 1, '2018-12-14 10:44:02'),
('5cb737bd05c5c62f016d7e4a559d22386fdfc15af9a909657fe66c6d7b43552c57ed988fbc240587', 'b3cad929bd0ba5f36621ee3e51c0cda8ff63a2b900d9b1935daf8a585a94eab09414cd6cc2abc84a', 1, '2018-12-14 11:01:52'),
('5cfc8418f0e7cccd57089950b57c6a289d445beffcbc9be16c4d3cb534df65f6d27bb3ae896e8248', 'd6923ce45afee26905a35bface2dc3b722f2ca6a714a8c1846342d85d36c5d9926153ac424ee3a06', 0, '2019-01-14 02:23:20'),
('5d1d809c803941b16996903aa2441d8026959ffe84be7c82a6294f15e630d07f6005c886e30b81c3', '36b95ea4a0f719959bf0e335d1d9ff87fd7824d7b222240757a18138e055c99e4d960e0dbacd7902', 0, '2018-12-19 16:55:04'),
('5d30d6b55de851b9ebadbef70a855e5c3013bf654ee634636c48c3976adfbd8324f2215ee6ef669d', 'f648122904ca181132dedd15f0a1f2a6a44d5a9d6fb21ab451b3b69de598108283fb9c7f3d32b554', 1, '2018-12-14 10:58:02'),
('5d51fd2ef6294ea9054548ac33e41903471b903f1419432d8d5bfbee77f9c6ab58a80d8f60651644', '979781a6fae3939d2535d7d16bb6ed3dde39c881eb179a115bbb84c463020e27aa7292cdbe9269f9', 1, '2018-12-13 11:52:41'),
('5d76ccc1bf9a91dc5bd75cfe9893f26b90c47a6756197e3070c7c2d47dac427318b39c50ad38a606', 'a2894319b88fae63e8dd2f33c32842cb6efeff64616031824896c1fd982e358c84052b51d954638e', 0, '2019-02-11 13:01:45'),
('5d8ab962ae41ca47df75cb64bdb1fe041e44f1ea479455276bfc957045de19d87398bea40cfdfe30', 'b7a026493d35a0fd5a1a089bbdc68c0f2e79be369a037c6324659e06c8b27fe5eaa759e72c04d799', 0, '2018-11-05 17:40:34'),
('5d8ddb8394d5947ed88b2687c8417b518cc217d69325484f0cbc2f4526fa7f216e1852ddc5722f23', '3fbcfbadcfd91e5d55b37888fab02d9d458074956042b95829071b416df222f15f9d6a138c5292e7', 0, '2018-11-06 13:29:40'),
('5dbbfdb80300a8bcf5fa6aeba7ca5222446fdfa69b602ed4b38c288717de324236837dcb8873826c', 'c66e0cd0bb4a78058b46868f2a25d0768eab9b05f04bb494fdcf0c17fc59de38d36ffc1bdf58dcd7', 0, '2018-04-29 00:19:50'),
('5dc9aeeddabaad8857b181b76ee79574f44b4a1748d91053cc01b042d659b7cc8368f5111486a9e6', '071ddc4658d1211a33cf903f07b5c7434e13e91ed3efaf38b8f2f2f27555a066f174503234dffacc', 1, '2018-12-12 19:26:31'),
('5def01d8269e4d003c58f961d1fc2f0e7575cff2c4666ca680ea2921632ccd840b5c734cc890e41e', '9f808835edf82403a133657a7a64be0975d89a2ba7b356264f3e84b9d018d952cc744287e8417b53', 1, '2018-12-14 10:50:52'),
('5e23a82c9fe52483fcd8d78a48cc19fbfd87b3f080d87fc9bc04374e259e31ced8d1aa5a30d03562', '2820c982f4f2d81ae93daa49bff1391f41af941bfc019a828453bb92662ee51b2c4f09fa43b80d17', 1, '2018-12-14 10:54:27'),
('5e38d0a2f1400b29051ce2d97d8f4dbf2b6f8d5264c46c88c276b7fae12feedeb3a44cc25920b9d5', 'd42a8b07cbf00b9946aa23ff267169f170d7f822dad4d50d3f40e05250025b6b362c991a200fcd51', 1, '2018-12-14 11:07:12'),
('5e40b4fabd7f6a4ac2f95b5d4219a193dba6b81cd5505533ec339bb16fd8829bf56e54cee11bab15', '93b0733500eeb0ac5fe11421bfc382d6f20c5340f27329f3e0d12694d75eec262fa04cf95bb21876', 0, '2018-10-30 15:49:02'),
('5e965b5d9a8d5aedcfcb798a91dfddf94a488823423000a1af91ea1c27e3718255ecbabc4a1ba9e9', '6a9aecbbca1728c43ae8fb2776fc6ab662917fd720692107eb84cccff5517dea7ca9443627c2d22d', 0, '2019-01-02 11:44:17'),
('5ef28a7a089535786fb927c746b4f10f6f52b65ac34574c4949ba72cdd92ee76467570cecc3d2707', 'ab44f8b5d9149bbd6dea741224a560a0296f23c145bb667d1c2ed0b56063e3222b017059dd13643d', 0, '2019-01-06 18:25:30'),
('5f0e84b396b89c3d4bc43ba7473ca33863075678dd5f24b21525ee0e3e1c9891f4e80f99f376043c', '05ffa2303e8a3340f062086081e806407732bcf552f0dbff20627fbeb439b5c7e0a5bbc0ea15a12e', 1, '2018-12-14 10:49:43'),
('5f6d466cd52ec14c7a999834521c5148d98250ead1743bab456b438957ea04324386c8b715a0db42', '1d18af29766f85e8ec2495fd3701ea667064e195f377b7d3b26e6cc8346e5a1c7ebc56b1b728d3c6', 0, '2018-10-29 10:38:31'),
('5fa0e86f0c9d0f87734bfabf194bec581c9689bf233e5a98a5e0ab55400060f6a8e4f63acce73aa9', '0b39a93d14762f8f68baf9a3682e26eb3964039fda1c4c8d3073ca1b52bfba19f7925d188badfaad', 0, '2019-03-26 20:29:43'),
('600db0f2e88b267ab1cf39cb5cb6e4704ae26658e8880799e2cfb8dfddcb972a7d6be01455e58630', '8a703cbf5cfed57aad5b738a5458f8c25ccdb8d182dacf8b5aff0a61ec69f792b0cf889bb96c37fd', 1, '2018-12-14 11:09:17'),
('602b62c87d0a3375fef4f65165f7222c9d6f55dbc797c0981cf700ecda98e7b338205c6dc8c98761', '3d78c6629448368906053c1ac9cc706a355546f5ee21e7fcf0ac3d07fe9e9ba9756aac82faac68bc', 0, '2019-03-01 21:34:37'),
('606f6f5a799c94d25cf11077d4ccc332c2f627adffa4fe24e89817b6b238d283fee304e5e19939da', 'a3753557a68959fc305bb3f51c7edca64d2e639fa1d481212e17affc35fadfa3cfec87c9f2693f7d', 1, '2018-12-14 23:50:43'),
('60ad198b9dd9d7117a96b0f32f34de3fa0a1f67616a8597a7c6ff13e372fb3003b9dc80e60aea58a', '576aa9dfec9fc7c9ab9598e4164338078e522180a2e97a78b3ce8cb701daaa0c1d577a6d83441c8c', 0, '2019-10-06 20:01:15'),
('60d652b3251856119de72cf4a07b1d32a82dc8a33a8f936b81d16dbe606d670fac959b0356ca7ef2', 'b48dcd37a898d382aad295faa46213e64535ec323acb062d549ca69029c72591cf0c23c85dfdb42a', 0, '2018-11-01 13:02:47'),
('60ef849830cf56e0714fa9c738a200712f68fc046eaba23b95dcd2664bfe5e994da9de7ee1af5e74', '579a0a61b79ce8df4da4835e1fc5cf5d746333264c7992fae140b1581b0fc8a81052469733030a2f', 0, '2018-12-28 20:43:52'),
('60f8d9252c940cb839712a8cd2171c6d856e1af3ca6450a3044215eba052dda60c87a646f889ffb8', '18a03859b04c2b4feeb7daa18a60975bbc748867f8ebb0d210377f3dcd3e4967a9595b61d4ea9921', 0, '2018-12-10 23:15:35'),
('6108b447643afb3671990c3b0ab53a959547f0e86da195fa3e6142d4696e720794d4f0844eb895a2', '3a2c68c36096b77995a423d0da018fc8ef42054bf95955347dc36402432ba4dde129f860c13650e9', 0, '2018-10-30 15:39:46'),
('6167be622a8f5ade3ce22721d96db9d5d2e3d76f21de47890f28377eedd18a89786525fecb642b7b', 'ebaecdaa991b4771ecb1bc9f87d4ba5ff6c14543315b4df1ad93085eadb15a70be4b85a07cee361c', 0, '2019-01-06 19:10:05'),
('61754cf8f8342c508f9888993be42c91aa21c84d389d122305f80d98c6fbda1d4939ae21f37ee40f', '83891b631fc8bab370327d8c2454f4a4c2d6f9bf7122506151553fe749fa1a6d86925e53153e4e06', 0, '2018-08-25 19:34:06'),
('619c6f986890c854c156b7ba38759a6017915afca53a288968835c39dac35f12baca808fc089a3b2', '8bfd489e606a67f5acdc0fae5c7679698f6dc934d87b9016c62587ce2121f1e4745044080619c0cc', 0, '2018-10-20 13:38:03'),
('61df427364304cbc72424473420111f7c0cf047eec9e4a27f008df42239b1b114f57236bcc094100', 'b56d8625163ba91eba3ae8ff383dc32cba492a431a917cb4a00dfc0d8c624330fa98dcdb00550008', 0, '2019-02-17 15:08:19'),
('625969bcc5c7b21313cd1e36df4c38f91cd5f5c1cf7deac89216ade1f290073b93cdc330e7cbead2', 'da911c1953034e0ee1639aa9a44c5eae788e06d06b56446d9e09e6f3acf7b7bcad2db840c9c01012', 0, '2019-02-20 16:07:44'),
('628f7741e01572e036d9ecf70f3fe5efcc29d7650b3a8b9051f89ca077479990570dc2ccab9a1e0e', '6639460074f10b4210c8a22a84f851f5a7307b19a6c224d13fb4bada242362da74e8e0793f512499', 1, '2018-12-14 10:44:49'),
('62bdd33b99a9b8d6095d784c454802510cb8920e1f84bc723b1e8e196cadf8588ac6bf4019172cda', 'bbfb1322e8c5890db32df4e1367aaea3e68da6fed50b33bb370ef0f085fe8761610a892f5323362c', 0, '2019-01-03 14:44:04'),
('62c16abae24a9b4645cf830059504ed2cfb7da0b9dfdf20bcc2e65931054bbe84e6ddf75fd803748', '499ce8f75991230ac797bbf8840b2fe040bf3041fa2c90ab1f474ce5bdfb8d3c2d858e171176edb9', 1, '2018-12-14 11:06:52'),
('63621ae126e9f74fc6cd4e557169441a490d17f3ec2d882c205312c1bbdcb22e456377f0eada8a8c', '417b917cc8700117a510299162fdf5ab4c261ce855384ff86c165f72baf90507c28f1c8ab32bcbd5', 0, '2018-12-14 11:23:41'),
('6362578c8b8ded5d174d474117acdbf950c04e5b728b2a73892c701c98ee50af81f432de7b0448db', '19940cbbb4162549d2b5d41b75c99bdc02c8eef540e57e53f9493f61618b7f8770fc595c5fe44ae3', 0, '2018-11-23 19:01:42'),
('6394cbcca61f533b0c53894a33f20f63e922741289a161aae9db74017de7eb67e36d9abb4af8b1ff', '5b816a0953ada3235b8f4645b55e6ba7004a04c944bef09e1a9061f53fe98d5f61f3a907fd650e36', 0, '2019-01-04 12:10:29'),
('63d9224c037eb0fda1407c1d5a5a75ffea1b746878bfdb2947589b526e724e9b86ef21b4285fce01', '4a0a54259fee1c2a9c915db14724796742b002023346095c41591a5f4f8e83b150b4ffd364b6baf1', 1, '2018-12-14 11:00:27'),
('63ddc15b21df5271e49cd8bf7abc5419d1ccabb0c2b9ab92d4103aeee53f581d0ab5c2e24bd4133e', '12aa05ba61de78e5ce4d47ae71f5285d40f3db632a6c1388e4d67f5879bd0aad6b656358ca741658', 1, '2018-12-14 11:01:14'),
('643c20eda8b607cf8833089912ec8fa8325aa8b010ff050d9952f337da35b81894f77225b4b2afee', 'b28e1bda9691d6d7611287630f097c2df56aef4a675b7ef9da1cc0cf1d56c11b7b15614518b08add', 0, '2019-03-26 18:49:59'),
('6453e84c6d35604d313ae764cc5a5d6f6539b5bf75325ba4e3aa96c575d55627039bca04978babe5', '6a11b9a1a7b3114f23a6d095d55af09880a183c7218ea3b1b6358fd637ed20fe6ef057544763bca2', 1, '2018-12-14 11:02:22'),
('64558f4d5cd08b13370153e8489b6371e154107f9e74cf387488754d88280733586cef9dba8be47f', 'fcd935e07b79acbff1db34ab216b4eb66ba7edc17e8b6e7514758c6ed94d1269589043228f71c031', 0, '2019-10-06 17:14:26'),
('647d2fb96b65295756c5451d6004a37f9a601b408dd16b639b7273847b625627f111fdfc449ee1f7', '4d58dc2e8cc886fe2dac72a09cb6dc15e06d76c4e72509e525ab81382be4ab785ce86304d8f8789d', 0, '2019-01-03 20:04:58'),
('64ba5d62092a87ac54bb3a299b2e9b42c643aa5c3e3103fa3c423548a4aa99d726aea3b244109fdf', '1162b4bf97cfc43a0e42316454daa6102109c20bef84ba9cc96212074275625a7a388d478bbd3182', 0, '2018-08-28 11:04:24'),
('64fc8febd7cfc4a2eebaa64b62381c2dafa9a0326dff0e1047e086dcc52e1314c5cce76f8828aef4', '06d01bc19f692044a8951528389f0bc643c859dfca504f63f661d96fbc17c337f874a3decb3ffe8c', 0, '2018-09-12 14:55:01'),
('654aa3c60688f2f81a9a5646c55e99d6285fb7e95a17655f3baa75d11a7332b8e96e8e509f8af305', '872a0be760e387c94218b93d481abe19a5e0527fb9dcb22e522af28b2b2a2414bacaf56c1d622537', 1, '2018-12-14 10:48:52'),
('65839d457605407c697a03fca488618843e9b70ebde61e970750c9e87c4760e3c6b16d12872a1d27', '05dfaeaa6e6ab1ef912d9b137b20ee4811dd6e34e63c6e684558cb5fa3998336039f241a78ac6537', 0, '2019-01-29 15:13:50'),
('65a692e8d6b9f2fd55c6551c9766ea1acac690902adaf87d80792ce29d75b179c0d98e13f605f0d5', 'c9e47d5ad551cf144a165c23b0e1c2ca3772e7b5daf41b1831b3c8ef3e39d3018f2ce4d84186f1c6', 0, '2019-09-08 18:18:00'),
('65aa31bd7b30680278cba3ef7994b748febd02b1c6810c80f12ffcb1d899d6d627ce32b76d25c650', '2919af59b491665aa3cceff809840d5e558b23422ba428db4e850fc1dc6a817561274ae34e0550fd', 0, '2019-01-07 15:01:53'),
('65ae5e63d5e47f393702ae713b520b8b2c355d656f2150fc64605c0e48f0e3253ee16da55158d69e', '57d2e5d6db1452f77fcda8042a1a2931ebb622b756d8913724709f59eb24cca932c75a259fe0ffe4', 0, '2018-12-17 18:16:46'),
('65b9758694e6d6014f2763a3fdc370b1235a105ac80bcfe121b783b9fed9d15f112fa3ec212b7f42', 'b72694cfb0008ede28bae720e00db16f8059d8753eaaa52c65e1e0cf63bdfa1ed1418d188f9fed7c', 1, '2018-10-18 16:22:01'),
('65cde0f64baf6d6847bdf52d63b2b46f83b5b6808f10d5278e976d31e815b4fe4f98181242e8a494', '3493f94a6ab0547a3a114e5662407493d2da0cd0eec4f04032ed9419f5edb1f38e75d9efcc86f377', 1, '2018-12-14 10:48:34'),
('660c43bed3e3a1c3d947367b6089fd6272d0df58aa1d201b9a9bcaed63b184538fbb16c3fc2416d8', '4a04f088afd4495e3f6ceb75afca0fab074dc260f2f9a2c061881763c5d9fa36404639df267f36c0', 1, '2018-12-14 10:44:28'),
('66159a9c6bdac6509523c82aa94c3a616306dc5586cd4b1f3c9ad50ce1d8488b33bee6fd79df382c', 'b5766b16242bb68e6f77cc1bd19948cc9a2bd1838a5499c708a457afbe491b224421181270756bbc', 0, '2018-05-04 05:55:34'),
('665c8adad767a9d909451e9f73e89d242f1873eb3c5ca18f84b0e6644ff11281e93c0d612cc1d450', 'cc3eeca5f715c4622f175010853764c5082566168172dcaee9d4b6dfaedfb8aa0ed645a55c0cc759', 1, '2018-12-14 10:52:22'),
('66aee509ab05931b0d31a968383c495860d46aeaa677092dd1edba2ba79f81e6a3feb6e34f26eed6', 'bc3f27bfb33de2a7ca51f024cf9ad8b5332729f9cbc5d8093f1ff413f9fc3d22974a1d787620a148', 1, '2018-12-10 15:37:05'),
('66b200e21b82398710c375db2d1e98f40491a28beffb734e85aeba6739c02766ac991278dccf92ec', '658602f6f4a4893b3a5115d0ab7317fc6551f2cfa06cd38ac1066b255f38946dc15d79eeec2a9a3e', 0, '2019-01-07 13:02:59'),
('66c07ed317b03107f519a1a6eddd0d6f59257c1a3b90575f7e6f0ff8ff09675dbbf42a58a91efb48', 'f3a95164ede88635f6bc6c8d4bc08e520dea29fd631143307c3f22a6ee88e7bb4e43550983ed9685', 1, '2018-12-14 10:55:02'),
('66c74c87fb683a0a556a8177271589c64cc5cabe259a213617fb6bd7fb05d9ff606e15092a68b2be', '8c39673686478b9d9fdf383703cf471248f0b373e473a9638fc527c1d9e9cceb3ee8a1fcb9a55662', 0, '2019-07-14 19:32:03'),
('6746bb92ec25136952f3203bf1cac3f7cb13f943022ddd087b056b6130d86fd3ed7046aea57d48a3', 'd7d37bdc984153ebbb4d4bfe088165cfa90feee40745f797dcd9adf8dfd6cda252047b5a6771a95d', 1, '2018-12-14 11:01:57'),
('674f78f4d1914d8c02e12924cd5a2114f814f05379ff67b333b4a1648bc74274cf2394979b1dfc85', '6bb19388408696ec20d13198a599ab7a46137d0842ce8e0c52b157fa959b4c72350da006ec369f82', 0, '2018-12-17 16:51:26'),
('67acf03437272b9233107052b436b23ca82897d360e789bb756345eb1e15136091cedf0196100f34', 'd5b9a0434656e0baf4be2584a37615d57c3b09a644634925632b6d5e45b12fc50be08dbc2c74442e', 0, '2019-03-19 21:01:21'),
('67bd8eb49b472d106fdc8cbdf1b296068c8d2e5eba7074474707927101585193c62da1db67ec0b57', '31d8e888febb15bc0762ee58e476804fad74a2ade02b795b24403d4339738909f5735e71d704da55', 0, '2019-01-06 19:09:23'),
('680d0e888e31c306ee64d0e82d1b2070202552f354ebbbad6b07800e8e24731d172017ca81e553c9', 'a877a37f2a215ebfffa6f1469d1dfd01d30f7fb505184bf6b1183d3b26f3ddfb9fc2e3631fdf7735', 1, '2018-12-14 10:57:32'),
('681c9b96c65d01ab589cbba818c8ed059d81532a8de9a68b0d87b2764a5a1e7fe5502d3ba3812cf0', '1bc4c2015ec95171b98a031ec2bbdd62683d38ac88150ed0d8b4220fd5b8f2580df9b376dd927124', 0, '2018-11-07 19:53:38'),
('685feb22387f6477989922223826ec7446d19c73edbdf65236460870fce8423eb2cdd889d32b7846', 'bd445a8de2734420b94dfa7c3f2cc100994ca68f525da99aa53dc610aef0d115169d38d7545c71ca', 0, '2018-12-13 10:21:52'),
('689d9dbdf0e2b09eb337c953f5e271bb445597863190987d4ff00cc7356efa388a97952b4a5567ae', '3356c7bbc2920e26e6cddad8f79edcf92b642d1604ecdeaac387955f091f328e3a2d4a5b87f0b70b', 0, '2019-01-01 18:59:29'),
('68a222083a9b1696ef3e182e10e067681f1352fd8aabd506497ca0e4ba812c3da2a6a706aeb9cb3d', '15b3f460e1974762eee5ffe19c825d894376ec041aaf1b7f4838c1ef36106a9fc1d82f7592b44d71', 0, '2019-03-21 19:40:58'),
('68d868d550fa76cd38c50fa06596310ead944aec8c79c0d70b2f53f2852170aa5292040c55fb9fd0', 'de196771381235538f819d0467a8af75f09d4c7db68b47163ba5821edd8f501deecc091ce52a1c8c', 1, '2018-12-14 10:51:37'),
('68f3256ff3d5596e83f01d31ea1886c6394407e902fe0703ddad39a7db14c68806f6d94fa8a3a5c0', '677058aa04d368d70d966451eeec5f411cf494aa3987df2f1f26c4075fc52a4a198caa3f3d0927de', 0, '2019-01-09 10:31:27'),
('6a15e83ca8d1af8522adc4f9245f296f53916636ac79b18040142b0a96d1990fc9b02d2f5fc51680', '33e6a869674569649a88dc9c6d1476f6662e5730f441ef98cb028230840d2be6fbb591bdd324f140', 0, '2019-02-18 11:07:02'),
('6ab763f1ba1fb3ef5b97ca1e82aa7fcfc412b9fd11712680efc392064b23dd665313d2302ac465d4', 'f55dd0b1c7147f5d4e841044da2d2b917da049bab0a7623b5be3854945a47c56f532bdfa6ee6da9a', 0, '2018-12-18 16:55:19'),
('6ac79181ad895b0a0d231500adc65b5f059d582a772ea86f4185f9bcdd5effc1e8e452415c891878', '745ddc6c525f78396fd8473389f67df84855d892eb5b7d12c6db562f68c96f59c2ddd53cc07b1192', 1, '2018-12-14 10:51:42'),
('6aca9c7effea5bfac53552699f32b2f7594e11f8e6674c606729d26734a28b90dc46f0f7c393436c', '87de64f70d24d67d94dd92be6dddc086e8f69f5396e0f4498e76cd4f30f34b8ab71cd5d667cf6c75', 0, '2019-01-04 16:48:43'),
('6b15ba9eacc0e8f5f4349413f13b2ab0c74a859db130aef5647deb9a98e0b1892c1a1bb835588a4b', '5a7c6f23a6750874f28c6863a2f8ee43ffd8e6233cb7db531abf1d76d39f60c5ba10d2914d7ad5ac', 1, '2018-10-18 16:22:08'),
('6b1a0e364b3613aec43848928bef6a5128893639bccf65d59b9b82cf733d1dfb3169137666f4d37f', 'bf921f97ef700c3380a5d5d0aa0f0fb4c1d291dbe98ef02a9af473cbbe7dee72a6675bca7cb058ba', 0, '2019-02-25 18:20:58'),
('6b6e8b8b0ac1c15e6798e01303ea38655cc24a660f37ce9240b31ec4eae457a66b259a7d728ad84e', '2f34c96945f86fc4c94b362462c05ab01ce659a00fb9a324aead50062f508445c0329596fed4a404', 0, '2019-10-01 16:55:59'),
('6ba71a6892e026e53ca52e5d72d84cd3807fa05dae7b42bd9ae4e2072ec0aaa952eaa12abeb6428d', 'ae2db2a6c883a7953cb7f091a74f5ce1c88a95a79ec425efd42a40f5a3228e4e39c9b3b0b747060d', 0, '2019-02-17 16:21:27'),
('6bc68b7e1dbf080eb39e62b1f1ef525bc89b6da933b1b6d6ef5861ec42725d6c92358d37bf0b7b8f', '1429f3ef6c15a5401dc912b96c8f6cc09df69792994881cb6bb2c1b6bc0746ccffb1e98f985e261b', 0, '2019-10-02 17:22:07'),
('6bddc329bf44638f7da0e46b9384b702213030fd7b0566a926764d67f97e38a73d3e04381e023029', 'd0e5673c748341f69d770dc3f29ba28097f55c7c4304eddc017c973d0438e94b6afb198aaa1360c6', 0, '2018-10-30 14:22:20'),
('6c366664e547f9ad2e1e170aee693679451a65433373aa62fdc684938c92b4421fb82a8edc8bf971', 'fc1b21358575dc863483d317b49fd1eff818740a99c73be1307767d84ca923cbf0990bee6dd4ca73', 0, '2018-08-18 16:53:33'),
('6c5636a3fc6c5b191f5f9941f80db35be14bb76e1ead9287cc93f3541e48acde898f4acd428a3e38', 'a942b95075d3a3031581280e6a6f7522a474aa01e17af857f41155abc5e716857686982b91401e3d', 0, '2019-05-07 14:42:16'),
('6c6b8f8426c701271f076d8d8759facef5d7a37f53382c55d3fd389ec0b817c376bc71a9813cb461', 'b9bf4b64ef61da07846bdec1ac415004442bc4970c6992b00e820c265af079197ee84471919006d3', 0, '2019-01-08 17:26:41'),
('6c825b88b57cb91358b2f2d52e1159d8f905ee85daa537546f257d6b833638db6561a7b86bc5186b', '812a69801fc5f3e29afa0b76ee14e986aa208fcfb3cce9d0f0869c73d46ad686bff66c8ae33aa2b3', 1, '2018-12-12 19:25:55'),
('6d80fc87106036cd24ec76cfcb1f3c6f4bacc9c6c9d73d256414b291005e5ea3a6c937f399f2b754', 'b019d535948034999498a03cf46647c352fbe8e6985deaa21cce0745efddf2777f48dc5d9a967c29', 1, '2018-12-14 11:00:07'),
('6e2abd53e6d0477525f936f10ce8910f663019b36d5d4e6089cc004ad4d9aab556680d191f665093', '0c9e597407e3348b5f88c8b353ef387f7dea8fc31a6d387259ff4fedbccd7584e968b37aeac0a388', 1, '2018-12-12 16:09:59'),
('6e3ed0234555cfbdedcb8576faa870822462682ff60e9c9cd77a44cb7f97a1bdd752207d3c35b44c', '00b957d0338e806ac6acd3710cd4b3b8b514519e05e7b8e28896c556c8d91c034de1af53d2bd8e0a', 1, '2018-12-14 11:06:47'),
('6e4d654ad73bce21c84f2037815d868f44d24ea3ad2cd8097cd377c15cda5177519ae8826889f653', 'fa93b9b1380c84b6d386f349ddbca27b3cd233a9601803a61abc49f64a421ed95643fa11e2db04d4', 0, '2019-03-20 13:10:28'),
('6e808bbed12017207af16f12444723c7fae2bbb5468d390f60b7458f49388c4c9f5cde55c2fd2d69', '9dd1173dd91478465aa64ad9e057ad88317311c6a373345f05d9c76470e73c139f0de10a7de0bcb0', 1, '2018-12-14 10:54:02'),
('6ea6262a9062a942362d91e4dc54f0309e68252155ad6adf199560caae33204006286f881d543eff', '88a5582064109094860ff7d047c7a2dae980761f732c48035cd2d9ea6be091973a0989334b88e2de', 0, '2018-10-23 12:55:14'),
('6f3ca2e3c7cb80484356b5c7d9ba08a7944b016fe8c2c2afac8b3110c9d14a0f59d7edd9412df7f6', '48a82bf8f6c9e48bcf9768b057f830a0490a9fbd1e4eb7a79083c8de9b37848d2a784b8e12ff65b9', 0, '2019-08-06 18:17:12'),
('6f4afc0c231f78d9e1faf27df81952007928d834739fb0e293dd260aa255d813a19960730f24cbe1', '0281681404ae217d9a5642841b575712816ad04539661d7d6b55425fb0e666758aa748c4ea6d982f', 0, '2019-01-06 12:10:02'),
('6f7cc46cb79b8e2be8749dec6bef82cc3a778196ecf5356b9e0b2df4507629d6836017bf383bbf7e', '841ac6449fd7b59e9b60e7c2d47eca9392de4c88681901d8c09a8d52e9180d95e647fdfa4e6d1b91', 1, '2018-12-14 11:08:17'),
('6f91e7b76fd3a4780facdf878d2cd386dcd46609085f36e087f0d9f67c6f6b6b6eb221d1f69e90d9', 'be1296499b0fbf09be609e1eec6a34d8bd5e4693758492554ba2e749c2b3a60a329a4b69ea48bc74', 0, '2018-12-21 11:12:24'),
('6f951fc81931b8109092077e2228bfae6c79b615f57953457dcbcba40e82c036351bb305d52c6713', '5279d94123a8607a215a4a8b469ce0b621753465e42cc41131272d23b32b8689359bd1333a3ae0dd', 1, '2018-12-14 10:52:57'),
('6f986786e2c300fd79bc10a45ba9ee713227994e487cc30449056216f25d1f1c46bbeda9ea2bab9c', 'e9bad87d529a5fd15b9d0e8578bcb526c6f57d00a09710bacfe2165d9732af2de166a5d872e22272', 0, '2019-02-21 15:01:40'),
('6feb7197690b8974778fb8844d76cbb00d9f11df6cb818dc1f28e777966d671cf53236c019c5cb1f', 'e42da8623279f670a56a824053169d5e4d3c7643342147719410d9ce6f27586ee69b4ee6122ef0e7', 0, '2018-12-12 09:50:46'),
('70451f8132c62066823eed4d0fb966d0c8d949c19a49e0a2077c59644039531dd9d8923e3f637a81', '09825d595ff11f894a4ee0338af83baa280215dcf70ef7c043da98d0b6a201d0a622fc49e79bf442', 0, '2018-12-17 11:21:42'),
('711f64d80e70eb310c3f261a6d016ab13e169230347534cefb12cd26724ae5135fed033877beb3e0', '0f5d0420d8ed75a2e72296051e34fea0a6a1024e8ce0cf3342fc0ee9218b7cc314ebe4d3c11e239f', 0, '2018-08-27 11:04:38');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('71382b11a80bf7029588d645149b6d0dcc1977b26fe779f071bfdc679f7af08e0f6a99552f3cbd31', '79ecd801cfe2c7876b3b5eceff4a619bd8b819801d532d77315f80049b95a2b57f00dd18942ca42b', 0, '2019-08-08 19:40:01'),
('7148c9cbfa682e4bc0d30467b41efa5605f99e541fa8e845e489adb61b6fb6681b1b997ab5844692', 'e73d94e7d93f1c9f3bae9aa10aa7e0981c9fa6437c0843b1cb2e95d38f7a10e3f1677ebc2d86b8bc', 0, '2018-12-16 00:59:48'),
('71a6bbc00d8c960b3b8b365a9226103aeec76648141088d1382ff1400914ddc227ae142472953e50', '8c4dfbf7120bf119c10302b956388206f4912bd3f028ef57112a0b8ab5bd740c75d290e5de72950c', 1, '2018-12-14 10:47:42'),
('71b84e633430a2043ae0396949481bb84d98decd03936ce32d2be281f5e77974fafbac7ffd0157b6', '96162f4568a21827b721559c01fe701d0f6f0adb35db115bf47c772de209e240dbcf7c76efdc773a', 1, '2018-12-14 11:02:57'),
('71f804d104173c58f1689c85cdc1918beb15f8c1020ef07a1875445bd38f5e12084fb304d3ca2ca0', '0f730a92ad796ef0853c6433c279de475d7d4ed0e0446d6f41eb0212e5fa96214ae59d952361368c', 1, '2018-12-14 10:49:07'),
('71f8e22f6f2486877aecb269fadfdb215979af0c0a3e78a6dc48d3c16fe99f1a2188f8b1c4abc905', 'd2bb5e151f2e11d859734c76407438747e03be2d94fe3efdde1c9b8377b8d6670294be27241c237c', 0, '2018-08-22 19:44:46'),
('723629f43badcfe2f609faa580892d4926dd500f63047b08342a7b843dca15f07901df906a868d4e', '9a36383a01c1ffb73df289c23e599636b52e86f0cc64a375ea5555ea8ee46b5e0803f96a2f6e6be1', 0, '2018-10-30 11:32:52'),
('724128c5800a96a1b0816704f4b27b72bf4dabce4401954841d9be73a3e4c35687b95b7f08cc04fd', 'f15bf7f830a1d114c24b6928691e1d9c5f211b57283241a6a0013f3a3b69b3536f0db97eb432d6eb', 1, '2018-12-12 10:32:37'),
('72a879e5414422d9f15d8b14c2509fb1527ff952f3185f6c84685353c6cbcf634b2faae3ac2484d1', '61d8509c594545f22767959c4bc672449f7308d23c93ca99c3b7833b95201e28d30e7c5c96bd421f', 1, '2018-12-15 15:37:52'),
('72dc5c8e7e9da96497edd5afa98c8fa1c24e587fbd28cad2b136211dbf8c59fbe8f93b0b2b625f32', '33ff204fc0f9b62553e2fb95b59ce4eed0f8b340f46bb689744833c11186ccd6e2524de076d9ffbc', 0, '2019-04-18 13:51:42'),
('72ff318ae7299a1f822e487de5b9277b4839a87461a853e62f6aeae743e6b32925cabd60be1e9c8d', '9b58fe1b6785e7fd158fd0967a05a8b2c2a58c950e49d93cc8f646cf35faff6c16c884152673a365', 1, '2018-12-14 23:54:26'),
('733bf55160d156a045c3d5a19ce2a1e8918ee6fb6d6bde1a17b0e842fc300608ed476a8d51617f59', 'cf367136cc1a1dac7610f82aee91357410ab0801108885085e5e89a417a827604998eb21d69b078c', 1, '2018-12-14 10:50:57'),
('73485c45e91d7bef56a86d6d18dd5e7d1a2745e86d875acc2b01b7ece909276d452833371b31dc14', 'a03f64cbf135349f884fa6d0e32e1b0547e88559a3e3b8045f44ab7c19d46d313e3faee6414c6bba', 0, '2018-12-27 13:26:10'),
('7404524d3bbd402c51f361a588b8435407637f08a6c7cb2d1411b80adafd08f3617412ecd7e28d11', '1a9ea4b87cb8401e53d8c125f134539333f29be237aa7751f96094c0a70cd48d46ab069ac95983b9', 0, '2018-12-18 16:19:16'),
('742cad529b89e1246be7320a294182eb0b523c0013c5c05ac7650b5111136ab7528898037e1bc895', 'fcf70d7057a112e0f8840d15425860fa3396fa6374ffa1df252229901174f13fbcaf5f2e8afc0b5f', 1, '2018-12-14 10:47:22'),
('74374522d9e8738c3b3ffcbb3cf6e7a25c2759a8b03573a1aa261c0b9dbd12d0438c5e25e68a62c4', '1be753ad852eca1c748de857ceb0ab7c03339d71a837859bb2c3b6cb7288c5b6325c1d8df77ae1ed', 1, '2018-12-14 17:15:17'),
('74512ded53bc9e5eae090f984dfa71d9a6c9ef2f5f2381c1551027e576ea106183edf046371a77a4', 'ba60d4f7a49b1fb938628edad0532e669e8928a48b7ba82515ccb46053f3a8bcc5c20a9308ce336a', 0, '2018-12-17 13:00:11'),
('7483bc5502ba234b265ad3a3456cbb2aa7ba33e437f24ac6ee67db75cf421e43a5b84f695023bab4', '98b1d5a8691619fa27a00a134569805f1115be5d270e602d33974c00fd0b343ffb82c7d6baabdc73', 1, '2018-12-14 11:06:33'),
('748ecc5ca19c0fe33e974937cf267e2e595827f5de2c99e27630a08a49a80cd9b1c0a660fea42cc2', '26c9ebe7b35aa1ee6a5e122e22099367d8411334325e1d1ac08db4580d8f77e9149915437c114e60', 0, '2018-10-18 20:22:17'),
('756228315edaf54d174d12c847485caf589f2808ce856b0fbcde752eb27f171a6a8018b4159add0e', '97386c785deacc27a89c750defa2c300335998de3bd2b179d8ae3e0845b0a3dce32112efd55d74d5', 0, '2018-12-10 15:37:05'),
('758c53c8206f4f4b4f2542a09464b5916e64b4155c942349e0c1ada4b9320f0e195d3bed2b0f8a04', '29deb1e96bc79a5e70e396fb3a9c10a476640b016d5a7eba4f665a509d0b9f37465f32b22ece1b05', 0, '2018-11-04 12:30:28'),
('75c6e14267371dc648df45c88bb6198ddbfc3e65a670c6c3a50466d62652d3eff14ef0e0fc55e9c0', 'db8b1c7f00693e82e2c7c777ce40b82f0ba15daebadf02f5717f2540b4f989c409d4752005e8f035', 0, '2019-07-14 23:35:05'),
('75cb09468308136a96b07c8d95036c38b6f57c76de5d6afea5cd9d724d68da57d80fe973b3b5445c', '5d476e3f52202b5204f9a3537f76a0fc970ebcd23963a099bc50ebd9fc7e56579d39576ba4ae685a', 0, '2018-08-21 22:58:16'),
('75fdc29c51014be04720bdafae82e09ac4b1b81e7ea4584247d2dc4965f20931677e4123b651cb83', 'a0e7a6477feb67de4280aeced5289e59fb99bad903dbe63b6b96c48c15796b1b37aa73ec757d99f5', 0, '2019-01-06 18:52:37'),
('760d458d21c1eac349a1c09964a6c6fd92c8fb931656985aeaf4cfba9bc98e094f8fef7258d88cba', '64ec3be49cccfa637e2745d9fcc3b8c8bc76c6c907f752213d827da60665ea1a718d3bc0ba5595a6', 0, '2019-01-03 15:52:52'),
('7613ef3796984b10984f74e8b130dbcada0ba3ae0cf922077b403e83c7d2e1ae63f9b170f8443019', '0d42cadd92953e9fb45bcd12f8b45c35d9f59a07c8530c72db036840ac1b2a35f67f3ea9fff53c65', 1, '2018-12-14 11:00:04'),
('76a8d0983d1343aad6f734390bcc55fa4f9fe9cdf93e5fb2f4e7e55b82b11d9bec3066c957084e04', '07b310a43957ca99851ade9127acce757fd62f1ff3ecee6d2f10aba467e4b99ba066415ef3f2df1f', 1, '2018-11-08 16:12:40'),
('76dd8b273c88708e7410e87b8f23713e24795596b69c6db9671ffa1186bd20580fdcccf5a5a5d0c1', '0b2a49e2f950fcb9a2890c40f4c20ef7d4f2edb9683db1c11fddb25cabc1bf9a23bb8ade067c6e6f', 1, '2018-12-14 10:54:42'),
('772fd608d6d6c10b78aa2fd032de34c0fd60b24fc24226d03d990777b7d31846d40c33f6ef70a6eb', '89272d32669f90fe5fe356364fadb97a0b6cea9de7d0518745f0011ad113c8be6121c33e514c89ad', 0, '2018-11-01 11:04:52'),
('7749760c9abf79ece26c3492a0a0eff5aa6e04c07e101e677c90f68c4d5ce04c896848855341b9e1', 'fa3c97927b669cf71d8138bdd0cca100acceff423f025ae57d86c72a7d78f4fa12b455157b065a56', 0, '2018-12-17 14:14:23'),
('779de0c160fa16f12a66c0c00c975a0a1dfaee186541241cb8037a483fdddfde83d1a96beba6d580', '07339d58eae3604ce3152576ab1996deff4a50ddb7eb96afb1dcacc1495cd815006b3bcaa3c88656', 1, '2018-12-14 10:56:28'),
('77ea88fde96ab169d8e317876bfb3a1075e64994d644f81e460849529e0560f22113d9de15f59a5e', 'c5ebb710f25d294c6a1ed01a0e7ec5cf915e75406f6d4f00e1b52a38c0c9e1c08a7bfafec1f1ca3d', 1, '2018-12-14 10:48:29'),
('780fe66c15e523d9a142100e88b03e720859c898ee96dd780b5161ad4f447bbdffe0f53712a4f26c', '085878e587312ebf0d016fc6ecf767aa6caf234e29c94adbcf7db5c99ef77625ef17c5326f88ada6', 0, '2019-03-10 17:06:29'),
('7832359f21e7ee819ce3a7f12a982463ccccb74bab13eaffe4af468f86b2d977b59f895396336ce4', 'c54df40ba4d8bb1538661bfdd2390720b8092c75e83d1426bdd6b2d37d8ff03cebb394f396f56dea', 1, '2018-12-14 10:43:46'),
('7894f3d5e5b64fee39bd0f5afce913f04b4190bcd1d71cbbfbe81670b8ea6abce42946487781e4f1', '1ceaba87fb00ed3cf673a3ac8dbad6f44118431680f43d7c31473296396698e2c8d9b48edac0e748', 0, '2019-03-26 19:51:28'),
('78a5d0677fffc8d6ea6b6f613791d53a8565eb400363b21b643ab44bc4e2b2f7a81b6a15239de020', '1dcafaa3922fb8518d16513f873b7cec53ce9d2360d0b8276a2deaa754460e72be890274e77c42e3', 0, '2019-04-14 18:52:10'),
('78b182fb5082277d87df8d26d0a02a7bd3410b52529fc2601fba5a97d5a0f9e0541c73a88d260c80', 'e9a0ea916d09b8e104d44b91b58edc5b338fdd92459ede59755c3960caef6b72f42956345e52b025', 1, '2018-12-14 10:57:52'),
('78d6bd1b78f02a67441de68e643b7eb6a21c2bab3acd82277200cca39b0c71ac5160597dfba5efd1', '06b8b532b617067ab185be2f095e83a59d23e391ac3601be13a7040b1b504e3e00517923538dd841', 0, '2019-01-27 13:06:36'),
('78f56e2ef2b1d0e3027f5d0e96687e485279912a545960f8805a11798fe5cbbf76e10ea5f2d2efe1', 'e4ba60f6d26dfcb060e5862d161b58f680192ebe7a6424fdf8d5c9e6635db3482da0ef7cca33e475', 0, '2018-10-19 16:31:44'),
('7918fd836ff9ee34c67e8c155b8d477675ba33a910a199025a15783fbae2ee24632620d6e177b89c', '4a84f53e7d801e352e15387cf140cf3eaa60eaecb279d775d6d15e907e79744ae3cf2203c4b49cf4', 0, '2018-10-30 14:59:26'),
('79347a63d18ea1d8ac0f8741836606e16e5011a6f60e5a650e2aa9f2b4615f08f2b83350eae83fb9', 'a5b285194f30941cc1b58d5f79875c6b81b61733ce84a099bc09a16b81b0cbc89b5b97e60e3ce181', 0, '2018-10-24 18:45:20'),
('793973679f3819472f35424556e7e8e54e99e63285ee1beb32206ad56a542eaf2e7f27e417f60c35', 'aa5316f364d88577cc8d0175fbf561b31426e8d2528c21ff5eaeb6c0ec8e4fcea5873d9ccc2268c2', 1, '2018-12-12 16:26:11'),
('79715aafffded1def5265ea0f06890f00108bd5abbefea2251f4fd26489cedcf59c793754222fa45', '20750e6fab25dfdc19101f9f5c416f1b619e348adf1a2c9e89e5f4c1f86ffd9ee7502fac74f11161', 1, '2018-12-14 11:08:37'),
('7975a84981aa911392819b2144edf3a3036ca698792c48acb60ae48607cacb1aa995f420bb6c65c8', '9573b5e01c954562de3fd56eb0fa5fd5a68536257a21672d9a0bf046ccddaba1b09ffaa66f43236d', 1, '2018-12-14 17:34:06'),
('79bd3819cde05bfe95b3e216ad25059febcd15ea22791f52ac87ae828418b7e4df8d716fdf95f930', 'ebb377bf44663446f081600274a24d31693708bf3895d1f937dcfe683ae0585f592fc8ac399e7553', 0, '2019-09-08 18:34:45'),
('79ca52341d96e55fdc9734133a79205b3639a9fdad72fe902cb48551a3353bf96e6ccce5cb359855', '4dd8e9257be3950fc5be106b6f8a29d7df6b16c56d374cfcd2bce53b771e6aa4992f9a81bbfe9c2a', 1, '2018-12-14 10:57:37'),
('79dd017c0c1790031d17f2b54de792e6e97bae12a436d3f8d7aa9ac06d2afc6752dfeb8cac623396', '08c9af7e116fae335c487bd45bcd3cc6aee7c56a79533d93ab0c89147e168497d9a41df5ccf98f39', 0, '2018-09-04 15:08:02'),
('7a495558bd2dbacaf6d98a61e2313832c062666079d071b43faa00fae8d3cd95fd6b1dd0034fac9d', '5af443ae67a843588dd4302e5da53ba21be7da55f4af8292dcabbbe6d291dbc57bef3532054f73d0', 0, '2019-01-06 19:12:11'),
('7a7d9582de1841c157ed4770776d4f19eb9a5cbbebb08966f406a275c21c5bfbfd7ea4d3d474670b', 'd88e27acfcb2cfe471771d572af2877cbd7a6aa581b990e525d74df853c6e6198584645ed7c64247', 1, '2018-12-14 10:44:35'),
('7a88fef18f239531583585b985645c2d16eb1031110232940d2679841090c01f8a75cd7c25ee0fc1', 'c33e7b65dc2db3a5ca326fd24e92109ea384c160b282f0c74538cae6276c6c11615ade25839c9691', 1, '2018-12-14 10:45:14'),
('7b023ca1386be157665e8c3e25660e288db230e37595dd9543c7724a3250abf6a7e401a1f7695b7a', '677277b7c11e1e3cd533b9a06c45cc6a47dd2c082c700e804a60021c64745673dad689791a492363', 0, '2018-11-30 11:15:03'),
('7b09d63486257a4fc9b8e467c15826d4a7a7ad89db8b73a25c61c11b3c32f2567a5b700e04bf402f', '089423fa697418d235ff58ab3e7a7c42a09bce65c44918ecaa3afce8168ea155cae477ff4e3eac02', 1, '2018-12-14 11:09:02'),
('7b45fcdb3c2a791731d843ba9061a841d4d08705bfe1caca3165589b332748041e98c75d1114d640', '8650d120132aecc1bf5f52f3e4d4f817f3850030484e8cc1f3e5104e26dd11764803c56b560ab996', 0, '2019-07-17 13:25:32'),
('7b657ffd1e9a62c60280ee82b9d7959342bf8940bd0f82f082139741ad9f9f5b0f459372a737a72a', 'f03ff313061f50eac0164a82f6a8925644b826435f6485942b2b796ca51be3d70058b32a46b0f0b3', 0, '2018-12-17 15:50:27'),
('7b6eea7d860a30bb4870ce3b86731b92195cddc9722d0e9f0390db1b4cac0114367d008b5591799c', 'b21d7d5756cb5b619f6131bd0136986e5585978819c0a7469735bc795afcec86dacdbc4cdc88146e', 0, '2018-12-27 16:41:20'),
('7b8b7d6bc695948543d2136c5475569666e204931d06824fc20ebbe900e67540523d93e2fd0490d5', '5ced8e113907729c59ecdcfc982f40bb2b24146a13aff00e87bca2cac513a159ee6f721fdc53382a', 0, '2019-10-01 15:09:59'),
('7bb65a1e584f42115dd90a3f0c2ec8d83b2bd8ca250f685c306ee58ed3dfba2861c4bf817e6b459d', '87b13dfc386e4e9e45e30df938b37d350012135de8a3ecb1b1003c75d77a59385cdd80e593c4b301', 1, '2018-12-14 10:55:27'),
('7bd333d3480dd3cd8b2cf360a83eae443fa75781189cc59a54a4c118dd3b39a3ed9cfaf8799be0aa', '178c330858ceda31c41a2a73cc28f522281313386f673e6b5a04dd84ee42281e0167e493816a35e0', 1, '2018-12-14 10:44:59'),
('7beab241cbf74c2e32ef2d0ddc67eb3548e6432cd0b218a03ce43efd29650d93ca35065c9b1fe72b', '2d285488f836755d94b17b3614ea697fbe4158690f7817516ed6b3e083b441e02ee3ba2e61b1b90d', 0, '2018-12-10 15:37:05'),
('7bffe467c175f2b520c34c75a19f8331177ba3444f84992193d2bee1a667a275f3405fd76d9c26f9', '2a10207c1aabe32974cc1e751239f09f32f61779c0e89e736c9fe69a848d97a7db2e0d286f081b8a', 0, '2019-01-28 03:02:06'),
('7c1ff6241bf3a5d73d427f3ff35bdbf680fb06dff07f36a6f0938d57c31c9c2f2aeb87be2b705800', '7abca72672f06ec03a0fef8a6a34a879749c270c2869436110b3c62c894ba24f50ac3b4272e0b122', 1, '2018-12-14 10:48:57'),
('7c2a67652f80a120946cedbf05097705acb65e866050802e33e5078c927d2b960c69a66241118e2a', '66ebd178f47de3d23addaf7f1a4585a733a156505d85b30809b802c8519840cd89b17c3f8cd67b58', 0, '2019-08-12 17:31:20'),
('7c9647838c55d1d432e34986c0fb1f0335e957b831148a166e5c1aa8b2ad2d8973ed1726cec6f4c9', '3b6546a847a3954e55862bd71e93c6ddb35f69a1ae621cbb96f3b6920b9d1f9591d485a7ffa5f575', 0, '2019-04-04 22:05:44'),
('7cea948545557353df8e918d9df642cdf7c8dd9512f0cb8ed1a1eb05f8475978dfd4498988ec1485', 'ca2900dfca3291c69d7acb31dcb87b129d8a5731e608081070505f3d1017ec9a4a7923714fb99a61', 0, '2018-12-28 10:17:20'),
('7cf2460c5ea5dc6cac446df439de0cb89c3a9d38ec833b0cb414375a5d09379d2cb1e5008ff685ac', 'd7100d3fd932005cbae9ff27def0fed0acfaeac317274641f1c016c5b8c95e5f157eb94208a3b1be', 1, '2018-12-14 23:30:51'),
('7dc54df2e6bc67934cec992a5c4aafbc436d1583b6dbb8f56f3a5fa8e097d1ea09256619ba66f2b7', '535dabf758e58c68a7c9d03fd4c5db4fc08d84f1d1dce1f4db92e018f10f9dde1af1817a6e6222e2', 0, '2018-12-18 12:17:42'),
('7dedf5971ef61a170d0c599c34f3450d28e830c6a9b4781a8c5c79d8afa69cddcbd5b9033562de17', '27b2452272d4008629a728229a021f7866250870a5b3dd8c00d2e6d3013444c4cec5eee8809ee0d1', 1, '2018-12-14 10:50:02'),
('7f1e1aa8b57d2f934264fcbb77b1403b4f015610425c507a5031622127440eb8a45bddfd7f5d57c9', 'abfba1ebf1f4c3afcf39aebdd0807fc401b9d8bdd9ce952d69607551d6990f3ccacb8ab64be32fa9', 1, '2018-12-14 23:50:50'),
('7f7f33cb540b1600de3837f50f38cb23da6a6ab1eb8b8994366ce007d433ab8ddaa25c26bfc41212', '7c5ee5922365b0a8ee5cf5b0edd8d057733ef25af5661b2dd3f234057dfce364def07dda22155abf', 0, '2019-03-26 18:57:37'),
('7fcee081878c7b97b92fc9bf6d6a7c88cfae78e4250f4eec795c37c075afb9fa90dd77b7216eed95', '459dbe7db9580fa8fc68c86b2dea4e4006998446d177dd6fb72ab1fc6464fb570694b03882b12252', 0, '2018-10-19 18:57:24'),
('805dd763e30c549da8951ad92b7288e0dcf7fad1fffdaedc496bf4c476376d51fe8ea1bfd08c13d7', '12244f0e07e473e4f65acb02cfabc83f81263e34216058ab46c8661599ab3eb279d5a1f361e0a98f', 1, '2018-12-14 11:03:52'),
('806d64f8769162fd95f5b9f88bf45f54cedef54d4dfb424116bdf8c275f59ba583c714bb15e9c6ef', '07d79c5764f703d39163c7fb1d15b335179c4a64c5bd60d7f3b26ce87f8008fc4a84811d849083cf', 0, '2019-05-15 13:45:29'),
('8088c86627df3a6dd4299bca20dc63fca2c8b44716e547faa69f19f385e6097f722a5d77be9e05ab', '90ab22cf1a819a7153378c35eb1fb220d818a6fc315e0f026ab04348477b8705027074c920336c85', 0, '2019-05-28 18:52:03'),
('80a23772d4c46565be98a514bd9e9a62a6cabd607331f386abb2401ab745c06d72f8eba2ebfaeaa4', 'ac3a71abff56c35a9d0991eb5d78c9181543f0cfd5cbc55c7c46df9b09185cdfe80ddbb4d1eecb2f', 0, '2018-12-14 14:50:51'),
('80a36e543ca2a75dce49d4f33411833a1f8141fd9c706206acc954312dcdea279f0b7a0933b3a789', 'b4ce6cf80402761cd9e391d9e1e30b9ba2b94a2f2d3ccac8803387289c0a1f2d18388ca3ad87ed8a', 0, '2019-01-07 15:13:55'),
('80e3dbf7a83eb6fcdab9452aa10a4665dddf69a11067e3d8c3ff343ecd7aed51f5c20d23cf8e0c61', '1e287117c98a08a490446903d60d6ffb1a9569bd2636e3bd182cbb1d44cd21ef616c7ba07244b4ed', 0, '2019-10-01 14:32:59'),
('80e9e4f419896e2eadcc7a94673eef019d61dbd7948a5b4ed56c7b0f92269d6ae75c9228d427d2d5', '84c2d32ff7125939af78f72a004659e98a84b18e1dd14d2480b8f9cd0893124923950ec7c5af9e24', 0, '2019-01-07 10:59:21'),
('810441bd651ad1552cf5688c7d3edfc29976beff42ab79161153c4cc5faffbe3de9489fc77b05855', '7e3cf3155f0fee858231be374ab20005dbe7aab09249aada246f07ce7f9be2dcb4a7c62e38cfdbcb', 1, '2018-12-14 11:06:22'),
('81070c8d28739a6f711cd4c71407049335b4f19aaa364657478e740276fd9ea1a7cdbddf8e4c81e0', '9f722eff9f8d303ba7563d30280c3348e8ea60e05c8bd8afeab111134e94f9a5fdc5bcd04b1e961e', 0, '2019-01-30 11:15:01'),
('8124e0908d15f54310463f81d0d5fdc23bd2a722640a5318a64aa99c2c646125ca92ec474f420fed', '8529642a815ba8fcf516d10b38290d0fd577fc7d6ed55237983c5fe390e048bc399563d5cb492f1d', 1, '2018-12-14 10:47:17'),
('8193c3197acdac73643d04cf884581c3fe06a9603985ba817ee910ecc0c11aa3558fd4ca069a8222', '55a3b452c3a513b6368c77131b00963de90240fb735e39cd0593221158515397da1a9c2384ce4fca', 0, '2019-01-11 18:57:13'),
('8286a4f24c82d984830d01373955694193ad7f4429a24dabe57f4859c92d3a44f8235e9e7359bb4d', '907857cd4b3d347a6cd72dbdb57e731f6a23202ed5f30b10fefd0f1f5b80447ae26b8314a7708360', 0, '2019-01-29 13:13:32'),
('8287a4e658200d58ccdad35c8702f1f6a8b55327645ac9dcd4d49ff74214da8080d62be674825aea', '0ac1e9b24b9558928bd39f507ad2fa3a8ffa1e2fee722c4ae06388d55b9a2ecfc23822701e7b3888', 0, '2019-01-02 14:55:17'),
('828968fd75057ff60c6b99b766aee440d4fa048806198e5648193259edb9d7c0be16d5d6f9c85753', '13a5ed6f5ad93940d3bb2c65b2b760eca49a5d0590a55d135fe2311fbb63a2b565c8a8b2e3bd9c6d', 0, '2018-11-28 13:02:41'),
('82a1e1d87fea8bcf6fb4c4aea50efe951d20fbc600036c5e92022fc3cef3521296f00a6a2e69ea60', '0ceaecf4dd26c417d0ebb84b5da8509ad26b763010e173b6ffaeb27eab01a2dd3778668128f69e15', 1, '2018-12-14 10:56:17'),
('82ac7026aba2a0c528d7e7e931277a796fec132a1d16594a1d17994c680ca7c7482fe9b8f78b4863', 'd38439d43e8cb27c4b971c75f19c7b2a4fd673a3fe6757a4e1ab3edfed7065326119455ec7172b4d', 0, '2019-01-02 12:16:26'),
('82bc6a7353ba6d3fa579ff0eabf18dc8e18aa1fbda6497d2bfa829c477ae4dff071dd99bb8c2b121', '6a198088d42ac8579cc7e337cd75a3e55ce607b929e49729722bbeaa21435c9df335801acc30ac28', 0, '2019-06-06 17:29:03'),
('830527e2d509727731296c4a34fb44e6118aff91038da44bc915d0702aab4d6c00c5e29dbb855c0a', '581986598a8a2c1bdacea0c6ae03a6470ef32631627128eafb9e0c7913d6cfe05d89fd40314510dd', 1, '2018-12-14 10:46:21'),
('832998666cee09b5bcd57f94bac7aa5952183e6597c3f5af0546ff69a210aabf572253c7fc9173dd', '297abef102b1e992445c2959ca8b42823a48089680bc952c4663510ac6eccf5ae39af69eab550bd5', 1, '2018-12-14 10:46:52'),
('835d29b175f4ddb39cf85c4dfdf3a73a85665849d2c9f8966e10128e2aab5c3fb2da9a358f20dfaf', '700538e56e3fd552ca2373f7675ca7d281534e86cb84c57762d0b925c14388a830f71ee68f555ddb', 1, '2018-12-14 11:01:17'),
('8360c8bfcb24e59c69bc86d0cda39434832a85bd62fd996ebf6764ac76ed511ac1d10f574f8c0115', '0ae053585e4ecf5dbe61af42d22a9304c36a91283e8079b0f6825f02e61611e774c3b45ff7a2780d', 0, '2019-06-27 12:26:37'),
('836147bf4fa65a63a600c4983f7529f433b664216f461c899d020f2319fea2a561757b2148803e84', '834e8b739713d50c048c432d378738490f2544e52c6e1700d18c208cb46f17cba775f3acda9f6087', 0, '2019-07-21 13:10:18'),
('838e88975ef39e30e264ea1f06844e7ae7dd328532473cfef29495f83dab7da549b9afd29db9dac5', '4bc488918e975b0abb51007984118cb5787a50f4b74e2133dcfb77213f3bd7cf18f2f5c1f3737d8d', 1, '2018-11-08 16:12:47'),
('83a2ff904c18f7b6563a5a0ef0716dff7d77ee7bef7829b600d55bf81e1ddc0d1ceb79551dcca542', '143e7c45d6c4e778ee07aa723a1bcb2aae34e10c723660ff0c8abc22e83a30829f52d3ce56430e1b', 0, '2018-11-02 13:04:43'),
('83b5845f40d7170b6bdbdab7e5aed3e9025ffdf5e4c3e32b6870b6535296a0bee4060691b8dbb805', '0bf1e907afc952625ebdb820287aa4abbf4f830dcd26d7e517aac3c0890e2097f70c78132e88e9da', 0, '2018-04-25 16:01:14'),
('83e16d610f7c7133bebd3721b9b06d7fa405c14b6846c831c1a25058b68760cd04d7757f9e7f4aca', '9bd17bd162635a4c07e1aa318f829cd2d9044ce34881fdab0e1c390798bd78ddc38ec293b80e7f77', 0, '2018-09-09 15:52:26'),
('840f1311f7bb7d5743d496fee2a15967dc87f5fef1cb0f2ab996e0b57ea79e86b45dafbcc725f4d6', '84a9d7f4fdfe44ed9c10ec73218b6bd5acc272efb14fcad62f39e600d471906f7154cf772bac2638', 0, '2018-11-04 15:45:24'),
('849633126741899f0f731e4b519a281e26527903aaa7368a6c91aecbe2f737cbd65d8c79a8e79be6', 'a63bd2314cbff7917a907950ea2155767098929cd2eef0583d2d6178af3a93fedaaea47bd0e10635', 1, '2018-12-12 16:25:56'),
('8496b2451e0efb031509f259c16d79f2bd512ec55f913a7a642a924f3d630ba09a23bf7488c3218c', '64c8a5c7b9c0f38b2d9116ede871bf0da0391217addc835c0c0d5e457cac4edab2da00b5891d6048', 0, '2019-01-09 23:24:41'),
('84ba8ac0034a07831f5ab078b4d89f0b9c95a824211e98dfd713f4c4e914e868315dec90ed1c9d3f', '9ec5432eefbad835c9b8d661f4212dce23e182e54be6884ebb834d48c6672099d781bba2718be76a', 0, '2018-12-14 23:58:42'),
('84c3b3be0bf438524e294fffdf913095264ae8bdd3b5ba967e501098490d3d04376f306e98b6f676', '77373a4ae9a0c7c8c08b5043b85b3a4eaf64a750a959441d81a628f9edebda5b0e5e2a2d39892416', 0, '2018-12-14 10:02:09'),
('8546dff7a04c94d9116ce0fc92951f7df56891e47a52b4cf8cbee43b909867319dba925ebd039f49', 'c1d0cd6ecf33d3837f5af7adb5fc1429ffee0e4c797c32166842808ae351d523d93a6edc1037507d', 0, '2019-09-30 15:54:33'),
('858ad990dfe72c3f36c8849aedbc1a8769d2ce1b1ba429e2216859cf43bd71d47a026d2cb9b6f3af', '7320643bcaeb6cadf3b56aa13e68624e1f8efc1d8bc598101eb5a0f29fc01d78523d6e9a72bdc1f6', 0, '2018-08-18 16:49:10'),
('864f8911feac877d5452eb25d23cc448a11607790d7b79abe7bf6a0730404f526e02ee372636cc78', 'ceadfc3350bec8161f66d0dda08d9088a84155b8a3fa7248f5dda3d5747e1626c6fb7d107fff943d', 0, '2018-10-28 12:16:58'),
('8678670fa2ee64b5ec51765894383b7b48719e389eb9611f707ba9f1340338eba64bbf49a410acf1', 'e8f01b315feeede424e8ff825aa63073642f47b5b977c51db3c966db1929780a232f2008ceac172f', 0, '2019-01-06 12:09:17'),
('86b46d87373ef475f2c1740f0343eebc8daad287b43d851fd208ae595b9f980ce6a8cdfcf38c00fe', 'e2aa87795719eca065c1414bd83838b0e5dbd1a84909fdeae9c148c186c9b4e9fd084457bceeb5cc', 0, '2018-11-22 12:44:27'),
('875018bfe7ad52a4629349a4f7b9f076bce9fb7eddd4d69417d9a04ad14b1d08c46538712450aff0', '8c159424a82ffb3c0c1e573ea2948b30f57aa8d9da4deed92801453521dbb95cd3034f2ff5126df3', 1, '2018-12-14 11:06:37'),
('87511c83291f052014473124ec6dd087c804ed979fbd9a7f0fdedf80fec9fabaf543c8cbb27566a8', '522872e8131f77899b5c518914363e268ab4e7a3a226c966ea93e28920a758dd14b2886851b5382e', 0, '2018-12-11 14:09:17'),
('87c9689fd96ed07dd47a6e1d40bd1979712e47d0cc1b2830e7b6f4f835a4ec658800dbd2f42ea845', '546241d0fd04b831958ffc30a69c80013f44ad22041b3266361388a7d3fce6729f8acb9114764752', 1, '2018-12-14 11:05:52'),
('87fc549ed998d0dd1559cca753af4a23151f991856ca97a5e9807f320fc07998f49d1fe5444a153c', '06726f2c23854a4c537aa53b19a8d89eea21f86e0b9970b2635c0a62988eaf9e15ba4da6052565fb', 0, '2019-01-01 14:55:07'),
('88d51ecc469716279b08f2d2919d65abc8c2d49b5b8fe7768fc26617e8cd2a3db6dccf3f261133f2', 'efee06bb7d332ee85cdaa158d840d2f8b33cd1766f0269d49607869b410c897572a2530c7dec2c15', 0, '2019-09-03 17:30:46'),
('88e6b2c10e4ebe106d1398c92aa6525129146a67119743a731d84751fd1aeed6c190a5fced60fb37', '8ae4426ca9b9192ca84bf5a189f07f7f6e96f5bccb3b5f95d01f2908300e3487a2bf2d5fe533d87f', 0, '2019-02-20 16:05:55'),
('89148a065fafdae93e0181a8d838e94fe60f948a2f247c6232308542a35d1eadd737d3b26fec130a', 'b2a1fe597c8a4a125216e96040c499e4ee875a837f6738074d0ee66506abd9da5db820ef61291599', 1, '2018-12-14 10:59:27'),
('896baedcd97eb9f8835424ebac7b016dc1485daba6c3de377a907335e8ec62b4637c8fd80024d41f', '8c030d73f5a80f0ab7737ed1fdf3e84fa416463de222f45ed7b69ab411b3c826b9df3f0bed9b2d35', 0, '2019-01-20 10:48:53'),
('89b975460e1c417ff02c80a26b8bae6ccda7f309d0f62f410106877089dc62690ebf9ed372a46891', '089a555382baab0cab0f87f887d19bcac4195231054ed7117e1c6c16f1c249b255aa3e9f43e1d475', 0, '2018-12-23 17:40:28'),
('89db9e41087a54639d84cbed9d755a2a4ce10899a27640ced5ad39c2f3db32e49898cbacb399d5f8', '48e76e3cdcd1d62202bebaca6384cda70eb274db7a33453c018d40381ce0eb0e113022aa5d71731d', 0, '2018-10-30 18:04:57'),
('8a14ef0338c39c742a696c2262bcaef0e387dc1c86b8e77ba7a43e97ad626ad81a13fffe87071b3e', '565e636b6b93f845df897629217a4598b4b38d58f1bfcc49eaa34557345486984d0f0082e1155cce', 0, '2018-11-08 15:31:56'),
('8a7e2e15541aaf9765ab5f5a4833b6220bd9e01dc93686d5f422c1a4f587418b957502af68dcd753', '386b223ab6c99a9d3c72ed4b8d877979eba677b78567903b60d6a8ad7a7758bbaa85fc0e3cbb7f32', 1, '2018-12-11 16:00:13'),
('8a8667f89b81a0ca5301ab7e08d99732e492c3b45f8738a281c053312372c87746c0f6b74e13e04c', '025507251af384b4cdabbf3860140d50207e22aafd1a8e6947c29384df7231ecde63e92a05cf9a05', 1, '2018-12-14 11:06:42'),
('8a8b8e039b607f03556d5c478890bcbd826bb5a59eb04bde82ffdd8d450a80c8dc2bc4152b2be4bc', '0852d525fff875bdd52728dec8ee19354041961c0d8afe7850f36ae406343cbdcb9cca0353b62442', 0, '2019-10-17 18:33:15'),
('8aa9be1a29b5820ba003ad0bb6935cbbf569d18c4bb057276094e92f956108b6728b085db1a26f36', '2547af27046c861b6920eb65b5925dfbaccf94121d813bbc6b4cfdbb25fba21e03f636d58ae63c24', 0, '2018-11-08 16:16:04'),
('8ac623033b03df278e6b6109c0e2542b824f9a3ceaacc1fc68db160770c7d7d69fa2e8ae20f67e0a', '5eca45f1316fe187b631d07d14f096e4ca81408defeed844907376a6f4dabeaa601ca3d9745507fe', 0, '2018-08-20 21:33:29'),
('8b3be4a80ea16ccd4735b7a36e80b60f0605bc223a1fa6dfc86a0e1be4403305ad6589e06d4daadc', '4658c085bf8700c3d592e49b424935790c5496562ffd9e9b3e3abd2acfe3f6784211c55f4660e4fa', 0, '2019-01-01 15:57:01'),
('8bb12548189d9d9539caf8712eaaa728269ea85be221203fd74254e987f94a47b2a8d586534a53cd', '5c3473668a67ee89c552604f2fafb465cf18a7f4c6119f374879b086a951da6a1515da012ccb91cc', 1, '2018-10-20 18:23:50'),
('8bb685261ff51dfceea12191d076216e2d93b3903940b2e580776249f7e3ad5239a990217825ddad', 'c746b22cf7838167045ad77686d08a1cdaa88db01243467d9652f735916e5741bbd93c0466accfc5', 0, '2019-02-17 15:11:09'),
('8be7f5695bb1752ef290b14b8db6a3920ff620482892c7bbef661625121e56fc1cee5bc2caaf7454', 'f52c0ef742229a7a39a48e87a21d19baf7c7836d3421b22785b7b48ee3c60d542715c0c9297dbfbd', 1, '2018-12-14 10:52:12'),
('8c717e683be735fdca8357b6ce260d8db15ecedd102be08407f5096f902a512fa2c303f3baa5ed30', '102d5af92c9d0681efa18d284047d4f220407de12ae51ed37723cb9550c998eeb245e6fca60e6006', 1, '2018-12-14 11:04:07'),
('8c9cde20434a9d753488fa862fea2e47f2f019cacbc7056a29b417269a1bcaf6311806855575f6ba', '0a1367ff850836ceda55085aae4860c3b51f5da48310f29d71d9d3bde7f362d5a7aae575d65b5ebc', 1, '2018-12-14 23:48:21'),
('8ce0d091ab249964c5b0c2f20283fd787cd750e8f814881aff82e5e6c60215148314ddf0f269f6a4', '4bd331b8a48af41f2261285479a54d9e2c4cb502bfb81996845593e9d0b6b9877e9cea484f9f38ab', 1, '2018-12-14 10:56:32'),
('8cf2c8c3a3fed49b4860c1ef0ecd5171fc4f7dd38176cd091ef0490014d73d471a000e8cb80e10c9', '627db15292ab8dc82beb817ad17ccfcaf690374b7d52109feba48541a2d84d0027eaffcd50cd2114', 0, '2018-12-18 14:58:22'),
('8d1cdb170cd93505a1c51ff552569354e67cc94fedd84334c972dca9dd38c1fb46953bc2ee934ad2', 'daa2a4942149f0a2167bbf420343890e49310c0bf51ee12ce4576e03a8d6e3a2428a65645862c0ac', 0, '2019-03-31 13:04:27'),
('8d276357f54437175c7ef57392b4eef33276596e9e37cb978b4528116504e66b5df6b6098480456c', 'b472323bf520d4ab031eec9408dab11ac06111e4c48ddee2866ebee6d0cfb8d82b05cbe3729e5175', 0, '2019-09-30 12:42:08'),
('8d701ed2997ddedb33365a2dd1ea90ad66a2758c9f255c96d8a3a413c5868ee74aad89af205281f9', 'a86542ab0ed9c29103d12fa8bf3c19c5b6a347ad128bf596857cce3180b4289f60fffc5c21082f9c', 0, '2018-12-10 23:02:09'),
('8d95f91a10be5b5acc098c64c332fecf9f56214bb40b5274b785e826728804019d78d322fe633550', 'd5f0e78a7a640abe5be774705ff4972103670c9d706020e0e9fe2372c8a575355fec27445f3e1e5f', 0, '2019-01-02 18:48:07'),
('8db8b9827094557157c65d9657417a4d304f5b6f5c7e61c3e63b48556f9c3d68dcfd69d0ec950b30', 'e4979cfb6e20566e8a6075501512989bbd9306ba9018c2cc1bd9653e46b6b1669b33fb24212bef71', 0, '2018-10-20 15:52:05'),
('8dc3216c024c5f005b18b6b491dc56bdcd8c757a5f71fd129fae7bc18d655e54a7d1be6b6728899c', '729da8fb1d636f0d1c230630eaac25fd38b8c73f30cd103220b969dcb0b4a255e049a29675f3ddfe', 1, '2018-12-14 10:53:02'),
('8e169ba7cc2c572e4717dd202c9f2f4f5711e2e109eedf4a76aff27fae74cdf93d07e46f834e5195', '0a955ef5db893e2db631508eaa5a22d9a95611dd2fcdc60997d18885c54f9a2ecc0fa1112ac2273d', 1, '2018-12-14 10:58:27'),
('8e4f5a8fe2fa6b913c4473627bf9760744a6150683f8d6cd596b729821fe0d0fcb2e5677b5696764', 'eb25369a42a8c67f03809fecc48b2afb877de59f7912959c839c6f568faeaa75694a82e77ac2cd6d', 0, '2019-02-28 19:03:23'),
('8e5b98852e2e43d8ba1305acc959d4b142c5cce0dd45e17fc3dd4dc295fc80e72d1b5c25ba9a1397', '4bf4520f27282b90dd450b293c709fbc2a50fd3d6119df3ebe5f09ed5771f3f5132629c37f0ea72b', 0, '2019-07-15 16:10:21'),
('8e5c5ba03ac3dbdf85e0e9aca201e783f942031b26342936831309f1c19fdb68149ca33b380a43ba', '65a73a9924ed4247c35d5f9939d5eb8e3288900df4af8a3cedc526b6388b09d0c699aefb9f54b783', 1, '2018-12-14 10:52:52'),
('8ebfaf2e4e153786f7ec64090b09a0eb1b7c8f661951268a828cbade7362bd3b8d189aac74cce083', 'aa55010a8c9af3ca8f05eb6c51e2fe81af945cad915f621bcf1f78e9c76a9193db5337c439511db0', 1, '2018-12-14 11:04:37'),
('8ed8f5f8231a56854900dbfc75210503c8284d639a5d66eb9d86bf056dbe00e063bb0405e301a7f7', 'b6e69ba5b5c08f2fb323a637d560660c5445b39eb0736f0d333ffd7dab2868769683487181a98654', 1, '2018-12-14 10:59:33'),
('8f01a5058ed08ab3d6b8fbfa1d8f8b58844854c7fb27d0126637312fef0ccac42048c3b1e0809a42', 'e679ae2b9fd84f7f7aa0fdb82478a732774dcf23ab402b6beea2b854e5eed48485533a2b233e2f5f', 0, '2018-08-21 22:27:35'),
('8f701e1412f7bd0a2d9c63312fe2b3bdc89ccbcda83540dd2647c76bfe05ce94f95d573aa8fe78e1', '992b18f3102fab8b907217d65a800b556b5cdbe582dad8f97902793f2a79ca9bfaa112f6637aa98f', 1, '2018-10-18 16:21:59'),
('8f8e86a265347c254b4665cf591039c45f92b9c7bbc80408d7ea43057cefc277516bcbf4b6ed8f62', '8fb0b3aa1e6f8fe7a2d6b659182ed5f441e15ed9d4ce43a3a975590113acb9c14d2117848f7f33b8', 0, '2019-02-24 15:40:51'),
('8fc45c6b293ceff0435ec8cce517defae237cb46f176c69363a1ec5cc1c935458f040a18f4f88d43', '7687aa3924a0580687938a130211c5d354e0d2079bb504276f691bd528e38796715c877a8833b67e', 1, '2018-12-14 10:58:12'),
('8ff5ccbf1e7f1ea53fbd40ba2b480fa6eb66dcef5d2f1a37637e5dac72329343aa38c3db8c3de184', 'abb34fb3db58e88b61e621a545af2f0f959c42ddfb9dd1164fca6c5f1a659ddcf825246b63b73d44', 1, '2018-12-14 11:01:09'),
('9007a3ed623e1f1a7d67279d62fd75aa840c7c627dfb517e02b5b70973239f32414f4f1c1c64a130', '5f030e93432bbe8420bf0b13e8d61ab0a57ad953bfe0e2ca3537e1c1b9cd970fed6402028f113bc3', 0, '2018-12-05 19:41:01'),
('9014ec04defb2985730314e9149d0adb2f86f24341b756f14f23c54b8ecde848f24d19ceb5f2e9c5', 'e7ee825d51f9f15a290e04f896e584262d401c9d2fdbf462ed15662c9ee66cec89365a4959a10109', 1, '2018-12-14 15:50:57'),
('901b5c89e2dcb7888e3a164212e370059fb429bb8ab57c47ec55c173878181901f80174fb6e56b92', '892596eee80d2efd4d96a0f9f13898509af6fb6149be2b716f948d98fc00bc1521d1e5887975fc54', 0, '2018-12-18 15:54:52'),
('9096670468b424d1b1e70efbff8101175dc3523cbadb4125cf03248b03dabc57a733cc32bebfb584', '8aa89ecb7f8b7b5a7e8933bf67459a651865932b130d5198038235b4d5588f1a8be53ac0bf654dcb', 0, '2019-07-15 13:19:56'),
('91120b035019c78d036193d930bc8a895750e9c8041ef368e0a85b96d13c51c3ed058db9adbc3ea9', 'b822962e0e1f6a6d577fd6f12dcf47659a07c24d2748bc4df4a4e1862ebd5ce25f0e8902ca59be71', 0, '2018-04-25 15:05:06'),
('9125b50609f56b970f75117321b0bf1f7cf491e468299bb0c49cfcf06f5523dd012e65dad11346ea', 'c94d892925995a0dcffe1497e5cf50f9807d34dfe1461a2b25245327eab49b31901bbf7394d059bd', 0, '2018-09-13 15:13:45'),
('9133bc9528003e518bd6c3098716222f7724ea4b35af85c87c5e7971a0098903edd5e8ebb48358b4', '613b73d18eb9c375bd064187bc27f46f5051ddb49a79d90946aa0bd276763ee72583dfb0e22c8e47', 0, '2019-01-03 15:23:56'),
('91408479b5dfe83878544b5e99729af0124c4b6adedb53ac6d07374df63a7da1387af890c4c8b36d', 'd7fc8ab3ba54621945bbc6cbc1af7f25f1c6b285c4c2f96204b3e1df08a53781ede986527e809c8b', 0, '2019-01-04 17:48:19'),
('91de21e1668c9e325875a03d2317821896b59d310373a41eeb291af021d0e09a551b01629e3d33f7', '9c3f7e75747539883150c708180b228799200ada1bf9b058418ab3cf8d111564c85b671c54730f71', 1, '2018-12-14 10:54:47'),
('91e4c353afb74bd69650d22f2e2556f73df86ecac28cac21cafd6436a97ffb434ffb132ac9db0cf8', 'cef8734ca807d0d5626370aef3344b8a5fbd7a7f03da5b538237ba8d0a929801525cf7a9f4e774b7', 0, '2019-04-14 15:14:54'),
('9252b433009ddf6c73a7e40dc21856f8606fb3f65a4ee448d1d289b79a33d3e907e511e2ffdfb897', '40c5bdc8cb299ec3f03ec1243dfe73aec1802d627539db964c8ce4ef129adfa582a8ce6abbcb9b82', 0, '2019-01-06 12:32:45'),
('9283febaae8a2d66734a3bf6fdb51c6dc8d6ba1b597298d33d29cfbc6a195d64ca388c065f869fc8', '9a81d56325d036d7d8b85e05dfd0b7331d801686739a78f2d216d751c7bb3c5b5dc4e6d7f2f0fef1', 0, '2019-02-21 15:05:26'),
('929df09fbfc284278eb05a48bec09ea184a5db1fe25d87643d0060ba58fd0c06afc5a87bef8f69a0', 'a3746a6c646fe9c2425fb0984ccadf671ffc239f76ec6dd5ddf220ece3fa31d7710c8b032247843c', 1, '2018-12-14 11:08:28'),
('92e0c82afe92502e7761556d3eb2a124d687a2adab7e44cd8df424a581bd749069ffcaa147e779b5', '394ac4c0954b78326999b0dce73a257e864bdd25bff397d4c77c022bd4da90b7990c4117902ee520', 0, '2019-01-06 10:57:43'),
('92e95546a4d4998c5db829c6b7ce7e40691d98eaf9968cc4d2e56d1db7dcf0419332a7d89faadb91', 'cfaa8110b60f1943fce59d0091cdf4a729783b71af9031c42ff5fe8a6fe9c5b413056173f477836c', 0, '2018-12-21 16:20:54'),
('9317c8153116943a9a86d803bda1ee78d605c64aa68084d9eac1043cce5c57d4174575e7094f9548', 'd837c6ee07a0afb09ba2e4c88248a5a6351844be79eb844f15f7ed9beb5567272fe74f81255e43af', 1, '2018-12-14 10:57:57'),
('9336ab78dbddff3a8755f98d3953278624114560964b14d02e4fbebdcc946746fbb0351157bcebbe', '68b45345f31c522654bc57a2a36da4c78bfe001e85a0dc5e8cf4f3671de801e283e2729edfe9db0c', 1, '2018-12-14 10:59:22'),
('93377e808f0372b4eef92ce41842b3332a4c94f636f3d7ef7001232a145b1aca0aaaee4bf3800e0d', 'c67c0bde92b6010f24d20d4090a2acab29c627186215e849b0783cb6253dfcf0a704ecbd99e0f57e', 1, '2018-12-12 23:01:03'),
('93589c21a213cff84d1d9b4e0da0ef4fb4b6c41019d35c700476181c0660c88f174f957c027a847f', '71ad2e151688b048e0d37434ae9a39b5c0c197bc2bfcae0d03d5ba35ab58c45df5a222563453b652', 1, '2018-12-14 10:49:17'),
('9360697c71b43b7756dc99b9eae963c150fc163c882b698a27b7380ca9ec769e8bdacaea1fe03027', 'cbdfbc3ab7b582e8ca6dcf8c45957a9b2f470ffc366fef3715c1f44be2f19f7e9b90e8f61399c23c', 0, '2019-10-02 13:49:01'),
('936f675c70c974a53a424bad568e9d5c5b17974c7f606c18e8a18c765182b5e8b85b77c91776fdc2', '5fc74aa53673d46aa10ae93048daf4aae398808bbd14e0c32b6f2e41d73e4e6c7d6d06e8672acc10', 1, '2018-12-14 10:55:22'),
('939ed110dbc0be35f65d1e5b78de72d4cc3365862c0c555f94631f97bb34bc0cf1bec8a551482088', '6596eb2ca3dd563247471587b6df888c131fe1880fe48ead9602217b48e8bd5c1a1a43aec0c58db7', 0, '2018-11-06 12:46:00'),
('93ef824894fcd6d2aa4e442d421d43530bc961d420c7a81110d2ebf3354623562cd14472746c0d0d', '09928f4894f9034d6b706f44a8aa5410969777a237294bd51587afe34bbda8cee3f38404d31e6ac3', 1, '2018-12-14 11:03:12'),
('946347f73e03f24042206843b23d00d92aa0e28b26b09d3c01b82ff14467650f621e5ae53e011c42', 'fb8ca52a3de053b7c0b0f7cc728e4de3d829c50620bd23ce589f255de7b5aa60012d05b38b4b9478', 0, '2018-11-09 17:16:38'),
('947d20182c1ffb5676d5b256dcc3294b340305e2f29aa34846da26250cfa9f3aaacdb5309c13c97a', '303ed0779eefd259e21deb178f4f1f04d957a24f7364241c9f1ead38be59eee27a2dfb1118182726', 1, '2018-12-14 11:06:02'),
('9488bfa1f40b43bde96fcf41784464477937932e16266136310002382ffd3690f15d7a5e93ed4cd7', '2704d0a5ee58545a6a24f215caa6c321ddfba2d52835e2598810f81659aa59f144c5dcb14721d372', 0, '2019-03-26 19:09:06'),
('949054e66f05595622d0f2d0cb262de4f6b2c956ac7f28da6a4b8b19aa66910bba25a5cb7ce7792d', '850b5f7bae89cb00e34d8d5905cf8608b4dc73c97c39c817f1bbf6db8e50232df2419656973e7d62', 1, '2018-12-14 10:46:57'),
('94b837773970c6d687f436b72094581e38c474e6b20f8fcb70ab72599921c893a7793847d0e09d88', '3cb5daf4d3e006bbf2b8ef006db3b205a76be1df22c4e253ef6bdea15aab88dc2cb4569c41e17ca0', 0, '2019-10-02 17:32:31'),
('94d006a2925bbc97b507ea179a8a8e65af7354fbd8bee45d81c9b1481eb7046b06d0f0a6e1cb5b73', 'dbe05aa548e59f3c4fd27f0a4f82de6ee8bceb399f8389a2ba351bafb85e2660eff2d6218bd02d6e', 0, '2019-01-10 13:05:58'),
('94d8ac8e9ee2f35b82f37b9200c0ad75cddeee0c2546c4b3a50f52fb15e0646799157fd12c46a602', 'b0f6781d35036e85cb7c9b452854aef40cda1cff9e644b2c0e180e18e1393bab7f3a483e03ee762a', 0, '2018-11-04 11:21:15'),
('953b78dd3da09fa6c5e7ca07e4409d0c39fcd98c42956fac0d9c6ba6659122e5b4cc5809b9b0ce69', '39759deabf02e36855d5e17381997ebde5b46c896efec9cb5722d2553a2dbd96ea6fcdf5808b9fe5', 0, '2019-04-04 21:35:56'),
('95b9275e2f712599e84fe0dd9e42f0a6bb77553d2ab269046be006c7ca8e61c58ef51f64063c438e', 'c48d5d2eb85e078989d58152485fa05d1a884de9b6eb86cd4871fa2420c7f50d6608c5d45e93dbfa', 0, '2018-12-17 16:55:40'),
('95f43c7d2ec733c114d1858b1ea6796d81128434c4de157104d1e8e068d0a553ed159905a191d8b2', 'a1f22c1027fbc56daeaf802ae274bed3363af255a979ba95f429a19b790d6f37e4a10ba59ba4ee4d', 1, '2018-12-14 11:00:42'),
('960808bc93d2e344bf86eadca56d07348a157520e3b5c42ea25e48083a77d574e63ab54e7baa215c', 'be543dc335a2cb996308910a5263e58ebbb2469c9f1fabd5e718539afefc5cbd839c278bada4775b', 0, '2019-10-06 18:11:51'),
('968c332b56842e2f764b8ed1eb3f4ad4724aa87d4dd2c9d5c6c3a1677e7cbebdf859193cfe71093c', '24578aa2a12dc2eb355e89d23cf3647629e65c6659c52d3e55460c9825c70f9c4cfad2c61b75daf8', 0, '2019-01-07 14:26:53'),
('96ac5bc2d641d49be791b3f0c429df11c1ad368da264cb5bd15e5388349a580ec030d677881991e9', 'fec5cd3c672f3c73b48d6d8c6045e64c70f0d9969087f1f541ac477a78fbf7b4112c1f89583710bd', 1, '2018-12-14 10:46:27'),
('96d41a0fe2de724d48d10a88df25d6cc0141633fd92f87bd80d63612af73ffdd46ff1f45e817005c', 'dcd9ae31d7e60eb0f08ed7852cc95f45f31e7f3d1fa6559426fe7e1038cdfab22efacb6d2b668b2e', 1, '2018-12-14 11:06:57'),
('96fccb8b5ef231232a8836206333bdb698a28d8c47fb9254567bb08c57817dc9c3062f783b0fbc6a', '2cc0936b86028745b9c3177133a2d26a06000f9bbe91eaa3bdb904047ce44436ed3763adc57fe477', 1, '2018-12-14 11:07:27'),
('972d45287101ba195b0c3727181ea3f2fbb5e0c2d82aa36f5b3d822949fa0022cc765501c9cb373f', '77f425a3dd386bafc150b66a2aba0599b7d1ab4908f5324942b66e94cabd758c234242af40b6d805', 0, '2018-10-28 12:06:08'),
('9731564d2a0a95a0f2a91612a8a25b5a9b20ca13674eedb926564482ac6940f551efdcc1f70672f4', 'f58cc12690a4f2248f7ded74d1de735651b4748f0bf02c834ac404774e58facad0e0a13769075548', 1, '2018-12-14 10:48:17'),
('9738dcca68abb5e8aec3b4435df805f8adf45a38c30157c97dbd4f7576879d793f0c0173ff24432e', '0a3cb1cb4ae28370755945adfc0652fa5d12391d7f9a480adfa0ce1599e09148dece4a6de60a13e4', 0, '2019-09-09 14:35:34'),
('979a4444705fe87b08d408b2ec0cb33c9418569accbceacee9fd8a53f3a6a50b7edc0ba9e2cb862d', '481e52cee68e505c84380c97b34e7bd54c0c2d0d496550e71d83523e8c1e949e369080f7d8650b0b', 0, '2019-09-20 18:49:10'),
('97b071fc14b3f289b33bfd71f54fd7923232a68ccaa29fe8f0253bd774931f9ef625c45f4d82ed46', '0e9f61b1d857dd6d2b9b5ff9b85dacfbaf328203cdd075e0f121b7d570b356b6a796c7c9f6abcf3e', 1, '2018-10-18 16:22:15'),
('97b853046dc8ef4b495bc34d5154497e9488da897cc9422088c489c6707c7560963e7b57d330b3ec', '2dacfe0976fed0786282bcbf5384f1296dcee37e11ec28d962df516ff4b2c2743d6c6d17b60e8265', 1, '2018-12-12 19:26:28'),
('97e40d936e807985ab78a6ddb23ae77518a9125c4a4c16c5c6363686233abfb71c8de917e0d54bab', '92e6c36d4f48c121bb47bdac6ce47ddc36a8884ac3499fdbfd73657c7553be9a026232c674b295a9', 0, '2018-12-28 11:58:07'),
('97f0f167f630a55ee4fe32a5dad4da2d3e676b0fccd3e87f829fa33df917f953b4b4d69441ab117e', 'beca1770b492cbc62b4bb6ea5bca0e97fc7a7fbe472f4838f1aae3a09702ca0029ff21045e409606', 0, '2018-08-21 22:32:03'),
('97f6141b8e4155dee41c508912df3a81cba42f640dd9138a7aa35341ca432c2aaf854d6c00e447bc', 'ec1b488be0ad08dce8405b510ff3b496ce6d936cd72bd54093845b6e68a889d7c379c7bfbd2afd36', 0, '2019-01-04 13:22:09'),
('97f7e487c90d88f4f834124d8dbbea0867a7091e252c116d58098b313e7a589e3aebef7a41878f6e', '35fd87a8b1453463297cb981f5b5b5aa6920bfc033720484b075f6364d32493e86821fb76b9aa2d0', 1, '2018-12-14 11:03:07'),
('980c202234a1cebf9c9d1ee0634122f7591296440eac788a92c09e401b58793d70760dcc1cea14b2', '7635ac5c17ae3bc0fbde4228ae5d7e03ca2398266f794ab8f758ca9296f85f671135ff1e8d18c53d', 0, '2019-04-21 16:01:31'),
('98a6ba6d1ef34a8406b16d3d7551a82ed18eac714f083785b31dd4639b4d133e7f0c6f6089b22d18', '7c01cfbbe203d2957cdd1fac68f9b312fa7539f30fa8a8e4e9b50d1e1db02b27ff6c57e04ca997a8', 0, '2019-01-02 15:03:53'),
('98dd11403d500fa5fe5925f6587511f2405884a547f7d807d4764c459cf4edf146e2d27cb64cf15e', '4715a4e15587d2a22e14bcaefa598ff66774a9ca12cf6c9e6865816a110b3e3ff96cbb88be85b774', 0, '2018-10-30 11:20:26'),
('99536631f88a4cce026ef56ff13bad1d5dc49f0263e6a05eab7c647fad42ff71b5a73e5dff241348', '0993049b120d07c26325dd0833fb9896a93715524f9eb4835bc6040eff9f5955a072061c4534c895', 0, '2019-07-08 17:50:23'),
('99c2d6646b40b3f955f428ac35b66118a845d63896a4422874fdd186830e87632e46b6936177bcc4', '182fdb739e03da9be192619e75c450b160dbd2336583b8b99940a4bba0f777072b8ccad5f8cded2f', 1, '2018-11-08 16:12:53'),
('9a05f4f2a97866b304615b8604d5d899abd65d7f4330b8ff742c4992f33491f3731f206ba339643b', '160faa5fab1c0f38368683e3cf603f066127f36fba789c15aeaffb9d43d3cbbb6154720ffa33baae', 0, '2018-11-08 14:48:24'),
('9a25387083a881bd416c4c9231ec9acfc9dcb6a5622dc5d0fa151c8e38283f6bfe25911569062773', '18bc6202236d99bec248a9e5f53697eab91830a795cb597e7bdbee36db50d92eb94c64ed9e6deabd', 0, '2019-01-10 13:49:13'),
('9a3ba12d4f07debb499e76478a365441c971b4768e37611cf1670540f6b94c209ca5bcfbdb2e6912', '99563700051203356d06c281f7be63368ede8ed1e2783a9935b4f1e172ed1cb0f27770a792ab73b9', 0, '2019-06-05 17:12:54'),
('9ac036b854632e3cefcdc8bc155c8f0f3442e57741ed99c0d8cfeec9394ad94d94cfde7c5cc9388e', 'eda4f94c1454a527d87cc8df4d0d4b32007a44c67b9cc73e38ed435364d69d5cdece6a475953e739', 1, '2018-12-14 10:59:08'),
('9ad9b93a2382ee1f4c69d5e7013570dc40405e4d1d14cf90c9bdcfb6ec32bedcf2f8ee9f95326420', '15cdd89c06bb3de0adebe79a0b750285392fe77dedea62a4b197b740f78652fbc17a9fa1af156290', 1, '2018-11-08 16:12:51'),
('9adf7840f9afac91415f706be85826758101f0fe6d3d9aa266161f51d1aa47d5ddc72a6d5dafe714', 'e61fe35f40a14e996c35783e210aa29c6a5bd8cadf830b92e75540bd9a2e73e8b6dbd9c1bb2bdb31', 1, '2018-12-14 11:01:22'),
('9aec615983b6d36a8636db5d54b2591afa2d677b5cd84bb7f465b387ab17ac769eb54b7fc0aed65f', '2ae8e0e93d1f127bf1732d261e8341ebcec9b647eb50aad96c1cf9edbc54992529dd94a9577616ec', 1, '2018-12-14 11:09:07'),
('9af522b7d26b5670ccd6861ea8d7623ad74b2f6448cee6166f6b36ce196cd10708fd4e3cf78bd135', '7a1049f3816d6e71f0ad993f45cd0d72fb22c6eb4989b79c94915a3c6b97255df714e4c9c4176b9b', 0, '2018-12-17 16:01:31'),
('9b317ab860efd5dbcd545bd300e04727c49ef5aa7f0b9bc6fcd37125f402b120bacd51a56543e0c2', '9ca9a61153cafae389c7fe4c3b7184bdc1494637cb7d9e73aa57daed090fe83c9f75263be1a76c1b', 1, '2018-12-14 11:01:27'),
('9baf88fc484e92645817d654c523489d10d9e46e51c88d1a38d052f13343752117cc78cd8dc9c00d', 'c37939d38a4914cb46f85e15b0f41ecb88d103dc6c536dfabf7063b85ed9cf281bfdc43f3bba602f', 0, '2019-07-15 12:42:41'),
('9bc2fda8e197b4f0b7dcf9a782cf4213dcc01f4d3f78700861bdb87c429dcfbf2989db8783f9a34e', '9fbb42266717448bc425ccc88cb7358aba8b83252bf6632bb588977b0f8c4d021e7ea0e6717d24c8', 0, '2019-01-04 17:09:35'),
('9bf29394f1292af618f2097ab80d19aca509ea334720a7f78def9eb4eca226fba8754eb2bc531a6b', '1d17f14e755216cde991a11a181bd3c07f6e808dac9e99d237c94b3a34a17de429f362410e3f7628', 1, '2018-12-14 10:46:00'),
('9c9145519423ea1939bbd4ea2f8a241cb8345cd177a2879c961cebd2b7ed023236f5fb4b9150888b', '29ed4482a122b1d7a6a546c96f525611ca3f1609205827ff3b086fbe24f0394633eec8be00d4fe09', 1, '2018-12-14 10:51:17'),
('9cb0c4d7e7c5dada4d2bfee8d481f5e6f329843ed2c92e564e7bffcc17a9c8b5b1c0465d23aa817e', '34f498ebaae2957902d897a13e2fc839d4dafa19dfafe5aa5a9a741a70f140c974ef2fbc5496cc6f', 1, '2018-12-14 10:51:27'),
('9d0ae13dd87dc6406610e0d8e91807722fab99efdc82da81f6b5e4889633ca17f98ca949cbedb396', '36a1ff46f967d9dd433232fbbe7be0254dfc1ace63498406c166bdcb4fbefbcdf0f948c75517369b', 1, '2018-12-14 11:05:02'),
('9d1482056e7ab5785619e734f905250d55578d61ab90d2ad874f8e267160683ce73c8520ca2e789f', '529448ca4e0df3a94d6c4d5aedadb9aad3c1b5a1241e24098b45a8a29c1bb90cca50e99d3f6f1579', 0, '2019-07-13 12:28:53'),
('9dd5f83a3099a571a7917217d8562d49c0dd24fdc06237f4854c41764912d94da1591edd739c5fbf', 'b9a9aed4109f0a1d6653a9db15f750e2e04cc415916a6f8001d1cca58ef4948d9fe9354b4d0f91cd', 1, '2018-12-14 10:48:37'),
('9de33aa2527292964d892ec7cefa6f0aa6e2267ed067cf8fbdecc103e950d6bfb6668a1cd23e5a60', 'de5dc72e8e4f2b642e1df089f4c71c8c704dd197f548230fb00e1441578f8b500d51ede416e2ce38', 0, '2019-02-11 17:23:58'),
('9de81f95b604ed775b44adf6a16096c9707a1c75c5a881b981ac40414e962b7396c79ab54c0774dd', '0381e14f1a15eaf708ef5801de12a3df83101a901c2fd497705f07cdb140d321286478343d001c10', 0, '2019-02-28 17:31:37'),
('9df8546092d635e0b3e62041717237a2e78fa34eb978d18479410f3f70c76ab2ca5c813c8b9112bf', '6b4e545d6fcedd1b2eef9e31b712bd510a99fca8cef7ffd44361a5b64b59be4ffffd11b55c82f921', 0, '2019-05-24 17:25:53'),
('9e0a94f95d0c0108918b2294f19e6583eac24916024c34e5b5b081396b3b8c9ae2741478cecc8574', 'd4042edbdfebf6440de5ef48fcedd0903472dc83ef12608630a16cb1fd8233035bf8f2e89ad01100', 1, '2018-12-14 15:39:45'),
('9ef2c31e611e17c03ec7301265d669a4a052aef1298941abbca728b5f7456ae91408881295bd1645', 'ea1be2ddb5e415fc73e65b86560f6a04dd83bd632e56f42f422c9a6008c7e73069d498c1ce736bca', 0, '2019-02-13 16:42:44'),
('9f117f328d38be651177d13790c4b27526985f2dc2a18a9263249427e450b54c89ec88200b28a981', '7dc215e492f436f274c3cf1c661e593d8f615d796af92b4f972010f8a91fc295206f24dd334ef1f3', 1, '2018-12-14 10:49:57'),
('9f309ef10d51236c7987c9afc7e8483e2b653d55eda6db2671d621577601a01c985ca98312cd9d03', 'c533bd26efa6f10db8ffbbb4952e53a024840b3f4203e26932d6f10c503482348f6b47ab13bf5907', 1, '2018-11-08 16:12:32'),
('9f55ee43891a1af158b5e94c6ba83e5711a9bc4b5d2c0ee6acb21b7d0488f5cf23ca7710f5bba8a9', '6214281938d63a5d843dd48b70fe817d057b44c3a82b68e0d47c8c2912811e879964d0a05fa42cfb', 0, '2018-12-19 19:41:40'),
('9f806243a0c6de016d1546d193bd358c19f594794c43759d22665974c953f816602ef1010455da8e', '09895d35d7f58fbdf77c6fec67075de9fcd4eef3b7a776be604645078b1fa9822cbad7e67a7b7b9e', 1, '2018-12-14 10:55:57'),
('9f89bc171d73983c53d8e6e77628907c0ccb46c39956692e4588933aacf9c904e581bb1a1c4e0f1b', 'ec44f2535ec2fc46b5bd5596dac4ae3627bb7cb1ead524f94e04670e2e90051aaf7e81bc7e123e5d', 0, '2018-11-08 16:07:23'),
('9fca11f9e5ab0da8070ff43bb83dc983be034854a31a421853092be1be1014d9106ebd39f00a745e', 'a583fab1dbde0719e40f1f5e03d52427fbb7df46b2e7487206d36f15a1946d6047e93384799e1197', 1, '2018-12-14 11:08:02'),
('9fcded774e7dbbbb6d2666a020367f6289f5fa2c8da10bc9cf085d58310f5aa5fb7d3754dbbc9bfa', '184e8a725a7607a10cd230f1cb0d3c920d112680318994d40f8f91e14032f46d3b41a87caabeaf4a', 0, '2019-09-30 12:43:05'),
('9fd013483d4d67e06b93b44a3a6b953932490d920a4f48b47da5f333e82b2b6e04df20c0dba9b814', '66449b200109ce979b0d773e9433de131b244a9708d6b82d4a58693a4ad87b47eb65a5f836468c1a', 1, '2018-12-14 10:50:47'),
('a0d029f46267e6bf5e52914c747f18aa0b544619749d7b4e793e63867247ac9d59be9181597cf857', 'b70f136022603842579f53aafe8bc4e073e2192591a7f8c7e95690e50941a0311467fa6eaa8204db', 0, '2019-09-08 18:45:25'),
('a1802e3ba31e796e3e6c72aa8d00b47f424978d1b98b1e6cbe806e9bb3fe24106b9ffe96c96fe9ed', 'c3351ab960235fadbf91da1682a9ed986b63150c29bf5ed7e423d77fe63f750d741e3f1c359d7cb4', 0, '2019-02-22 22:15:54'),
('a1a7647d35164d3992027cccee8d0411b946ad29743182083824186e54f65e3c08f1cd4f4d675ad2', '463a41fa14c6fb6ee0f94e0f212af366c5606658dbfcf88db7107cc0ebad68f58cfebc75a8570fb8', 1, '2018-12-14 10:56:07'),
('a1f010c8bb06d357397d4ffb8c5fb914cac691043d6ceff77d771aaa1ce7d417dca882eaf3f95fe4', '18095821c733a5e06911e872b79c9d06d962cd0a0219e2bc6a12886305968b0ba0da70e0cb0b84e7', 0, '2019-01-04 10:55:02'),
('a1f4fd47c984bc45aec1e7ac92a010fc358f1a7bffea0cb442088d8cfb20dbc94b2c704a67a0e40b', 'd34beca53f5d1bc8aedbe1e7f82d3d900ec5b0565b143574a9ef0fc82bc3123bef25c43492764392', 0, '2019-06-25 14:06:15'),
('a224e8b758b0dd63b26f3663b97bb4bc1e30b6baeba18a0b54f60827a207ead7588fa8cf7375a731', '7c12ce670a56d50ad3405b0ddaee420593210d58029350da4a37b0a6fd90ef2ed928d3e63a5e678a', 1, '2018-12-14 10:53:47'),
('a233b6df8f34b6b9494b92b5d83548fb46cd7b28fc2bedc4cda45c0225994d12e04284f503d82a26', '4199664eb67668ca2a342229154197acd91ea4f7742ec2d82b915b5fe50d95cacedee8d09b8a0872', 1, '2018-12-14 11:05:27'),
('a2c1362577cd16245d159f8999569e8abeb6ea00704d15743e6b2160360976e4ad20eb4e08611f6f', 'd12f23622b95a96020a25410556ad9e73edad513dec67add4b7a078a3ea27b148d795140f4a6d020', 0, '2018-08-25 19:34:07'),
('a3a700fa0d5bbcc2ec4445deddb621be7c655c5eb43968dfbb59d23d25cb00b8d27f0449d24022c5', '3885be5e80db4d2e9e814ebf3d27841edfce0baf60717b06124abb8ea7560e392630dac2a8ee1ae9', 1, '2018-11-08 16:12:35'),
('a3cf19b281b9dddf486d626e975b1df4b0e795899372b5fe3e8352fd09d48dec1657da6913c97869', 'd4ed0da39d9aa91cd8ec9e47fa6e613eebed8141bb4e825171466c6b7494bbfca5d5c70fd201e263', 0, '2018-12-20 12:46:10'),
('a46de6004229eb927b37012115002e25d33f1372ebdf7b4a19f9ff54aa70ec29e3138d2ffd1fba59', 'f5f5cdf5cbdcd77b06b5a034e0bffe66955e28a84ae4b48a8605ce255416c4ab392ffbfacd9403e9', 0, '2018-12-19 16:21:50'),
('a4ed510ec5a891f6ecc6b90cdc1e83311e4a9ee61222c54ee6e0ab07e4e85d2036415c92365fa129', 'bbefb751728b7c3f5d5a49e4f6a5f023ccd8d0d843a86039a3c573faf0af2f2e80eecffba661f797', 1, '2018-12-14 10:45:12'),
('a5659994127053bb95a7df7e1b47a8d6d3cbcea0f011114805e20f6071747f170f72595044f1e9af', 'b68bc1f0b16e0821a5444d33bc15f237c8dd4634794672db34ac7736e247c37fa23995335266e767', 0, '2018-11-28 12:54:27'),
('a5768d121139ec97624a82f501e043defe44e43886639ea3645f6fb5c1d75aed73bc1feb20632c6f', '35ed187217df32021e90853d64004225e61997179154f4c2d114e24266f7e5168ffbe2d239a25a2f', 0, '2018-12-21 11:26:13'),
('a5c3625b66148e3f161ac498f2ea2d3d60ba01be3144f4d1e8a5387ef2c0110a61718bcb223ded9b', 'a4a9d24c4f8afefb9c06e3a1362018eddd9c4568fbaa03d375881320b34b1f43da885e0bb582e760', 0, '2019-03-18 20:25:27'),
('a5d539f38b7927527987cb2e693d740c78db7d2ac8d6d4971ab157cedb61c6b624f21c9ee223198c', '3fd6e58b0e569d0b5c322b481e2ece8b89d0c0030709acbb13bfaa02888a2b36a4adfcdfdd1a1b47', 0, '2019-04-21 16:21:17'),
('a657d43b1eeefb0ea34aa6d2ef015548dd61408ff269fc9a79ca1109509c8c804525e18cdccaf67c', '8ef4e6bb3861b3c6b4df226bfdb8bc5f022856679ae6eeb6c6de089ee3f0390d5ca307dd5cdb64ba', 0, '2018-09-09 15:55:49'),
('a6b315d044e9d75ce620f7eb6453b6561975e6d88d75f1d374ce1a6a7c847f44316988135d67ddaf', 'b7f5883c65fd3e5f5782eaf011b09557abfccd4abd42a48adb701ab43056cd9ca48b93d99b1ec283', 0, '2019-09-15 20:51:31'),
('a6b6292bd593adde9411034142ad79dbc0034b4fad86ec15c3dfc7315e776d750606443caf6283a7', '45d58820cadf90ed4ca1a741bbef17385c9018752991baf6286825950b09c28a0292d4ad8cbf8c15', 0, '2019-03-28 20:45:40'),
('a6ce8f741113c684ba18e240d8584dfc24cc408c21fad11f3e8363388d3c1dbd4d58b8ee33d21eae', 'f2d60e0b99dde47874dd31ae7b1a6e99c7d7f08ad631ed15d7d45d590bb77c3e05a702dd8afe0004', 0, '2019-01-07 16:10:54'),
('a6e53792ac80297f061b9da019250ff2ef90889773346759b5d568774ac8ace7863fcdc7ca7e7a6e', '8466aeef8fdcf7299f8bd413ca8db6737c86603eeb42ab5ecf0ac906b8f9ac53bd051f68ade36660', 1, '2018-10-18 16:21:56'),
('a6eb9d592cc82ee6e367cbd5af5e8d875b3eb35267e36728829e2044298a7cff218c0df5a2f1fa60', 'ea508a81d6cd588c479295d45c6bec8f0559d5bcdd6c36ac422ce9965705293336299b25dcd5d941', 1, '2018-12-14 10:54:22'),
('a790b9f8ebd549444b958973b431b126cf32ea25549a7d03717d546099f14c929b0dc89a44387de9', 'c0d16e2740752b6269718df8ee04194253369d58c5c6b8e0ebd3073f40020fa7dcc31afb3c832385', 0, '2019-07-14 23:40:56'),
('a7ca787548b1a3e8e5e395cfb8d86f3b134fe720c3e17fa2634d42e9bb169647dca65ffe07ed94fe', 'baa8dce538d0f6b54a93bd865bdffa5e3c92105eaed32ca4e69deb9f21034fc9f56b65ef046007ca', 1, '2018-12-14 10:58:37'),
('a80a5484800a97c4f97e7510ef21432473b1b97cdfe1a4207dcb853dd2ce15af668223f13253fe0b', '1f583d038edb5a08e9f08f51db8db1440f905b0c3c7c19b55fab9583df03ceb791cb892f10e2b23c', 0, '2019-01-08 16:10:33'),
('a81170f32f044e8c0b5ab3b3a72f3c4fdb9a2d9d37abf0ce58b3908148f8203228dfb66943f678c4', '3f27d4eb471544651a30b817592de37dbe6dc5123b584c084a353d29f6f0ce7c614a9902a895aca5', 0, '2019-10-06 13:54:51'),
('a85ceaf8b63f30848c175e81683f452a9b8858ea1f47860d59ac34f3e99d79f7b1b9266cdc9d729a', '7cc414821f6b42dc3bb037792042653315ddd5832bc1a6fc3f309f80b1feefef951b88aac441d249', 0, '2019-04-05 17:30:18');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('a8765605030ce6af668dba545e29c8c763418ce41a7443cb56492ac00f074d2267b8f285997f347e', '6936b4605624500237fa324a0d5053c4dbeaa6c30a43035c82dfbf54e21f6987ccc34393678434f2', 1, '2018-12-14 14:46:36'),
('a8b9bc769e95ee3ee6834e60ae3a5ea20f174aa9fca7d0003abfd5871032fb9735c3165a101e72c7', '55a0e43850afaf95c1ead58d54d7b46f9222dd609d24884615f49057e057882d85bf5629f3b0643d', 1, '2018-12-12 23:04:44'),
('a8c97a91a4296f48cfd809ab59a2920f2d19289a97c638e790c6518370f6d8183e9f405ebbb3e586', 'a18e6786f6153dc5ed40d1a71fb40bdef65da434dc64eebb516a74299b2f9dcaa4627bc62b11ca38', 1, '2018-10-18 16:22:02'),
('a935d781b681fb586697f6991eaabd70a7ec33f824375e34ad989a1f19778b061abcf7562943e278', 'fdbff26a63db7b4b368866c9ef4656b421c05b7594940bfec95258cf0da9ab7d28556c776dcfc016', 0, '2019-04-04 23:28:44'),
('a956eae013b8a87b7b6ee337dfd5729838a0781cfbc7c31ee25b36ab925f1606ca4db3226e18b37b', 'a474163661188b2ce2083dcb16a30011c9da55b69d9c7e5593fb33df4867992d739878f8e736415c', 0, '2018-12-18 14:51:30'),
('a977b0fe832c9c613f4c04750e063cc889cf1c581af4e553d6613c237a893a5f1ac62a21d4e2c747', '38906f1c5cda57b72cba7b971fea09e009627118b9bdae2e20cc5f299b27f67b8ede707e2337e957', 0, '2018-12-23 17:37:46'),
('a97d79f86401139e0e4b67fec79e7bb57825227d2adb2f1fc3a4c50009058962fd627a1d092ca7c8', '2ebd83524b9f5a819db8966127be52922558e723ede2b2cdce3916cc30d758a905cb9ea24ff2c8b1', 1, '2018-12-14 10:47:47'),
('a9cceefd1773e48d58f73a0bc85a95c6b854d5ce976821ae7dba025846e72ba9b7a64b24dbd0e058', '34d86ecf5edcc38dd3a8954f306f64d4ecde339fc5b25806bce14fb7b8a154246ecd4b217518ae26', 1, '2018-12-14 11:09:12'),
('a9dfd40e0b9f806b954bfb1b7c98b97a8f2165006110a758afd0ea16ebae578c4e015d95f800cc46', '4e23f7d10e0121cc2a22734ffb6199f51530349cecf458a31c3bc98b52e620b7582f93d13022bb93', 1, '2018-12-14 10:55:17'),
('aa2b4ef443ba72d38f9ef0409079a2bbb075525cbde1138cf5d31d498f28e1b014e6ae37ff61d4f4', '95e25fb473095b5ef00818c6b654d23cc7b78033849543fa8122f4572615b61e032bfe5c0e028668', 0, '2019-06-29 04:29:37'),
('aa4ef3779b27cd64259982c95173cc88f307396aab79671e9adf8793bf76120ee2c962fffd53e473', '47c127ee1a8ee83f8b15ece3ec7f0a71d4d467985ef6cf9c3c173170e6655334d47a48ba771e26b0', 0, '2018-11-21 11:47:26'),
('aa85ebbef3ba14defd5c8ed926d368a8b45ba1870b630bd6010f2815eff6fb2b51069f1f08dc7710', '3df2c78704753c0a614eed84504658fdb85ded74183d6c0c1083b8d75b65705674992c143fea4be4', 0, '2018-11-05 13:19:26'),
('aae184d41ea6601f7cbfe763942ce0fbf31d6540ec84d176f6c5d8cdba33fc1ab54df73645e53753', '5279adfea615002af35843e0692b3d7838d78621e5145af12b9b885a940993c51b34b728f94bf888', 1, '2018-12-12 19:26:21'),
('ab29700d9106e5fa64a7c7923c411962a4aacff32103e633e0632f3ddb5df4a6e8e4bb32695ffc89', '23a4af11aad1515f3ccc8c9dd02dbdcc11cbf60acfae147938131bd35b689d94a5c3532621edf8b8', 0, '2018-11-23 11:17:52'),
('abcf756d68ab1c71e2a9afb23ca33d1d6c542a103f6c76a5b5bd002799936612a2bacd4cd6ca5b6b', 'd8a22a6f83deba2333a8a86e0be696af82eb2bf3d2d4de5ce46587834fde4accd9e2af2505c4be22', 0, '2019-02-20 20:14:32'),
('ac19e6508acbdc548e0848bbe5d974258f26727d0fd694d5f8d1d47eef62bbf97c21bd011da4ab90', 'c60f13f432340411ae1c281c03e4ec930e5e0dad0f9e6715b4a6765aca041fc7ab1eae68ab2baa45', 0, '2019-01-09 18:08:50'),
('ac2ce369917218e02938b0d3ff4fdc5ddf6eae631f1073b0ea26438a817c32db1669bb2cfc7e91e2', 'b7b06c81ddc3438737c8c8bce8467b0082d14393d0fc406e5e3f34e776c40cf3520e3666c891c6d7', 1, '2018-12-14 10:43:57'),
('ac5175df8372039a52fb36bc8846b29888481406dd25fde46585a03277a1ed4cac7d8bbb96ce7314', '60aa700fd0a551ad8486d9d2066572e4c68d00fa4ff852248d8702fc499b8a986f0e97d49016c8e4', 0, '2018-09-13 10:46:37'),
('ac891705484875e7983a84289038ba46e39ae371d57c51a9b0da0d1e8126d3a087f4a00a4dd19213', '60521b1aa5197583d69be143f5ce27bf78c2559e47aa330cd45b2ac73c3baaf4463e7ff981cbc90b', 1, '2018-12-14 11:00:32'),
('ac97e89b92e0469c982f6cb5be71f505ff79c805fa3fbc723533860ce9532f536122d0738115801c', 'f7b8bacd9532c780bf69d3cbbb499772f25a6eaf0806ea398855fe332d26f2936546f4a85759a788', 1, '2018-12-14 10:56:22'),
('aca0d83d7b65afe07cf4d2af1abb3b0f0de169175e3dcfbf79ddbfcb4054e950883e65fe5aa2b286', '644f149b73438cfea98a733aa80fd5647ae44ab2766945551e9d589537169baf9548909c49de84f4', 0, '2019-02-12 19:13:16'),
('acbfdf2e246cb043d339ff80d2436e34964dd4b613e487c3756be1100b477b325e5f809287f85566', '5c57101ed5f2670c41a3ca28e993aab8baa0c7e29735b35bdd95bcf4018c83d5f16e95880cf05d61', 0, '2018-12-17 18:10:46'),
('accec13cc94d6cdc07de52580dbba420bfd8fe4476e47262359fe85519779fa4e096be357a2a0398', 'b58f899b49ffc0a52cb8761814c8ac6381a25b211811245b432ba85031937bf5b27b65983f56c5d6', 0, '2018-10-29 00:15:35'),
('ad452752c876282328806396b5538418cec0430af6a372476627d826359bd625caa0b29625b15c6b', '50bb03e324fd16d0b9f7d946ca1b8052963bc784c9f32dd8befdbc6417ccac6ede9ef67e6a075a4c', 1, '2018-12-14 10:50:17'),
('ad52c4472c0a85b5ad0da96dab914dfc95ec3ce38dd1b855050d02f13d29d3464ba7f837c8fdb051', '096bbaa0e02ce37fc668f05c39bda66b26c8b13c34630239622c996960eeb930c65b169640a91ab8', 0, '2018-10-23 11:53:11'),
('ad94f80ab3ea8a3985445c2d9611e0106a0e31632c0a6a87d4f903a9414930e1770f43f1652e0a93', '02e7b0c28f49179707275b8c6838e22884f0ffcdd4ffe849d6c7d803f27817cd375b7fe3db96b9a1', 1, '2018-12-14 10:43:50'),
('ad95dc9ac361681fb1a1b111b8107f746d4a3cdb061c8c284565d93ca07998e3374e96fb40c13a01', '41fa7779090f598e74a166fb01da9675f85a1d50c63dc8b71101cba67338b28b89223b7033fc5950', 0, '2019-10-02 13:27:50'),
('adcc6b06c30da2f9c667dd471933cb64f1fa659058551592d8ef9142e675a24f3e38507be910578d', 'ec39ab5e57e30ecaddfc1aeaf996eb4ddeda3fe6538d47ee6d42393af2aea3643680bb9aa866d294', 1, '2018-12-14 10:46:24'),
('add782d383e838f4dc927f1e187261d9195df3d81d50f5f4c1b6318ebf26afd04dc0becfa3e9d9a9', '6841b945ac69f28180201b8e61c8bc8af24b922990aadf92d4d60e6dd71af9283aabf281022c6cfa', 0, '2019-06-10 13:35:59'),
('ade28b7289a8646878b1429f6dcef80a9b46aafa22ccb471aa6e2e3cf642a048c6c22f85cfabd035', '9d8276b25979be5480003acb0b573fa5bfdaa038954039342daaa1e8028e5cc0900f29ac0650dc6a', 1, '2018-12-14 11:00:52'),
('ae2d72dacc33dede3fb9665712b9558775dac9d005fbdd723d383640df11593eee5286b8215cab10', 'cea72a70703c8ecb53229fcba22668499a84a491035ee0f52a45c2dd0d5807df6f79754171afa5f1', 1, '2018-12-11 21:33:43'),
('ae3acb05584d655d9f0ffef462c539acff456689b072cab3a258cce2722280eb7af8ed94813aef35', 'e3ec4baca841c10a41649f0706dc28bf046072db57b02d2a40246b75c9d6d7671bbc767c5f147b90', 1, '2018-12-14 11:08:12'),
('aead234e6f7b292a545b884901813ebb0071735220150f50a441f807d9a24105f584c561eec2c2d4', '8ffa9d596d65481fef954d7801bd172fb3c4a67dd0fd5567d3a60651b0f189447707cbd8c3156925', 0, '2018-12-15 15:23:13'),
('aed13b21ed62e879d1b096d60ddd669debc49e7e5cf6f7c4b18aa2dd65ccb494f93b618565635bde', '712c3a3039eac7d27f73365e2c10a4c84971ae742a586c4ffc80e36098bbf7e41d8c7829fdb7f42d', 1, '2018-10-18 16:22:25'),
('aeec7dba5201cd4d2d97e5f2fd1afb2790f59430077462a1cbaee046aa3927d5b9c3ff7e77e0a63e', '0a9275bd3ca9daf76b0532cc535704823b11317c40d5baf7746edd44083b1e9fc74efc16b85817ee', 0, '2019-01-04 17:21:20'),
('aef210f900a9caabca6b03bb5b81a0fa6c10d84568f18e017e0706149201c370304cbf1240f7b733', '2b76960e80e25ec465473d86fccd4285b41d6441c5b9d857e199e01c5856a6a2d364c25f877260fd', 0, '2019-01-04 13:16:08'),
('af0eeff66772137519f2807299498267ac53b7d916cade693a2dacb2ebf54fcfbd24d2d1e78dee1b', 'e8c7c2de2dcfb15b6d1cd6f9a02ad9142930e748eafd0c6ee660326eb35ba40fab1b549616907843', 0, '2018-11-10 08:28:04'),
('afdd3d7685bd4dd9eaa490124f3eab338f2d5e41166a66327244ae7271a0daf326f0411093507578', '5ab7242ba979bd311dcec7a42efa943cb6dd3ff29e4d75cabd5bf4f5871414c3b66aab5468151b62', 1, '2018-12-14 11:02:39'),
('b006fd84822de40121f934885c197bd373e7ee9d380bcca9454c655cbba9af1879b7cc2b818dffac', 'f78224ad817e1f96ef77445c1aaab014c429a6c91d1103f41ca308355ab869b15b760f62f12e44f6', 0, '2019-01-05 18:18:36'),
('b01ff4486efcda519b7bc70d1be850b7f10891ddde4efad0ca89a58c99a6832b1adbd1d93214f18f', '5e2297ccb6896f4350c825e7ac0fd5f4249323a1da5dcb89448b9431e6b8e2fd02d675e69d377409', 1, '2018-12-14 10:45:08'),
('b030a963ea9e5f67fe36f1135ef6716a8d64272456cbc6a94e965bdb775c706a3b5cc378eeb8de65', 'ea4cacbfdf2f61733611bf0689e669c636579cdb727c2874b4c097a5cae82201f1c53cb06913ad9b', 0, '2018-11-02 11:20:20'),
('b03d7f5083dc061e94e4dd964001b5299b6d3e48a99de774d3b2d127a9fcda0f66fbde1ab9ad8113', '1d57e5150653b52d7588fb309853a397d2077e694c91a503641c98f4b29929819eabe05c9debc976', 0, '2018-12-27 18:39:44'),
('b07be0fb73246ad9a502889b371fc7823b0f948e62c98e830422f530ad3df010c35ba13e9aeef396', '02f479612f7fcaebb56c744eec41d74e1e1bca43dae0d1f59e0dce4cb216f46371868e5e7f046b07', 1, '2018-12-12 19:25:41'),
('b0abbef9217b7fd7b59d0a84dc4882ef88c0f467e3358b8b6531a971e5c513e375f86f1a4dd7b031', '4179da29ac4f3c543c2ad8d37a17d9ada47e97feb4f39105987180585e77561fdc8cb791aa133caa', 0, '2019-01-02 15:01:57'),
('b11339ba02a4baf92b74c907b1d6c697a662dcf34aa1b96d6bc0a8c265a9a7dc80b069207fa17357', '71c6e6337cbc862a9d24d3bb91ff25b667a6bb021e07eadafa4b1777a196f1fe4632be266b71b931', 0, '2019-01-13 01:13:48'),
('b1174167d1779dd0ade42ac21b9cfb27bfe58086d17e8e8cf10b9e5e6f9243370c4ef38169e00eb8', '9412e32284f9487e9132b2442dd902c2a7ec800fa04c1a5bc336d06792bb942d269c67c90a5125ad', 0, '2019-07-08 23:46:46'),
('b16b9df23cd60a3da34de305bd1360b23881ba80bf885cdba6f98b663345bafb24b03e8f31341ff0', '0e9eda5fdbb516d419ffb4363a2d2af6b6cf416813bcae6e174b0a21588bea2bea7aa8a87d03d2cf', 0, '2019-04-14 18:44:55'),
('b1b9cebc2a08dd6211f18f970f3916c6931754eb64de3c86468e1ce6553b5700edc2805edfd7450d', 'c80e6a94cabc39ffe3862a6a7e01a114ed5bc6cdd0b334df69830e6b093f0142ff02f6d33f48d16d', 0, '2019-01-29 14:28:06'),
('b1d69a22d9fa8b82338dcb3fc53978a35eb70e83e2898faeb3059b519063de5b2ef082487b85c736', 'e869357363e8e04c7d673bee9eaaf6c9b3bc997e40f7f832a1d2b8b3a625e07d2802ee3268023137', 0, '2018-10-30 17:51:49'),
('b1dc132c308ca34981efedb690c63a9595fe0c6862e8322750b3cb22240913335886e6b444bb7556', 'c895cfee36689f9094c9f5d2a70bd9a6b34ebbe76d81247eeb96694a72e9e381cf6cce8fc54a98fe', 1, '2018-12-14 11:08:42'),
('b212c277397c41e8bf38855f5df6f3d2f2922c8feb3c2a4b4845c38514d125d0a181338a85b7a0c1', '0183030c5fe3551dd320cb06687c6e2e2f980216af8a75b7ed7944b734741f5171e633a3659da871', 0, '2018-12-04 13:49:23'),
('b24ac46a3d9d8353433061bd29e7f791c2bcab135486e467308b50612cfe9a8bd5249978faa78cc7', 'a50b671289896a84105d73aebda7baf8ffd67189794f2a71daa582b0b2147741072663a2c490668e', 1, '2018-10-18 16:22:21'),
('b251c015be2538c2eba131b04b9529e162ecb6b918271a2eef9c9f50d5e16e660ffba96e6a071a16', 'bec46864a35795974bb13e0d19264c8311848d3e910738b73f6e1cfb2ee6b97a34b6fd5117630606', 1, '2018-12-14 10:45:42'),
('b291b7bb6d9112b3d7aae558032f0f98f264a14654d340d4a7bfe41e69454aba286f63ded1bbe032', 'a7aa792abe0891a6e363a19f42c789efd45194559f6fe189d8811b6e0ecc654a3b93d06cc8a2d182', 1, '2018-12-14 23:50:41'),
('b2a1c9a4fd7e9a8f87b7637e04d85a2e473cd9d3877cd1aab786ade56973dddcff8893e3ed4aa8e6', '6b9bc96c24e9f89699d8dfae81b946cb9b2beee9a347f5f0b8c29c3cfb379c8bf02a51d8056f324c', 1, '2018-12-14 11:09:42'),
('b2ca77e118a43d31681aae35e503a4ea0372352430bcc6a0586fe631ce1a15f9cb12945fcb35b31a', '11187599e91e552f4d01aecdd116a01f657f6f9174ee6231e83016f32694534b36e0c02b6c407a26', 1, '2018-12-14 23:54:24'),
('b2efff0ca0fb43fbe5ea9c8f2b3a011746a54f53f259260f7edd327277814eb9d602c25792cf06ff', 'e4bec015a75528dc9009009a3476a7fd567717cad442f0bdc4e2e1ea227a708cd34184a782d17888', 0, '2018-12-18 21:29:37'),
('b320cede5385859f18fccb2c6522a6f03c44b896b48bcfad60cf5792463871c4379628f061e2c38a', '9bb1f809d6e20d63f2df033c2c06f649a535781bd5796ba98fb8703a8085399355824f6623723cf4', 0, '2018-12-18 16:29:26'),
('b36715eb553dd565970697d4347227643d86f5eaaf70193e4dff4700d1a9517a751ac1c2133a9ff4', '53f68042ede89e252778636b9d2f98ce296b62a8094e1f75609cb4b206881a048bfb3501fc1f1d4d', 0, '2019-01-30 11:20:20'),
('b38c8bd4f209372beabcd927a6e7ef03433efcab735823d7060b879761722434e0bcc2e1f68db315', '6ca226de663d3413f5a1bed533c8ceff8dfb9a25249e1c5b14573b532057e5dcfe4a9bab6c9bf1b7', 1, '2018-12-14 10:53:22'),
('b39152d3d963499174e3a054e1c62ee1209cc6b6f5dbb4dae7eb2e048fe1b5fff5e6fe71b06076bf', '4e3f8e7b84e212e6302cff7475a522fb9753834e4250dec9ed76fe7ff0edd886d9645639504f1ba6', 0, '2018-10-25 10:07:55'),
('b3bb9300b4df8662616dad3b5c460857629c05c495f86fe34fe431c3098863af632afca425a1c405', 'bfb40413e0e64159b068d7f7cee2e0a87b259cd919312f126ae0af424129537096bc87488b863f84', 0, '2018-11-04 15:44:00'),
('b41ddaaad6aee81b3e15c56ba088e7927a58c816782458b9a003031883eba46da311c3580378ff41', 'b7fb31b975016e8dd25b26c15b67812aba180cf7ca442d07765cfe02dcb90353dc8a7cf41f7f7645', 0, '2018-09-11 10:15:33'),
('b448286b8c50c601a1541b8c0833ba5112b19426ceb5ac643e20e980c84a46b68e0514719e33d025', '6838d3c29cdfed94daebba8b2b152ca80607f60702a66f8d72974b03973a0c96b19eb4e630e614e8', 0, '2019-10-07 19:47:50'),
('b480e5940b3be49e351cdd89a1f6e07ec87fb86894fb5119cbd2258ca5397f37d31a978e6287ad6c', 'd0b8a2b4690353a89364f138e982dd5e5cd683dcf57d61cef22fb93f4ea4919ca0724dbf9527a2c4', 0, '2018-08-21 14:17:53'),
('b49c8b2a740daf7ecc6695ab89826d05ffb787154a7419443a972be81174a71e4858b4821876fbc5', 'c603651fb024c8b0dd43e9e443ffb814e4112f6687415b1fe07bdf26cc646c98bbf7fc7deae1d289', 1, '2018-12-14 10:48:22'),
('b4fc77c817bcef09d22a0784d4c5856ac08e62ec2314d1ad16ff7e5587b7e496ea81ceb7d72d5ce0', '4a0395bc244af7f61263ca9bfb46dbd2eb0df1d7b68de9c986082b21289ac464e594a20a825514ba', 0, '2018-12-25 13:07:01'),
('b57248ac890b901b04d3a835f4451f52aa159a3b9e224fd800ee462001ffbe13e1c05a3f37a476e7', '683cbd641018658ede0d260600d8e2b7593f0fd36413b8aef7ecae05083f5a050353750bb61cc116', 0, '2019-04-18 13:51:43'),
('b5813d2f97e8ba1994a0cfd17e4a536be2790489db96a3dc6ecdc8e94db0f295f846767d6abf6cbf', '46650d28902c558ec3c413f56033de4b8c3ee4744c355a6662cf2c71647ac30de3ed1ee28c498200', 1, '2018-12-14 10:44:22'),
('b60b1d622063bcf671008f8bb81d5950866f41757905d2fc59db8a049cc6ee606a671d0411e1e395', '94dafd3886ddb67d0cf7fbd5ceb64d5ef046a4bfbd4d6506cc521e4b9380345323f425af716c9969', 0, '2019-02-24 16:43:03'),
('b67d71038ef2152f588cff1568822dadf02fc2b78f5542e08676a02939d311ed79912eb29780839e', 'd9b8df764ed5b3019aa5ac5f914bc9104a081a15cdde66590aadb6f0e56fe84d461ee99839ff6c09', 0, '2018-05-04 05:55:36'),
('b6828a020d69d414797feeb74749a3a2511003adba58c6353cf43245f09fc1021ba28a70bdf7e408', 'ec08244f8fb5b28788d47c0e9ac35b015358ae4325904be242d275ac42b9e90de448aacfb4721739', 0, '2019-01-07 12:47:58'),
('b6a86fcd5a6acbb78c377e9e80419fd8753c40cae0282c108e9533c37caf6e1d78315d748b1d1397', '054002d6ff33d78ffd1ab2c3668f9c04434875fb3e9738e20585c238174255664997b699522a3ef1', 0, '2019-01-03 14:38:30'),
('b6b0a0992a33e2054a8767be9b55062422d04c0db4597ff9a8eb95c08af472919788e7fcc914f46b', '6ea267e4fb0a86ba9cd59c8d8222244d5e8bfd91b347f44f1d0a9cd289990c54acbf4d8adf8e9faa', 0, '2018-10-20 08:09:30'),
('b6b85ef31c58ad1e1739f83444aa7cbabe1da52f31784e4eaa3f68cbf04c9550c2103bb3d8d54e7e', 'f16df5dcb8fc9ff1ff16f48c2fb5696b054276ff600a7d09036e924527e5b434972ee3c98c3d221f', 0, '2018-12-11 16:45:54'),
('b6c1299fd92ba7b0a871ce647b83b2c2b91d0fae3725409fb86cca3751e769205d114144f52c7cdf', '32e3bdcc30f8b998668ee6864c2a2fbb8bb38ba34b4858ffa2f6a28c9fcfb9c69aa83ce0d016d1c1', 0, '2018-12-13 12:30:14'),
('b6c209d1ca71ddbb8e3668ebc0ddfe11e1988a5dca1f6f20be9d0fa31bffdda0b42a5a71764a2d85', '77395794e498c84241c613bd9263442aeb0a7e2b612fce618173f9ff15eca3390df838d0c6ae29a6', 0, '2019-01-09 14:49:46'),
('b6ed08a379cb110600bcda9921392d6b36ef5825ddeb0b6c79121c0564c84da3d0b386805b271b21', '3498f0b8b21a23b08804fb54acc9797f2be41f475037edca34cc42b2c80dd190ed4ac4337c0ccee7', 1, '2018-12-14 11:03:17'),
('b728413190fda0e25e6f69781094dcd155e5bfcba9d0c51109987ed81ff25c4cb1d62d758b4b5ea1', 'c7938fd47ef563e5bd4b1f5414d0acfb595e51d7ef3020a8a2a792d14991d64126c7ab4d52a35765', 0, '2019-05-23 16:45:30'),
('b73bcf47c55c69a9d46a6663f9e3230dd158870d9d03ba37ed185eb273843a6088d0b608ddf6f80e', '8fc322f204321d7e7f8d5d5d36caa96b3a5ec69a4d978b0386d18220e896cfe378a6e9de3d327d88', 1, '2018-11-08 16:12:44'),
('b7cc5ffc70fe9507850279d4267607bf239295f5bc51d25c94f747b5bc3d09068556efdb5032453d', '7ee306b2337dc71e97331d095a35a75570d6ccbdafb50778275befff82071042662d7ad16e7e88ea', 0, '2019-01-02 11:35:52'),
('b7e918b2464480ddcf5993f289082629a79a6b2b71253580f6c59db46fae13e0c9ecb8cc395c5b6a', '3cca82853b765a22e9ff3354fdc93d1707dcd37f7bd5f3994ce279d4fe611e6b8c1e3ed63eda9a4c', 1, '2018-12-14 10:47:07'),
('b7fe8e521223347aca2e705321beb9a7279cda3555c98e9762987ca4088bf5d03bd60126d3fcc837', '82be114287193333c3ad8f60fd57ee8dc7e653af1b71f11acdc7fcd36c209e13d9d2d4b15ee063fc', 0, '2019-10-01 16:36:57'),
('b80caae066b07fb4943cf793a7f1ae8fe5b1e882a5573da69190ebfc24925fa5c2534b10bb4d1f0d', '15d0e1de60cee488ce9411057172d1d4f6a6adc9e62f1158af56088f7ee9d603a6defcb8fe145241', 1, '2018-12-14 11:03:02'),
('b839fb396ab9bcfe21f8922903c0d2d8b1ef7b847f9c27be1195f074983fe99a39e7c558068de9d2', 'cc37bdff0bab8a1cf0ebf50c0db9ae99b234e51700cdcc90d501d55ae4bc6978b6a37cb12f16e3f5', 0, '2018-11-28 12:55:31'),
('b843dc2d86935173c0bb1e0fc8145eeeee6bdaad2cc8dc3ee30faba1095e37cda7393f13019158dd', '63d19bfb81ef1cab1251a23dc39dc40fbffdcf3859923c74ab58d0722875eea6be36e13efc5dec97', 0, '2019-01-03 23:26:43'),
('b86f0c2a66cf53a9949f7b8191e865c9cb4ab3136d4c8518df0c09c65c85fd59ace23e6ef1863772', '9e2465b0824c941568af84420fe78e716df457146a2a8c0f9e25683f1346748eb6e668a969a12e0e', 0, '2019-02-28 18:46:26'),
('b8d4fe0b1213495babd37dfad123d1a3fcacf80e1bf9c0bb388f1251ff75060c36f289755d4019d2', '660d50084932798d6042ee157c2f5d89c9076c413e707f8b87db3f9a5a8deda5345a3af62f3c9644', 0, '2019-04-14 15:56:48'),
('b8db0dd56bfc787d7aeae94edafa30098c958fc7bc3fd65b3b1780ad9fbefc3f7b96d88759d89e77', '1aaf3f0f64bdeab53a88503d13fce99eee0c65742141669afb7cc49aa3c233ed5f15852217fba9d6', 0, '2019-01-02 10:13:16'),
('b8faa8fb1346b5c3409a942b93c075d7994b6bb832ec671384e39af665ca3b080fd76340eab03227', '2cc72158f2bbe5b9270c1257f06bf387389ea43f28708fd5ff1a52f2a756bb4e63b77a79d767104f', 1, '2018-12-14 11:04:27'),
('b8fe2bd01fe0ca669068bd8d7afc6b52277185e38ea5ed1d449e449c41b01a84c231060ae6674bc2', '70395fedf3a822421859e675ffb334adf42b859f2843ebcf41cbbcc08aed6ce048a01d8636101143', 1, '2018-12-14 11:05:57'),
('b92dbdba68998fdd1d3e6ce96a8fec897e75ee9eb6e64caa0441fadba971226b0ca63d7f2e1537ca', '89f5f82e8ae87b164deea792bdd28c0cf32055dd6592da82c4cf3f5f6043fd7b1a0ab91e58efc9a5', 1, '2018-12-14 10:58:17'),
('b9799bab2063e0e3ca5c87504bc76aaa73df6e370782136be706f2ca4008486aafeb63725ae57405', '82e35132f947c7f8af16d66bd4e2a5e771c10078551231ceee347ba923ab375b2ebd6ab4d7a15313', 0, '2019-02-11 21:39:49'),
('b9d8b19dc0c94a78305bafc5ab51911c25214b9666046cea5d6ec71f68bddd2c6784f0b15d4188e0', '2fcf2c63fbf13906c49ed38c935d18ba09a4fa2be3add9e270e01e6ac50f21810a7ef06a0b0cd613', 1, '2018-12-14 10:46:22'),
('ba6a1206cf76d29008d5a10a36110f5c939a5189d900d94aba8d54b800f5ba13f5339fc5b49ee064', '01ceb34538e560f55512839ee0c1dbd4510ccbe08e5680c727ef1d73568875ec773a72d8aa83df26', 0, '2018-12-17 15:29:04'),
('ba740af4449caadd64e0fcf5ea954bd9010503a2fb329ac34c32f0bd16e32cc460b011fcd2e06489', 'cda6bdaaa51f402e99382d53a3c8ae0bf3d338ad553367387c66f0481de280bf343867397844eecb', 0, '2018-08-29 00:21:23'),
('ba835ee9bffeb00c6453d8ab0cf132484b6fdeb534c400b4c2df89a969daead3869bf78096d4f752', '41aed2b69d58b542535446c6fd91870bb9dfd84bf8411c161de2a44bb2318b200e490d860238de0a', 1, '2018-12-14 11:04:22'),
('ba89e27b546f4800c5682ac3d2fb7f7376aa779dba809aa3230979256ff2b07a2858861357a35c76', 'a4cb3b4bc8a8bf50ede7b69a0b21595d8c4a59ee5bcb6dcf1c6e2df9f97dc89d3906336807eadc95', 1, '2018-12-14 10:46:47'),
('ba8c0f208001611f0e06b7e54a1a85a6a4a51c13b99417a5b4613bfa292f3ca680710a8b95e08d8b', 'af2a7118ac56502a45cbea0d93ae69c58c7913b0274190cc18ca1863b688e145d6374fd19137a62e', 1, '2018-12-14 11:00:37'),
('baa9daf0d81d9c2cddaec3f1bde9f58cdb36b8cd5da61b8a7695a9df8e252646ef9912fadaec8424', '657e200240ebff5dea212dd081a7312b13a65bb1fb58b128ef83d07ec3ab6512cb813e6206bc0f5d', 1, '2018-12-14 11:04:42'),
('bace28e43ae34c81f325c90a6c97bfc1001dab277ec31a50f8d838253a1f01a656e7bea36f05b5c9', 'af16fc1e3046254e4b6348188ebc9923676168b9a63cb137322b85cc752f59b1e303e536a4ec22d1', 0, '2018-12-14 11:10:14'),
('bad989b180369d18a97f83032d1a2fdc11f6fd953db74c5a81d11b94a8e91e9b1492d8df8931ae20', '18f5e6af3d837ab4e092126bf7f45240dc6497a09a971edc8ae984bacd2b8840db279ff1f6d41b5d', 0, '2019-10-24 16:04:00'),
('bb06b0fd710bb4375aa1f5e55abb6144835239ddc7a571c973938ac0fa1feb5647bc9deaa19cd501', 'c845363efd778d14983d864e05701b6a6e5baa81a40fbe7dce2922ab8aab4e6a56395de0ecba1651', 0, '2018-12-17 18:21:41'),
('bb994e6130ae9b3f9d4d8305006cab07fdb746464ca42780a4048fe74e7bcf7f51277063359af81c', '9fd2f1377bf4accbfb5a2131687cef6cde819f1503c1f1fa85303f9b7da80996ea2b1f6fc625ccb0', 0, '2018-08-26 21:11:47'),
('bb9de87e6ec9b5eae7f67c905f825ebce438b3186148e1447e5b920201d992ba89acf8459593875b', 'a592b2a57f147c5bdc0bd2b5e567787567021b00e00430eab4fb62bae4f52105952419d0f8a1b5a4', 1, '2018-12-13 12:20:06'),
('bbd9de3c29631de99bf0ec1a807fe1361f64e997ea0fd61ff25e158b925eca4592c2494c93fd2a9e', '5211d4acfe0722935e60611fa36a8d92d0504291c68ded5e6d13ac04c95d142cbf15d764475319ce', 1, '2018-12-14 11:02:32'),
('bc36e0da5986868abb3b54b3290777750e0639ec4daff0903813b78ca9261ae4da5a63a7bcf0b6da', 'eefe31578e04aeec9a6a48598eb8d88c2f112ded01803a05f0bf0365d23aa7f9d635127af23304a1', 0, '2018-12-18 14:49:10'),
('bc8ae50aef698387fd6ab019a1ebbe21ec070a72b883a24c9e913d278b6a90c40870a9a782dddcf4', '9a209b945401d967689056db8dbbeb9feef9b8af92162c1c72b3cff42979e9063197f1008c977638', 1, '2018-11-08 16:12:55'),
('bc91ce35ec1d5b4a989e0072549ab65b1ae085e8b123aab3d53e0b6f264221d7f626631a2b45fe46', '5892d5c5224aa4a3f921906a56cbccf3b58103ef8064c272657d791f8234f81ae065d66a05b527f2', 1, '2018-12-14 11:07:07'),
('bc94b3da933ed7ad22fa163c935006ece57130b146ba79c8a12a740c5958308f5b8bb5d9081555f4', '9cd4daecbf0f096c4b796febb4a32360714e330e25a66fc03692f9335fbf75b6f56f243ea5a7768c', 1, '2018-12-14 11:02:43'),
('bca71691de368f59ef65139adc919a7d436cdc1f40fb0f87c13f85717843d22d772014a390e5208d', '382615e5efa09cdf8f9393bfb4ec98ae5a7639776f6460a4d349ee73aa4f01e4ebd47ba5d9959569', 0, '2018-12-19 12:57:03'),
('bcd48b79874c2088ec8336fc2fc269e15e7343471e7694bbca8ba19ce35110ea5e9e509e76273b0a', '2dc887a43ad79f267b332f76333a8f671b7c5901ee3d9d9a6eb5a16663d50910cf725d798ceede75', 1, '2018-10-18 16:22:24'),
('bcd97c7485bb185573f6bf7c1b39566443d62f2f8e2caaed3fb3df78b514ae4dfde73bf43a4b282f', 'ed0e4ed217c038a494a039957928cd5710f5e867751baa4c8121c4d612dbc5a9ffd371e30c768ec9', 0, '2018-12-26 15:12:15'),
('bd23c7d06d586a4a717b5b0d7682e268048019cf3d8afcaa1bc1a650b9f3a1afba52f289fb8062af', '7b3346432521449ef1d09bc5fd1e13701c8181330ea460b7847a84c4fb989b05731b40c616b5e0eb', 0, '2019-02-17 15:06:19'),
('bd6032917fb43e0bcbd6342b6d2502e74631425c9777d293432a422466701a0708a02e2d45988377', '93bbe288cac353cdf0abfe436994617f4b982f2fb8b0a25c51175f4105dbb617eb2074e53ec71836', 0, '2019-03-26 15:05:36'),
('bdcff9fb829c152af1c9e9d10836b71c36b5525f960fd33b816bbf99e3eaf34203e8488f9ed25188', 'cc6736635e1a4e707d3bb106f2fcc36df1fefbe5d26b446d703c2557cd7a80bcd90fa50a61106413', 0, '2018-12-14 10:45:42'),
('be2e4f068aa1cc9e7b732331412e9e3050fcb039706a39ba40ae7dd5d3e898730aff50c6969f6a3d', '773cb823f961f516a0a8281d885f58a9dc3e07df009aeb2ba9086f07ff91d3d6b202e91583250a2e', 0, '2019-01-20 16:23:51'),
('be328afb2065c1f61eaab1fe14a45b88f8acd1a21a8b779a8e6bb377dcfb9f230bd1c2508c064981', '3fe77448a04e1d1b69a717e40dd0a89c921fbec9a0ca862e207f711903f0d385c71afa683d951992', 0, '2018-12-14 11:10:14'),
('be586e1ad25a94490d57147fb85ec50c1ae67fd27b3e8f77f88cd05509dd7e0fc6b3b7ffad1fe197', '18706103ef4161f589d0ed0b38cffe1b83accac814d8fefc28bdff9386be1d75836785eb9dca37d9', 0, '2018-11-08 14:13:17'),
('beff8ffab7da7e8b32d48a7f4bbecda18ca3b149fa3d3ba93b016fd915eae5e5d3c3a1b438e00a79', '8a5020d0d23bc522a1e95e07e91528e9f76e7916cdaa6c8fa7cbc64ec406f3558091dced70c8f8e9', 1, '2018-12-14 11:03:22'),
('bfc7d2f835ded56c443f5fd720f117ab25836e318e232a915e3f19baf4d76e31cd961220996fcf19', '7bc40e9f806812e660014c32f0f06daa66755acec57d60fc4998257924c937a1f28acabb6bea426f', 0, '2018-11-08 14:13:18'),
('bff3beb97bea1270b69f992eddb1759beea1f3ba0e2a860eb7b85e8521441eadf95257bc5bd4d39d', '904952a88b10e331231a2331b1c6ba9c547c1861b9716c1dd1aab9fc3cae9c6e2db844949f48acbf', 0, '2018-12-17 18:22:18'),
('c066c6521b96a93333719c80cf8d4ed393fd47b53444701caf8c05e0f7f6312c06bed956fa6f05c4', '5f59f095f7acd033c750abf9dd197ca9e104e193fed0512b7ffa2a830db4f83d4708192326ee7666', 1, '2018-12-14 15:50:58'),
('c06efe0ec3dce1413bef83e4678377e277df53abf18bc96259ac6c6c369a78da9bd3c87d12adbcec', 'b25b9072fc973c2b6671cdf8c99d89ed3c9f0389726ca9fe96a845908ac7f6869806ca5cb65d96bd', 1, '2018-12-14 10:55:32'),
('c0700142a6266d0a8f8c258d784b629a4b230220d6e07600d88dc1a024a1e12bc19f7d0e761530b0', 'e8ad0e719e5f04061a69af1e11f4046b330aa0a17fc4478f1b7a6b74b49c5c627881daeaef0a2eda', 0, '2019-01-06 12:28:32'),
('c0e4cb69f41496a37b5984f42a42db52c717246bfbbeb2b97175db3d438d1e0e0e63c74b507bd33c', 'b8cfeb1d1d846a5323720256c9cbe0a9da8932b51fc4caa82dd5d7e07bd59e426d5e2b8816228e8a', 1, '2018-12-14 11:03:32'),
('c151a58b110bf82076500adb5297c844825cbc9a06e8fcfb7aa269c0caf0f9296898c3605fc71484', '0a99ac3d9e017ae198277b79684103daaf0b8444459153a96fa6546b1240338435b20b01d0ebf193', 0, '2018-12-23 17:35:08'),
('c1990b5b4a9378f10534b1e533ce176ab112b500747ffab51636869ece69535222333fdf0a61ba7b', '9d7b139c64ea5b6be579d82cbcd0ac4f8831962d518fd47e6ac8b2c0233c7c62cdb10916a5626b3a', 0, '2018-12-17 19:24:47'),
('c1b0a05b9ff12c6ceba3c076dc0bc0a2da3f3cad184cb4ef65ad4f5620294fed9f9e5c0c7ab34acc', 'a1823681dd22a2ffb4a117ebd4b2df54564aa8e250b91ce37ceb04002025c5a55e378db1bcf7deef', 0, '2018-08-21 14:13:40'),
('c1bfe33e4c10aa8e4ee74deab1af0d5f1e7fd1a024e91b4ba1211e97b923be6f5b0376c58905c973', '81c0a79b0f49a3ef04e78397d19e8edf5e9a1113f43b6732452be8109fb10e42301ab475bed64ad9', 0, '2018-12-17 18:20:38'),
('c1f6fb03cb9f1430335d56c38f262482427faba6ff8127a35bc9e9ed9bee490e26ac4a012159c064', 'c2f84dc1209f4f7841890f98368e4a3dc689f4c60cca2b99c6eb93f41c3d2a0fe4c9b2cc1bfe98f9', 1, '2018-12-14 11:07:52'),
('c2035a3dd5dc70e65ed65992f78d10bfe31159412aba44e3a11c7eda5f2ee7e2d21c57dbb5d54840', '83bac5e8ab22120139717ef7a58d9c3c089e4bab8485a928b6dee48f61e91a91ae42301e1fe2eaab', 0, '2019-10-02 13:50:17'),
('c20450ec39ddd4827c26919292fad1338205693a7c143e16424162574180363b9b5acecddb777313', '27835f516999b887230bc582416f61a97cd777f69ef42c7645174e1289d5bf3df3c0919f396cecd0', 1, '2018-12-14 11:09:32'),
('c23134cf8a469c28e91d1641ccae6169a648461368d53bb3f16db539881b807956e93da2e555b5cc', '0471c1bb9162e9368bed604e14d1fef55ee4e8b6f2111e16175ad9caf6c9d45e13c005a8dcb9f4c2', 0, '2018-12-19 12:20:54'),
('c248e691443bb1dbddb5fb5895571f0135cd43a6d71bbc5dc9692264f2e83a54cee41d3c2651a44a', 'ad1a52a67289a775c673bc1b21d851ca997d68ac6dd7c1b3ee73d994e570694a969b448b37967e87', 1, '2018-10-18 16:22:11'),
('c249144606ec010a2dc690da5d85d950b1e403ee5378469d71f4aa4df8cdd9f9d239438efd741234', '8fa7bf9cc7fb955bf6b313bb32cc0ed30e0c86ad9bab4cf1f86db60a47f08d2859c660acca74d5e1', 1, '2018-12-14 10:58:42'),
('c2560f8c409d0db2e7466ca005d139a4d11ee8e0d2c4cfc28ebcb2a2a65fe846d980e7507dea5a38', '7250a2a30f080505be26f6d9e63a0c2c2d393a64a2a7aa698e4118d9ee11e693a52c01baf5ebfdf2', 0, '2019-01-03 11:33:45'),
('c2a285af046998f71eb9869b62667534f30b8fa9aeded468a26af2c54be03fac609d0d6ccb408d9f', '0348162db90d13eaadf6a94338837e92b71fe10aac18cf59a0100a9482970365f33c0788ba56427f', 0, '2019-03-26 15:56:18'),
('c2a56b64290b6142884a03ad0e3be1044c3dd3449634cb5696f4ca8f6c7fc65fc96c90859963e82b', '70115c27b9d6178252c72e58e4bc5c36051e1a9ccddb43ebb68d1f83bce6569981a1d45eabf89e76', 0, '2019-03-31 12:48:05'),
('c2f740dc3387f5c42b9527113a0b345fd9926a389c0da81baa63ba660fad9ae64f5186fee0dfe2d3', '16d3a266e9e9774b098c40e39e0b0cf02a753ed3673ae9e48643d711fac956eac6a16a14efaa70e8', 1, '2018-12-14 10:48:12'),
('c308e74d41fb29bea82df0faf9700cb18142d2a58979f49f8eab5ca0a61aab0741effe4ac36c3686', '6124b08f51eaa5278989ba560e1c925b9ed7019e397a382e9e4a7edb724b62e6568db16749547a4b', 0, '2018-08-28 21:35:03'),
('c39a7c1dfe4bef4bfc3346838699875202854a6c9054725174658bbd947979cd4e2f470fafd0673f', 'f250e2b64eb00431b4290473d4e32c11540bd2412d3828f55434eb100db02d47fe974aca9250f2c2', 1, '2018-12-14 10:57:27'),
('c3fd06aea9fdcf6dc63b8e70fac90681523f814ac9d0ca763991a05985addc29fbc1c00cd9725d8f', '28126ffc3a2ed05a068cf38c3e4c09f4ff9db755ce72c805b4439feedfc72db8ffc99f9df2a41dd8', 0, '2018-10-26 10:40:21'),
('c48d8d6f0f1980eaed52da2b170945cbf7efeabfd1e86384bf391b5514e9405ac8ae6ebd695d6938', '97e8ae6082cba3401cfdf19a0c20106f096c6e143cf60c187196d1af0a400fff814ae7b91795e44c', 0, '2019-01-20 10:29:36'),
('c53dc92629c1a161c5de5db414e26a4d58ae3c0dc8ded337f397efa4c8193e7016c8d88c42c0ce69', '3daa7c9262d4f507a9b928fddcfa649e4ddc603ef670528ec910758157ef1bd346515385cec53608', 0, '2019-02-17 15:11:44'),
('c5b386654ba6b4c69c3c685e97c7ad85e0fc226dd49735d0f1574e280e1b769059c6a6e340a59150', 'a60c104cef2db52f047577c0572a91ebdc395ed4d78462a5288e06e4aeb944b917626ccfecf98fba', 0, '2019-01-10 10:35:10'),
('c5b7ad88026bd4ac2edbf46ed5adfa3c01ba768f79907c0283c6b34b9015dc07d7d1e6229d49530c', '11853038ba54bd4576c73fdc1b390ab609e9e58f120a670b86f268e881273747421caf679b5e972b', 0, '2019-01-06 19:13:08'),
('c6579358ac954468b14a5504acfda1ef7fa780d19ca87b8fc06c8532921dcc86c00d04eb64262e77', 'c3bd74a295ec4e5aa5f477f5019fd48164ede319ac2f3bb3c7fb42470b4c8e8ae714f44f6623edc9', 0, '2018-12-27 19:02:33'),
('c68d4f2a484edcdb990a2950c6845eeef709581c8f44c98c8a7d4c99f7851942d76881dad4185c80', '94f4247639f82765e7f776ddf599199ab7f34bb5537bcbd9cdc137793abe103b925830bef7227645', 1, '2018-12-14 10:51:07'),
('c69eabb469ab5f358dd1609cdfcd349133ae896008ad82520bcb0a6921a680e960eab933acf069e1', '1df9eec2c33bd587650646315592af074a74e9fb578f3624783a432f241e2046f92ee7f3e67d1226', 0, '2019-08-07 23:38:50'),
('c6ad1a0f00ea2fb9a08f0d2ba087a363752d3de54a956f95376c323aec709ef0a3930612441a3caa', '859fb3e5f7229ec259531efb86fe11352ef203657ed18b7903a1794b325fac8b0c43f63c89eb88e1', 0, '2018-12-04 13:55:44'),
('c6e0dca0828feb58e23272711be36042d8a0445d2a7c7cd0d33c862b4b3e21a98ce3fd340b67580e', '8dd34c18fd0309c4769871374f7c472742696ed5b6a0b189efa2c8263479c59683e42e36ce07b1fa', 0, '2019-01-06 14:27:59'),
('c73f4749a2983e91924f70a795d9157179518dbb073cf5689a3787437addea8b77d863dedd9f0213', 'a8092a4d11645edd48d2d7e136458beab2631f9c1c5ba8b72eec5785a543e1ad2120eaa148df25b5', 0, '2018-11-05 00:32:18'),
('c7d48f0080090d7f00edaf4f9cd044100a05602981991a17d397566dc16f77b16104c2de5a2a5606', '7af206727940b7a9dd2082ce06c5406f17ef5bfb66a662afb2e025eb9ca066086994365bdc756c02', 0, '2018-12-27 18:57:58'),
('c815af651a2f5843c5b5fc7d99a6b120469fa384072f344d2ea6e8c35921f43f0662ea79887f1bef', '2edd30bd4a63f83477e0f3193e607aa1ec09dc2e713dfc7f8e6b8974215585775ab67cfddcf3bddd', 0, '2019-01-02 12:56:57'),
('c816a5e9f62bc9894b109dd2e0836b2fb81faf99b7f1b0837c624ea019cd10761020312c5f6ba092', 'd1b087c74437b243761f8181955ba84de7622aed2b1fd5790fcfe83e896e815d45aba2baa1dd1f9c', 0, '2018-12-26 18:51:56'),
('c821183d908b3e67e98cd87cfa365f54b2c88a48d02d4ae6fd5b5816cf5170ff5df45c358389d87d', '9ebb88f4bbad019f1b29eefc6444efa85b49a152bf2f91c0033b9362949bcc25b7739b127a8b0614', 1, '2018-12-14 17:40:23'),
('c838f0c17217cc3f4c4b4334ebe6ebd5f4998cca14993acf8a093582a41fd10c84301fe96d039034', '5ee9c055a561cf19c3deaa67d87a39a201d1c86c314d1f2a26b95363b9610dfbb57631c5b5955d32', 0, '2018-12-11 14:09:21'),
('c883351ca63f56021f100147ae13150df0064b466ff21a42a2e71fc3a3eeb6e37d630765968f1c2c', 'f5c6ff21106d7ecf09e2ff379cd11cd886e017af0a358cdeb2a8726499e3ac2eed128a4d1c4a38b5', 0, '2019-04-21 15:03:22'),
('c8b5de4968e06db3a78287f370d73883af4f9260c199e5bc5d6446fdda15c49b8b3cf81aa9f2daad', 'ea24bfc07ae8b6a695e99d28b8fba634ccbdea5f07645d8165453be2ec2d6b9106a35d286844463f', 0, '2018-09-06 15:15:59'),
('c8b86aeae0694903f99c18ffafa4119cdaf8a9cc6f0db9ee844dcf9ca5ff1bd1dbb07fc8c77fde74', '510fbef827d6967c37cf7968ecf3dc5cccc4c7248252bc03964430f849fd2c66074c6faf56bff2d7', 0, '2019-04-21 23:29:13'),
('c91cec3ee3199112d48a145353efd883697329d0254a11341400e890c86105fd7a5b1821593c33f4', '099fc8440a68af694e869d063430b3dbc8f656b3abe08e94820ef1484e77705f31db472e42d4ff74', 1, '2018-12-14 10:45:03'),
('c93f89b28b29a8e13bf90f249dd3710dc5b7c2d797bf7812d7dd86496e701a332e938267b31f4866', 'fd146110f4bfd393e445b2ec698693cfd27fc0c3764657957ff32e5c37902e4d637019ed9a082641', 0, '2019-01-06 10:25:54'),
('c95e96214d8ca434b28797ec93a3cd05eb521306421ee35aeafdcb708e07c419d7b2b0a3dcef6d2f', 'c75840f546280b4813a49ea196890041dc70d45487d8ad2ad863dd84bb35b061ace34694d5b50a8a', 0, '2019-09-10 05:05:31'),
('c9667481eec71fa68aa7ce4d667dd9a4f856aa3381108807891880c924c3c230051555f7dbc8aedc', '6f16fcfae7d7a72a82425ff9ef091bd466cafd53a1bce711c5c417cc62630e4ebc5f1418eac2c37a', 0, '2018-12-16 17:33:23'),
('ca4db0fcc6f9ee557a8efd9e7a02cb8dd4543813f0ec1fb665b41b85338bf378be4a1bed20ef0985', '6165b1521e6f9a61a4b400bb0ebd6bc628cb873c4cc887939bd5307fb9a3ce8d9bf96d38d353e851', 0, '2018-10-30 10:19:30'),
('cab6ca5049590a75fb413ae461d5289637da89c52eb2433a919a010c7c33920ba2cf6a952ddc3a0b', '51fd839155c5bdd543d346cccfb21d74ebde65c7cc3c017c1cce82420d50d75f5b3a415c52129415', 0, '2018-11-08 16:12:56'),
('caeceddf64722c1e2bba72470284dc6945f0ce9e74148efb81ff88e0115488a66f5bce4977acbe96', '32c3168cd43100c843a2b8e889ac6ac6c6da7393c975ec9caf3e6f25c82a80957ede97704ab0a352', 0, '2019-01-03 15:33:02'),
('cb1bd3a3a25c23e18af8c5f747bd44e9079d9be8ab44588794c4c1d1af8c76b9cb75035f3bc25f32', '2faad5e3572acbedd0b6682c64c0de33eb205b2a9b7b12d6c3b0bc853362d81cd94394717537df87', 1, '2018-12-12 23:00:05'),
('cb33b2adf07d5ea27b37a855689de8f357f457b6bfdbbbb5fb5b6206ed368702b6eb6f5a8291ce0e', 'c79c82f2b5005960b558638a1ad7a60a069ce6873c64dee3412e3f0a97ab5eb0ac74e4f6a00f84b6', 1, '2018-11-05 00:32:17'),
('cb4cd8a212faf3282d8217a48de8519183b39faf60b7edbbc0bc5be0fcd4f7540077997ff6340af0', '5ea00b71ddfc453f85233f18ad5d997591042fd7d4fb4fe6de116019e21b0f1ba3864480f1341b26', 0, '2018-12-20 11:29:08'),
('cb6fd6f33dc81a20e17d968192f6ac1f48cb5e5f23fa96358cec9c9b3fd38bf296d2031128d007c1', '04ded0904a37bf88514c25db0174212bab2f132ae0ef631709e37d4949e2c2b50fd2dd68b4c2092e', 0, '2019-06-26 12:09:27'),
('cbff6f5f5faf561f3b425d23bd06b7710ed2b82e2ad5a4a614be9f0a78414a4aef8b295f0f4e5e34', '72e3e33b8270e5a247d8790d01e63ec1ccc009f9f1840451a7dd4d19b9cbaaff06034bf6b8b845ef', 1, '2018-12-14 10:57:02'),
('cca277a0394ab78f86db916146e88602fb5fe08d8e45bac1dd82ef3f149f73f5c50c709ae7172b10', '2aba26500529e609b784dd0d11c8980a5e3eeb88e8eaa314952eccef1c031f31bccc0ba6270c18b1', 0, '2018-11-28 18:18:33'),
('ccd0934a845f35fdf1958c11d404f12e699b7aa7223560297c35a01e82f5cd70fb52e79a537212df', '588d2a73dd73dc2dfc35762723e46eac6169110a2c8f3a4e025547af5976890d6db292eb7850ca37', 1, '2018-12-14 10:58:47'),
('cce3b6e7a1f273850e2bf4a50071ee86793a37d1992626b29741a099758017289e953e3070ef3c80', '11721df792ce828d67afdb64a7df0df43177ffb2ea16db2ff5134b0d732ae2051382aaed3c8b2157', 0, '2018-12-19 18:11:23'),
('cd14f37f2097b72d45f3aab6895cb38ff564eeb28b5b15551cad3504e20e78e13051d376d7534bff', 'd76c5272d1039eec883ea687168b728ca95a37bfd6f26ea77221a6a27d83092cdb04449a28fb9172', 0, '2018-08-31 12:38:21'),
('cd20c1bde0ea0a8b36bcd8189fba234e52602fffa9cc2cec57923c0a241e6ae569047424454575a2', 'd4ff654c186e27a356b4de7471eebeb9ee5ee87daae24105e18805ae60076e3571e65ca2a34967b2', 1, '2018-12-14 15:21:06'),
('cd27d123fcd02eec4fd7d5533cf7af552dad4363cc4a9d21d21e4ccb4f85a0f69f1a801afc523710', 'b8375b10159910e856cacf12c2bd09313c96a5907558a84b7754a6248c0b05cfa747a2dd95b5e6a4', 0, '2018-12-13 14:46:28'),
('cde9946aac9f4f57179675c4133e0da59396607e308c1b09b1f17b9ee043731848a30aed635c959c', '529eb528bec8d3bb250f72807a6c66651b2b2dba75fdaee01d2603af0be34b0e9c72a62032713898', 0, '2018-08-21 22:22:36'),
('cdf031fad5efa574edcf82d56c7210e1cf9f7bff57ab9c7227c737c7a6a26e2a2299623c14e2a50a', 'ace0b76ca51b904ba301ae10f50bb9d68ffd97927d0002aa544a041486d68b15dece31699416d4c9', 0, '2018-08-20 15:53:10'),
('ce4c95fddfcd0f22f1b2d16b45058255b7474c842df1dfc740d7206dda68f2437fbc654427cd1839', '74aac1691796b083829be470f4af20fe231170151d7d3c57abdcbf6f863392fb1204ffb407f6cb81', 0, '2019-06-05 18:39:00'),
('ce68b94b2a16e2686ee0a409d42f4b7d4d497f8c66f0e432216c46e012cd28605cd67f3e3a30e016', '70c6b46e8f6148ca07ac707fd95818eb0392415a19ca0bc31e133110f8a8ae1fa793d1dd18c4c75a', 0, '2018-11-30 15:53:12'),
('cec69bd1c0b1e35a7d2c8011ceaaaad7dc6cc507aff285b2981fd7db7fc71588654145bbc12cb0cc', '277f41eb2fdbdd73fca2874d29e06c727fa26bc40f649919dd515e626dc0bc7e4ce745f523b13a6a', 0, '2019-10-01 12:07:10'),
('cec929aea5c03bad587797235f45760d981b4f5ff671a87b89fa0c9fe4193d5c40a39132dea9d03e', '37eee2b75c70bc89d3923e943af7574c20e5f604873bd5830fbd09f9fe55703c8b0ae9c315cd1e51', 0, '2019-06-04 16:08:07'),
('cee414451bc37ff70d55e55ac842a482ff8787d085954220c96261b7b856dd2b264425e4a023eac6', '2617ef0c90e2ce2580968dab243702d76c441d064791e49fd79d95618d957c5826b789ecb3fab195', 1, '2018-12-14 10:45:46'),
('cf3947d983cddab8fd83b0508cf557a007f25301829f4b1d956e6f63d37c4d2d95c19452fbe68820', '5cfa5eb6b86168134f44799f6d5ff9f932973743a800d775e5c1451d321ccc507d22e9ea56714aea', 0, '2018-12-19 17:29:39'),
('cfe47fb32dcc2472703201272b10d0402a8b10464575b1273c5e7ed1636103ba735c74cf707287ac', 'e1ea6b19a003a1d5ab273760d2d286c29f6dd87e52bea00978994c2a99afaf867bbffb8d4c866f3e', 1, '2018-12-14 14:47:08'),
('d056c9331c00b5e61876434454b280f1a1016507ae69f27e7caafd1bf7e278223c9edd69e6f758b2', '203713b437cee89a2b5f293cd84707850005b3410f8c0ef686e20e18066d146aee19321bdae16994', 0, '2018-12-20 14:29:24'),
('d05e18d07697221ffc2a2aa50670310304a72d5b40151d60bebdd1a3a79f0c20a448977140a30b0d', 'e21e8f8de4f166a93db8205c7ec80feb2ca307143d0768731ea29592cb7d601e72d3933538211a66', 0, '2018-08-27 22:03:55'),
('d0b39513c14127f7a6d33e416d2fed54df642b6b6d064cb5b4e4bc46e5cb863319a2ce5d45fb9f03', 'cd785c94cfe386ac0adec745e709d99473d2f46f64d9f9af775fb568ff8d32335d7ba06f81bf91bc', 0, '2018-12-17 10:22:04'),
('d14b453dd2352783c8f5d93bca9b3ec3aa8184ebf5569d386d6615486f804f88591f5ea26c9cfaf4', '631539104c91238fa72d82ff59fdaa33dfb42044ce210c128b14de26ba10573b8faa430709613ebc', 0, '2019-10-06 19:53:57'),
('d1603f76c0e93922f17eacd258e20e28bda61c9fb0c0c68bc8e135b58699315f86183125627374b7', '22d6e6458d21b695979e3557f94eab43f3c21930122fb40745797c17cf6e55cf0ab817640debf100', 0, '2019-02-18 16:45:05'),
('d17c7fbeb647b0f40849d4e5c94f7b01e9262cd62b17fc7583d9e9e1ef3bc8fb7ca35d9c1f462fef', '6d7e430a764becbfc38270ecce65cd75996982ca723bc85f530428c32c5d9788f3fbdc73049bc2a4', 1, '2018-12-14 11:09:22'),
('d182ccec3781dbc12a72b17dfd607f490f999c835a058029b1866dab418f2290513496b625809787', '15c8210748b9b076bb1a8bc6b7d2cf406dde6a4d23845f5ea08ebae0b66275c620af3eee4a48d042', 0, '2018-04-27 01:32:21'),
('d1def085ab8e5a85f95f11a57cdfebc48e541b70000bb62a99d243da2dce2238c79ee5952ba3df80', '44c6f04ae850442f99b1e37c092a885b66de5333eb3e91cbb0e9738a5202c2edbf073a043d70061b', 0, '2018-10-20 17:12:33'),
('d20509334bfe64e749cc14f7c8a699c5780c77809e46155abe6f408b1644a48e76d11f951cbf5f04', '47543d4121202b1ad56538007f860e87ffa60ea584d94550a96781a5272185ec0a8a984659dccce8', 0, '2018-12-18 15:51:42'),
('d2ad983c0defa606222d2333cc8706574b226e64597dbeba940d19298cbac04dfa54592fc98c7e98', '43d5a3b36c87621cc334f705b712c21d913e98397f8d037f4fc5088e71bc96d3aea229d3d68412fe', 0, '2019-01-02 19:22:17'),
('d2bc39f265363101a7c405ea63a17231098cf9982c0f8d5b0fbb592e92d5a19d73a38aab8acd6173', '9406b378953267908a566ae7dec83d7833c083af8a7fa3e61e99d6b403156976e2401413324deaa8', 0, '2018-08-29 00:21:23'),
('d337f0e0c0d55b8dc7759d26c921cee55f3e2091ebbcfe344ff52a263310b24b5b364d3626abbf96', '7386c6d90ad59283c7e16b1d0188b3e208f6a0f037ab072442a7af0161ddcc71311442c9cb55694d', 0, '2018-12-18 15:09:17'),
('d3b42051065da2445a6d0b8e52e28b122c2220c5760ddf3c5350a2f74b03904123ea71551463329f', 'cd08455e6c124959b734c76c293a240958f0319da685ac7e3d96f49114724a253f52b28a1db76a50', 1, '2018-12-14 10:44:47'),
('d3c5230184e5dfcb736f5fba00f08a52e734e5a736be2c16bd941884fa73befa2dee410b26efae90', 'ea64c7f9e313483d3d4f5477c84248a7d7d35d37ea2b78325cc6c18ab1cee2c14f96aa42e2a9d238', 0, '2018-08-26 21:11:46'),
('d3d8bf2eb3a5fc2152c9ad8532dce5a11766c13122d1e016a3e002205bc14d8755add9a48bf895e6', 'd99257d397cca9ffbca40da284d64b648f815110e5cfd7e4544ef41b08065abece0f29eb6060436f', 0, '2018-08-22 14:25:13'),
('d3ee6d00e082cb00ecdf52d5a75c5772fd3ebf4b425995c913427df523c03bcde646b084caefc87c', 'fe17bc78b0680e09683be26164083bf30ca6d5f1e66783e2371a57037692c76fa8c88dbd30466e23', 1, '2018-11-08 16:12:39'),
('d421428bb3aa41806e062e78f28f9d189f984d9efd5c598cf9e220a1295531415f0527ae976b4e0f', '1de762d3a55a53b7c2b731704d4cb317f4291a44315e24c32e1a98c2c198f2c3054738cd3ad90b46', 0, '2018-12-18 14:17:37'),
('d424778ed516984e2db695f094c424cd46365c328957b4bb506aee854e77bbd47b24c782174775e1', '069c5c25f503e7f19faefffd3c0f3cc1c43f2a7faf7e9fd1e243f736af9f398a62a73a493046ceb3', 0, '2019-09-09 10:03:32'),
('d4eb6697ae3badac7bb33da442ecd58ff155d1a8583a9e93e5d510b12f1cac69dc61618c757bf46e', '65699f2c2dda6107d24ec44639b65b1faba7c52a03bb43c5b17c8902b4f82906573c90b6f627cd9d', 0, '2019-06-04 21:38:08'),
('d51929fbb949ac466dd5f323313bcb664deb44a1695819ce36f10c1d793ac5fccba506bdc16d1ac8', '2fe0bf661c499671a3eab4aee9702e7d7d811474b5dd31a82b5278f924773f60621b040b12dba496', 1, '2018-12-14 15:49:33'),
('d557b2f706ff0706e77f606df6f4537eaea260925fd36b7cac158857b43a01b902ff787794d36782', '338325d3d9c5fdf3b02267589b31d329c045147e2db8bc9f9a36da22b3101e591d2e981f2c081bcc', 1, '2018-12-14 11:01:32'),
('d56dd32daca4aa849dc27cfd34e15ac90cdcd6acdb9d0525f3a8f0e5068d3fe9b37ca05b9899ff43', '8bb2c3a20f13057b30e31570c7e7c82d595b3f6e8ddfa2ccc15994d3c3e94faf8876b81e935e80c0', 1, '2018-12-14 10:50:37'),
('d5a4895b87934aa6387136153347fff4c9eaed2b38b9ba41fecb7478a25e92e4433a08fddcf97652', 'f2aae4894a41cc2dc2bb6ef32d03104c3b6ccb15af865030055e5d8e8e858d83d8d246c7abde3001', 0, '2019-02-25 17:47:44'),
('d5e86443b22d2a31f41cd8652e4dfc00c4363bee544f1a2e591419a5b28c675380408809d04775fa', 'f465629bb6e3076cc21e94626101b67bf4c22011d5f599b5b7c06625a6a07261a9577b3b5adf921e', 0, '2018-08-22 22:48:59'),
('d653648cddf48e1d43638803c93fe11699694566762e43cb42b3a88cbbb44474393243dbf04014a2', '0f565594cb190a2e12301f7d6f1b55d3b706810beef67daafc356a38c63c3d430713ff23d0e8f8f8', 1, '2018-12-14 23:30:55'),
('d674a6114916b9801531d335f01ce4f04cd1c8c305e68089d07c5bb03c599e75c76bf1ee54069466', '5ff1550f37df7224fb61a01876f54825cd328818c408757c4e6e3aad15a9c7be8059d199ca624707', 0, '2019-09-30 17:27:13'),
('d67fd79cd00cf04c4d2a522f43e4fe8452bc877982aacc8209f9943df805507f03c97511f305031f', 'b939473da6e8fb08adbc10a4f9f462634aab779ec615408b90287dbc3691a14bcbcd4f92bb5f50e5', 1, '2018-12-14 10:49:02'),
('d6d623cc3b4d0380deb4079e5feb8f66ce5631ea9715895b700f884281a3b4e115039d7d5e27ebf9', '3c00d701156cbf53e24179bf50541a0af0e79329779aab3f3befe44c1904e4a4894302115cadec9a', 0, '2018-12-14 20:46:21'),
('d71385eaf8076255011424ff88b8c3798ceb461044c15d6bff334fbf06b4ed1fa06d42b1ee486284', '1ed8c949194a1bd781c5e1c2f25ac99ff96c08c3e69407f5d209718feb49bb2e35cab3faafc321d4', 0, '2019-02-17 15:08:40'),
('d76c20aad34676b5b42a400437463f124d4f9b5510326359f06eec7ab31f9612d9b0f658b1968cd1', 'e7b9b9b5e065cbcf822361b1d3900ce7447076ba47e466f7a3a4074f36530fde0c3315cb97164feb', 0, '2019-04-05 15:52:37'),
('d78251346205b9d6dd9208d9c9468cd94f72e581196e1cd209a04054cdce4d13cafec19d11b5ed33', '5afc7b05b0ca987d7341e8a09fbf2febb7dfde4acdf8aab98fdee707c67c523b16a7e3940a41169c', 0, '2019-08-13 18:00:17'),
('d78b615a5c09b4cf6c904b2c56857bd3bfe3b603b815e7415e4a7dcf6d0534652a334e4dbcb341a1', '130356813cd9e138e4e6fc686c12a0119d6f1ced72c530d34a48351ba23fb87d06b9a20427a7d2cd', 0, '2019-01-15 03:45:01'),
('d78dd2a1924e56cd177cf11d44350afc01f47bd1373bf5421e09ba0f199782751cf48e7dd1e58529', '5aba46d7419df0360e3dd8ee2fb0fa7f6de36e4fb1b8c70fa553beb7501bcccd70b23ac61e587998', 0, '2018-12-19 16:23:57'),
('d7947ac4fa39db4fc1435e11567589a355b2e32eda129d81a9ac7a3428b0456442d95d186e852d7e', 'cf5f9b0278fd1b0f9be0a565e108f58d047cee71af64df03bb4cdb09df8b2f8e01e25eaf411e6cdd', 1, '2018-12-14 10:47:52'),
('d7bbc1086cdff28c1cce8addce75acedf4d7a13aeebfd453a2d1383a0b8608f8a562c4aec8e6f2fd', '233a90d6ba60fffb2f6523e79dab52ba962ca4cefe765d7727c912794f4384e478e5ada3ffaeabe2', 0, '2019-01-06 16:38:44'),
('d7e95789cdb4673d2a9456753e539f4b93fccbd0891d96d8126a58301ad5856d873fab70d95c8a97', '2807ffcd3c259f801cfd9581ebd55fa0a7afe343770be48ad3bdf976f86e560c1a4c993080970140', 1, '2018-12-14 11:07:47'),
('d7f4492cf813fc14f48d9ac766b5e838640b2adebeb23f2d66a06ca5dd5c7aa537f66c95a2239e5c', '001f5d7829996df3b960b8879b3e282831fa977af31eb7b7d3e28ef594e37d00dc962ca09b0a4dba', 0, '2019-05-17 00:20:13'),
('d84cb84225ba3cc9391c13c37f1555ee7f9d506fd12a20bda2ccc954c7e7f6fd3bb988d11478d848', 'e4a0128596284c4c1a31fe92935c5c0b6950c4a7501be5ffb2ce328261219e87a705184db0981f66', 0, '2019-01-10 10:28:19'),
('d84dc25529d092a1770136f5873c0bbcf1e82bd53411d1bdb5c69b643882b71d4aa5da25c7a3e985', '5eb176796dec9dd465b9e4252523652f04087544b57329487210100d95ff90a210563541fb410586', 0, '2019-02-22 10:58:01'),
('d8b9b7ee1e5b6c5f5338add85fc89d0bc58c8c615892ff7f1a3a2ae0b9e47173b007db6c975392ad', '38df08c8dbeff0622889d953c9bacdca6cfb9048e763a1485632a7375eca2ad947243fdbdaf97b82', 1, '2018-12-14 11:09:27'),
('d8c7f3c71764bffb578376ff83dc5dcf79ad2c9360f43235e1289ff3c62bb3a90b72cbd4cb849fd0', 'daf0aad4e35e0bcf173a5e52f8043c43aa284dfc8b3dbfe88a3ea952f69702f4103741735cedd7a1', 1, '2018-12-14 10:47:02'),
('d8ed1aa8082c263ada10e4e0687cc4aa24e075675f982374dd332008f9162d84e5f3c02aa84b2d91', '1fcfe35e375c2c87e11a1a2b0f8be8d77bc1579772baf6f197a2a41f0d451da0d279cad260a4d93b', 0, '2019-01-02 14:59:04'),
('d9845904903d175a8320056d051f7d820a3f880bfea079532fe3c5700b1c152a5a573dc2c21be855', 'f333670155cac13a188303951cc633a6b52e87a3b641dc1a5cf3bfc2d517e174bb6cf24d9a3bbb3f', 0, '2018-11-08 15:46:45'),
('d9f00985a67de7f888ebc5cb00f255ccf50f639a382c1c43260b26aaa9af3021b36bbc7a5ad99dd5', 'a39442bd1452b667dfa3ebfb5c8de8391f8aa96b5f929f6ecdc6f3c7ac3f4f4ec61ad919766c8c06', 0, '2019-01-07 14:59:53'),
('da55a4bcf87a7ebd8b1b1d9b188a57a5c5abaf15b5eb76f0c32b93b67ec711837749818f00e3b25a', '2799b2269803068237d5deddc3d1c53f908a26269295597e6aec00798d6ea0f65159b4eccb12e6a9', 0, '2019-01-10 19:03:46'),
('da6285e84453c6b0e35c0498f656e956de26f8dea572cdfdd92cfdfd7338fc922d24e4df3c1f6b18', 'd144ef0003a5051110ec1fbadd367c9f4c0b3fb4dd5c0ac15378c3c937ec40bc438e8cee5f7cf08a', 1, '2018-12-14 11:04:02'),
('da8b89bc03e2b9f7b402e135dcb75404f71c231988f150f5699d713a0d2a6209529b50a7e9d3a7dd', 'd173969a26f674042181a7fcfe30af35dbecd641733ff43649e31e6da9966c37756d018fbeaaa12e', 0, '2018-04-27 03:23:36'),
('da9932c75c94fa9a8458dcc90aed89fedb6a53f72e563727ca96dc651a720f99f2d11363ea2c171c', '83e467f6db79eb2c3c93344a0b6c7da68b43695ff08b6c08a34d0689814d445689d15726b97e00e1', 0, '2019-01-03 11:30:58'),
('da99a97f87a30ff6e1ee2d1595181145f11c29d9f5564f046eac492472521cf9092a01a06c91dadb', '2f2bc4573b85f9f63f3a2487462b6c0c9cae7a7867a976ce03c4cfe77204c6ddb3982229a8ee8ab4', 0, '2019-01-24 13:52:53'),
('daa8da107ad130b7eb710c5dd5eeeaae9086c8443e5606751efabf31df00bcfa65171cc57159be0e', 'd4b41fcb98f8f619eb243df0d957dddbf11b728d2b34cccd9d2fea74b957c2dca30271fb08468bef', 1, '2018-12-14 10:58:57'),
('dafbab26f088008fe6a2f4faabd6b67bedf8072e8c269335168c0112a74716ca336c2c7cc34354f3', '31d82c500ae0c980a5aea86f4126c764079946ea205a9e11a7b3064587a7b879af556f8224770b0c', 0, '2018-08-18 19:59:48'),
('db01a71a808c794616e0c007a76421b1aeb0189890c07f2d90baafad55241d58a4a1b7bfb9d41abd', 'bfea06cf544d6316013726dcfc45f37142d4fa15721a88c978fbd2eabe39354262de2c214bc9d1c9', 0, '2018-12-20 10:27:15'),
('db0703efb472b504ca2e203bcc14f1d1f30d748955c0816252ba0241eaa66f68f6673aa5d1bf0e94', 'ad162c3a3e14af5dfb09f628e8029a70217c9e318b413dbfcba515d3c12c0fe02cb221c24996397a', 1, '2018-12-14 15:25:39'),
('db0b7c22c897534e60f5bb50191e65d10bad78da91e6573d619d31a569453e6d2a094d301286ca68', 'c1467dad14ee993f8bd6c66c8b0ec3f8bbe67391f94bdac1dd40f6aceb52d95c44c976cb068ad531', 0, '2018-12-11 14:33:38'),
('db52f8b629ceb34c36ce2bb2290d290706e02f1fe27cf519b26947591b49b8c5b1ad308d270c7b9e', '06e918526fd0f1f02e7b4b7ba2961896410c7a766775eaae723695f51e79b2132d310a04b05b129e', 0, '2018-12-14 15:58:37'),
('db72f495773c59fe50c4c539e92bcb5d0656d9474943df52735a3f72e5c68b637525a5d081c9eb9e', 'fa761f16994ea71be36460b1301ec9a79cb7d5d3cde1cb103001003e5e35439f8a0f8875e82bb04e', 0, '2019-02-24 22:20:10'),
('dba653aa165afc9a5fbb310fd24286e25253e1443a70da975c452fab5c5b993f2daf82ee1546c29a', 'f3055cd1bf6af38a7d20d2eb1c4e2f9ee8de76991d168480210d76ca364550bcbeeb60c1b793510e', 0, '2018-12-17 10:07:10'),
('dba6a8badef5e7b0e8f4899ad2385567fe05f212c6998e2091f3258cd468a9f5c143338626a770a8', '2ae58cb5fcdbd26a65b9031fbfb6461389b6b5b49ede6da3adeff9f17f5e8117c40879a77b41c30a', 1, '2018-12-14 10:55:12'),
('dbf7e89293e9fba43bbf2d6f43161da3199baccb175370f6680242eb188f515f1f858d87f348ead3', '4046b93063820af2000c1b37328aef60c3679fa465fe2e11755ef8076d0436e2be9e37ce3678b0df', 0, '2019-01-07 15:09:48'),
('dc299252ce15b5dd6d5cab6bab16a873f8ffeccd8bcd0213f5bae5003c2baa83a2150ff8d646b867', '2437002a9b9381e9abff514df252cf81493d8b6b4c9e0e096883b2fa575cb08e1d21e61dab704139', 0, '2018-12-18 00:49:06'),
('dc4926279e4f63375dfe5d0f7b9eb16af445f57b0d2393343b7ccb2eecd18f32e4aaa7a29880a752', 'd51e97db0eba115f07b8cd6b13de8d669898e97d488cbb0ccb4b8d5a96bd12d913251cddd43b5504', 0, '2018-12-14 20:02:09'),
('dc5557c690731215442f1ca117b0c6b7400216bc2b9688a428e321f233b7a926cad146d16faf4885', '95a02041d9ad5ab80acccf3528eae4929f1cd283f26c81e0de1c2b5aa331dbbefa7d923cd165b29a', 1, '2018-12-05 17:43:01'),
('dcd0c790c6d5a170bf1fe481577fed54e224b291ee7fdedb9d48c10834d30444760d5fccac359d23', '981607158725c9d4b7444aa199cbbf31a026ebd90655ee6d4019ec1a751b4180f96460e64b3d27a6', 0, '2019-01-13 11:28:10'),
('dcf94f60f7b9e2f6f6c6e53604309d96d9585c4e5ed304b75d620e85feb2a2edb990b3be9a369d83', 'c3cd30feeeeaaefc127d16ef7a888268882766de6aa6fed0f0eeac1e1f798ccbb6900d095735c897', 1, '2018-12-14 10:45:24'),
('dd5c427fc416e5dfc63652dc09f38d30903ea4b57437e5547d9553af759eeb783a8acf74ba69ef05', '9bc95cab90b7c9e719af624d2bc67f8eb2c4c07bb198cb7ae9a960ad8c239d942291ef021d9b00ca', 1, '2018-12-14 10:57:47'),
('dd6a0ff20d766b9e7d47b9b226e4856280eaf60d9403bb2f8b799d1c74d2df11cb70452370a8a7de', 'd4aa9adda542167846a1a524b7d4d2a012b5783f4134d9c3d59002e3dedceb1d9d4e2905a4ebbf00', 1, '2018-10-18 16:22:03'),
('ddea2c18845e905099010abd73a39ab5e7961f96e3624fdb3f15ff40302835f61ea0ad4ed3ae4838', '1487fc8ab2a3f4cab6ba6ecc16b241143a209fcbe60340d8c66494a9678cf82195f1f801ef67c946', 0, '2018-09-12 16:06:02'),
('ddf23faa90ddb157919bf590f27a889509b7e441ac98154c9410b6e5d23f9f295145533cc6bbb0bd', 'a675621c1bd2078c41d23d5052ba4cc92e6379c8d07ed462cb864ce6567df71a892da9f86f8de448', 0, '2019-02-28 19:19:03'),
('ddfa593d9279e7307f4ed4fb425d04401747906c5f35251a24b1849e3c38d7d07491e03e93bbf6b2', '90c70a298741a4a40426aa13dda6ea855e953d8adc0a7422b99d37e72f975d311f7f07eed2dfd5d5', 1, '2018-11-08 16:12:52');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('de15261405893897d050473838ef4d318328582a257548a347c9e0eb065ccafbbf9eed7eccac8446', 'e19aa3b69eb11798c3ebd47a36a7f5df92c99266c53eb153b7e65c9b643fcfe4080928d8ca12a03f', 0, '2019-01-04 17:01:22'),
('de1709924673005320762a18dae8768b2e5a9602bfd453de49688a91a93d07ee521ff25303b90ed7', 'e8f821968d440e9a4bd917b9e3b4631b7a7392693aec6501cc4c663f70f09f314f329bc55823359d', 0, '2018-12-14 12:27:51'),
('de58a764f5fb6a556dc48d7b0aa392eba27cfc5c97639efb54b5349201996e3cc91422e5ae292f8e', 'fb3590c12352fb448e513062d70d7a1b77884f90175c57e087eaa4c2ab58c21ce3902dc7bad05a87', 1, '2018-12-14 10:59:42'),
('df0d03c2284b022355ec5d45165bcb949b92b1cd00e689c2017b640b6f03e28afea179febc0bac06', '39c6443130f0d967bd53fde4db11cd1a9fe7c01f233f5f472ed436bfb61c1697162a5c7a51114de6', 1, '2018-12-14 11:05:37'),
('df1e0c80979cf10817ad90f52993cd41ac14eba3a4e30db7e43fd5f440897bb2288a6e92b77e19dc', 'd857a45a50ed0962beeff59071e01219752023df057d2c1e92f578d6904801589e93eb7ceb5ca069', 1, '2018-12-14 11:05:42'),
('df6c7815dff9565ab29aecb19275754606a73278017cf0fc38e55c6d0661f93ed4a16abdae93ef20', '7634b9e5d7b2c249c40a1d2e77f0cd3e270980ab36725cf68a67b436e79ce40aca380bde511a9056', 0, '2018-12-13 13:12:42'),
('dfade66a20cfa6cbad461c08b049b3b8a57d74ca39727b35d6cb60642202087377308cae269515d3', '42c421e02f00f8bbc749730d46c5a7cf64de551bfa3c90042f17f4376962757f795ccacb22ca9d34', 0, '2018-12-05 17:27:08'),
('e05778f349b858b0daa4230229020bcfa4513f752520ec595c51a692ec47b19a138470fa291e7a94', '04472db7d6d3588a3f67e5e3d5bd15a71f67ad438db373d7d4bd571b413158e5fff1391f56baacbe', 0, '2018-12-18 21:33:19'),
('e06f798e812b6fee8b0a66c4aa510351c062b15c13d44555b9866870706afac0013a30a1ceb3c77d', '2b7a37d0213486ae13e29b1801b1b76305abfa13512a04cc6ae438e13c7af176eb3931a1bfb4958c', 0, '2019-01-08 16:07:12'),
('e094bd20d85dd2b5b755a5174877a4b70865b49e0205a0f21b3725c0d368029622de983bbb7b331d', 'a144a7165049cd52b2849d529d8c9869d19b1dbbc0bee4de19bdacb499af9861a7eaa58716648b57', 0, '2018-12-18 15:10:57'),
('e0dc91ffe33479a266aa24d0463bd7953f87af96a84a76e423782eecfb77e7af73f947dc212317e7', 'dc9f4f7ad52618832f83c641025d16b57c1e61dd82350b6939f7f92c39049e42ecdc714ff8ef1f28', 1, '2018-12-14 10:49:12'),
('e0f158d2194e4846a13ea18f9d25eee80b571a41a2f5a9ea4aefa4f5f3b3441125e2e1cd45ee9293', 'efed43064490ca11fc1dbc814a212d4d4b027501b6d18a3a533a7b9dc86102e7cefd6a3e66c878dd', 0, '2018-12-20 12:41:25'),
('e1409756cb72589898d9bc15c158b1c5e0cd51a190923624ab9f180dcfa0ca2824109fcfad917d49', '49cc4ae96a888c202b907e9fb50720169a8d86dc2fa942b1af32af470b492ae852fa28e07b2d3c16', 0, '2018-12-28 10:17:19'),
('e14224599e4c7b9a90de9396d9c2a1e7001dfeeae607d7976bf6eb017b9bb69e12f3d05293ad7546', 'e39aaacf495ff83fed0fefef8124e822c26fcdc34e8db325e7300a7d6e924002f4a827521405196b', 0, '2018-12-24 14:59:03'),
('e15447674e32a07dc87c5bf680707fd79b51fbbac07478d8e0fc4c6d37e9d4cc7bf8e2b2cb41fe55', '5d119bfc7c7f710d4432e21aec49408f59074fbf93af7d2da8c9440c3957320662e3357773fedfd5', 0, '2019-07-15 15:56:27'),
('e182ae298bdf257302ac813519a0ffc729b663001c92c96f16422a1a0fd28ced8d07cac4a74e7d6f', '312161e51415b09677c6ddce62527fb32d0aea9fbf828204ae78bd1f2a7e51b6b705a1e0c6326576', 0, '2018-12-23 17:32:22'),
('e19598cad7e281c3afa1d4ba8f261f30050990fc4883b08f9c8299d72cbbb7a69ee9ca4398c73e36', '04303b41d39696e55e6544b4a0947b1e9e6979fa78bbb4b1449d78c4492ddf64228c92c08f0fbfbc', 1, '2018-12-14 15:49:37'),
('e1be6fbe385e9924907597df2dbf73a1b05efd2105cc8b31e8976455bbf07f2e9e6f98bbfdbceea2', '0c6512373bb7baf23c378265ad87fc9bfa28e5aae863d835953e4766f981db83d4ef9c7e9b2aea89', 0, '2018-10-29 18:43:21'),
('e20c35e2202b5d2b7cd66bc8eca3cb9cc642b3206556911d590459a2abc331e6a6a147658b8b8774', '9ed0d247e5bf53ef5de871662a94f8ae2d362c647701a0ec875a9fc4dc01008ab5b4bf419fc7b6a1', 1, '2018-12-14 10:48:02'),
('e2382322129bb3d47043e25255c50d3bf7435ea8f6782827ff8dd3827cf2e71c0a4b148883269061', 'e8154fb0255773116af6cd34d0678c49dbd1b46fa6b11f1b8302d895af713b2babf2b717e62b2b54', 0, '2019-10-02 13:50:08'),
('e2d240755af1d95fa72cc5267aa78f6a35bdfbeb0730c3c270d6adc440f8d7449f93dd710a3ab91b', 'c0e6f717fa127fc41ac1c0aa3ee15d1740f3d14a59bac8416e2cdc377b7326b596301717e9cc295c', 0, '2019-09-15 18:28:59'),
('e30d9eff9d69f0a3edf1be218854a8923185ea251e5b62206d310fea5bc3aade5a0631b489783f53', 'ed034aa96060936549ae6d783988dfa79f8f833277382524c187f7f6bcb1701b14018fe40523c79a', 0, '2019-01-01 19:14:44'),
('e368cebbeaa5ba442d9ed58f9dc52fcbb51e2383bfdedb54f44c452456f4034e0fccfc3684e83382', 'da05ce68401082eb8d18cc658048e510f5789fae1e7281eceed46a9071c7e24caa33f98b8eb34afd', 0, '2018-11-10 08:28:05'),
('e3774aee83ffb30f4ef414ac15f46170cc2ee93d8d305a651f4fd3ee1837f2d7e245c68974aa2e16', '64d2f1cdeaa405c858d10f9b1b2fda6213c4a004d0851dc5f7e2b5699819874740918bd7a4e3cdaa', 0, '2019-01-05 13:29:04'),
('e3a0252364590a739d379e1ac0a2568ea7ca34dcd08023820a7d2828e86127dd5c852030752ddeaf', 'f781b7c6b72bfa97878a3efa7e5718f413cd54f6fe6fa3360a3b20aeabf8c9cbf9460998591cc24d', 1, '2018-12-14 23:30:54'),
('e3b01dbdd4d5d22a2e7dc1221bda44b7a095efb2841d3778fa4d9e869dcb35b0e2b3293ed460ab52', 'be0bc9e1088f48fedb04f22a91eb1ea2520c21056bc6271adb290800697ee12906ab25b7a71382c6', 1, '2018-12-14 10:49:23'),
('e3c9ba0b639686ab430fc848cb5740ef706c79013549e48930fbd22ddafdc54cc871a9fb9364f23d', 'ee3a754acd3081a953b9317740be10223f193f06521a512917d9899741af7d1d45f125900252d7ee', 0, '2019-02-22 16:35:46'),
('e3cc95bdc01925185b1be5112463bba0fee32acb06ba8fd87e6eb5c10f9a2afa8997e43abff17c1a', '17519aa8e480e64c17965e9587af205e3fd834291aa4a03c721be189dec2c0d6ea772625bf9f77cc', 1, '2018-12-14 10:52:04'),
('e3d3dbee580e61dbd52079c1747fbf6102ae82918ce3e427f0c4c8bef816b297c7fd2d0e12d14488', '2b6bcabfb1f23237396ad40c08e3e9e85889a3fd8d2e63148805f161cb6e24c06020ea33824040c8', 1, '2018-12-14 11:04:17'),
('e3e6f88469f7651e7542bb683a39f02938a788e2995c361509fda80aad4ee5f20a92fcac0a970cdd', 'aa4a8c9362356b07838f6c351109410d82175cde56145df1af375e41e3f1f33af177c1a7ede7d777', 1, '2018-12-14 10:54:52'),
('e3fb1983f8e2665842bcf64c4f13b7ea48ae98e884b9cfb979268661f50ffbd5be2e0546238b1d48', '311734b0156a80fe3f56daa4f20a89d1674c83d1c58753fc504a7ceafafd2a53a1eb7af24b1458c2', 0, '2019-01-08 16:15:13'),
('e45ad17db8dac0750c2e10f8afba3ae073d76b8589d71c34b64ecfa5aff7755bde9c0be0e181fa2c', '8713328f13135ea4793bcf189720647ed4f68e1a7671f0cd2ca33e0db80ce6160f3b9ced77c84c0a', 0, '2018-09-06 18:31:31'),
('e49b4f37a9533767996b6c5ea443632ca7b4870987177e30fd2696dfaf21a9e4af0cbcd32feb580e', '9607de8c993f45c4a5d5bba519ccae2d5e06f50d2ce52107d3bd1f80d788ee783f19dbff94390155', 1, '2018-12-14 10:54:57'),
('e4d42b3a8328c578846c800fdd2675d8b742aeb2974bf88004793859798853a1b80f178211f9ec85', 'f18d55a72f04f74a87c4cfbc8751fbf36c2de3aa8c68ddff6e794c023487a2e1704142fff164f2bc', 0, '2019-04-04 13:02:16'),
('e4de5f03ce34f14a8f60adeea123f2e5da806961802d3e7bde6cad7e6037984f9488b04fe02f6df2', '6b3c7b2f4f021e155519fc446dd32f366e0afb9d6d9732a44bb0a1ba989726195bfb2fe8f78b503f', 0, '2019-03-26 20:44:01'),
('e4f2520d18fc1473d8040dd4eb0d5ab981102655a0288aa5d7b5c279dc0b6ee35d0904123d5aacc7', 'bab7fa5a3e2a5fbdb9fd23103f4f85b4ddfb5a9e1f8406ba0bf832c2831c51cc96bcae801684b411', 0, '2018-11-28 13:03:01'),
('e522d08afa9b759a6b8a1c2c13f7ed891ff8e9d466e1bd3d65da08e0dfb7da7f9f2c553a1932d9b3', '7b9331349fe6221c2a8848009ca4e06dc6082faf3f9dbab0acfc698c12d0c04d53373da4ec7c9a0e', 0, '2018-12-19 11:03:01'),
('e53d6685c05cd40232e37e901c9261f645e58c40c05ade9d2caf3832898a18ccafcf7076e702545d', '9b60736e39b78ed30b3598f3da4478f82db31b98512fd010d0db0707a2f18268be5d2661477cbbdf', 1, '2018-12-14 11:07:37'),
('e54e624f900d447ca63cb0a1b3cbfc11ac558cf000ade06837dabc8ebc2c90f984cef0021ca21cc3', '986a5ecb6befd722c44a914b92943963e7d11a86b8cec734703318d48a7cfc3277f80e1174117bb6', 0, '2018-11-30 16:15:23'),
('e5d13bb54d85949333f2f64947923b3f703b636afff48387d736006fc2e6163dcf2289f111d50fc3', '157cfb376f1dcb30804fe839440d642fff530d8c9758593a20fa4be6ef4d922443c1cd5de0dafbc0', 1, '2018-12-14 10:59:52'),
('e5e3937ceedf19a3aab84cfa2086d559b0ad1fda0d05fe0dd976cf2011a4ea2d37492098d91c8176', '3399a6f7aa3b3d9f7a2dd3b8b276c0ced9f4dd4d9180e4f570166ca16cab392bf51d36896de93d37', 1, '2018-12-14 23:54:22'),
('e5ea0c5a328673737ba453292ba9c7d20dfaa47e742ee9327e61d8fd74535bca505f123c755f79e0', '282301e1a381fbafdb706afc0481416f1181fac24bdcc41033b1c1f88ac2222a973fdaab73f734c4', 1, '2018-12-12 14:51:15'),
('e5efff9ca512975ffcb1cf2293edcf2d027b4d217c9dfca2bc2cdb6154b014179bc0820eb6a2cb76', '4395bf82f85aec1160a69b409080a6e53bc48742ca55761c5891315faa4dcf61da64c51739e345e7', 0, '2019-01-10 18:25:02'),
('e623f25f267ca051cc5b88243e79c12ef114ebb0067845f7e85748683b3f6248c261fb6ad9f5fd16', '963a3adf55020222549ff7d219d9a5ae357ecc1b30d01ad68e1f4e91060121df4db8329186869381', 0, '2019-09-15 19:07:41'),
('e65fc46eecc13f3efd46fffa6077acb9ba3b014796fe5254cc645e3b709ecd03044b8d19d17bf5de', 'a52950969059397e0b936bcba7fdbdf488b021ef96e1435d78397c1024732b3e4ade5e06b5577a65', 0, '2018-12-18 10:08:25'),
('e666c85b55f897a7dc18c05eab776c6a99770dafaee5fd85a8e515b999d1bd9a129ee8ad2a3ee891', '1c49165c880c986bc3a7c738bdd27b330f4484620231a9dcb255bd7c53f72ff313c83f8040dc2fee', 1, '2018-12-14 10:49:27'),
('e695ffb2ab8b4f5f5dc514c2d827fbc94c8534a1ddfe1cb8f4fa36f226315803cf3fb4fa56af9a8e', 'a193e6941cf47437d1bef118d81d9b99bb354e17dc08be0e30b46059f6296d257690997af0a9c831', 1, '2018-12-14 10:45:32'),
('e6dfcb4949221b46a41db91e62d4587f7291f6b68261a3d07e8ff4005aeb4137130fa6ecc2e61faf', '1ea0142a172ebc8c24c6ae78d5d73a5e8aebb9912cf7af99bf88781469bb6fd79a71696669542e9c', 1, '2018-12-14 10:50:12'),
('e6fffafa6796d9b3515d02a2dac4ccb643703dfff325e13ee45316eabee27d56d58e9248f9fcfecc', 'be8476824e8e8d3c07d2a163b2eb5961c83186db6cc1a893af48b206ce84ab722034e662143d44a3', 1, '2018-10-18 16:22:12'),
('e7543e7782da6e02c828e3143dc641bf6476fa0841a7c5ee41404c203d963bfe4a9b7b58408862a0', 'ca32444c4de1e1480cc3b368ea4ddaf7c11365bbf147e0c3db76b23f22947fcafe2f2fc73d3e9939', 0, '2019-02-13 17:22:33'),
('e75b80326c7e4590b5f2278b319a341a9bf0892e9e104642fa90c2cd06d8b98d6b4249b7f5fc59f4', '31906380ce82dadaf27a44dad3990be39be0e65a0e5b3e17e4e7d4881fafd2b40ce47e2750e6b68b', 1, '2018-12-14 11:08:22'),
('e76d5fdf661b6eaab2f6991094989eea4e3cb83785b46c536938170bba6eef94179e8ee8ffa1c73a', '5410d439c88cc6045e68c09420c94794cc132c7e916ea9c71b7f3f09162b1f0a68446462dd946346', 0, '2018-10-28 14:35:26'),
('e79967f64416c7fa389ef84bd2cc9c7cc3e318e97c4ef50c84c76719d71d77aeb9137adbd95ce61c', 'af83cc4716ab71485d29fa3a85a2062023986f1f15dd073afa9a237c6c9a003d32e6f5a8565e1cfb', 1, '2018-12-14 10:46:04'),
('e83a2ccb21f9563fe6caccd31321648855d42307c665340a3f7d8f0e750c4e609c2e33ebf7e98cea', '8c0c8f56ce1ee37b52e9e47da1875a25e2f81da82d971c334fb994d0b0c92bc984b9e226b291ed73', 1, '2018-12-12 14:50:57'),
('e867e3857f165914251b11bfd2b8e75028ca96346b957a605200ad5f5675da5cd7968af22f01d9e2', 'be4878b6a746fceb1cbe7c73bcef44928f7033b534df662897188706087222f4e0a9d848051f0876', 1, '2018-12-14 10:59:02'),
('e879af8836df5c9393ea168700b5c6114f617e24249437005832d1582e4300a3d3e52b5b32943aef', 'b9ea16bdc19df1e7480c43b3026999fbda36fbff5ac8dd04c1c265ccabe6566d011ecc01588b455e', 0, '2019-05-20 21:03:14'),
('e883e52faefe081c8b6b662e26572a288aca690b9fd642fc2ae335e923edd456b5b5997af422fe14', '0e6fe18278e1ee2e70343f3c79c7a0084902c41f49f090b01592181e41aaf722be21187e6b959164', 1, '2018-12-14 10:45:53'),
('e908bcbe7bfa6eb4dd10854d6081372d7fa072a8ceb709330eec8d12dd2dca09369bef77e7229056', '4780186ee9dc3badec7944527a7f93071facccb90215e0783a504a7539f8c6045c00a2490432fd73', 0, '2018-12-11 14:06:03'),
('e920cf81abb97b69cbe4828b1cefe4211017f11ec2a5aee8fef700df80a4f5def6f0ca76ddeea82f', 'f8772fdeaf77df9403d5f2883feb59f305992ae368336753a387bd349ac7837dcd01ae82fb25a0a6', 1, '2018-12-14 15:49:32'),
('e9248c3c83ea64a39ca4cdf7dcf8feae1057c23e3e82970a6d4eed317fac9a1b99e636336969cf19', 'b13ba6c1ce5c2246eec9deba25038f0d92fe17ae3896517793beb98ae384420ccc20a56e4ed2154a', 0, '2019-01-02 12:26:53'),
('e9afc15f36de5a336278e6b2d2e6ec39c766fd1e0274434912bec0b81595cb62af601e24c97c61c8', '7ed2c830a095a1d886a39a54d1b88746537454aa6c6cbdeddba8180a135fa1cca0b2ec8a94cea685', 0, '2019-02-25 17:36:59'),
('e9c3bf4fa3c9635541889bb9360918a815749a65b0ff407d66229a87053006904503fc17a28a0622', '0c42b2c2a1b87179bec96d00be08b5bd29b073eedba77a2f0c71ee197f16bbcceee7124bab68a943', 0, '2019-09-08 18:53:03'),
('e9ce375293b5667d0cd243d6534dc6db14dbf724d24d59ae920a3213e7744368026c0c6024f3e037', '263565b623f0f86067da4f8c443ec531b20270aedf076deccfb15f5a079ba85bedc9490624ba63ab', 0, '2018-12-17 15:55:04'),
('e9e63df2d01685ce168cfc0a0094358bb9a24c989833c3846647a7e45ed32803aa6c835a3b35c1f3', '955b26d2bf81e84f0f5a17cd536879cabf44e24098360c2a6608305e1ea313907e75db26556356e8', 1, '2018-12-14 11:08:08'),
('ea1c390c82c43c96e7ff94191e19ea919ccf436151052b33c183f447036e3500ab3ba20d2d5ff92c', '3e8469861dfda2f8f38ae9df18d2ae361ee5b7e49f4c956991952768295924b9a93155000231405c', 1, '2018-12-14 10:59:17'),
('ea1d97eb553f1e50b0d77c0f92fc182f0f9b0b360e7a313b42f58f3b0f52e56e71c2ae5c24cac2ee', '0493b389e0f3d9fabc36b1570881f526ad2df0cccb287a997ce77cc50bada2646409cd90218cf11d', 1, '2018-12-14 10:51:57'),
('ea3636311fdf5bb3697e6aad4daf5873a8028c4d994105f5aec0eb1afbe47739c657868fea7dd25f', 'a88f2b3f256f1a436172d97fa5ff515669b5485994f2a55faa7b70a84020bc406b2addb373f32a4b', 0, '2019-02-12 10:33:51'),
('ea5b569ed0f369aceb32f1504066b14d574e83b942f1c8a045d1bc485a7230f0bcaa5747ecaf4280', 'c251ac4099aa6cd6c43c086b9c0552b32796fd2d99e41866a67a9e544aa33cbfcea92072a51398ee', 0, '2019-01-16 10:34:34'),
('ea80dc1afe91d5d7a1c70af927db2a8a6763c6e501a4eb812d0596b2177fefb91ec53f206aa978e8', '542690feaf68a7feaf9e3d4b1e0baad60ecbd4d295151df8991091486363bf1e7750b3348cd5db44', 1, '2018-12-14 11:02:52'),
('ea83bb34d840c9459f5854700e93856d3c6ea26a0bfbdc08ffba25ea86463a115e5144145392e12b', '22a810e3e3d658ec56f5353cd83f6a96230465d17e9738f7e61811d073379eeb89110c7344b0a822', 0, '2019-01-04 20:02:10'),
('ea8a41213e74c436d3c0e58ae0a9755ef4d9b709272914c65be9ef8fd678f515f4d0739fb7cc09c6', 'a66f51ea7e5e15e414dfeb55cb7744559ba1e9b9af32bcb19176d044cc29b02f008649a83c4b4495', 0, '2019-01-30 11:25:19'),
('eab13c62981b6a7e7bbcececb5b90f8f9801f91a5fd818476440d1e090a7e273e32c4dbb2df5ffe0', '30395c3ddc1ee08ade62c708c2ee7579d63c7c2a20e8b12a979719cd8d23476e947299c67b57acfd', 0, '2019-03-26 20:55:37'),
('eacb3c10833bef5e8121079b3c9524d23e7e99ccc47753d75c3e4fb664a92d8593abffa5ba679e12', '5964868a3f885baacbb00ecada5f356366d1b46a2d461cdf7d583a7326e327f530c509a55fe09505', 0, '2019-02-18 02:16:23'),
('eb2f91c4d428610c7b112ee38b7eac82354593656c7ed75ae89642ec9986d37d45422433bb222045', '28f7091f359f0aa9c9a0333f5743ce399f148824c8b48b2c19d8917cb427e6382606b197159c7cc8', 0, '2018-08-19 18:08:19'),
('eb5758ddc352903b42285623b463bd79ec457c42940791db93798a320802fca7a40158e682f2a425', 'cfc15a87047671ed6c7518c5cfb18f7791e0beacab6447b5960aa8d5b47097c494548416a35a768a', 1, '2018-10-18 16:22:09'),
('eb71fba5f303ddd403dfccece34bcbf157f64d64a3f8142f04d1161ffd59489a1409956ab1a40905', '263474c151d320d77ffc722cf18a50393baca04d2d529f7fc2446743229957047656b97b73ab9e30', 1, '2018-12-12 11:41:57'),
('eb7b8e66dda3cc09ac12cb262f0e5171e6a0c517d251f915c927378298ae7fd298b6bb4807632baf', 'd1c6ba25fa06b43295106d31cba8d807aa1b50c056643dbb36cda80e5cd1b8f68c8d8950fc16450d', 1, '2018-12-14 11:07:32'),
('ebfd2121f80a1175d67a441591abdbd8dd6f1250fead6c1626a9fae36f35058159fe9aae30f50e79', '4ba646a7c0b1328cc68d1445da744fa7b0b88590c1727502797669c37e0e1806bb9d506ae26ac3f8', 1, '2018-11-08 16:12:46'),
('ec0cc999e1c2fa48b2034e1979b6791d911d99ef886e47d83227ee22d1044b4426c063784e1970b2', 'fa2e684e71b00ba317912306e4829e3257ac4d43a6d304855a65b7103ea55145563670e9eaf9bb12', 0, '2019-01-28 10:49:43'),
('ec13200826e3d9c19b47dd855a1c0b52be4b306e6da5a124a147843d6d325e1f407ab4d36eb07ea0', 'b8f26547f5936f995ad734e2faaefdde94cd2358dab38a7c6d52f7689364aef2e7b3dc5064c23a6a', 0, '2019-07-01 13:21:16'),
('ec3f952b9d2aef9e43ea4229891f47def3005922493a08970e186cff2a6cfd162421c6f5adad152a', 'fa8f8692bd2d19476dedb99539f8b145e0b3df394e2b10c23ac689f6826322fade6c44242cf8cfac', 1, '2018-12-14 10:52:07'),
('ec53e45268557802274e31e96533ce2ae5d9526edf3fe03a68bae77660785d5342d3ea37d18fa89a', 'fbdca35537d5158b44e7e7287db918be5d7837ce145cd32e6b08c8365c576c97a596f8f750df7658', 0, '2019-01-07 14:26:52'),
('ec59cbe55f5869485c336879689f4dc7fca90da4ad0bb4db903ab5ff6f63eadc955eb7d9761f431a', 'ff545007008080272cedcd28e4a27c5dc5cec37933aa9a6d110587fada7c5978b931c46f652e0137', 1, '2018-12-14 11:00:22'),
('ec5f406434f2b6eb310f870aa1079f4c6e6049808bf0f9f24cfa7ec4b0f486b2e7e953409c10b6cc', '1572ce52fc446add7d5a92c9d76175b99900e1a7a7ff126b36c549ffa22cb0d896ed175e9026487f', 0, '2019-02-26 13:20:21'),
('ec69351fdd70d9e387f419f4bd1ecdac87618437f5d5d85518e4b4fdf17dffd58d423be1190ba8e3', '67ed741f13f343266a82bf287406477a7e4ffc1b6e9ad9a333d3c7905a7b6af3e11a8c58e6cc0247', 1, '2018-12-14 10:48:42'),
('ec965f82ec2daaa6be5b17cdc8086ed1e8e0d418a287d34a27367493383a399285b35bb0e8566454', '9df9597126301736b9d02f36529ffc82855c80266eb9670ebbb2acea434e2ade3273ad350bb0ab4a', 1, '2018-12-14 10:58:07'),
('ec9c5a5e7c56b36540eb90650a2d8e6fda88d4307a411911158c2e349ea7506ba62d01b62cfed788', '519ede73dcaac1d41d1487e360b1a2a045feddad33472e672af2378e8fc7548a4dc1f75a5949c51c', 0, '2018-12-19 20:41:49'),
('ecc4d7c34ad5cf316cd638e0eb3cc8041d46c577b536cbcec009a22c6ff2fdd9b92ed529287f1b5d', '45ccaccce61284ce642c85287886d83d11c3be24ae95338665b8a48268fdf74f93dec3d621760c56', 0, '2019-01-02 11:17:36'),
('ecc70672a74b632c2fff1c967b2853fa9f78dba319e025c93b7cce756745bda170c4f3b1d5d50cee', 'd9311afe99606cffee4715c7e954754fd2aa32213cd3ed36476a67e607c6e71a698b16786d790b83', 0, '2019-03-26 19:31:15'),
('ecfb398b9db49de4d3f393e5a32c4092957265de09ee5615edeb64683b58a1a77f12da5bed5c3e33', '2cf979bf1a59e39f0bb64755c93751ac9aaacc84f4607795a2531dc854faee298db4bc375a8fa948', 0, '2019-04-25 15:29:40'),
('ed700ee509cf9606df97711d19bb362def5e9295e09ea1b6643ee120dfff33fa9b36cb6ce4284d3e', 'a37be619e06f344c1fcb58b95feef07e9d082d5562743411fdeb766f9f3b805fac2ba2128d0fd4af', 1, '2018-12-13 12:33:50'),
('ed88c7a6217bff2b4db691bd39d85ed7891ab5421eb2e34dcf0ccc74b03053a0b05e8b4ae4c2c4d0', '78d6cadb98dc6d21b3ac16720c4579303a92065a8d2d7cc4560ec9b62dbbc6c5221c2de66c19390d', 0, '2019-10-02 13:48:47'),
('ee07b87d43283ce0d1499bc55314c7cf07fc7f344860df327123fdccdab1f5c92d2a6d941844ff52', '9e609b3759734bd39961740f5b7b11f4d8f672e2e1055ae8d1488989aea0deed9e02923ab9ca88ff', 0, '2018-12-28 15:22:45'),
('ee0ec265bb1d6eb7fd8ba861a14de9da410de906cbebe1db3e06e588edaa8b9c8c7cde09834d204c', '09e325330ef329b6427b65c4914162689b778251ffebad0ae590fd3ba0e99d25c27e1309991e1c31', 0, '2019-09-23 01:59:51'),
('eea5abcf7170a8efbda7552478bc463ab1fcf450c67620a5d13cf1bf90733ab1597ef14e9c6be0d9', '86ab5bf8c5ce770185bbb440c6c534659582f6fe19cad3568f51e9435a04e5ef4fdbab33a4f48a89', 0, '2019-01-08 16:34:23'),
('eeb29e42730736aa6b401deaf0ae8f023a99c9f893b2f0d90d25b80dc3bed24e0ec8cb6c01511681', 'b66ab1fe3370482afd414cc21d6838295c016b6c3ef2770111d2f2e4d935cc4cd836070b31a87c76', 0, '2019-04-04 22:26:42'),
('eebbb3941088080543c9b124cb6a69f1123e51ac8d89004ff0ecac3ad8f78dde15a3cf4e90653d08', '28bb9e5c2bc8eb5d84820480b0a3d36a81337fa591061519aca33a1511ae9c0df0c0eda488a5b1b7', 1, '2018-12-14 10:53:57'),
('ef04f20ce2839b140b74605b32b0a20d04803b9b77ba9def17ae0dbac69d337f34953913028cb6f0', '6074d309003f7cd87d0587e94dc4556702fe62388d95b0ff31969c3cd3f76703693ca06fb4b62d55', 0, '2019-02-17 16:19:48'),
('ef11d6649a63f678f3bf129eec548dbda0f4a37fff2d25813ddedf2e6f7e8b9dc3455a645631325a', 'aff9465c7783c8d3fccc7b462bcfcc9fade1550da958ae5a15c94867a6abc4dffae89cc9cd98522a', 1, '2018-12-13 12:30:55'),
('ef55defd6a9318ef67a1850a279710a4649a859fc3aa82ead3f72ea92a6430f27bb96f031269c753', '0d6cabbb0757a07b24498cf647cd7e8fd95a44751484e09fa65ebf5c7091a82fa2364183d77b5117', 1, '2018-10-18 16:22:26'),
('efeb29d9daf63a8a91352efa26e198cd5b3aee9277d6a2825217638d7bdb5ec79197bb0febc30f48', '55f9ffa3b262c6a1e194f91229b10ddeb9f31c944f30e6ec7918b1d865d94261cd6dedcae9656160', 0, '2018-11-08 14:54:48'),
('f047e660af44986f03e4ddd39e87eda2d51c445e395361cf7294b93f0a59b9813e3b808992d7f660', '3d4a621760d55a5aad6ee5ba2f982ed0ebb86bd7309682a7aec827ca8a3e6166974d58aaaa3c7038', 1, '2018-12-14 11:02:47'),
('f068a530ce6541e0c43c1b5af559d07a6c5650936938ef8c54ae259e0b686de3edcf1163b8f640ea', '2673a98951324a38374efb688dceae5dac855141493509108af464127138b2180d68f4098d31e051', 1, '2018-12-14 11:06:12'),
('f074f94a9016d582c9b218ff92e9ae60dfbd1f191eb1f0d44336201db23bdecb8d6242b2d1a5f21d', 'e571f2cbba31655fc830f7df9cb9ff73a4c8d51d418cd70e46c0c1dd64ebfaec69cfed770f34865b', 0, '2018-12-12 12:53:33'),
('f0c1a433d35357a4929c9c293d30d1425a9e400d5b6f72d7b899e3f5dc3cf26719c5a4caed4b2a32', 'f997c0548fb5a3c7ebc286cb38b471c897029e3968429a33f1cbc0b37c5af1eb0bf1f00ef00e9a53', 0, '2018-11-08 15:59:03'),
('f0f35070ee829c2f2b0934ae47c152b1f8040acc0b095ed45894e7f08e2b17ec22d77b159e6e7d19', '07da74a1a369eb86afe7bf056f1b2ff5cc3af6aba56590c687f92cdb5d02d8f8c34c78064577691c', 0, '2019-10-01 16:45:51'),
('f149559206706ae6cae09d6fb776ee901a15a7177a6629a13c7ef76e978263502cb76c907ef96a91', 'a0541c3e6e88de02b08160397aa6fb5816cd6ba62907f41395b6483ee6cff6ffc5bd9a315c36252d', 1, '2018-12-14 11:00:17'),
('f195672e6eaf2b3191a2983e51fde315f8400e3cb6a7a50373f3098dbe57c99d7acfbd7e6412664d', '834df3a7210f03112beebb3725e7fa07f2438f016cfc202de93315077f347f513621ba61e63706f8', 0, '2018-12-18 00:19:50'),
('f1c418377bd7e6baf853a41d1cc760cd70be71c4bda05b10b224fb5b063f7e1af2abd4f6a78e5d5b', '4cef7ec792f391cb872c4bec0713b58af81c7bfcc985ea130f43cce40b42ee67f931f26d0a38c3ae', 0, '2018-11-02 14:36:40'),
('f1c597aab06ba8e844cc2cc1f022564138c0559a7892aebd994ea71c48ad329c80f4f961e50dbcae', '56a103c9515a9911cae46645494add9dd1cc4d343d4efc015ee509744c5f82365679e097d225e741', 1, '2018-12-14 10:51:32'),
('f1d4958a040a91d0e249f203416fe9042ac736cba4c6b84367deae8851fc9620746a8009c0fd6db3', '6ac2da099a00276c369008b69a6fec0fc2b76cb08eec566432f6abbefe95e3f8e3b481e4840b9219', 0, '2018-12-07 10:28:51'),
('f204c203684810ef9140e2140698357b15df32aa3e48b10de9edaae349d48af9dcb4a48d3288fe5f', '7fc4a89c2c998efe63ff0aa9dba41453bc87b4c27bd468d3cc5dbe185073116b3758cadb8619bcb8', 1, '2018-12-14 10:53:37'),
('f209b01bb9b44544cef3f0be2d50e3317212ec049e417a9d4bb6cac676c464068969d7e261599257', '66fdc36fa5064bd594030d89e344fcb9acb5e050aa5373b5b1cd483019db2ceaa2611034c18b46b4', 0, '2018-12-18 00:45:15'),
('f23fd2b044a480b06aa8af4ff2b1bc05d8017fffead96e0185f4b688f257a87dbc99f5d9f298c320', '35045a0186c79511a2c87978c03868d1335d515c52c8c166a89612fefb0c2a349505bdc1e1d0c625', 0, '2018-11-05 13:19:29'),
('f2af22224f0ded39a42dba3a92987d4da070dffd529f54aa392d23f2f6063720c45153fdf1dc9b2b', '3c9cc1ff8abfa557f42218f3658834da374d1302676967634714e04841a97b864bba0044534f1a00', 0, '2019-01-04 10:26:06'),
('f2debc7175e5e442b10fd5135f2b85a8291b0d5a3478303e680763c4630e164854f455ff69988d03', 'cfea9fb5cebbfd9f6c15bf544108c3110ec35f006f0d4f493dc15d1db8bb09ec44866a709685c0b9', 1, '2018-12-14 10:45:37'),
('f2f3252c6d5355deddf2be230c54783ac02613cc11d89a031e2bc39106008c315c6d643dd97c5aa0', '51428af1991f9aa091894279395dd322cdfb422f31a0cd331a8e4c52ed844eea0b07fa2d0220db04', 1, '2018-12-14 11:04:52'),
('f2fcbe63c291f766b3ded6cdcb978304bc7fa99352d2dca0fb003576e3e7fcf23cab8598c37a5237', 'e0326335f779e16b3ec5204f88141811fce25d17126534c51fcd9157e528b66b6fcefa8dbacc2ea0', 1, '2018-12-14 23:54:27'),
('f30d3f3c9f47f14f86a612b63f5bfacd9fd03f49af15bc438fd6850363b9208ac49f250b7d97b44b', 'c8347573a122d3e5e8abbe1259b6422fee68751bbe73a17bfbc76f793625aa665696dab8c696a067', 1, '2018-12-14 10:49:37'),
('f34375c0a8f68c48fd1100bf45dcf58621dbb24408b4fa8eeddda1916bba368950f313132bfc5db4', '47e8b8114659d83a0737c1e14a642533f4b2224d7a925ab596315bb9418a09aaa52c965990877b8f', 0, '2018-08-20 22:36:57'),
('f3506714de1e2df0b547c08d706ec8249eee8603797634fd6dfe06910a1fb3cbf1005f7c426dd18d', 'fee4d86f2030dd58d399c8e852a4cb98e1613086d91a1777eeb3704360e794b74a525b669636f155', 0, '2018-12-20 12:40:45'),
('f37dbe1a46c329f6f2ccdc39c5050c6f9baf61e1e2288c16051540661587b35c0b61a277178b85a6', '6d5e69893936ce91c1ff1b3955e13039e141baa103cf2c0ff825332726969a591141ac09d2f50b55', 0, '2019-10-07 22:23:53'),
('f3aa847895ead71787e2a042f60504e03fc04e83c45ec9c7a94bbb5b87ac7fb745f4bc55324f3f49', '29862e94126d3869075334946d3e51f0722246e7ff3f98f734c323d40ba58af9a66ade83b1c755bf', 0, '2019-10-02 13:48:20'),
('f3e3312de420d57f82df1103516e800de4a4ccdca468705a75808e2a9bbe6f61d5206771dde17b08', '4be087722eb74f40e192525da1ba58e2ce6bc3af0421f7d5f9127c5a6ad9b5a4450093badc4f446e', 0, '2019-08-17 22:28:47'),
('f421fc23271b798b825eada59cf2699d42447cd475c5b658987e8d8e761f2cc8ca0fc1fd6b40c0cb', 'fd2fc3e84d4a4f619ff6db9db8405c83d8ee1d5c12591463d06d26f65a8bdf66c40021c9c016640e', 0, '2018-12-14 19:12:31'),
('f46b75b5a701d6dbcfbc1b5b562c265d966109c921438d90da562fed9ca263790500dc65620fda89', 'dc7343e0b65c76276d7ffbc19920a0b32fa3acb31f056faedbd377a0ddb58ff3c7de34b2ce8657cd', 0, '2019-02-26 16:32:12'),
('f4b4c5c5cb6a4732be2f311909c7f70f454bfae2af313963a80d97bfc7b9279e35085c02200ccb18', '812e1eb2e7a9525c2ddb9ffb766dfcd7fb3a0439f5e51527d202d89b04b1e9ffa2e2e90295e89727', 1, '2018-12-14 10:56:53'),
('f4f02cea128f4dbb3ab3d5f3f4d42fa6d004f1d34d68cc246c44ff9341b05892e346b84a48a5eca9', '36a4b72c0e877dd61c3e79168a7fabf69c73284af0516da4d64c06cdc86e8cc31249cd7515f83603', 1, '2018-12-14 10:52:17'),
('f51c036ebbc4bb5bc88345744c029f88e9d03c4f84088c4ad1e12df3dd51ca47f6df868eaa85978d', '284052d307a81674a0e1a143e07d3499fa46d26c71bff2e0af4504912e01345e765eea65a48c20ab', 0, '2019-10-07 12:07:16'),
('f53a4f2d00c03b29db9259238aa8497e025f84253b82ab582388ab1e3723dc4e42efbe41242c8ecf', '1fa272aae54c16f9eec0dc39d713b06bac0862d7ff7445c97724e3e7d2442108e0ef1a79e9138afa', 1, '2018-05-14 05:32:26'),
('f58ba5cd8a29e2b2596c05ba2544b534952ddcdbd0834ca07ffa57e883e74a77a6eb159857ad90be', '9a97c02a7c611b1dd700f93c3bc64335037dbf43069eed9f55fc04aecf04da43998882e408eb7a0e', 0, '2018-12-15 13:52:44'),
('f6042e269bb22e26132e28b48eb581437ba13d82cb039030073831b90f48a4b435204ec10f85ed92', 'bd85e781a9312d9e82353d5c8a07aada31077357948afd3203080a54b4e4999228e7b34b159f0127', 0, '2019-04-05 17:32:07'),
('f628de347a8afbc8c0b834c3162dc212062745684505257ecd0e74fe8801e2344a278ae037fdd603', '17c32e41b2009ed3c0639f511b4380f201062603d613c4a87f6b17a07323692b851aa89038bd64a5', 1, '2018-12-12 10:32:38'),
('f66927f81282d806c34be1e2674d29d9df0ea3ea1dbbe739616eebc79ad0e5b53e33d9c68ef27889', 'cecfd288c1c504e24a9662bb0aec126698c93747d6449684fc17ef5117047586adea1ac85f6b7326', 0, '2019-02-11 19:24:17'),
('f7055e7f5a9b460f2bc38167c942efffdf37c1653a00441fcac6f915b1cdf3d50ca7e9f7d6b6ba07', 'f33d9337aa204c0dc46930df8990b1c59e898b160ccf65e9154ff29d917e8d3495965df1851d1d04', 0, '2018-12-17 15:06:11'),
('f73a60fd4d67b9f920972f03a44be6b94470a767a70347d0d9e1cab6e7d30134a7581218ce113a68', 'adcd1cd37f4a63562bd1bd75445cd04cc52818c10673b5964755625b42aaa5f9fd123225f0ded2c3', 0, '2019-01-07 17:09:40'),
('f75523a62e64589be251b00b4ac094cfc26e50f645479270097ce065a7a80a1c7f1b2eaaa4421262', 'fc7f63e3776b6104ce9a21b3a96e598deaa81cb7715984e750fa46392fe16bd8a0494e4332ad2bc7', 1, '2018-12-14 10:54:17'),
('f7648bccfbacdccc1d8089e05274d8b53f7bc42f7b7ae184791424d674b3fad07563616dc7cd8f32', '50f93180b3d9179e3522a2a432f4d8ef01f60b574f87562f9fac9ef9db8d1f2919c8111c2f99d5a0', 0, '2018-09-10 20:38:20'),
('f7c38b49ee2efa6c4d95448d23db12526222f8f67d936111224b0a81715db420338cb30f6b9f8f87', '80edbd97e64a1e91f891a7d0a8e9a302793b4bac59a22c9c9e8bf9d883013cb269f17164257adae1', 0, '2018-08-18 19:59:47'),
('f7e062351da2c5396b00acfb4be99b67d0282d7e1642a8eb0d3ff0bad66e45b3076b054548aaeae8', '49eecbfbd9156cf18be294141564bb95ae4b0196a7a4e93d2cafba77947a12f8c7bd94a31b2b5ad0', 0, '2018-12-19 12:42:42'),
('f7f01d9aa172a69365f18a38b6ce6838dfd4f5e26c2a929de7a9ecf340922a7e817439366ff989b3', '397c9406688aa895b73fc9573495e2cb7b87d52ff3dba0875674c80cd105c38e08c586d9c7813a75', 0, '2019-01-06 19:12:55'),
('f80b5fb1f92ba63fa9eb1fcc21d37a2aca8062ddeb88c2a328130c0a63b9a780890d29250d504b36', '202d7eb2a33384c228c3f8e3cbaf2ff27baea46ffb51a5a56cbba0abf4bee58411b8a14647a5c233', 0, '2018-12-05 17:07:33'),
('f822cc39542b34aa729f8db832bbfc768c1aa60909f167d82d6d3e7dba8daa34fa59131422c40f60', '95ed509fd8ce06c8ad2f4c3f2c8d050dcc5f4584caed33af4484488d5044d0f1fa9593656a9b413b', 1, '2018-10-18 16:22:22'),
('f8303f8cd10d6250f6e8205b2360e2f7308267e42522f42a62559a918e89a95f19c2a30faa15b341', 'a9f0aafb7172e8d6885304351d7ebfb4e681c7b96947288f0063c8c3c68831a8ffa84802eb6f0359', 1, '2018-12-13 12:18:25'),
('f83851c801f9d3a8d158a3b0f25115ea5a57d7bc3d953ca5f69f0f5ffc7670e8702e92d5c0377c63', '77bf3f4d9671bcaef21439bd39b826f838d8800c082c6935fe5b44e35d83410b2edd324a1dd5550d', 1, '2018-11-08 16:12:49'),
('f84708801f114260cc9ed072447aca3c2da8572e3625e3d0587c4b92d5096248a164d40a73b74289', '91593bbf651cbbb5e78853ede62a97a78b7c2916f8ace6382f51b6e2cfc798d767e814f7e83e6ce5', 0, '2019-03-31 12:45:40'),
('f84bfc90438f7d9ae3773dd9e5815a4e5f4379d93f51b070d8e9a4a274cbd7a02c2fd3186e3a48ed', 'c450d97549ee236745f6ca9029e3e72354233a150581b141c6169c3dc0225a48410650e8abf789b9', 1, '2018-12-14 10:54:32'),
('f867dce3384d5cfdf3196b94dca3ce1be66ba51d23b9aeb1def7a5f4afa1184a13df5766dca07f85', '955d4f4ad98cab30e2c0b708ab3873753db69033a8c569c0c16d6f6eac387104b3565531b29b0ce7', 0, '2018-12-05 20:12:08'),
('f89735729c1e88f5930f2ea8f622b7a18df96924ed04a712e22c83a17762b5c51ccda5309bbe4dcf', '2408d6e756a524d7dc97229213b9b86ea9b489a87c92d52064c4a0d00fbd67e0d886d0023d794f6d', 1, '2018-12-14 10:56:57'),
('f8d270fb193cfb6dc61947103a767a7ffdc80e09cc7302f870ca944587d5f799967ea8c9c614f5d2', '1c23120a6d5d5258685e1c25cf8d27e45bac4277e9ef46765bd8c395be4c76cd257c391ccaf9a6fc', 0, '2019-02-26 12:58:51'),
('f8f2f6665bbf505ec93ea08f790a8cefcc1ac096d72b09a83efa31960d4162ce7f378efdef7e87d8', 'd98c83529c5d77d045d0510674aeaf5969a3409c5161c22a8eef2e68dfec40bdb6bddfaf996ef52e', 0, '2019-05-22 18:50:22'),
('f95b46fefee6fa3deac094243eeeec7aee4fc0767217f68f005226b3f5309671b6f8a25048552636', '3bd147c5944ec4405f021b2e48d0b24990edb1b80b4d1fe5ed9f8cc097f5387041137048fb3b84cb', 0, '2018-11-23 18:55:31'),
('f9916881a28132b33e17e773706b2a8bf27d363723c18b9f9450e818c0a57321f6a05810f4d61bcf', '335ba5e662360f21298041730fb4b615df741ff9d06a5a553d1666c5f577b0ef1e1bde3766535ba2', 1, '2018-12-14 10:53:52'),
('f9b19d6789028c37e043ce8e688e049c3b23c3563ff60d4ea7e9a64f2a92dbc0aff0015aadaf3544', '455cf0c78b251e82cd6d1ac367bf83c4c08ae7b443a85796b5cfc3daf87790673f92a444ea86ca97', 0, '2019-01-03 17:56:20'),
('f9dfc7190f7b7ef6f92eb655cab9afc060e80af104f36bb90407d67fdeebeea70170059c2dd86d43', '10511f2c3d328a9d69d11b3f40cf3147dc2eaec4eff7c4daa9c951b4c30ee9752562dffede10a30f', 1, '2018-12-14 10:53:17'),
('fa1e0bf4c58383ba33faf11944d3263e624b812e3a864c7262a61b93f5ddd2004d270e828f89de16', '7c7d40d84e91cda82151fa37700acbd11274334d2808e318429a0235a7c2cc1bea6db1246050e2a3', 0, '2019-02-19 13:34:39'),
('fa66887c07c3ef125d4e710f948e0d4525f0378ba6fd590d54db9aa27bf800aa93d6936bf7eec275', '18095624d8ac80fa22fa19dfc327cfe13dabd8fc8d0a6f2d0e4b97275a9026b21abdbe9ce1b3fb51', 1, '2018-12-14 10:46:07'),
('fa8e715928e36af566abf22cde4cb5cd6d4a1f620c3a7b176716bc8e4bb3c611a9ec73acd6dceba6', 'e821d0dda00bbb0035b1611c065c1c29a82debfa50146a54854fd00bc7d087ac04aa00dbc335ca46', 0, '2019-01-13 11:21:34'),
('faa86fbe312c137a2c97ea9cade9a24d4c8d6140bb82c4265ba5bbfd846005931f73c57ffffbc898', 'b9470cd055b55192bcf358284b062f257a2016a556109a602e9f45c1e65876585b054cfd8e95c617', 0, '2019-05-07 19:43:45'),
('fb63eb8d18fc49ffb6c246d4127d267e1aa720d9733ee35ecd41aabbce853f5aa31de89768a69e1f', '716bacbc6c55dfd33a626359623dc5000943875d97edff6da6eee68d76a5b5e286373dbc15be981a', 0, '2018-12-27 19:46:37'),
('fb71bd12eb975a50931b4391d993725f62b3bf22e0cd906736dc10925422f0b20ad96580953556ad', '672591bc36029799e82a4adcb0963b357ba3c9d374c250e7ecfc30f8003ec56225d112f08c9e4093', 1, '2018-12-14 10:54:07'),
('fc4131a4cca4141bb18e24d08b202d129e3792ad11c06b03ff669a99db453e1c4321a9cfa19570b8', '47a1f3c50fd3f531e7ddf798d7a2aae27f71cff7f1604952cf4c063c17c3afc2e1f02d5612a84bcc', 1, '2018-12-14 11:07:22'),
('fc5a14c723428cfa60c5baa82c0c154a9634594f197b4b37211a95e3f16def70cd455642fe0c3557', '5e4592ff76f30a56507f9a6200af7aa7d4356f3d62f2ba39be2e92c3459db4531f62091883dd41be', 1, '2018-12-14 14:31:36'),
('fc7327b467048f32d45d4e2a04522569705fcfba8ae2a83a0758d88fe2f14879f0b18260ff03c0f9', 'e3d33758f8db2aff6a86de907f457c541a450e87a8c8e9473e6899979d3514e34ab468497a6af0e9', 0, '2019-06-04 19:10:38'),
('fc805d274ed359294f5c98ed9fa8349d085f98df7aa0fcd9aaecaa8769ea7d37b7a16d0aa09fe64c', '1e9648eafc76bd1947af2d01aa8aa5f1e26c6974f61d101ca64cf4d8a74f173bbb3f03a537216ade', 0, '2018-12-28 15:08:38'),
('fc89751354d3a80bab91e24ee751d1fc489d7fd6a89d9d7ba38e5f467f651034726c58ef44a82d98', 'a2e1c80635b01533a1ea7d95748fefc95c5c333f97209021c46cd55b8cf18cabf3aa2e924a5eef32', 0, '2019-02-17 15:03:44'),
('fcdc58c114e745b9b5761a329d4ac947250316aba17147d9531370019716c553ac4acd04e8c4aff1', 'beacf7dc1e962e2d37589b951731140ba4c46c1d7355f753cb948a4d5190369782d40f318abea141', 1, '2018-12-14 10:44:57'),
('fcebe65388e1d76a66bc1ccc087c2f44e842e3471ea5e715205dd059c36b2465669393764c7203a1', 'a898f7f95b3ccb27e4596759e0399a5186f9c79975044a2d22f7ac955bc0f393f52dd9fbb5fa17bf', 1, '2018-12-14 10:51:02'),
('fd865a9f217ac14f17331acf627101a0e853621a26058abb9d65b86c3c44d0b2076994275859994e', '6de5eecf98d55a6164d78e3d27a488186724bd5fadea4789eb0cc9b0d0f62c16fd34868ea89aab59', 1, '2018-12-14 10:55:37'),
('fdc79b9a641bd97a2bd147cc6ad70c41286dcbde7392508284fd5fcecb4a1c20b326cb43c6522b28', '8b2f552546f43772241d3599dd84fa0ce7a2160144b4c9e5b26b3d456a7f63594df5b56d78d96608', 0, '2019-01-11 04:29:31'),
('fe02fac4ee8108f5af45b7abbd3959dd4cae6446b86b858cd00fd26730651202434861d1cb45d537', '47f9641bf9f184e7bde4eeeadd73092a71083c25f4349d201a54310cddf86c0c1ea88bf58c324317', 0, '2018-11-08 17:19:13'),
('fe08134c2e84b98c886d26ef42f5e14f5cba7a7407dad4074ccaf87f91d953bf23904f82b83a242f', 'bd625162debfa1f9006b5953ba5536ea3873f9ff94cdd218132939747cd2597d0ee915b71c7a721d', 0, '2018-08-19 22:37:52'),
('fe1db7d9b5017fa3480a0b3f1d88b8052f55ad9b4611bc4fcfaa6ba6b094aaf00524268231f1f307', '202c71a1374c867ccdbdf7f9d1b08b2c10134b5241757f1908a4b445932a2706c4dfebe7a43c90db', 0, '2019-02-13 17:24:00'),
('fe4f3a82171ec12894f06a7faec8089a16c648b49b5373bf4dac8115bfa4f4ceab490212d83c462b', '96bce3ad7e6a34c09add25deaacef329bac4c1bd44ba669de353137dd99d9680bee81423e00497a6', 0, '2019-02-22 19:22:38'),
('feb8c73a03fd688fa6a85a83533c88bf478816fe7ae661b828b3cc41f84498bed6b1168cb056f90e', '7ac82866775fd8b97235e24fe514740fdfc2b00ab90f4c6e41b2227ad5d8a767c1df9e2ac022d025', 0, '2018-11-08 16:25:16'),
('ff4633ba5209018642eaed5639c2153e833ea00f73827bdfecaaaac660b2ab073aee7b1e50782fdf', '8791b89e9e755aa299155fcb3e4750e1cc0ed4f4827e39e98aed93cc896fb04e117a2e8e62c66a0c', 1, '2018-12-14 10:57:43'),
('ff812c4ad286a645010f5123b8b35dfde7b74b2d5bfd05be43133ba16aa37a756d6017e443327d98', '90bdcf5cf89c9c3e7f97941cf966fe091e51c3d6f7c03f16bf94a7bfdb903ca5554fd722abcd64ec', 0, '2018-12-15 10:18:22'),
('ffd876f5dc95efa9b51368e171ece31be828eb9169bba4740f26b293913ffc0518a0478e5ab64244', 'f47042030f04068c175970400f6762b62bf5805fd79d8bd980fd6d3c4d1e08c03ed19d0b89ea8d0e', 0, '2018-11-02 14:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `name`, `image`) VALUES
(1, 'use code abc123 this on your first ride get 10% off', 'https://www.carecrew.care/public/uploads/special-offer.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ratan.singh1911@gmail.com', '431018c7273022065382e02c44cfe98871137ee1ad605270fdb576d282600f9f', '2018-10-27 18:35:09'),
('carecrew123@gmail.com', '64e6a50eef301b505cbdb0bcdec0876febaf5d210d5f87cbc18a105f929ded6b', '2018-10-29 11:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `expiration` datetime NOT NULL,
  `status` enum('ADDED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_usages`
--

CREATE TABLE `promocode_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_service_type` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_type_id` varchar(333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `major_service_type_id` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available_for_emergency` enum('YES','NO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `available_to` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'available between time a and b',
  `currency_id` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_amount` varchar(23) COLLATE utf8_unicode_ci DEFAULT '0',
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(215) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `status` enum('onboarding','approved','banned') COLLATE utf8_unicode_ci NOT NULL,
  `fleet` int(11) NOT NULL DEFAULT '0',
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'en',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_membership_id` varchar(22) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `stripe_cust_id` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wallet` int(11) DEFAULT '0',
  `term_n` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `provider_service_type`, `service_type_id`, `major_service_type_id`, `available_for_emergency`, `available_to`, `currency_id`, `base_amount`, `first_name`, `last_name`, `mobile`, `email`, `password`, `avatar`, `video`, `rating`, `status`, `fleet`, `latitude`, `longitude`, `otp`, `lang`, `remember_token`, `created_at`, `updated_at`, `login_by`, `social_unique_id`, `provider_membership_id`, `stripe_cust_id`, `wallet`, `term_n`) VALUES
(30, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'hugo', '', '67630096', NULL, '$2y$10$EQlpNRdMXPfHzm40Br9ekeP.3PmkEeC.oO/slOVrd45oTlb/IgupS', NULL, NULL, '5.00', 'onboarding', 0, -17.75596960, -63.10009250, 0, 'en', NULL, '2019-03-08 05:00:01', '2019-07-04 17:10:36', 'manual', NULL, '0', NULL, 0, 0),
(39, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'isaac', '', '77055824', NULL, '$2y$10$ShW6M294mx7JN5jX9uOkPetTFoI5/nbmgtrvhT.SD4Od6SWYXYscG', NULL, NULL, '5.00', 'onboarding', 0, -17.85575600, -63.19351900, 0, 'en', NULL, '2019-04-25 09:35:10', '2019-04-25 09:42:51', 'manual', NULL, '0', NULL, 0, 0),
(44, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'Marina', '', '71339161', NULL, '$2y$10$gPDz/ijdxZ9H0r8KRqroc.Cj2M9VPcVIg4tc2CrRpnvAgGhhn1y/2', NULL, NULL, '5.00', 'onboarding', 0, -17.73759890, -63.17330200, 0, 'en', NULL, '2019-05-15 05:30:18', '2019-06-06 00:53:01', 'manual', NULL, '0', NULL, 0, 0),
(47, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'Emmanuel', '', '08023871363', NULL, '$2y$10$MbFG2tN9zn23fSp.npyRHuBK2XaBNjNADwmYtjAMu35onqNc9a28a', NULL, NULL, '5.00', 'onboarding', 0, 6.47332420, 3.61908900, 0, 'en', NULL, '2019-05-20 05:35:59', '2019-05-20 06:11:47', 'manual', NULL, '0', NULL, 0, 0),
(49, NULL, NULL, NULL, NULL, NULL, NULL, '10', 'Prashant Driver', '', '8826540770', NULL, '$2y$10$7lBvQfHoDV9ckd82AgpgGOu/YhA7Oj/y.musQeZZ6wGUjOomwzc1.', NULL, NULL, '1.75', 'approved', 0, 28.58543090, 77.31268590, 0, 'en', NULL, '2019-07-04 00:23:30', '2019-07-11 20:30:07', 'manual', NULL, '0', NULL, 0, 0),
(50, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'Ravan', '', '7905848385', NULL, '$2y$10$J1yW/9k1v4qX0wqqDk5yveik6GAyfceXM8n.DMA/YT76vtidAwO/e', NULL, NULL, '5.00', 'onboarding', 0, 14.62772790, -90.58270770, 0, 'en', NULL, '2019-07-08 20:23:42', '2019-07-09 16:12:43', 'manual', NULL, '0', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `provider_bookmarks`
--

CREATE TABLE `provider_bookmarks` (
  `id` int(7) NOT NULL,
  `provider_id` int(7) DEFAULT NULL,
  `user_id` int(7) DEFAULT NULL,
  `bmark` varchar(22) NOT NULL DEFAULT 'N' COMMENT 'bookmark yes/no-Y/N',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider_bookmarks`
--

INSERT INTO `provider_bookmarks` (`id`, `provider_id`, `user_id`, `bmark`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 58, 'Y', '2019-01-04 14:09:59', '2019-01-04 14:09:59', '2019-01-04 14:09:59'),
(2, 2, 60, 'Y', '2019-01-04 17:36:51', '2019-01-04 17:36:51', '2019-01-04 17:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `provider_devices`
--

CREATE TABLE `provider_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `udid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sns_arn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_devices`
--

INSERT INTO `provider_devices` (`id`, `provider_id`, `udid`, `token`, `sns_arn`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', NULL, 'android', '2019-01-04 17:51:24', '2019-01-05 17:01:49'),
(2, 2, 'ca92c076677c3135', 'dqkZ-gJr2Cs:APA91bEhNBgwJwhK3Yl5aQ07NQZlmHi_w64Rq0PgoFOgsatGNKpBb8R40CtSIET8h4PqPZaVfXUovH32zGmI8iAXqCDc_Ug2iyw5gFkmyGibrMAmY0xTGM64gtLTBtZC5GXBxn_a2nPg', NULL, 'android', '2019-01-04 21:40:54', '2019-01-04 22:25:08'),
(3, 3, 'b299a5d5ed47e53a', 'cl6f3ZBTnxY:APA91bHxZJtH05VAd5gixGag9Ydhw2Z8gG7xXuN0y8ZXUOKkthKNLHygW6zE61DRc7gLTFbWAYK5nJ5IABRfOnyrnVFeMMP2aGfDkuiw_xdCAWuPfQFDgcZYeJW4I92WKkCfQxLjp4p4', NULL, 'android', '2019-01-04 22:34:00', '2019-01-04 23:03:18'),
(4, 4, '78a6e92b7993d8ce', 'cIT8lxUdxwc:APA91bEbL62OXPsA3TdUlkkDl5au7jGmyZDPEkCdz19tdGLVyf4853guKZmxU0Bfn-6M6qgfD1OJIDZQr4MR2TgUL59l_ANh_J07ca9dntXloju-ZQ8_GZDVVhL6FLpWFVLEgxoU-ajb', NULL, 'android', '2019-01-05 14:14:13', '2019-01-05 14:14:30'),
(5, 5, '', '', NULL, 'android', '2019-01-05 14:21:39', '2019-01-05 14:29:47'),
(6, 6, '78a6e92b7993d8ce', 'cIT8lxUdxwc:APA91bEbL62OXPsA3TdUlkkDl5au7jGmyZDPEkCdz19tdGLVyf4853guKZmxU0Bfn-6M6qgfD1OJIDZQr4MR2TgUL59l_ANh_J07ca9dntXloju-ZQ8_GZDVVhL6FLpWFVLEgxoU-ajb', NULL, 'android', '2019-01-05 14:46:26', '2019-01-05 14:46:26'),
(7, 7, '', '', NULL, 'android', '2019-01-05 15:08:55', '2019-01-05 15:10:45'),
(8, 8, '78a6e92b7993d8ce', 'cIT8lxUdxwc:APA91bEbL62OXPsA3TdUlkkDl5au7jGmyZDPEkCdz19tdGLVyf4853guKZmxU0Bfn-6M6qgfD1OJIDZQr4MR2TgUL59l_ANh_J07ca9dntXloju-ZQ8_GZDVVhL6FLpWFVLEgxoU-ajb', NULL, 'android', '2019-01-15 03:59:45', '2019-01-15 04:01:43'),
(9, 9, '78a6e92b7993d8ce', 'cIT8lxUdxwcAPA91bEbL62OXPsA3TdUlkkDl5au7jGmyZDPEkCdz19tdGLVyf4853guKZmxU0Bfn-6M6qgfD1OJIDZQr4MR2TgUL59l_ANh_J07ca9dntXloju-ZQ8_GZDVVhL6FLpWFVLEgxoU-ajb', NULL, 'android', '2019-01-15 04:10:44', '2019-01-15 04:10:44'),
(10, 10, '78a6e92b7993d8ce', 'cIT8lxUdxwcAPA91bEbL62OXPsA3TdUlkkDl5au7jGmyZDPEkCdz19tdGLVyf4853guKZmxU0Bfn-6M6qgfD1OJIDZQr4MR2TgUL59l_ANh_J07ca9dntXloju-ZQ8_GZDVVhL6FLpWFVLEgxoU-ajb', NULL, 'android', '2019-01-15 04:11:00', '2019-01-15 04:11:00'),
(11, 11, '', '', NULL, 'android', '2019-01-15 21:26:15', '2019-02-06 00:16:10'),
(12, 12, '21beaadfadd71c1c', 'ePyUlLNVB3E:APA91bEEJqdo_Oy-gYWPlvDSbJnZpN7Z02fr4dLGw8upez4Og9PPtwwmARQQh9LLiYNZzH4kQcda234fCgXyNT8uHuZ2dHsE0wpf2aEz7K8Vj4buw_HQLCXRYW9-stxdmtiA0k0d17cy', NULL, 'android', '2019-01-15 22:01:23', '2019-01-15 22:01:23'),
(13, 13, '21beaadfadd71c1c', 'ePyUlLNVB3E:APA91bEEJqdo_Oy-gYWPlvDSbJnZpN7Z02fr4dLGw8upez4Og9PPtwwmARQQh9LLiYNZzH4kQcda234fCgXyNT8uHuZ2dHsE0wpf2aEz7K8Vj4buw_HQLCXRYW9-stxdmtiA0k0d17cy', NULL, 'android', '2019-01-15 22:19:08', '2019-01-15 22:19:08'),
(14, 14, '5122831973b157b', 'efHaLvdzDHw:APA91bEMkA8YLKhL4WNbY5oKnlWjS6YKjy4QrptZHCV_Wt7YeFBIO6Io60trk1k0ELOwTQaPcYlEeWXBqKYCkTUrKJODXF-J6WTKkQDJXClQORK-xkBVP-PzWcXmCo5N9KryjnQg9o1S', NULL, 'android', '2019-01-21 21:52:47', '2019-01-21 21:52:47'),
(15, 15, '', '', NULL, 'android', '2019-01-25 22:17:43', '2019-01-25 22:32:25'),
(16, 16, '21beaadfadd71c1c', 'cbD7n-0_qKM:APA91bGXodTTGfbrCRDJElxzxqLai8Kd-H85KxP_-VcgVIyxrAspJlvshgsiY41CHHIB502CAjBq8UVUEAnwNFfVxpRNjQDM1dBBiOqv4uGLBY_JEbGHQgWjLGf78M59iUjMvUXymyz1', NULL, 'android', '2019-02-06 00:15:27', '2019-02-06 01:58:52'),
(17, 17, '21beaadfadd71c1c', 'cbD7n-0_qKM:APA91bGXodTTGfbrCRDJElxzxqLai8Kd-H85KxP_-VcgVIyxrAspJlvshgsiY41CHHIB502CAjBq8UVUEAnwNFfVxpRNjQDM1dBBiOqv4uGLBY_JEbGHQgWjLGf78M59iUjMvUXymyz1', NULL, 'android', '2019-02-06 00:30:16', '2019-02-06 00:30:16'),
(18, 18, '78a6e92b7993d8ce', 'cIT8lxUdxwcAPA91bEbL62OXPsA3TdUlkkDl5au7jGmyZDPEkCdz19tdGLVyf4853guKZmxU0Bfn-6M6qgfD1OJIDZQr4MR2TgUL59l_ANh_J07ca9dntXloju-ZQ8_GZDVVhL6FLpWFVLEgxoU-ajb', NULL, 'android', '2019-02-06 01:28:00', '2019-02-06 01:52:13'),
(19, 19, '78a6e92b7993d8ce', 'cIT8lxUdxwcAPA91bEbL62OXPsA3TdUlkkDl5au7jGmyZDPEkCdz19tdGLVyf4853guKZmxU0Bfn-6M6qgfD1OJIDZQr4MR2TgUL59l_ANh_J07ca9dntXloju-ZQ8_GZDVVhL6FLpWFVLEgxoU-ajb', NULL, 'android', '2019-02-06 01:34:22', '2019-02-06 01:34:22'),
(20, 20, 'd983a1dead69325c', 'cRGWw0wPgRY:APA91bGSuJunXKKYmDE4OY6_HRqra9IVqZPWrCrL2UZZ1UELiBwL5cZniYey781apRzjDacHHVPgTbtMcr-nzkL61BOe3052UaEAX-V924kdPzlZk14Hn-Ha5131lcHfBV1qBS9j9Isg', NULL, 'android', '2019-02-06 03:50:24', '2019-03-02 19:43:32'),
(21, 21, '76698020b66bd84e', 'dsPJoVP0bVo:APA91bG480PWtAFjhe6sDcZ1baE6hDnlBulpFOmfBr2SPn43uLVRIUCq6RkmOlVyxFAqM7NizyIc9S1ky1IOhCjY_vuuPYaK8fZk9ufuaN3vfUppfEFkDCfyxVSfowFhVaKsd2jHXQl9', NULL, 'android', '2019-02-16 03:59:15', '2019-03-07 03:38:58'),
(22, 22, '032da0b7cd870f79', 'e9kfnn2n9MA:APA91bHfZkuumYfNrJgUGnqUiZTII6jr_VulfKf0UXru1oFXvBjy_-C5qT3t_DYNycOQVzyLKg_qupallzKwRtKVgFzChzJ6ryjYKKAWcw7i1cIe7xSjAn1dlIOPZczwqlDal_kQzQXI', NULL, 'android', '2019-02-23 08:59:44', '2019-02-26 22:11:25'),
(23, 23, '29ed60dc3bf487cf', 'fmTc44-QJNU:APA91bG_9yy5PegFg7zRDjDpkMZfdY0nN5j-F46TeIqY_IEXGAz7onHU1zMweUeZSbydpO8-k665G6XNp4DgMSwpyDb5hV3htRvWAfCc8byxDzzApNUMfwcP6VI8RLx95mFhw8VNetKc', NULL, 'android', '2019-02-23 20:23:48', '2019-02-23 20:23:49'),
(24, 24, '', '', NULL, 'android', '2019-02-26 02:44:51', '2019-02-26 21:59:44'),
(25, 25, '032da0b7cd870f79', 'clPRy-8AGYo:APA91bGbUTg9bHz3nV2FBV7Mw_811UvWMj2SNtfPfHOGadqrCJiQZSvrk6M_0VnJuO9_aoVIdtDbHYkZjDUDfaQTNnEpJIjcpiWczb63Bw6gDmsar6MfSQxITw3ssBw6l0qwcYgEo12W', NULL, 'android', '2019-02-26 23:07:28', '2019-03-08 01:12:14'),
(26, 26, '76698020b66bd84e', 'dsPJoVP0bVo:APA91bG480PWtAFjhe6sDcZ1baE6hDnlBulpFOmfBr2SPn43uLVRIUCq6RkmOlVyxFAqM7NizyIc9S1ky1IOhCjY_vuuPYaK8fZk9ufuaN3vfUppfEFkDCfyxVSfowFhVaKsd2jHXQl9', NULL, 'android', '2019-03-07 04:19:53', '2019-03-07 04:19:54'),
(27, 27, '7742431ff420642b', 'c-27S46m7mQ:APA91bFcVLdp9BRFx-LcXJbZDFXeZCLhbnCESQt8vrk9WQgdg-2nf4FHEgvaGCy8VvMaGeafTNZLCB67Au3xMtnZ2ZhRCNcMG_YPXvvGYYhZwfPGu-w9cF20mdFa17USlKgdKfR7tAo8', NULL, 'android', '2019-03-07 04:36:37', '2019-03-07 04:36:37'),
(28, 28, '8997a0f8bde8cae2', 'fDP8R05HcBI:APA91bFJWcuKW9zR7L6n5WXm1Rrzr9xcFbOV0dfMbt7xkxiaC8-h1QcTREDxKUR8FQm0jEC7JO_g_TJJDQlICcPPIiFnpjWNK83giKe-67ajhExC6HMRkzKsTibaubLUE1GS-1Kbs4BY', NULL, 'android', '2019-03-07 05:21:21', '2019-03-07 05:21:22'),
(29, 29, 'da', 'addsas3', NULL, 'android', '2019-03-08 02:03:34', '2019-04-03 22:31:31'),
(30, 30, '052b08b616a11c33', 'cjbiKnUKtYM:APA91bGVWdS4v5VpipCWg2UNImbpuGWX3ha1GSRqCjwHgEr9NiTDSTCPZ_IDbdJubr4ilDq_LLWkgrgkvW-BEmwf07X5JQwMxh9111wd6XpU8XHR80apfUmqN3hEqL1yMUXUejUGTGj9', NULL, 'android', '2019-03-08 05:00:01', '2019-07-03 07:08:02'),
(31, 31, '21beaadfadd71c1c', 'dPJGGqXDmBc:APA91bG9jDYKl9EYFYKToJV2RT65tnOy7V5wRC9yCx0mp7r2bZUmbz0Pq46zoEBSiTw3lx1_dBS8yXHrrfxKlaoASRsDjMUfsOmcjmOTlt_nB5L7Jk30fvzkTJf_kXdGtg-4iX3ZRoxv', NULL, 'android', '2019-03-17 03:17:58', '2019-03-17 03:53:47'),
(32, 32, '0bd55297288f5440', 'eYANYI0lg_M:APA91bFQme9-_Pp01gtI-_fKwRd4yvvCRutTD2d2avozU-U9TbbgMBjeepBAoAyw62l-9XguEDqFtovoGvL46-kvEo-YoQK6xtmkQpAkEFXaQYL8ey_RKQwHiuTbV3GPHWYJocxBdA5j', NULL, 'android', '2019-03-17 16:28:30', '2019-03-17 16:28:31'),
(33, 33, '0bd55297288f5440', 'eYANYI0lg_M:APA91bFQme9-_Pp01gtI-_fKwRd4yvvCRutTD2d2avozU-U9TbbgMBjeepBAoAyw62l-9XguEDqFtovoGvL46-kvEo-YoQK6xtmkQpAkEFXaQYL8ey_RKQwHiuTbV3GPHWYJocxBdA5j', NULL, 'android', '2019-03-18 02:44:55', '2019-03-18 02:44:56'),
(34, 34, '0bd55297288f5440', 'eYANYI0lg_M:APA91bFQme9-_Pp01gtI-_fKwRd4yvvCRutTD2d2avozU-U9TbbgMBjeepBAoAyw62l-9XguEDqFtovoGvL46-kvEo-YoQK6xtmkQpAkEFXaQYL8ey_RKQwHiuTbV3GPHWYJocxBdA5j', NULL, 'android', '2019-03-18 02:47:17', '2019-03-18 02:47:18'),
(35, 35, 'b5f52e4fd99c37a2', 'fGD3C-jL2BM:APA91bGQmeLkzBG9x--iI28NYv0MpNI8HIjVtp654UctSZwFjlUFUilhqynh4NzANRf_mARdjUwvD_r5TtcTgmwyT9QyPyumj8DUo_W957QBV-pxFnnrgMKaVj-fqHBoi9rU_EnLZEiS', NULL, 'android', '2019-03-26 23:46:14', '2019-04-24 22:47:26'),
(36, 36, '53e0239391a18bb4', 'feV7XtJ5NlE:APA91bFYAEDAFmn7ZfH0v0gVOYUcIMQqU44CVc3FTU0qRRZEZXppDisil85XnhUXyzSPtJovtOiMErasZG5kFttnP7DH6ISE3cwmLl-qBuWIJsiVN3BzW2oqd83uJYQ5ZjKrwHGTYqPl', NULL, 'android', '2019-03-27 00:11:32', '2019-04-19 21:20:06'),
(37, 37, 'b5f52e4fd99c37a2', 'ddZH6dGu_uc:APA91bEnTiUCWlsm-M-AOA68PKV4UukipgUR0aIxXG-7Hm14wbAjqP0hCxcHgp2FFXHwmmVmuN3tME4MrUf2YFiiwuSXMYVh-DA_KPMlT5sYIJoUVqri6uv2FdEqPlrO3pMsot8Znh8H', NULL, 'android', '2019-04-16 20:07:04', '2019-04-16 20:07:45'),
(38, 38, '21beaadfadd71c1c', 'cKbPNf_YIBc:APA91bE8p_7ifr61UzchxgLowjHuNKU9Kp_vbIKnqApgxiEk81Myy0ZiPwvxwPs1BAUEOSfZQtCKLkDNJ4ffb5z5zcUBySMVsv7OmD_SUVMmPQpqb2psSM5Xn6smqgkaTAzUsRDXMWeh', NULL, 'android', '2019-04-16 22:44:58', '2019-04-23 19:11:21'),
(39, 39, '8997a0f8bde8cae2', 'dCsmvCti15g:APA91bH9hFrjouvvI7rIIqWO6bkniVeyIUnOcyAifmGcAzili5Bb0bp0sH70AJ1wVvaxli-lIxJphkO07oI7csUC7nKxE_eUSuAj0irsBF-dYsI61UAkz5Pd8B3JA3o_rR7CSDCGztGE', NULL, 'android', '2019-04-25 09:35:10', '2019-04-25 09:42:46'),
(40, 40, '53e0239391a18bb4', 'feV7XtJ5NlE:APA91bFYAEDAFmn7ZfH0v0gVOYUcIMQqU44CVc3FTU0qRRZEZXppDisil85XnhUXyzSPtJovtOiMErasZG5kFttnP7DH6ISE3cwmLl-qBuWIJsiVN3BzW2oqd83uJYQ5ZjKrwHGTYqPl', NULL, 'android', '2019-05-09 21:06:09', '2019-05-09 21:06:10'),
(41, 41, '53e0239391a18bb4', 'cigG8hYvwQo:APA91bEr3RDKYVTC4kkj09oEsKiaRdzPSbsqz1DXcr0r3UYWh-StRNtPfMqRU8qx6Cf41iiaB5JvnmodjyH8uTUdixqUDYqhR7XLqvOztBeZRVNiLw_WSZQq4a1IRSvUqmssDA_RFhBB', NULL, 'android', '2019-05-09 22:00:35', '2019-05-09 23:45:46'),
(42, 42, '53e0239391a18bb4', 'cigG8hYvwQo:APA91bEr3RDKYVTC4kkj09oEsKiaRdzPSbsqz1DXcr0r3UYWh-StRNtPfMqRU8qx6Cf41iiaB5JvnmodjyH8uTUdixqUDYqhR7XLqvOztBeZRVNiLw_WSZQq4a1IRSvUqmssDA_RFhBB', NULL, 'android', '2019-05-10 21:49:23', '2019-05-10 21:52:56'),
(43, 43, '032da0b7cd870f79', 'fD1HT13nusA:APA91bH2B6OtTfn8TJPfzZxHtyP8f7z2MlgHyaRyI77vS6A5hv3X61ohd_Ftn-Lkq7kfKK7qgG7IIyxBFFeC9OSbMQcZqz8JVMTXlliHNrVWaVqZpsTd8gxt7__G6yJGcLyH6FHqKphQ', NULL, 'android', '2019-05-14 19:26:02', '2019-05-15 20:45:08'),
(44, 44, '82310b9bf0053dd5', 'fZikCSjzi_8:APA91bGaRf4X3zETp89ovPhVMMxB4zzR87_d-S44gq3VbX7I0dZjftcGEp0ZfjibaJYHmeME5jqZyYpBvcL2EOzXSKTB8q_PR28txyS1ZKuU33l1uTZ1PFJQuMc-FwIuSYJijFx41erx', NULL, 'android', '2019-05-15 05:30:18', '2019-06-06 00:51:41'),
(45, 45, '032da0b7cd870f79', 'fD1HT13nusA:APA91bH2B6OtTfn8TJPfzZxHtyP8f7z2MlgHyaRyI77vS6A5hv3X61ohd_Ftn-Lkq7kfKK7qgG7IIyxBFFeC9OSbMQcZqz8JVMTXlliHNrVWaVqZpsTd8gxt7__G6yJGcLyH6FHqKphQ', NULL, 'android', '2019-05-15 20:47:07', '2019-05-15 20:47:08'),
(46, 46, 'b5f52e4fd99c37a2', 'cNLu1NewaYw:APA91bHyg2Ib3dHvK8f2miRtuIqsgpywt8Qo7202SeLkdAdcTInGdImmazOFcNIlhlHyd26348xHpiVGVgHlidm8r3g8C0wJQUXD9KmzM6mfwGxfgv6uRdc-ewWko5-YHVGHHSosxPAG', NULL, 'android', '2019-05-15 20:53:56', '2019-06-18 02:28:12'),
(47, 47, 'e74be6af9466b3d7', 'fuQA98Ow_Hw:APA91bG9SfFQ-MK6-eIPu-hV07ysXCO7zGa6YvX3Ti_SgWQzeUj0XA8u6RpRlkRBryEBiBwZrz4bCjKiybWdW2d-CJf7BPPJJUx55Y0lGWxEGW8roRnWKk3-OMes2lkCNSjBtlnBPs7O', NULL, 'android', '2019-05-20 05:35:59', '2019-05-20 05:36:00'),
(48, 48, '5565971570a46824', 'du_ePpEy5-8:APA91bH_65leyrqbdQZ3M8ZoOYalVd-ZsyXDZ1TBDHDhiHWmDgk6yvfyD2wYA7q1yY8BQ6vohYIJuQ6WhXnjrZcygAJPAOXfVxudLg7UZiUsJZYlbSQr0oNwI5AZwGgchs_hUPhdj_LU', NULL, 'android', '2019-07-02 20:32:04', '2019-07-02 22:56:13'),
(49, 49, '2fc4d9fa31b17d75', 'fbHjmp9b-Uc:APA91bFVRMjLA1RQeqxtHCwUM36LiUcNWDYWnD8NmoLESpE_v2dCCBaVia4RaruLTa8WAuVY_vi7WR1KoqDlF7jpHNqzQAR1H_fBQrohfTNgoUjOCxjg29DQwb2CvtetdROOWbvHT-Br', NULL, 'android', '2019-07-04 00:23:30', '2019-07-10 23:19:10'),
(50, 50, 'fde60ae087cd5784', 'cq6FyHrf1Ew:APA91bHWb63XhlembO8TJjO2-7p8qECgq_vCBbt46fpxnIe3_qcHPSXqjvMZ159F2HOKtYxLflox7YkxlvD7JhJuOQNUebBXghBWtVW_RbCxyiR5JbuCYwcaNvZODLil9CjLntZL-5JK', NULL, 'android', '2019-07-08 20:23:42', '2019-07-09 16:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `provider_documents`
--

CREATE TABLE `provider_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `document_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ASSESSING','ACTIVE') COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_documents`
--

INSERT INTO `provider_documents` (`id`, `provider_id`, `document_id`, `url`, `unique_id`, `status`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 1, '2', 'provider/documents/68439433878b6c3d88eed6ba36b986c9.png', NULL, 'ASSESSING', NULL, '2019-01-04 17:54:54', '2019-01-04 17:54:54'),
(2, 2, '4', 'provider/documents/7479ff9019647091a07974e1d028f22f.png', NULL, 'ASSESSING', NULL, '2019-01-04 21:42:03', '2019-01-04 21:42:03'),
(3, 3, '1', 'provider/documents/1913d3f02dba39a5e0ea1cd4a7d7cde8.png', NULL, 'ASSESSING', NULL, '2019-01-04 22:35:18', '2019-01-04 22:35:18'),
(4, 5, '2', 'provider/documents/988b9656be538310bad630c629ccb8c8.png', NULL, 'ASSESSING', NULL, '2019-01-05 14:28:44', '2019-01-05 14:28:44'),
(5, 11, '1', 'provider/documents/959339189caa985dc4f8ed1eeacde107.png', NULL, 'ASSESSING', NULL, '2019-01-16 00:35:21', '2019-01-16 00:35:21'),
(6, 15, '2', 'provider/documents/75801ddc6fdb9b6725a3b49d3e39a308.png', NULL, 'ASSESSING', NULL, '2019-01-25 22:18:12', '2019-01-25 22:18:12'),
(7, 18, '1', 'provider/documents/cb0f3559256b33eebd15a98073ff4991.png', NULL, 'ASSESSING', NULL, '2019-02-06 01:32:40', '2019-02-06 01:32:40'),
(8, 16, '1', 'provider/documents/cb0f3559256b33eebd15a98073ff4991.png', NULL, 'ASSESSING', NULL, '2019-02-06 01:41:55', '2019-02-06 01:41:55'),
(9, 21, '3', 'provider/documents/6386a0270598ea0e612df6d2a88b5128.png', NULL, 'ASSESSING', NULL, '2019-02-16 04:02:30', '2019-02-16 04:02:30'),
(10, 22, '1', 'provider/documents/0877e44a175198f8a212d22e4130e6be.png', NULL, 'ASSESSING', NULL, '2019-02-23 09:01:13', '2019-02-23 09:01:13'),
(11, 22, '2', 'provider/documents/0877e44a175198f8a212d22e4130e6be.png', NULL, 'ASSESSING', NULL, '2019-02-23 09:01:26', '2019-02-23 09:01:26'),
(12, 22, '3', 'provider/documents/0877e44a175198f8a212d22e4130e6be.png', NULL, 'ASSESSING', NULL, '2019-02-23 09:01:37', '2019-02-23 09:01:37'),
(13, 23, '1', 'provider/documents/6adc3b8c421c3cd3674b7a87c4b3cc8e.png', NULL, 'ASSESSING', NULL, '2019-02-24 00:30:27', '2019-02-24 00:30:27'),
(14, 23, '2', 'provider/documents/6adc3b8c421c3cd3674b7a87c4b3cc8e.png', NULL, 'ASSESSING', NULL, '2019-02-24 00:30:36', '2019-02-24 00:30:36'),
(15, 23, '3', 'provider/documents/6adc3b8c421c3cd3674b7a87c4b3cc8e.png', NULL, 'ASSESSING', NULL, '2019-02-24 00:30:43', '2019-02-24 00:30:43'),
(16, 23, '4', 'provider/documents/6adc3b8c421c3cd3674b7a87c4b3cc8e.png', NULL, 'ASSESSING', NULL, '2019-02-24 00:30:50', '2019-02-24 00:30:50'),
(17, 20, '1', 'provider/documents/7e8f715e1c0cab165ae85a05b85a4a9d.png', NULL, 'ASSESSING', NULL, '2019-02-24 00:35:29', '2019-02-24 00:35:29'),
(18, 20, '2', 'provider/documents/7e8f715e1c0cab165ae85a05b85a4a9d.png', NULL, 'ASSESSING', NULL, '2019-02-24 00:35:35', '2019-02-24 00:35:35'),
(19, 20, '3', 'provider/documents/7e8f715e1c0cab165ae85a05b85a4a9d.png', NULL, 'ASSESSING', NULL, '2019-02-24 00:35:40', '2019-02-24 00:35:40'),
(20, 20, '4', 'provider/documents/7e8f715e1c0cab165ae85a05b85a4a9d.png', NULL, 'ASSESSING', NULL, '2019-02-24 00:35:45', '2019-02-24 00:35:45'),
(21, 26, '2', 'provider/documents/1bbb29859935e61fe918c922384779a1.png', NULL, 'ASSESSING', NULL, '2019-03-07 04:20:23', '2019-03-07 04:20:23'),
(22, 28, '1', 'provider/documents/b15846b791347201787c933d90c93678.png', NULL, 'ASSESSING', NULL, '2019-03-07 05:23:42', '2019-03-07 05:23:42'),
(23, 28, '2', 'provider/documents/b9dadb20573591c3acebb664594be0a2.png', NULL, 'ASSESSING', NULL, '2019-03-07 05:24:05', '2019-03-07 05:24:05'),
(24, 25, '1', 'provider/documents/cbd6355bbbac190692e0a7c8d38367d9.png', NULL, 'ASSESSING', NULL, '2019-03-08 01:12:57', '2019-03-08 01:12:57'),
(25, 29, '1', 'provider/documents/cbd6355bbbac190692e0a7c8d38367d9.png', NULL, 'ASSESSING', NULL, '2019-03-08 02:04:20', '2019-03-08 02:04:20'),
(26, 31, '1', 'provider/documents/837cf383816971199fc53686ef3d351e.png', NULL, 'ASSESSING', NULL, '2019-03-17 03:18:35', '2019-03-17 03:18:35'),
(27, 35, '1', 'provider/documents/92919000f1e32bdaba79b5c79d416419.png', NULL, 'ASSESSING', NULL, '2019-04-11 00:31:15', '2019-04-11 00:31:15'),
(28, 39, '1', 'provider/documents/5ae62b9ed98a0c115a254df73ce2261e.png', NULL, 'ASSESSING', NULL, '2019-04-25 09:41:33', '2019-04-25 09:41:33'),
(29, 40, '1', 'provider/documents/c991077033bd88e3ba34faa190124384.png', NULL, 'ASSESSING', NULL, '2019-05-09 21:06:57', '2019-05-09 21:06:57'),
(30, 41, '1', 'provider/documents/a6a132f063e498bdb4a9ac687f088301.jpeg', NULL, 'ASSESSING', NULL, '2019-05-09 23:36:34', '2019-05-09 23:36:34'),
(31, 41, '2', 'provider/documents/401dd1a7f381374d2d0c2f699e14d2a2.jpeg', NULL, 'ASSESSING', NULL, '2019-05-09 23:36:48', '2019-05-09 23:36:48'),
(32, 41, '3', 'provider/documents/0d0736478e7e2c9f09033886e31b5d31.jpeg', NULL, 'ASSESSING', NULL, '2019-05-09 23:37:00', '2019-05-09 23:37:00'),
(33, 42, '1', 'provider/documents/a6a132f063e498bdb4a9ac687f088301.jpeg', NULL, 'ASSESSING', NULL, '2019-05-10 21:49:44', '2019-05-10 21:49:44'),
(34, 42, '2', 'provider/documents/89faed718fd80b81f5cf7049a349b413.jpeg', NULL, 'ASSESSING', NULL, '2019-05-10 21:49:54', '2019-05-10 21:49:54'),
(35, 42, '3', 'provider/documents/b72ef8bd100a0744b599b845d03571b6.jpeg', NULL, 'ASSESSING', NULL, '2019-05-10 21:50:43', '2019-05-10 21:50:43'),
(36, 42, '4', 'provider/documents/381851dd1ff2e36a84403833b071ad1b.jpeg', NULL, 'ASSESSING', NULL, '2019-05-10 21:51:01', '2019-05-10 21:51:01'),
(37, 43, '1', 'provider/documents/b4ab5e6d4b82cdbe642a976c4f938f1d.jpeg', NULL, 'ASSESSING', NULL, '2019-05-14 19:26:42', '2019-05-14 19:26:42'),
(38, 43, '3', 'provider/documents/401dd1a7f381374d2d0c2f699e14d2a2.jpeg', NULL, 'ASSESSING', NULL, '2019-05-14 19:27:33', '2019-05-14 19:27:33'),
(39, 43, '4', 'provider/documents/458c73ad8f125b819e6e87e58f80cd7e.jpeg', NULL, 'ASSESSING', NULL, '2019-05-14 19:28:32', '2019-05-14 19:28:32'),
(40, 43, '1', 'provider/documents/a6a132f063e498bdb4a9ac687f088301.jpeg', NULL, 'ASSESSING', NULL, '2019-05-14 19:37:29', '2019-05-14 19:37:29'),
(41, 43, '2', 'provider/documents/5c67fda6aa70bde1b10941130b6f3e85.jpeg', NULL, 'ASSESSING', NULL, '2019-05-14 19:37:49', '2019-05-14 19:37:49'),
(42, 43, '3', 'provider/documents/401dd1a7f381374d2d0c2f699e14d2a2.jpeg', NULL, 'ASSESSING', NULL, '2019-05-14 19:38:03', '2019-05-14 19:38:03'),
(43, 43, '4', 'provider/documents/884b4d04110523a238ec46be3b688d40.jpeg', NULL, 'ASSESSING', NULL, '2019-05-14 19:38:13', '2019-05-14 19:38:13'),
(44, 46, '1', 'provider/documents/26859dba529a958ccb1514b303be110d.jpeg', NULL, 'ASSESSING', NULL, '2019-05-15 20:54:43', '2019-05-15 20:54:43'),
(45, 48, '1', 'provider/documents/7848975d0a81d5f131f005eb2d9d87f7.jpeg', NULL, 'ACTIVE', NULL, '2019-07-02 20:32:33', '2019-07-02 20:32:33'),
(46, 48, '2', 'provider/documents/f21d44a701ab784081670f5d833796dc.jpeg', NULL, 'ACTIVE', NULL, '2019-07-02 20:32:51', '2019-07-02 20:32:51'),
(47, 48, '3', 'provider/documents/ee353960d9ec558de35c24bfd7ac843d.jpeg', NULL, 'ACTIVE', NULL, '2019-07-02 20:33:03', '2019-07-02 20:33:03'),
(48, 48, '4', 'provider/documents/34d35dc1adbeae8875a93045215c1fb4.jpeg', NULL, 'ACTIVE', NULL, '2019-07-02 20:33:19', '2019-07-02 20:33:19'),
(49, 49, '1', 'provider/documents/4a82b40cb836cb36c19ff062877a17ab.jpeg', NULL, 'ACTIVE', NULL, '2019-07-04 00:24:30', '2019-07-04 00:24:30'),
(50, 49, '2', 'provider/documents/ab55449ffefe6815fca357370aef6ff5.jpeg', NULL, 'ACTIVE', NULL, '2019-07-04 00:24:41', '2019-07-04 00:24:41'),
(51, 49, '3', 'provider/documents/628e0a5fcc8d3d41b265586758a7b8dd.jpeg', NULL, 'ACTIVE', NULL, '2019-07-04 00:24:50', '2019-07-04 00:24:50'),
(52, 49, '4', 'provider/documents/5f857e09c32dc9069fa321357c57bc9b.jpeg', NULL, 'ACTIVE', NULL, '2019-07-04 00:25:03', '2019-07-04 00:25:03'),
(53, 50, '1', 'provider/documents/4f5f2441e15dddcdfe0f1b7fd5685ffe.jpeg', NULL, 'ASSESSING', NULL, '2019-07-08 20:24:08', '2019-07-08 20:24:08'),
(54, 50, '2', 'provider/documents/008fac594719fd340a03f7d883330d42.jpeg', NULL, 'ASSESSING', NULL, '2019-07-08 20:24:25', '2019-07-08 20:24:25'),
(55, 50, '3', 'provider/documents/4f5f2441e15dddcdfe0f1b7fd5685ffe.jpeg', NULL, 'ASSESSING', NULL, '2019-07-08 20:24:33', '2019-07-08 20:24:33'),
(56, 50, '4', 'provider/documents/a8434675bf637e206318c2341e48742f.jpeg', NULL, 'ASSESSING', NULL, '2019-07-08 20:24:41', '2019-07-08 20:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `provider_memberships`
--

CREATE TABLE `provider_memberships` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(222) DEFAULT NULL,
  `plan_price` varchar(22) DEFAULT '0',
  `plan_features` varchar(222) DEFAULT NULL,
  `commission` varchar(33) DEFAULT NULL COMMENT '0-10',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `plan_type` varchar(22) DEFAULT NULL,
  `updated_at` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provider_profiles`
--

CREATE TABLE `provider_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_secondary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_profiles`
--

INSERT INTO `provider_profiles` (`id`, `provider_id`, `language`, `address`, `address_secondary`, `city`, `country`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 43, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-14 19:55:56', '2019-05-14 19:55:56'),
(2, 46, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-18 01:48:26', '2019-06-18 01:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `provider_services`
--

CREATE TABLE `provider_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `status` enum('active','offline','riding') COLLATE utf8_unicode_ci NOT NULL,
  `service_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_services`
--

INSERT INTO `provider_services` (`id`, `provider_id`, `service_type_id`, `status`, `service_number`, `service_model`, `created_at`, `updated_at`) VALUES
(1, 1, 13, 'offline', 'hhd', 'fad', '2019-01-04 17:54:59', '2019-01-05 17:01:49'),
(2, 2, 13, 'riding', 'alfa', '12', '2019-01-04 21:46:09', '2019-01-04 23:25:03'),
(3, 3, 8, 'active', 'mecnico', '12', '2019-01-04 23:02:41', '2019-01-04 23:03:27'),
(5, 16, 2, 'offline', '123456789012345', '1234567890', '2019-02-06 00:18:06', '2019-02-06 00:18:06'),
(6, 18, 1, 'offline', '123456789012345', '1234567890', '2019-02-06 01:32:54', '2019-02-06 01:32:54'),
(7, 21, 25, 'active', 'kl', 'mm', '2019-02-16 04:04:54', '2019-03-07 03:40:36'),
(8, 26, 10, 'offline', '00987DS', 'AJFB0087', '2019-03-07 04:26:23', '2019-03-07 04:26:23'),
(9, 29, 1, 'active', '123456789012345', '1234567890', '2019-03-08 02:04:38', '2019-03-13 03:02:38'),
(10, 36, 1, 'active', '765687', '1234565', '2019-04-01 19:57:37', '2019-04-18 19:53:21'),
(11, 35, 1, 'active', '765687', '1234565', '2019-04-11 00:33:38', '2019-04-29 00:53:39'),
(12, 37, 1, 'active', '765687', '1234565', '2019-04-16 20:08:12', '2019-04-16 20:08:28'),
(13, 38, 1, 'offline', '765687', '1234565', '2019-04-16 22:45:43', '2019-04-23 19:16:11'),
(14, 41, 1, 'active', '765687', '1234565', '2019-05-09 23:44:33', '2019-05-10 21:46:20'),
(15, 42, 1, 'active', '765687', '1234565', '2019-05-10 21:52:29', '2019-05-10 23:34:31'),
(16, 43, 1, 'active', '1265NOIDA AG', 'POLICE690AG', '2019-05-14 19:40:08', '2019-05-14 19:41:30'),
(17, 45, 1, 'offline', '1265NOIDA AG', 'POLICE690AG', '2019-05-15 20:47:44', '2019-05-15 20:47:44'),
(18, 46, 1, 'offline', '1265NOIDA AG', 'POLICE690AG', '2019-05-15 20:54:46', '2019-05-15 20:54:46'),
(19, 48, 1, 'active', '12345', '2132445', '2019-07-02 20:35:54', '2019-07-04 01:00:49'),
(20, 49, 12, 'riding', '12345', '2132445', '2019-07-04 00:26:40', '2019-07-11 19:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `request_filters`
--

CREATE TABLE `request_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request_filters`
--

INSERT INTO `request_filters` (`id`, `request_id`, `provider_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 63, 45, 0, '2019-07-03 20:17:28', '2019-07-03 20:17:28'),
(2, 63, 45, 0, '2019-07-03 20:17:43', '2019-07-03 20:17:43'),
(3, 63, 45, 0, '2019-07-03 20:17:47', '2019-07-03 20:17:47'),
(5, 65, 48, 0, '2019-07-04 00:44:34', '2019-07-04 00:44:34'),
(8, 68, 48, 0, '2019-07-04 01:03:33', '2019-07-04 01:03:33'),
(9, 69, 48, 0, '2019-07-04 01:21:10', '2019-07-04 01:21:10'),
(20, 83, 49, 0, '2019-07-09 20:16:18', '2019-07-09 20:16:18'),
(72, 1, 49, 0, '2019-07-11 19:43:47', '2019-07-11 19:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `selling_items`
--

CREATE TABLE `selling_items` (
  `id` int(34) NOT NULL,
  `item_type` varchar(122) DEFAULT NULL,
  `item_name` varchar(211) DEFAULT NULL,
  `item_price` int(5) DEFAULT NULL,
  `selling_item_price` int(4) DEFAULT NULL,
  `quantity` int(4) DEFAULT NULL,
  `unit` enum('PerPiece','kg') DEFAULT NULL,
  `service_provider_id` int(6) DEFAULT NULL COMMENT 'store_id',
  `item_image` varchar(222) DEFAULT NULL,
  `description` varchar(555) DEFAULT NULL,
  `delivery_charge` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selling_items`
--

INSERT INTO `selling_items` (`id`, `item_type`, `item_name`, `item_price`, `selling_item_price`, `quantity`, `unit`, `service_provider_id`, `item_image`, `description`, `delivery_charge`, `created_at`, `updated_at`) VALUES
(1, '3', 'chorizo', 30, 30, 5, NULL, 1, 'user/profile/a3ce9d43e59fd377288eef101ccbea24.jpeg', 'out of stock', 12, '2019-05-16 03:35:39', '2019-07-10 02:50:51'),
(2, '4', 'combo Burger ', 12, 12, 10, NULL, 1, 'user/profile/6cfe948c34b40a35cec55fa7e6e4bc77.jpeg', 'in stock ', 12, '2019-05-16 04:05:31', '2019-06-23 08:10:04'),
(3, '3', 'sushi ', 20, 20, 154, NULL, 1, 'user/profile/e78300c434285b3d95ca82924f5dc7d2.jpeg', 'in stock ', 12, '2019-05-16 04:06:46', '2019-07-10 02:51:06'),
(4, '4', 'rice', 15, 10, 20, NULL, 5, 'user/profile/942c7da725b919adb50f9d329857da56.jpeg', 'vsbsbsb', 5, '2019-07-02 20:04:38', '2019-07-02 22:01:58'),
(5, '3', 'roti', 56, 12, 45, NULL, 5, 'user/profile/88123b92bad5d23704a970531e1db72c.jpeg', 'full', 1, '2019-07-02 22:31:57', '2019-07-02 22:31:57'),
(6, '3', 'roti', 56, 12, 45, NULL, 5, 'user/profile/88123b92bad5d23704a970531e1db72c.jpeg', 'full', 1, '2019-07-02 22:31:58', '2019-07-02 22:31:58'),
(7, '3', 'roti', 56, 12, 45, NULL, 5, 'user/profile/88123b92bad5d23704a970531e1db72c.jpeg', 'full', 1, '2019-07-02 22:32:16', '2019-07-02 22:32:16'),
(8, '4', 'rice', 12, 10, 41, NULL, 7, 'user/profile/8f0e5f195d2ae6ffe330378d4e16dcd3.jpeg', 'jfjf I can', 12, '2019-07-03 22:17:48', '2019-07-11 02:23:54'),
(9, '3', 'pakoda ', 12, 10, 36, NULL, 7, 'user/profile/df77d530f08a6ee1267076a6c1ba642c.jpeg', 'Hi Please let me offer please create a good time. ', 12, '2019-07-09 02:15:57', '2019-07-11 02:33:24'),
(10, '3', 'kopta', 45, 40, 15, NULL, 9, 'user/profile/1cc87018b5edcedf42c14dc9414d32ad.jpeg', 'Hi Please let me offer please create a good time to ', 1, '2019-07-10 01:19:07', '2019-07-10 01:19:07'),
(11, '4', 'Fried rice', 56, 50, 58, NULL, 9, 'user/profile/300b3f521ae7302c0ea7fabf28e8613c.jpeg', 'Please share here are the best services ', 1, '2019-07-10 01:20:03', '2019-07-10 01:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(233) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(33) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(33) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_price` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_name` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_image` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT '0',
  `fixed` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `minute` float DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `calculator` enum('MIN','HOUR','DISTANCE','DISTANCEMIN','DISTANCEHOUR') COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `device_type` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `name`, `location`, `latitude`, `longitude`, `emergency_price`, `provider_name`, `provider_image`, `image`, `capacity`, `fixed`, `price`, `minute`, `distance`, `calculator`, `description`, `status`, `created_at`, `updated_at`, `device_type`, `device_token`) VALUES
(1, 'Dominos\'s', NULL, NULL, NULL, NULL, 'Food', '/public/Restaurants.png', 'http://97pixelsdev.com/iserv/public/uploads/fa4fa1089885b649c6a3d67068ae236f5e99da47.png', 0, 22, 10.998, 0.5, 0, 'DISTANCE', NULL, 1, '2017-12-09 03:12:27', '2019-02-16 03:57:11', NULL, NULL),
(8, 'Muscat Pharmacy', NULL, NULL, NULL, NULL, 'Pharmacy 24h', '/public/Pharmacy.png', 'http://97pixelsdev.com/iserv/public/uploads/235027f87881cc1bb8074b9632f016b57bc1b7d1.png', 0, 22, 11, 0, 0, 'DISTANCE', NULL, 0, NULL, '2019-02-21 00:23:38', NULL, NULL),
(10, ' The Flower', NULL, NULL, NULL, NULL, 'Gifts', '/public/Floweshop.png', 'http://97pixelsdev.com/iserv/public/uploads/d079608778c81f0c30add7ea4f1e4917f2a46221.png', 0, 22, 2, 0, 0, 'DISTANCE', NULL, 0, NULL, '2019-02-21 00:10:28', NULL, NULL),
(12, 'Classic Tailors', NULL, NULL, NULL, NULL, 'Snack & Juice', '/public/Tailor.png', 'http://97pixelsdev.com/iserv/public/uploads/4f4733f3b5a34c9bc96342e9fd6f09945bc9ad9a.png', 0, 22, 4, 0, 0, 'DISTANCE', NULL, 0, NULL, '2019-02-21 00:34:09', NULL, NULL),
(14, 'Super Market', NULL, NULL, NULL, NULL, 'Super', '/public/SuperMarkests.png', 'http://97pixelsdev.com/iserv/public/uploads/6c3d10178a7bcb4b7f56e7909ca25874792c15a3.png', 0, 22, 13, 0, 0, 'DISTANCE', NULL, 0, NULL, '2019-02-21 00:30:00', NULL, NULL),
(20, 'ClothingStore', 'Delhi Cantonment, New Delhi, Delhi, India', '28.5961279', '77.15873750000003', NULL, 'ClothingStore', '/public/ClothingStore.png', 'http://157.230.51.152/public/uploads/6d5c9fcbd0b41f92ac1883398856553aaa4cd2e7.png', 0, 22, 23, 2, 0, 'DISTANCE', NULL, 0, NULL, '2018-12-29 01:28:32', NULL, NULL),
(46, 'Letter', NULL, NULL, NULL, NULL, 'Courier', NULL, NULL, 0, 2, 2, 2, 2, 'DISTANCE', '2', 0, NULL, NULL, NULL, NULL),
(47, 'Box', NULL, NULL, NULL, NULL, 'Courier', NULL, NULL, 0, 2, 2, 2, 2, 'DISTANCE', '2', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(12) NOT NULL COMMENT '1-country'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `type`) VALUES
(1, 'site_title', 'Tuami', 0),
(2, 'site_logo', 'http://97pixelsdev.com/taumi/public/uploads/07c83a8a6559e7ec972533063d2e7a33c825a32d.png', 0),
(3, 'site_email_logo', 'http://localhost/logo-white.png', 0),
(4, 'site_icon', 'http://157.230.51.152/public/uploads/cd66949afdb7380bd4d5b4cfdc2dfb9aefa32b5c.png', 0),
(5, 'site_copyright', '© 2019 tuami', 0),
(6, 'provider_select_timeout', '60', 0),
(7, 'provider_search_radius', '50', 0),
(8, 'base_price', '50', 0),
(9, 'price_per_minute', '50', 0),
(10, 'tax_percentage', '10', 0),
(11, 'stripe_secret_key', 'sk_test_6EKU6IUt4aYnIuqO4Aohiho2', 0),
(12, 'stripe_publishable_key', 'pk_test_LTXZTPA9yepu9dEodKsJm6GA', 0),
(13, 'CASH', '0', 0),
(14, 'CARD', '1', 0),
(15, 'manual_request', '0', 0),
(16, 'default_lang', 'en', 0),
(17, 'currency', '$', 0),
(18, 'distance', 'Km', 0),
(19, 'scheduled_cancel_time_exceed', '10', 0),
(20, 'price_per_kilometer', '10', 0),
(21, 'commission_percentage', '20', 0),
(22, 'store_link_android', '', 0),
(23, 'store_link_ios', '', 0),
(24, 'daily_target', '0', 0),
(25, 'surge_percentage', '0', 0),
(26, 'surge_trigger', '0', 0),
(27, 'demo_mode', '0', 0),
(28, 'booking_prefix', 'CC', 0),
(29, 'sos_number', '911', 0),
(30, 'contact_number', '67630096', 0),
(31, 'contact_email', 'contact@gmail.com', 0),
(32, 'social_login', '1', 0),
(33, 'Canada', 'can($)', 1),
(34, 'Portugal', '€', 1),
(35, 'USA', '$', 1),
(36, 'driver_base_price', '10', 1),
(37, 'fare_price', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `store_users`
--

CREATE TABLE `store_users` (
  `id` int(8) NOT NULL,
  `name` varchar(222) DEFAULT NULL,
  `email` varchar(222) DEFAULT NULL,
  `store_type` varchar(122) DEFAULT NULL,
  `store_name` varchar(222) DEFAULT NULL,
  `business_store_name` varchar(222) DEFAULT NULL,
  `business_license_no` varchar(222) DEFAULT NULL,
  `address_proof` varchar(222) DEFAULT NULL,
  `signature_proof` varchar(222) DEFAULT NULL,
  `password` varchar(222) DEFAULT NULL,
  `image` varchar(222) DEFAULT NULL,
  `banner_image` varchar(222) DEFAULT NULL,
  `min_amount` int(4) DEFAULT NULL,
  `offer_in_percentage` int(4) DEFAULT NULL,
  `max_delivery_time` int(4) DEFAULT NULL,
  `description` varchar(444) DEFAULT NULL,
  `address` varchar(222) DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `landmark` varchar(222) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `device_id` varchar(222) DEFAULT NULL,
  `device_type` varchar(222) DEFAULT NULL,
  `device_token` varchar(222) DEFAULT NULL,
  `open_time` varchar(33) DEFAULT NULL,
  `close_time` varchar(33) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_users`
--

INSERT INTO `store_users` (`id`, `name`, `email`, `store_type`, `store_name`, `business_store_name`, `business_license_no`, `address_proof`, `signature_proof`, `password`, `image`, `banner_image`, `min_amount`, `offer_in_percentage`, `max_delivery_time`, `description`, `address`, `latitude`, `longitude`, `landmark`, `created_at`, `updated_at`, `device_id`, `device_type`, `device_token`, `open_time`, `close_time`) VALUES
(1, 'Marina', 'mb.tuami@gmail.com', 'Food', ' chinese ', NULL, NULL, NULL, NULL, '$2y$10$UqAT1nBpYzicOOQmkYvPZO38OOts9bc.YoSMshOfzy7HAoVX5v76u', 'user/profile/49da7cf79a20570635476ab0444e0358.jpeg', 'user/profile/899d3ac1f2298294186594b63af07b45.jpeg', 20, 10, 40, 'chinese', 'U.Catolica 5155, Santa Cruz de la Sierra, Bol?via', '-17.737633', '-63.173251', 'restaurante', '2019-05-16 03:33:47', '2019-07-04 00:49:03', 'cdaf14b1be25773a', 'android', 'iukjdalk', '12:0', '23:0'),
(2, 'chalet', 'amit@gmail.com', 'Food', 'chalet', NULL, NULL, NULL, NULL, '$2y$10$U1vWSOH.59anN.gXwNPqDOORazOA3NL6IvI3IkSkbUweKOdG66uE6', 'user/profile/729056d37294d77d81fcd71532a5f7cf.jpeg', 'user/profile/fa1525d4b7f7a3e90960407b1f5c0459.jpeg', 158, 12, 45, 'hahahahaa', 'Calle los Jazmines 514, Santa Cruz de la Sierra, Bolivia', '-17.764671', '-63.204408', 'lululu', '2019-06-06 11:42:21', '2019-06-06 11:42:21', '860178c8774fc4e0', 'android', 'cF7zCJLWgrk:APA91bFpf1fI5-FduiodHPzT9RCayNXU8Yqd6Y4x_f7Nrh8im7a5qdncX1ebPg3gUYi3L4PsRY_FTvES7_bbeo0JD0oZVSg2GzlGJcp9MOHhFL58ue5CdixKCbgWsedv6-v-kHOO2hZx', '5:11', '10:11'),
(3, 'carlitos store', 'hucor_666@hotmail.com', 'Pharmacy', 'Carlitosstore', NULL, NULL, NULL, NULL, '$2y$10$eJps3yI15taK0XxcgOezCeSuQRD2ZrYqCKXcHakMcv7humyBIpTtS', 'user/profile/ece30a04a877d9e10ebee4856b146c88.jpeg', 'user/profile/73e3048095cd774249a293a88aff3f62.jpeg', 10, 5, 30, 'el mejor restaurante vegetariano', 'Unnamed Road, Sucre, Bolivia', '-19.020026', '-65.283756', 'casa nlanca ', '2019-06-11 23:58:24', '2019-06-11 23:58:26', '052b08b616a11c33', 'android', 'iukjdalk', '7:27', '12:28'),
(4, 'Rajan', 'rajan@gmail.com', 'Super', 'Rajan', NULL, NULL, NULL, NULL, '$2y$10$Q4b9Mv9IWGfc4A9YXXG.PO.BHYqX74GduuctDqkLz8Ikz3lV82IRm', 'user/profile/28a33cf85d0ef6f9a65ed4d6abdf8f0f.jpeg', 'user/profile/8033f4226d3172e85b05a0d021005d84.jpeg', 10, 5, 30, 'test me best', 'nndmx', '28.585435', '77.312685', 'vxbf', '2019-06-17 23:57:32', '2019-07-08 20:14:26', '5565971570a46824', 'android', 'iukjdalk', '16:54', '16:54'),
(9, 'Somya', 'sm@gmai.com', 'Food', 'SomyaFood', NULL, NULL, NULL, NULL, '$2y$10$Gq0lj4YDA1ktV7Woc6184e5mQodqqLDG.Yfyfsp24JYM4unM8nH5y', 'user/profile/dc4fb3dd14337af5042d756015c42b33.jpeg', 'user/profile/4012a59e1f15ee856ca31be3938460b1.jpeg', 23, 12, 12, 'Hi Please send me demo Africa in a good day and I have work ', 'D-98, I-Area, C Block, Sector 2, Noida, Uttar Pradesh 201301, India', '28.585194', '77.316689', 'm', '2019-07-10 01:18:07', '2019-07-10 01:18:09', '2fc4d9fa31b17d75', 'android', 'iukjdalk', '6:17', '22:17'),
(6, 'upendra', 'up@gmail.com', 'Pharmacy', 'UpMediciene ', NULL, NULL, NULL, NULL, '$2y$10$hA10Dq6Uz91EytMk3Q0kle3OYx4nzWFdxm3JXVLft2EqPB.oTRTXa', 'user/profile/4f5f2441e15dddcdfe0f1b7fd5685ffe.jpeg', 'user/profile/f4d234143b0a5f59598a3ce99957730d.jpeg', 15, 12, 15, 'udbdndjnd is the only one I know of you need a ride home from the airport on the way home now so I can get my hands on your back and then you can get the way to work and then I will get back to you.', 'A-73, A Block, Sector 2, Noida, Uttar Pradesh 201301, India', '28.585435', '77.312685', 'metro ', '2019-07-03 18:58:33', '2019-07-03 18:58:38', '5565971570a46824', 'android', 'iukjdalk', '9:57', '10:57'),
(7, 'Store user', 'store@gmail.com', 'Food', 'DemoFood', NULL, NULL, NULL, NULL, '$2y$10$SBABL7QkfLWTx2CjaCg/bOaxAcbSIXk5yBYUZu.5JHpAG/H8SGmf.', 'user/profile/a897343d5279fa8016bb5941d529f919.jpeg', 'user/profile/6fc857064740d3e9e4ea8a66ff94ad58.jpeg', 15, 12, 13, 'guI can see you need anything let me know of the airport', 'A-73, A Block, Sector 2, Noida, Uttar Pradesh 201301, India', '28.585428', '77.312688', 'metor', '2019-07-03 22:16:46', '2019-07-10 18:59:49', '2fc4d9fa31b17d75', 'android', 'iukjdalk', '10:16', '9:16'),
(8, 'marina', 'marinabettaglio@yahoo.com.br', 'Snack & Food', 'juicy', NULL, NULL, NULL, NULL, '$2y$10$xTLp50pCzA16JhKIg/ISAuhMX0.GBspVAPxeasp/VjmiG.tpZxUYW', 'user/profile/126e8c532a66b8f9120b512b3a562321.jpeg', 'user/profile/924fea4b80b7880817f97d45f4c30849.jpeg', 20, 8, 30, 'juices n snacks ', 'U.Catolica 5155, Santa Cruz de la Sierra, Bolivia', '-17.737606', '-63.173287', 'work', '2019-07-04 00:53:29', '2019-07-04 00:53:30', 'cdaf14b1be25773a', 'android', 'iukjdalk', '8:30', '20:30');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `category_name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Oil', 'Grossery', '1', '2019-05-13 13:37:22', '2019-05-13 13:37:22'),
(2, 'Parasita', 'Medical', '3', '2019-05-13 13:38:29', '2019-05-13 13:38:29'),
(3, 'Panir Kopta', 'Food', '2', '2019-05-13 13:39:13', '2019-05-13 13:39:13'),
(4, 'Chicken Rice', 'Food', '2', '2019-05-13 13:55:58', '2019-05-13 13:55:58'),
(6, 'Testing Product', 'Grossery', '1', '2019-05-14 19:37:54', '2019-05-14 19:37:54'),
(9, 'Tablets', 'Medical', '3', '2019-07-03 19:10:33', '2019-07-03 19:10:33'),
(10, 'Syrup', 'Medical', '3', '2019-07-03 19:11:23', '2019-07-03 19:11:23'),
(11, 'Capsules', 'Pharmacy', '5', '2019-07-03 20:01:57', '2019-07-03 20:01:57'),
(12, 'appy', 'Snack & Juice', '6', '2019-07-08 22:37:58', '2019-07-08 22:37:58'),
(13, 'bike', 'Gift', '7', '2019-07-08 22:38:16', '2019-07-08 22:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` enum('CASH','CARD','PAYPAL') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_address` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relative_address` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `self_address` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_contact_number` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relative_contact_number` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `self_contact_number` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_name` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relative_name` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `self_name` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `stripe_cust_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `earning_money` double(8,2) NOT NULL DEFAULT '0.00',
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(22) COLLATE utf8_unicode_ci DEFAULT '0',
  `lang` varchar(22) COLLATE utf8_unicode_ci DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `payment_mode`, `email`, `mobile`, `password`, `picture`, `family_address`, `relative_address`, `self_address`, `family_contact_number`, `relative_contact_number`, `self_contact_number`, `family_name`, `relative_name`, `self_name`, `device_token`, `device_id`, `device_type`, `login_by`, `social_unique_id`, `latitude`, `longitude`, `stripe_cust_id`, `wallet_balance`, `earning_money`, `rating`, `otp`, `remember_token`, `created_at`, `updated_at`, `status`, `lang`) VALUES
(82, 'Amit', '', 'CARD', NULL, '9871192371', '$2y$10$O5IAPrgJPoHXsCUa0j49bOSvXBCWGkJbPyeYWfC3fFygGXBD6Od..', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cokzXqZsPZM:APA91bH_U4r3POHttSDvk5rI2CSQUKF47feYlVSMHxOyEMIIuWaywpfybAtMyN9XAXgec7zcJ828cXLS9AjEu3DWEoZnhXymGrcVqrWD1aJUWH8ZVOX1CpD6Xf5TgJ6hlUJgElYqZ3YT', '9654c9729f32dfea', 'android', 'manual', NULL, 28.58266790, 77.31565940, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-03-08 01:38:59', '2019-04-24 04:53:11', '0', 'en'),
(83, 'hugo cordova', '', 'CARD', 'null', '67630096', '$2y$10$TBXfKyH7d4wUDC/3tK4tv.6Tu/8SYL3bFDyEDzlyc38vv177UFUii', 'user/profile/6e83d7fc36889ecb7e3836c5ebbbb83e.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fjtVxrpCyk8:APA91bHli8YXdbQekuvg8cohuENobGp120vfAwBTLH4c-VWNKUHq6ae7Ee0r9h-1YbYPla6oVfWmjnAaz1ArdsYwFLao2loN-8kNI1VAEcvxqDMhMFZ4DiHslIjyxtRs-kyDf4qI1u44', '052b08b616a11c33', 'android', 'manual', NULL, -17.76442260, -63.20421520, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-03-16 02:53:13', '2019-07-10 02:50:43', '0', 'en'),
(84, 'Marina Bettaglio', '', 'CARD', NULL, '71339161', '$2y$10$uNtp8y4eAxTfdsD1mSRvKuM1zpaOl0xtqlmbq7HaYPSAdPfN4UakW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c67UM9-Jja4:APA91bHsdmyKYamh3XzG0lsiQHP57MSI0L2oib90CROYE5I-RiB3r69fdvukVxZ9_mS8S6cAbDtvwYxcXRZKL8XrTksGXxcczDynTTrBqRDJ6MPBgHo2SIRd-J8woMd1bEJi3rs9Gx3q', 'cdaf14b1be25773a', 'android', 'manual', NULL, -17.85576170, -63.19349940, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-04-10 06:46:45', '2019-07-14 02:59:54', '0', 'en'),
(85, 'Ratan', '', 'CARD', NULL, '9818317757', '$2y$10$x1ne1fpNf7bDowYx838uie6S/f5yHl/.bCeqbtYFRcuRIAqoiBRoO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eo3Mu5UJowk:APA91bHhlR5GOVpyYpR9dlJZyfHkJfukRJHUFFrD4joN2UBF-zG_8B9YPRsrXWDQejJOdeg6zaWrv83KGEUEqXPNSZ6s9Leg5V-N5zdVxPPR-3A5IGdbzy4GbodEcXZUnKodqIvtTF4q', '052b08b616a11c33', 'android', 'manual', NULL, -19.02011740, -65.28381960, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-04-16 06:33:55', '2019-04-16 17:11:33', '0', 'en'),
(86, 'Rajan Gupta', '', 'CARD', NULL, '7717755329', '$2y$10$WOefm7DWmdDVeG6HwBtw2.m2voifE6FuTDHLUr5syn5P.3p3Ny7/e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'android', 'manual', NULL, 28.56815070, 77.39181930, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-04-16 19:42:40', '2019-06-18 02:13:55', '0', 'en'),
(87, 'Nikhil', '', 'CARD', NULL, '8434198080', '$2y$10$9DryZLBGvdfuA8lfgJbTOe8s5tBv7CDVt.2Nuum7E5chmcEm7K1Wm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'android', 'manual', NULL, NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-04-16 20:19:55', '2019-04-16 20:20:13', '0', 'en'),
(88, 'isa', '', 'CARD', NULL, '77055824', '$2y$10$8vy3MODt54YYUwXDOp/7v.EJ4DGEAnTU5viBPFVcs3Foa8d0QK6si', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eq3-2TCHjSo:APA91bFogxZsXKVjmQYo-BPObVx1e0LSXQdaXiF6xrseQTEYc1_3m0H31YO-G2K3bYUuAGbeKHNFYW2MLNdTXGr1xrHmL1EnI30sroRArb9_A982TQV5RdywBc_ljldCyIth0fSJptpL', '8997a0f8bde8cae2', 'android', 'manual', NULL, -17.85576330, -63.19350080, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-04-25 09:58:04', '2019-04-25 10:30:38', '0', 'en'),
(89, 'Rajan Gupta', '', 'CARD', 'rajank879@gmail.com', NULL, '$2y$10$XDPcuzvckhQnlA/kJXM49ulG4nejMNl6HpVQFKdex3Xq6RFT8yDPK', 'https://graph.facebook.com/1960961720698130/picture?width=1920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'diQYsS8lvHs:APA91bFXb3UecSgQkxUQqM2unNvGlf0-BxHp6WDrZqTBajpRcc3TPxPzQ8H8LBEwQy1i1pcealU9U4mBjImjUN5g7pR9EOELmYt1oMy4XztDCxfzfiO7jEkuN7TRLVUerLHynUWzph5U', 'b5f52e4fd99c37a2', 'android', 'facebook', '1960961720698130', 28.58266790, 77.31565940, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-05-08 02:44:47', '2019-06-18 01:58:25', '0', 'en'),
(90, 'Picndrop Singh', '', 'CASH', 'picndrop2018@gmail.com', NULL, '$2y$10$99A7zUgvxPUND238PWmZxOv.TAT/Y/Nx8w4wAUlFC0IRSXvw54R0i', 'https://graph.facebook.com/281725112770135/picture?width=1920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'android', 'facebook', '281725112770135', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-05-09 00:39:36', '2019-05-09 01:16:44', '0', 'en'),
(91, 'Emmanuel', '', 'CARD', NULL, '08023871363', '$2y$10$UBL35Anwn/XHog7XBW./4u0nuipKd2Ykebx6jSo98PyW5qgLxLJx.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fnPE1U7P918:APA91bE3XEqFfpvHMZandmlfUSiex-kVPFlYbk91PJbi2dixNBpU5EJ5iQt9gDypYlpoe6guduqm6bbajEstsT4ciZ4PyELVGiiwQ16UgD5GkM1sLVeqO0nMXjlLiHoqBGnItPJifkkD', '85227c4111c280a4', 'android', 'manual', NULL, NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-05-20 05:28:46', '2019-05-20 05:28:46', '0', 'en'),
(92, 'Ratan Singh', '', 'CASH', 'ratan.singh1911@gmail.com', NULL, '$2y$10$blLQCblxZhN5HtYaeeO9OeX6e6wE5EAWHqent27zVQAr2jLVtk4eK', 'https://graph.facebook.com/360972018109934/picture?width=1920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eHg9C5TJ0OU:APA91bEvI6L_blfBvvcvdyuEpYNmpEURxNcqzm3h1C6bnsKFv_-Av6k7HQ7SoFl2CRXNsd-YpdJR5J-7NkFAOZZsj3nuiogRYXO1om6ChJpW3YKiXtKKeHH9kD7A9sCuwxWOIfwzzpyN', '20f24ee87e9b60f2', 'android', 'facebook', '360972018109934', 28.56816410, 77.39184750, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-05-30 07:56:25', '2019-05-30 07:57:38', '0', 'en'),
(93, 'isaac', '', 'CARD', NULL, '75338822', '$2y$10$hpM2BvTrQ.PmGD6R4bLNBOnz9GUu9jICRpAOvSQRxEUAMD.hClOCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'frmIV5p8Ia0:APA91bF72HF3MsImRbGY7SZMj-TYvp_tIX5zM4DHYz8utEn3LCxi50dwdTfsEhDqMi8C51YYGYdDOsAqhbZpyCdbD9YEhJuQ-St5-KqVRSWHXuH_q_ol22cY7A8-5CNKrrP3Jmj_MlUd', 'f779b0df97341384', 'android', 'manual', NULL, -17.74929590, -63.17696470, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-06-23 09:48:41', '2019-06-23 09:57:16', '0', 'en'),
(108, 'Gary', '', 'CARD', NULL, '8826540770', '$2y$10$RaEllDGeIPY4F96RGoeKwO/D7qESkKKPtS6DUuWqkJ5NsOHFGGk6m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dq804E-Mt8w:APA91bHd_yXYOh2_1pJw-FPi_6qgn63IxPp3SpmZUf5CYNppqKE2HrDPZuBxCUK4B71SwIYimsBnlUz_L6l9vl4rfNK2r32f48HsuqjIlMCoWUO-tuaN3dnBQnbBwXNZcSfjRzywnW4N', 'fde60ae087cd5784', 'android', 'manual', NULL, 14.62775600, -90.58272490, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-07-03 23:55:58', '2019-07-22 09:22:18', '0', 'en'),
(109, 'Mb', '', 'CARD', NULL, '71339161', '$2y$10$ifcPiDPAFDseXvbj1ibwkOVgI6jK0LKzkgogd1k5a8UYiB2YniP1u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fJn89tQv3O0:APA91bGRoAVDuyWrrovRgYMsm49eYGnwGdRfi5D-wIOhdTX14qfJj1iuUhHueZP2QkqxDP8lc5GbWtUxmq3C1e-ZYA8AX72kZ3NWCKqhZVerpxkyy05ctb2ISzWiDNSuAN2WkVtqQCOh', 'cdaf14b1be25773a', 'android', 'manual', NULL, NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-07-04 00:45:20', '2019-07-04 00:45:20', '0', 'en'),
(110, 'sneha', '', 'CARD', NULL, '7905848385', '$2y$10$1v0W9sn1knihzHdiGM9Jvea7tf6r64p0jQPCfT.HO0r460ezlCTBq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'android', 'manual', NULL, 28.58543390, 77.31268610, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-07-04 20:27:49', '2019-07-18 22:36:11', '0', 'en'),
(111, 'Hugo Cordova Rivera', '', 'CASH', 'hucor_666@hotmail.com', NULL, '$2y$10$DqaZucc5JrtAJa6hUBtzbOYitH4j/Xj72KGIxCzGVb4iBJ12pkuDa', 'https://graph.facebook.com/3004392976267701/picture?width=1920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fT1GTTkEujo:APA91bFMVHzVR-rdahcllSajkgkHIej3HaRNDE6_XyoG9mm8fGPWtuzPN7oOkOhFkqF0jTGHQ9bP5EMMjDA2zdblLn50BpzrLvSCKEp2rmiXBIt0CpZ5sUx17YXcPg5Z3GneEENBmzcN', '052b08b616a11c33', 'android', 'facebook', '3004392976267701', -19.04420410, -65.24298290, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-07-05 00:32:19', '2019-07-26 03:32:38', '0', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `user_invitations`
--

CREATE TABLE `user_invitations` (
  `id` int(21) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `provider_id` int(12) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_location_types`
--

CREATE TABLE `user_location_types` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_type` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_location_types`
--

INSERT INTO `user_location_types` (`id`, `user_id`, `location_type`, `address`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 194, 'Home', '153-154, Chakkarpur, Sector 28, Gurugram, Haryana 122002, India', '77.0905601', '28.4704001', '2018-10-24 19:23:44', '2018-10-24 20:41:37', NULL),
(3, 194, 'Work', '153-154, Chakkarpur, Sector 28, Gurugram, Haryana 122002, India', '77.0905601', '28.4704001', '2018-10-24 19:24:33', '2018-10-24 19:24:33', NULL),
(7, 198, 'Work', '153-154, Chakkarpur, Sector 28, Gurugram, Haryana 122002, India', '77.0905604', '28.4704001', '2018-10-24 20:51:59', '2018-10-24 20:51:59', NULL),
(6, 194, 'Other', '153-154, Chakkarpur, Sector 28, Gurugram, Haryana 122002, India', '77.0905601', '28.4704001', '2018-10-24 20:46:54', '2018-10-24 20:46:54', NULL),
(8, 198, 'Home', '153-154, Chakkarpur, Sector 28, Gurugram, Haryana 122002, India', '77.0905607', '28.4704001', '2018-10-24 20:55:11', '2018-10-24 22:47:54', NULL),
(9, 214, 'Other', 'Shop No. 4, Near B.M. Plaza, Jyothi Market, Chakkarpur, Gurugram, Haryana 122002, India', '77.0845483', '28.4749622', '2018-10-28 05:16:40', '2018-10-28 05:16:40', NULL),
(10, 215, 'Home', 'Delhi - Jaipur Expy, Block B, Sector 34, Gurugram, Haryana, India', '77.008335', '28.433652100000007', '2018-10-30 02:44:40', '2018-10-31 00:54:07', NULL),
(11, 215, 'Work', 'Mehrauli - Badarpur Rd, Saiyad ul Ajaib, Saket, New Delhi, Delhi 110030, India', '77.2015352', '28.5204918', '2018-10-30 02:45:31', '2018-10-31 00:54:16', NULL),
(12, 217, 'Home', 'Saket District Centre, District Centre, Sector 6, Pushp Vihar, New Delhi, Delhi 110017, India', '77.2182409', '28.5280842', '2018-10-31 18:22:41', '2018-11-02 19:27:29', NULL),
(13, 217, 'Work', 'Adarsh Nagar, Sector 12, Gurugram, Haryana 122001, India', '77.03217719999999', '28.4653211', '2018-11-02 19:27:16', '2018-11-02 19:31:02', NULL),
(14, 220, 'Home', 'Delhi Cantonment, New Delhi, Delhi, India', '77.1587375', '28.596127900000003', '2018-11-02 20:02:31', '2018-11-02 20:02:31', NULL),
(15, 220, 'Work', 'Noida-Greater Noida Expy, Gautam Buddha Park, Sector 95, Noida, Uttar Pradesh, India', '77.31499869999999', '28.5652558', '2018-11-02 20:02:38', '2018-11-02 20:02:38', NULL),
(16, 221, 'Home', 'Delhi High Court, India Gate, New Delhi, Delhi, India', '77.23548590000001', '28.6086036', '2018-11-14 22:41:37', '2018-11-14 22:41:37', NULL),
(17, 221, 'Work', 'Noida Link Rd, Mayur Vihar Phase 1, New Delhi, Delhi, India', '77.28790630000002', '28.6052585', '2018-11-14 22:42:11', '2018-11-14 22:42:11', NULL),
(18, 223, 'Home', 'Sector 39, Noida, Uttar Pradesh 201301, India', '77.3558', '28.57427', '2018-11-14 23:33:32', '2018-11-20 22:36:21', NULL),
(19, 225, 'Home', 'High St, Nakuru, Kenya', '36.066575699999994', '-0.2979989', '2018-11-19 00:30:44', '2018-11-19 00:31:18', NULL),
(20, 225, 'Work', 'Nakuru, Kenya', '36.080026', '-0.30309879999999995', '2018-11-19 00:31:39', '2018-11-19 00:31:39', NULL),
(21, 227, 'Home', 'Ebberupvej 62A, 5631 Ebberup, Denmark', '9.9779773', '55.2425646', '2018-11-19 01:07:35', '2018-11-19 01:07:35', NULL),
(22, 218, 'Work', '17864 McIntyre St, Detroit, MI 48219, USA', '-83.26258059999999', '42.42164090000001', '2018-11-20 00:30:24', '2018-11-24 01:42:49', NULL),
(23, 218, 'Home', '22101 Coolidge Hwy, Oak Park, MI 48237, USA', '-83.18221249999999', '42.458040600000004', '2018-11-22 19:38:16', '2018-11-24 01:42:34', NULL),
(24, 232, 'Home', '22101 Coolidge Hwy, Oak Park, MI 48237, USA', '-83.18221249999999', '42.458040600000004', '2018-11-23 21:05:57', '2018-11-23 21:05:57', NULL),
(25, 232, 'Work', '22101 Coolidge Hwy, Oak Park, MI 48237, USA', '-83.18221249999999', '42.458040600000004', '2018-11-23 21:06:12', '2018-11-23 21:06:12', NULL),
(26, 235, 'Home', '17864 McIntyre St, Detroit, MI 48219, USA', '-83.26258059999999', '42.42164090000001', '2018-11-24 06:28:20', '2018-11-24 06:28:20', NULL),
(27, 235, 'Work', '22191 Coolidge Hwy, Oak Park, MI 48237, USA', '-83.1822928', '42.459196899999995', '2018-11-24 06:28:39', '2018-11-24 06:28:39', NULL),
(28, 86, 'Home', 'New Delhi, Delhi 110037, India', '77.11980129999999', '28.5638921', '2019-05-10 21:50:05', '2019-05-10 21:50:05', NULL),
(29, 86, 'Work', 'Noosa Heads QLD 4567, Australia', '153.0923901', '-26.386410299999998', '2019-05-10 21:50:15', '2019-05-10 21:50:15', NULL),
(30, 84, 'Home', 'Av. Cristo Redentor y, Santa Cruz de la Sierra, Bolivia', '-63.175940600000004', '-17.7492126', '2019-05-11 02:42:49', '2019-06-23 10:02:52', NULL),
(31, 84, 'Work', 'Av Santos Dumont, Santa Cruz de la Sierra, Bolívia', '-63.1822123', '-17.847583', '2019-05-11 02:43:06', '2019-05-11 02:43:06', NULL),
(32, 103, 'Home', 'Sector 2, Noida, Uttar Pradesh 201301, India', '77.31592959999999', '28.584687499999998', '2019-07-03 22:35:12', '2019-07-03 22:35:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE `user_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `courier_id` int(6) DEFAULT NULL,
  `selling_item_id` int(4) DEFAULT NULL,
  `total_item` int(4) DEFAULT NULL,
  `provider_service_type` enum('CARETAKER','CAR','AMBULANCE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_hour` varchar(122) COLLATE utf8_unicode_ci DEFAULT '0',
  `service_hour_status` int(3) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `current_provider_id` int(11) DEFAULT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  `insurance_id` int(11) DEFAULT '0',
  `prescription` longtext COLLATE utf8_unicode_ci,
  `status` enum('ACCEPT','STOPPED','SEARCHING','CANCELLED','AWAITING','ACCEPTED','STARTED','ARRIVED','PICKEDUP','DROPPED','COMPLETED','SCHEDULED') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cancelled_by` enum('NONE','USER','PROVIDER') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cancel_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` enum('CASH','CARD','PAYPAL') COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `distance` double(15,8) DEFAULT NULL,
  `s_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_latitude` double(15,8) DEFAULT NULL,
  `s_longitude` double(15,8) DEFAULT NULL,
  `d_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d_latitude` double(15,8) DEFAULT NULL,
  `d_longitude` double(15,8) DEFAULT NULL,
  `total_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `schedule_end_date_time` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `track_timer` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished_at` timestamp NULL DEFAULT NULL,
  `request_type` int(11) DEFAULT '0',
  `user_rated` tinyint(1) NOT NULL DEFAULT '0',
  `provider_rated` tinyint(1) NOT NULL DEFAULT '0',
  `use_wallet` tinyint(1) NOT NULL DEFAULT '0',
  `surge` tinyint(1) NOT NULL DEFAULT '0',
  `signature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_key` longtext COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `request_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `alert` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_requests`
--

INSERT INTO `user_requests` (`id`, `courier_id`, `selling_item_id`, `total_item`, `provider_service_type`, `booking_id`, `service_hour`, `service_hour_status`, `user_id`, `provider_id`, `current_provider_id`, `service_type_id`, `insurance_id`, `prescription`, `status`, `cancelled_by`, `cancel_reason`, `payment_mode`, `paid`, `distance`, `s_address`, `s_latitude`, `s_longitude`, `d_address`, `d_latitude`, `d_longitude`, `total_time`, `invoice`, `assigned_at`, `schedule_at`, `schedule_end_date_time`, `started_at`, `track_timer`, `finished_at`, `request_type`, `user_rated`, `provider_rated`, `use_wallet`, `surge`, `signature`, `route_key`, `deleted_at`, `created_at`, `updated_at`, `request_amount`, `alert`) VALUES
(1, NULL, NULL, NULL, NULL, 'CC796666', '0', 0, 110, 49, 49, 7, 0, NULL, 'ARRIVED', NULL, NULL, 'CARD', 0, NULL, 'A-73, A Block, Sector 2, Noida, Uttar Pradesh 201301, India', 28.58542800, 77.31268800, 'A-73, A Block, Sector 2, Noida, Uttar Pradesh 201301, India', 28.58543150, 77.31268550, NULL, '', '2019-07-11 19:43:39', NULL, NULL, NULL, '2019-07-11 07:13:39', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2019-07-11 19:43:39', '2019-07-11 19:44:33', '0.00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `user_request_payments`
--

CREATE TABLE `user_request_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_service_hour` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_base_amount` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_type` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_id` int(11) NOT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fixed` double(10,2) NOT NULL DEFAULT '0.00',
  `total_minute` double(10,2) NOT NULL DEFAULT '0.00',
  `per_price` double(10,2) NOT NULL DEFAULT '0.00',
  `distance` double(10,2) NOT NULL DEFAULT '0.00',
  `commision` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `wallet` double(10,2) NOT NULL DEFAULT '0.00',
  `surge` double(10,2) NOT NULL DEFAULT '0.00',
  `insurance` double(10,2) NOT NULL DEFAULT '0.00',
  `total` double(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_ratings`
--

CREATE TABLE `user_request_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL DEFAULT '0',
  `provider_rating` int(11) NOT NULL DEFAULT '0',
  `user_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_request_ratings`
--

INSERT INTO `user_request_ratings` (`id`, `request_id`, `user_id`, `provider_id`, `user_rating`, `provider_rating`, `user_comment`, `provider_comment`, `created_at`, `updated_at`) VALUES
(1, 1, 58, 1, 5, 5, '', '', '2019-01-04 18:40:49', '2019-07-10 00:22:47'),
(2, 3, 58, 1, 5, 1, '', '', '2019-01-04 18:51:38', '2019-07-11 02:26:51'),
(3, 4, 58, 1, 5, 5, '', '', '2019-01-04 20:12:41', '2019-01-04 20:12:48'),
(4, 5, 58, 1, 5, 5, '', '', '2019-01-04 20:28:03', '2019-07-11 02:36:47'),
(5, 6, 58, 1, 5, 5, '', '', '2019-01-04 20:45:51', '2019-01-04 20:45:52'),
(6, 8, 60, 2, 5, 5, 'muito bom', '', '2019-01-04 23:14:09', '2019-01-04 23:14:25'),
(7, 10, 58, 1, 5, 5, '', '', '2019-01-05 15:58:19', '2019-01-05 15:58:21'),
(8, 16, 76, 21, 0, 5, NULL, '', '2019-02-16 04:33:16', '2019-02-16 04:33:16'),
(9, 27, 73, 21, 5, 5, '', '', '2019-02-19 23:29:55', '2019-02-20 02:20:17'),
(10, 28, 73, 21, 5, 5, '', '', '2019-02-19 23:33:02', '2019-02-19 23:33:16'),
(11, 30, 73, 21, 1, 5, '', '', '2019-02-20 01:30:41', '2019-02-20 01:30:42'),
(12, 39, 73, 21, 5, 5, '', '', '2019-02-20 03:47:17', '2019-02-20 03:48:12'),
(13, 40, 73, 21, 5, 5, '', '', '2019-02-20 03:55:01', '2019-02-20 03:55:02'),
(14, 41, 73, 21, 5, 5, '', '', '2019-02-20 03:58:32', '2019-02-20 03:58:33'),
(15, 43, 73, 21, 5, 5, '', '', '2019-02-22 03:41:11', '2019-02-22 03:41:16'),
(16, 44, 73, 21, 5, 5, '', '', '2019-02-22 03:51:30', '2019-04-29 00:53:42'),
(17, 45, 73, 21, 5, 5, '', '', '2019-02-22 04:06:09', '2019-02-22 04:06:15'),
(18, 46, 73, 21, 5, 5, '', '', '2019-02-22 04:08:08', '2019-02-22 04:08:08'),
(19, 47, 73, 21, 5, 5, '', '', '2019-02-22 23:47:31', '2019-02-22 23:47:32'),
(20, 48, 73, 21, 5, 5, '', '', '2019-02-23 00:32:59', '2019-02-23 00:33:00'),
(21, 51, 73, 21, 5, 5, '', '', '2019-02-23 01:22:10', '2019-02-23 01:22:11'),
(22, 7, 82, 36, 5, 5, '', '', '2019-04-10 02:43:50', '2019-04-10 02:43:59'),
(23, 11, 86, 35, 5, 5, '', '', '2019-04-18 20:45:19', '2019-04-18 20:45:39'),
(24, 14, 86, 38, 5, 5, '', '', '2019-04-20 00:30:26', '2019-04-20 00:30:29'),
(25, 18, 86, 35, 5, 5, '', 'jk', '2019-04-23 19:19:06', '2019-04-23 19:19:09'),
(26, 20, 86, 35, 5, 5, '', '', '2019-04-24 03:01:23', '2019-04-24 03:02:42'),
(27, 25, 86, 35, 5, 5, '', '', '2019-04-24 03:26:16', '2019-04-24 03:26:16'),
(28, 26, 86, 35, 5, 5, '', '', '2019-04-24 03:32:31', '2019-04-24 03:32:37'),
(29, 29, 86, 35, 5, 5, '', '', '2019-04-24 03:37:40', '2019-04-24 03:37:40'),
(30, 33, 86, 35, 0, 5, NULL, '', '2019-04-24 22:13:16', '2019-04-24 22:13:16'),
(31, 34, 86, 35, 1, 5, '', '', '2019-04-24 22:17:23', '2019-04-24 22:17:29'),
(32, 35, 86, 35, 0, 1, NULL, '', '2019-04-24 22:19:21', '2019-04-24 22:19:21'),
(33, 36, 86, 35, 0, 1, NULL, '', '2019-04-24 22:21:14', '2019-04-24 22:21:14'),
(34, 38, 86, 35, 0, 5, NULL, '', '2019-04-24 22:54:26', '2019-04-24 22:54:26'),
(35, 73, 108, 49, 1, 1, '', '', '2019-07-04 01:49:05', '2019-07-04 01:49:08'),
(36, 75, 108, 49, 1, 1, '', '', '2019-07-04 02:13:39', '2019-07-04 02:13:40'),
(37, 79, 108, 49, 0, 1, NULL, '', '2019-07-09 02:39:52', '2019-07-09 02:39:52'),
(38, 2, 110, 49, 5, 5, '', '', '2019-07-09 20:59:14', '2019-07-10 01:30:09');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_moneys`
--

CREATE TABLE `withdrawal_moneys` (
  `id` int(8) NOT NULL,
  `bank_account_id` int(20) DEFAULT NULL,
  `provider_id` int(7) DEFAULT NULL,
  `amount` varchar(34) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'WAITING',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_email_unique` (`email`);

--
-- Indexes for table `account_password_resets`
--
ALTER TABLE `account_password_resets`
  ADD KEY `account_password_resets_email_index` (`email`),
  ADD KEY `account_password_resets_token_index` (`token`);

--
-- Indexes for table `account_switches`
--
ALTER TABLE `account_switches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_faqs`
--
ALTER TABLE `admin_faqs`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `admin_helps`
--
ALTER TABLE `admin_helps`
  ADD PRIMARY KEY (`help_id`);

--
-- Indexes for table `admin_terms`
--
ALTER TABLE `admin_terms`
  ADD PRIMARY KEY (`terms_id`);

--
-- Indexes for table `api_test`
--
ALTER TABLE `api_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courier_details`
--
ALTER TABLE `courier_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatchers`
--
ALTER TABLE `dispatchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dispatchers_email_unique` (`email`);

--
-- Indexes for table `dispatcher_password_resets`
--
ALTER TABLE `dispatcher_password_resets`
  ADD KEY `dispatcher_password_resets_email_index` (`email`),
  ADD KEY `dispatcher_password_resets_token_index` (`token`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleets`
--
ALTER TABLE `fleets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fleets_email_unique` (`email`);

--
-- Indexes for table `fleet_password_resets`
--
ALTER TABLE `fleet_password_resets`
  ADD KEY `fleet_password_resets_email_index` (`email`),
  ADD KEY `fleet_password_resets_token_index` (`token`);

--
-- Indexes for table `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indexes for table `item_requests`
--
ALTER TABLE `item_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_bookmarks`
--
ALTER TABLE `provider_bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_devices`
--
ALTER TABLE `provider_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_documents`
--
ALTER TABLE `provider_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_memberships`
--
ALTER TABLE `provider_memberships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_services`
--
ALTER TABLE `provider_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_filters`
--
ALTER TABLE `request_filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selling_items`
--
ALTER TABLE `selling_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `store_users`
--
ALTER TABLE `store_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_invitations`
--
ALTER TABLE `user_invitations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_location_types`
--
ALTER TABLE `user_location_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_moneys`
--
ALTER TABLE `withdrawal_moneys`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_switches`
--
ALTER TABLE `account_switches`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_faqs`
--
ALTER TABLE `admin_faqs`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_helps`
--
ALTER TABLE `admin_helps`
  MODIFY `help_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_terms`
--
ALTER TABLE `admin_terms`
  MODIFY `terms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_test`
--
ALTER TABLE `api_test`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courier_details`
--
ALTER TABLE `courier_details`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `dispatchers`
--
ALTER TABLE `dispatchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fleets`
--
ALTER TABLE `fleets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurances`
--
ALTER TABLE `insurances`
  MODIFY `insurance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item_requests`
--
ALTER TABLE `item_requests`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `provider_bookmarks`
--
ALTER TABLE `provider_bookmarks`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provider_devices`
--
ALTER TABLE `provider_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `provider_documents`
--
ALTER TABLE `provider_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `provider_memberships`
--
ALTER TABLE `provider_memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provider_services`
--
ALTER TABLE `provider_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `request_filters`
--
ALTER TABLE `request_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `selling_items`
--
ALTER TABLE `selling_items`
  MODIFY `id` int(34) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `store_users`
--
ALTER TABLE `store_users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `user_invitations`
--
ALTER TABLE `user_invitations`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_location_types`
--
ALTER TABLE `user_location_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_requests`
--
ALTER TABLE `user_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `withdrawal_moneys`
--
ALTER TABLE `withdrawal_moneys`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
