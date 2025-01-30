-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 30, 2025 at 05:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pre_school`
--

-- --------------------------------------------------------

--
-- Table structure for table `Attendance`
--

CREATE TABLE `Attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Late') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Classes`
--

CREATE TABLE `Classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `max_students` int(11) DEFAULT NULL,
  `schedule` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Events`
--

CREATE TABLE `Events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Gallery`
--

CREATE TABLE `Gallery` (
  `media_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Messages`
--

CREATE TABLE `Messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Parents`
--

CREATE TABLE `Parents` (
  `parent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Parents`
--

INSERT INTO `Parents` (`parent_id`, `user_id`, `name`, `phone`, `address`) VALUES
(1, 40, 'bbb', 'bb@gmail.com', '[ygn]'),
(2, 42, 'noon', '09345678', 'noon'),
(3, 47, 'bobo', '095t6y789', 'No. 1, Jalan 1'),
(4, 50, 'pppp', '094567', 'pppp'),
(5, 51, 'popo', '093456789', 'ygn');

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `payment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','Credit Card','Bank Transfer') NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `staff_role` enum('Admin','Assistant','Other') NOT NULL,
  `hire_date` date NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`staff_id`, `user_id`, `name`, `phone`, `staff_role`, `hire_date`, `salary`, `address`) VALUES
(1, 31, 'sopaqus@mailinator.com', '+1 (157) 198-5117', 'Assistant', '2025-01-15', 300000.00, 'Enim voluptatem Omn'),
(2, 56, 'vujelikag@mailinator.com', '+1 (103) 802-9791', 'Admin', '2025-01-10', 300000.00, 'Dolorem quas tempore');

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE `Students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `parent_id` int(11) NOT NULL,
  `enrollment_date` date NOT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Teachers`
--

CREATE TABLE `Teachers` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `hire_date` date NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Teachers`
--

INSERT INTO `Teachers` (`teacher_id`, `user_id`, `name`, `phone`, `hire_date`, `salary`, `address`) VALUES
(1, 2, 'mgmg', '0912345678', '2025-01-23', 100000.00, 'mgmg\'s home'),
(2, 3, 'mgmg', '0912345678', '2025-01-23', 100000.00, 'mgmg\'s home'),
(3, 27, '', '', '2025-01-29', 100000.00, ''),
(4, 55, 'koqipuro@mailinator.com', '+1 (984) 242-3405', '2025-01-15', 300000.00, 'Quas repudiandae pra');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Teacher','Staff','Parent','Admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'bobo@gmail.com', '234567890', 'Parent', '2025-01-23 04:34:54', '2025-01-23 04:34:54'),
(2, 'gajuge@mailinator.com', '$2y$10$ZZ16Ene8YW40QlhKagV81OVxvNywLZdUB3tgFkseatGk.WVRlHV.G', 'Teacher', '2025-01-22 22:53:27', '2025-01-22 22:53:27'),
(3, 'kycuhasi@mailinator.com', '$2y$10$V8J/lIEjXUoPa31a0C6CkOaJXfbWJYJNnJrAaBfyGFZDtRe8ccf2a', 'Parent', '2025-01-22 22:56:15', '2025-01-22 22:56:15'),
(4, 'xuvaciloce@mailinator.com', '$2y$10$d2oAjozxzXPGQVrQ1Luu2ufXcc9pzdbq0GBjUrOMzv78O3UtJ.GiG', 'Teacher', '2025-01-22 22:57:29', '2025-01-22 22:57:29'),
(5, 'regysoz@mailinator.com', '$2y$10$a2lrCePvIZEhkJ.Kqo49H.sYGo.mV3SLX/zXDrm/LZBSAGsKEwbM6', 'Teacher', '2025-01-22 22:58:51', '2025-01-22 22:58:51'),
(6, 'siqotiji@mailinator.com', '$2y$10$aJjAq.UNhHIaaX7I.2Qrmu.QU/FDiw8iq9x70k2ypSDwiju8k/beW', 'Teacher', '2025-01-22 23:00:26', '2025-01-22 23:00:26'),
(7, 'nehe@mailinator.com', '$2y$10$xqdPJeSV1crpFUShxDEH7endpIbVjaDZhyEg67QnS3bDHUNyZNgs2', 'Teacher', '2025-01-22 23:03:32', '2025-01-22 23:03:32'),
(8, 'fohoc@mailinator.com', '$2y$10$MmpJXfgDEfhS6.XEhZJPBevwEywFUPSwVycDj2UHXG9.O..jqvD4y', 'Teacher', '2025-01-22 23:04:57', '2025-01-22 23:04:57'),
(9, 'pybaja@mailinator.com', '$2y$10$/zGgzt4iTJow1IggIDONqOX7r5TAL01htymQtVqKVdK8WfRry7VSW', 'Teacher', '2025-01-22 23:05:32', '2025-01-22 23:05:32'),
(10, 'lokyp@mailinator.com', '$2y$10$nUvv.z.g4eQjmKnupfRT..ggUvN5eIaU2VOx1W.WcmBVZkhHVgyVe', 'Admin', '2025-01-22 23:05:54', '2025-01-22 23:05:54'),
(11, 'gekatejab@mailinator.com', '$2y$10$vWUwCIPiJaUU/xwPthU40ub5Kq9VFQz1k7YHlHN/cHKMSzOIwkkM2', 'Parent', '2025-01-22 23:06:28', '2025-01-22 23:06:28'),
(12, 'fyzowozulo@mailinator.com', '$2y$10$BwJ.gU/0RFKX7wdN5J5TuOShhT1xssbYlG/lpYhcgSk8Fc4wuW4sW', 'Parent', '2025-01-22 23:07:42', '2025-01-22 23:07:42'),
(13, 'cowopaj@mailinator.com', '$2y$10$vRGbDrFtxHvqmhH/DX1TV.gezcBrGdJyFDKTAvEdjBR1RHeCcxgZ2', 'Teacher', '2025-01-22 23:08:07', '2025-01-22 23:08:07'),
(14, 'dalikef@mailinator.com', '$2y$10$5BWeMHOAeLJCW/6it2PkCOH5qs3nyZV4VhFw.EwW6IYINjhaHPijC', 'Teacher', '2025-01-22 23:12:38', '2025-01-22 23:12:38'),
(15, 'zukocesa@mailinator.com', '$2y$10$eHCd/8Wkvcnyh8yPBdMFIupVdmc.TMsQhcIe5xb/AmCaNBMO.CuVC', 'Teacher', '2025-01-22 23:26:28', '2025-01-22 23:26:28'),
(16, 'fajowusi@mailinator.com', '$2y$10$S1EXL.XDLyaKSDJs/ANhNeq28DkxIii0EBBrWqOV0EYoo9CXvug/C', 'Teacher', '2025-01-22 23:28:46', '2025-01-22 23:28:46'),
(17, 'lysoboce@mailinator.com', '$2y$10$rL1ZqOesD2xsYZO4fWFvXeMplJjt89YLaLQ5DNgy9.qXOmEdwmtrW', 'Teacher', '2025-01-22 23:29:05', '2025-01-22 23:29:05'),
(18, 'bazutybus@mailinator.com', '$2y$10$ChvZCY/pxNACv1/lSKd9UeLQhQV7M6QFX/4l6H9Zj2GK8ZYGNvyUy', 'Teacher', '2025-01-22 23:29:25', '2025-01-22 23:29:25'),
(19, 'pewim@mailinator.com', '$2y$10$gCxSvT/KPurWQwTBH7.uf.Bq.A6dR3SoIsUvRA8fy74e.C24X2GNq', 'Teacher', '2025-01-22 23:29:51', '2025-01-22 23:29:51'),
(20, 'vizof@mailinator.com', '$2y$10$ggtk2QO1fre27D5eTI.lyORPZSfNv2MA/Y6xonFUaNr19a0T1DpG6', 'Teacher', '2025-01-22 23:32:10', '2025-01-22 23:32:10'),
(21, 'wydawozoj@mailinator.com', '$2y$10$h9oIsbgr6XpqDLxwZ2Xjf.vDfptUr4erpRI3LgglmDNjULo2fiixG', 'Teacher', '2025-01-22 23:32:19', '2025-01-22 23:32:19'),
(22, 'pogehufybu@mailinator.com', '$2y$10$ZlUXWQjv3t75yG81ufKsO.NAv3y9adXIa6C0S6/a8cTSmxy0WjKqK', 'Teacher', '2025-01-22 23:33:28', '2025-01-22 23:33:28'),
(23, 'momo@gmail.com', '$2y$10$aQRbEOf8wZfSSDV1um6Cx.866vEsGqJgkarOlFpizEARW1pxAh0LW', 'Teacher', '2025-01-22 23:34:55', '2025-01-22 23:34:55'),
(24, 'vavahepyzy@mailinator.com', '$2y$10$N1iDYxWlVvJNY0jvmYdhC.fSTIgnzDngAFntQB9mbI3.ATthYpmR6', 'Teacher', '2025-01-22 23:35:41', '2025-01-22 23:35:41'),
(25, 'rore@mailinator.com', '$2y$10$lnLAuK18mbgZc7vKR3dyG.bgTQYd0FQayKU91XCVRTCpMHUAC/QeC', 'Teacher', '2025-01-22 23:36:43', '2025-01-22 23:36:43'),
(26, 'jonac@mailinator.com', '$2y$10$vrmOT5ZfW9MhZBQPK3.K2Ow3rwNDmJFvR5Xd.41jw4WFtmVmpGVhW', 'Teacher', '2025-01-22 23:37:16', '2025-01-22 23:37:16'),
(27, '', '$2y$10$mHj385iuYZ7TmLdX1DMAp.9fagFYCLBbWH/ZuEv.w7nQ1XV4mCpn2', 'Teacher', '2025-01-28 20:20:54', '2025-01-28 20:20:54'),
(28, 'xede@mailinator.com', '$2y$10$d7To.3qPzc4pHWREErAf.OKAut9LbUFlIAW.MCSYBtwtJsO1Eod6a', 'Staff', '2025-01-28 20:22:34', '2025-01-28 20:22:34'),
(31, 'rery@mailinator.com', '$2y$10$LEn1NjqUCovJgWyeFHngYeufvxZAvAoRxjwe57rjYyVnT0qIlEpe2', 'Staff', '2025-01-28 20:28:51', '2025-01-28 20:28:51'),
(32, 'dojodefi@mailinator.com', '$2y$10$qVkqUdshrmIJd3y6ryBRie4AWT2D6DJERA77Y7fzKLrkB9wopmw12', 'Admin', '2025-01-28 21:27:16', '2025-01-28 21:27:16'),
(33, 'cagy@mailinator.com', '$2y$10$GPfUm8KJ6Ukc0CrBR6boquHKch94dnCp2fWuiLYZh.BcPh.FbLVOO', 'Parent', '2025-01-28 21:27:57', '2025-01-28 21:27:57'),
(35, 'qefykima@mailinator.com', '$2y$10$UbpxGr7ffASs1KUBOHj7ruvNBdNLR/f5lZrFwtoJ7RgeSzjy81EFm', 'Parent', '2025-01-28 21:33:22', '2025-01-28 21:33:22'),
(36, 'bekevaqapi@mailinator.com', '$2y$10$jvlmCCclzREUxf65WkrkJe9ou58vrl2PZr6SG7KYd2GDJqXzqh2im', 'Parent', '2025-01-28 21:33:46', '2025-01-28 21:33:46'),
(37, 'myrifefa@mailinator.com', '$2y$10$ydgd/YvBX/phgN0vTU0LeO5hJ5BwbGEU9mDL3RgsrfC26DEojjCNG', 'Teacher', '2025-01-28 21:34:25', '2025-01-28 21:34:25'),
(38, 'huxoce@mailinator.com', '$2y$10$q1CEFo1Tdk6GAWppHJoueOizmO6.vuH7EtFgVS4mmklg7f4ZiWz/G', 'Admin', '2025-01-28 21:36:39', '2025-01-28 21:36:39'),
(39, 'foruhukami@mailinator.com', '$2y$10$b9dQyPX.m2JOPP7XMPj3HuxN55dWv0DkqhnZ1z5PltqpXfVUH0Jn6', 'Staff', '2025-01-28 21:37:19', '2025-01-28 21:37:19'),
(40, 'dasyby@mailinator.com', '$2y$10$QKtmGI1FU/CD5j4iwTiGl.hvqrOqz7C1wDavnDbEcQb355AgKT7fe', 'Parent', '2025-01-28 21:38:57', '2025-01-28 21:38:57'),
(41, 'wujexo@mailinator.com', '$2y$10$jPIAO1LglGPD8egviDIr4OTfsZT1nvEcKNU.QFSvL2U.xZjnF2m0W', 'Parent', '2025-01-28 21:40:36', '2025-01-28 21:40:36'),
(42, 'jagipubas@mailinator.com', '$2y$10$3lDK2Vj9aJUwOs9eeON/UOa3vB2KaDY8bZnAfC5GvmhOSlnlFF5fa', 'Parent', '2025-01-28 21:44:46', '2025-01-28 21:44:46'),
(43, 'ginuqym@mailinator.com', '$2y$10$jKFNediJDLXxxTb0dy3w6OW0E4ca/1P6kKKz1FI93lIlgnHe6YsrC', 'Parent', '2025-01-28 21:45:34', '2025-01-28 21:45:34'),
(44, 'pylyloti@mailinator.com', '$2y$10$qHx41D.S2wVwTGWg2aCAR.W74dXqDf5tDOEK2kbwHD5/B02LZiq8W', 'Parent', '2025-01-28 21:45:51', '2025-01-28 21:45:51'),
(45, 'pp@mailinator.com', '$2y$10$KwJmtWvU3Sh2kDacxybJc.yv08DUOzUNYM2hJ2vmC1PnT.tJnCLz.', 'Parent', '2025-01-28 21:46:59', '2025-01-28 21:46:59'),
(46, 'lazif@mailinator.com', '$2y$10$moBVlk.We.fl4wQzRyML9uhmVSyxIC6.5tvEIvNMM1ekXv.r5yrfK', 'Parent', '2025-01-28 21:48:29', '2025-01-28 21:48:29'),
(47, 'zokow@mailinator.com', '$2y$10$tirh8ZjJ7A65ByWuVSO3y.hIdQj4gXzmqZHz3DoDRRRGDTN1Cfo5G', 'Parent', '2025-01-28 21:49:15', '2025-01-28 21:49:15'),
(48, 'kocuwovo@mailinator.com', '$2y$10$7vDn2XwRsiZDMDwX.XWJPO14OqmKq9I2RTZEfAE0zDByZLyEmGni2', 'Parent', '2025-01-28 21:51:11', '2025-01-28 21:51:11'),
(49, 'cyzeryb@mailinator.com', '$2y$10$jCs8yJeCc7bJVNwO6v0ldeK0Syfy96vyiCCPP1j1peEuU21cee5zq', 'Parent', '2025-01-28 21:51:41', '2025-01-28 21:51:41'),
(50, 'suwyciwaf@mailinator.com', '$2y$10$RqM6Pk7.nWGFgkktH/UloOrgtWJDMq1yPYyDUlNbslpMQMtKDrHa6', 'Parent', '2025-01-28 21:52:29', '2025-01-28 21:52:29'),
(51, 'popo@gmail.com', '$2y$10$V0TKutRUUcMdcOw5S0JcnuwFC5NB24gafoqChmLKEF9IRankrSL4W', 'Parent', '2025-01-28 21:53:49', '2025-01-28 21:53:49'),
(52, 'gazoka@mailinator.com', '$2y$10$dCgxzLwJoYAiIB46aidXW.RJN1vz9Iqo0SvHVybXrg73JCOZB/Coi', 'Teacher', '2025-01-28 22:08:49', '2025-01-28 22:08:49'),
(54, 'rose@gmail.com', '$2y$10$LxsyMGlfn2jEEYuAiWHbWuE/Op56nnQ1Yst5xtYrEE1JYM157HLVK', 'Teacher', '2025-01-28 22:10:13', '2025-01-28 22:10:13'),
(55, 'gawu@mailinator.com', '$2y$10$AFdS4yMVliIStSG8kA9wT.XDs2GuNkQD4rGrhomtZqw4RKSZ8S.vG', 'Teacher', '2025-01-28 22:13:29', '2025-01-28 22:13:29'),
(56, 'koxebo@mailinator.com', '$2y$10$mWppIkmi2ht4JJg.3fwjB.emLz4DimGd8/rJDo9LEfLQbeHNSr9gO', 'Staff', '2025-01-28 22:25:43', '2025-01-28 22:25:43'),
(57, 'user200@user.com', '$2y$10$qZ2WkoKRpbr2fhDK.kDUHeBD1ylqbwZAo4BZymgrrW57uNQmubUKu', 'Admin', '2025-01-28 22:45:50', '2025-01-28 22:45:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `Classes`
--
ALTER TABLE `Classes`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `Events`
--
ALTER TABLE `Events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `Gallery`
--
ALTER TABLE `Gallery`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `Messages`
--
ALTER TABLE `Messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `Parents`
--
ALTER TABLE `Parents`
  ADD PRIMARY KEY (`parent_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Attendance`
--
ALTER TABLE `Attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Classes`
--
ALTER TABLE `Classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Events`
--
ALTER TABLE `Events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Gallery`
--
ALTER TABLE `Gallery`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Messages`
--
ALTER TABLE `Messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Parents`
--
ALTER TABLE `Parents`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Staff`
--
ALTER TABLE `Staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Students`
--
ALTER TABLE `Students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Teachers`
--
ALTER TABLE `Teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`),
  ADD CONSTRAINT `Attendance_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `Classes` (`class_id`);

--
-- Constraints for table `Classes`
--
ALTER TABLE `Classes`
  ADD CONSTRAINT `Classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `Teachers` (`teacher_id`);

--
-- Constraints for table `Gallery`
--
ALTER TABLE `Gallery`
  ADD CONSTRAINT `Gallery_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `Events` (`event_id`);

--
-- Constraints for table `Parents`
--
ALTER TABLE `Parents`
  ADD CONSTRAINT `Parents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `Payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`);

--
-- Constraints for table `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Students`
--
ALTER TABLE `Students`
  ADD CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `Parents` (`parent_id`),
  ADD CONSTRAINT `Students_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `Classes` (`class_id`);

--
-- Constraints for table `Teachers`
--
ALTER TABLE `Teachers`
  ADD CONSTRAINT `Teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
