-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2026 at 03:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_eval_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add subject', 7, 'add_subject'),
(26, 'Can change subject', 7, 'change_subject'),
(27, 'Can delete subject', 7, 'delete_subject'),
(28, 'Can view subject', 7, 'view_subject'),
(29, 'Can add question', 8, 'add_question'),
(30, 'Can change question', 8, 'change_question'),
(31, 'Can delete question', 8, 'delete_question'),
(32, 'Can view question', 8, 'view_question'),
(33, 'Can add attempt', 9, 'add_attempt'),
(34, 'Can change attempt', 9, 'change_attempt'),
(35, 'Can delete attempt', 9, 'delete_attempt'),
(36, 'Can view attempt', 9, 'view_attempt');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$I3AE9AIlJSagjRQNWG6AsK$lhUu/cFPZmHaDKY0izF6w3yqeF0frSLxaXnL1ulp/LE=', '2026-01-08 11:57:24.690237', 1, 'admin', '', '', '', 1, 1, '2025-12-23 14:40:36.744552'),
(2, 'pbkdf2_sha256$600000$lvqs9P6b789lU3wqPwnnmH$Y+YtBrGKl/qrt8pNQWGgik087I/6wxkMvoaN7ZAPv1c=', '2025-12-31 15:32:39.075223', 0, 'aaryabaniya12@gmail.com', '', '', '', 0, 1, '2025-12-31 15:32:37.722154'),
(3, 'pbkdf2_sha256$600000$nN24jK2YpcBXDRFf5tBLib$fT0Jx2Js8x9y7GPJ1jZaM/ZE2ps+UUrBGJDEaV4c4/Y=', '2026-01-18 12:03:01.813457', 0, 'Aarya', 'Aarya Baniya', '', 'aaryabaniya12@gmail.com', 0, 1, '2025-12-31 15:49:09.236398'),
(4, 'pbkdf2_sha256$600000$wm0icCg1SXKAcE9JQh6kPp$tGfoB12FNmDbUbo+x4P9VLfvPgHi/av5OnPd9c4rucw=', '2026-01-04 04:30:47.209205', 0, 'Tenzin', 'Tenzin Palki', '', 'tenzinpalki12@gmail.com', 0, 1, '2026-01-04 04:30:45.851006');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-12-23 15:23:15.844762', '1', 'Distributed Systems', 1, '[{\"added\": {}}]', 7, 1),
(2, '2025-12-23 15:24:04.308047', '2', 'Applied Economics', 1, '[{\"added\": {}}]', 7, 1),
(3, '2025-12-23 15:24:19.606551', '3', 'Advanced Java Programming', 1, '[{\"added\": {}}]', 7, 1),
(4, '2025-12-23 15:24:35.412803', '4', 'Network Programming', 1, '[{\"added\": {}}]', 7, 1),
(5, '2025-12-23 15:24:50.298424', '5', 'Network Programming', 1, '[{\"added\": {}}]', 7, 1),
(6, '2025-12-23 15:32:14.124466', '5', 'Network Programming', 3, '', 7, 1),
(7, '2025-12-26 08:24:11.420328', '1', 'U1 | easy | Network programming mainly foc', 1, '[{\"added\": {}}]', 8, 1),
(8, '2025-12-26 08:27:22.607551', '2', 'U1 | easy | A computer network is a collec', 1, '[{\"added\": {}}]', 8, 1),
(9, '2025-12-26 08:28:46.610454', '3', 'U1 | easy | Communication in distributed s', 1, '[{\"added\": {}}]', 8, 1),
(10, '2025-12-26 08:29:49.110908', '4', 'U1 | easy | Which is an example of a distr', 1, '[{\"added\": {}}]', 8, 1),
(11, '2025-12-26 08:31:09.257851', '5', 'U1 | easy | Transparency in distributed sy', 1, '[{\"added\": {}}]', 8, 1),
(12, '2025-12-26 08:31:59.131043', '2', 'U1 | easy | A computer network is a collec', 3, '', 8, 1),
(13, '2025-12-26 08:31:59.131164', '1', 'U1 | easy | Network programming mainly foc', 3, '', 8, 1),
(14, '2025-12-26 08:33:24.479456', '6', 'U1 | easy | A distributed system consists ', 1, '[{\"added\": {}}]', 8, 1),
(15, '2025-12-26 08:34:33.054571', '7', 'U1 | easy | The main goal of distributed s', 1, '[{\"added\": {}}]', 8, 1),
(16, '2025-12-26 09:33:38.040348', '6', 'Mobile Programming', 1, '[{\"added\": {}}]', 7, 1),
(17, '2025-12-27 14:17:28.008760', '8', 'U1 | easy | Which Android version introduc', 1, '[{\"added\": {}}]', 8, 1),
(18, '2025-12-27 14:18:44.485774', '9', 'U1 | easy | Which file defines the visual ', 1, '[{\"added\": {}}]', 8, 1),
(19, '2025-12-27 14:20:29.960928', '10', 'U1 | easy | Which of the following is the ', 1, '[{\"added\": {}}]', 8, 1),
(20, '2025-12-27 14:21:43.414512', '11', 'U2 | easy | The R.java file is automatical', 1, '[{\"added\": {}}]', 8, 1),
(21, '2025-12-27 14:23:09.379371', '12', 'U2 | easy | Which directory contains the s', 1, '[{\"added\": {}}]', 8, 1),
(22, '2025-12-27 14:24:19.341790', '13', 'U3 | medium | Which layout displays items in', 1, '[{\"added\": {}}]', 8, 1),
(23, '2025-12-27 14:25:36.207432', '14', 'U3 | medium | Which attribute is used to giv', 1, '[{\"added\": {}}]', 8, 1),
(24, '2025-12-27 14:26:50.380596', '15', 'U4 | medium | Which intent is used to open a', 1, '[{\"added\": {}}]', 8, 1),
(25, '2025-12-27 14:29:50.401667', '16', 'U4 | medium | The setContentView() method is', 1, '[{\"added\": {}}]', 8, 1),
(26, '2025-12-27 14:31:26.874558', '17', 'U4 | medium | Which widget is used to displa', 1, '[{\"added\": {}}]', 8, 1),
(27, '2025-12-27 14:33:02.027583', '18', 'U5 | hard | Which method of SharedPreferen', 1, '[{\"added\": {}}]', 8, 1),
(28, '2025-12-27 14:34:06.941623', '19', 'U6 | hard | Which SQL clause is used to fi', 1, '[{\"added\": {}}]', 8, 1),
(29, '2025-12-27 14:35:29.313756', '20', 'U7 | hard | A Service that is started by a', 1, '[{\"added\": {}}]', 8, 1),
(30, '2025-12-27 14:36:32.680546', '21', 'U7 | hard | Which method is used to send a', 1, '[{\"added\": {}}]', 8, 1),
(31, '2025-12-27 14:37:38.116954', '22', 'U7 | hard | To access data from another ap', 1, '[{\"added\": {}}]', 8, 1),
(32, '2025-12-27 14:41:18.302274', '23', 'U1 | easy | Which goal of Distributed Syst', 1, '[{\"added\": {}}]', 8, 1),
(33, '2025-12-27 14:42:45.236315', '24', 'U1 | easy | In a layered architecture, whi', 1, '[{\"added\": {}}]', 8, 1),
(34, '2025-12-27 14:46:57.803554', '25', 'U2 | easy | A \"Proxy\" in RPC is another na', 1, '[{\"added\": {}}]', 8, 1),
(35, '2025-12-27 14:47:13.407170', '25', 'U2 | easy | A \"Proxy\" in RPC is another na', 2, '[]', 8, 1),
(36, '2025-12-27 14:48:26.219678', '26', 'U2 | easy | Which communication model allo', 1, '[{\"added\": {}}]', 8, 1),
(37, '2025-12-27 14:49:40.690478', '27', 'U2 | easy | The \'Middleware\' in a distribu', 1, '[{\"added\": {}}]', 8, 1),
(38, '2025-12-27 14:52:24.980427', '28', 'U3 | medium | In Lamport’s Logical Clock, if', 1, '[{\"added\": {}}]', 8, 1),
(39, '2025-12-27 14:53:35.946359', '29', 'U3 | medium | Which election algorithm is ba', 1, '[{\"added\": {}}]', 8, 1),
(40, '2025-12-27 14:54:56.782853', '30', 'U4 | medium | In Mutual Exclusion, which alg', 1, '[{\"added\": {}}]', 8, 1),
(41, '2025-12-27 14:57:58.609049', '31', 'U4 | medium | Which consistency model requir', 1, '[{\"added\": {}}]', 8, 1),
(42, '2025-12-27 14:59:21.496831', '32', 'U4 | medium | Which replication protocol use', 1, '[{\"added\": {}}]', 8, 1),
(43, '2025-12-27 15:00:29.190445', '33', 'U5 | hard | Which type of redundancy invol', 1, '[{\"added\": {}}]', 8, 1),
(44, '2025-12-27 15:02:57.000682', '34', 'U5 | hard | A \"K-fault tolerant\" system ca', 1, '[{\"added\": {}}]', 8, 1),
(45, '2025-12-27 15:04:55.354021', '35', 'U6 | hard | In NFS (Network File System), ', 1, '[{\"added\": {}}]', 8, 1),
(46, '2025-12-27 15:24:50.554380', '36', 'U6 | hard | Which security property ensure', 1, '[{\"added\": {}}]', 8, 1),
(47, '2025-12-27 15:26:36.517256', '37', 'U7 | hard | \"Stateful\" file servers are be', 1, '[{\"added\": {}}]', 8, 1),
(48, '2025-12-27 15:28:53.918224', '38', 'U1 | easy | Which definition of economics ', 1, '[{\"added\": {}}]', 8, 1),
(49, '2025-12-27 15:31:03.657888', '39', 'U1 | easy | If Demand curve is a horizonta', 1, '[{\"added\": {}}]', 8, 1),
(50, '2025-12-27 15:32:13.944115', '40', 'U2 | easy | Which of the following is a de', 1, '[{\"added\": {}}]', 8, 1),
(51, '2025-12-27 15:33:17.854382', '41', 'U2 | easy | Consumer Surplus is the differ', 1, '[{\"added\": {}}]', 8, 1),
(52, '2025-12-27 15:39:44.711356', '42', 'U2 | easy | The slope of the Indifference ', 1, '[{\"added\": {}}]', 8, 1),
(53, '2025-12-27 15:41:21.875258', '43', 'U3 | medium | Which law explains that adding', 1, '[{\"added\": {}}]', 8, 1),
(54, '2025-12-27 15:42:29.546082', '44', 'U4 | medium | Economies of scale occur when:', 1, '[{\"added\": {}}]', 8, 1),
(55, '2025-12-27 15:43:57.240077', '45', 'U3 | medium | In which market does a firm fa', 1, '[{\"added\": {}}]', 8, 1),
(56, '2025-12-27 15:45:06.654928', '46', 'U3 | medium | A \"Natural Monopoly\" is usuall', 1, '[{\"added\": {}}]', 8, 1),
(57, '2025-12-27 15:46:10.613156', '47', 'U4 | medium | Selling the same product at di', 1, '[{\"added\": {}}]', 8, 1),
(58, '2025-12-27 15:48:03.706491', '48', 'U5 | hard | NNP fc (Net National Product a', 1, '[{\"added\": {}}]', 8, 1),
(59, '2025-12-27 15:49:05.808953', '49', 'U5 | hard | Which of the following is an \"', 1, '[{\"added\": {}}]', 8, 1),
(60, '2025-12-27 15:50:17.546375', '50', 'U5 | hard | The \"Paradox of Thrift\" sugges', 1, '[{\"added\": {}}]', 8, 1),
(61, '2025-12-27 15:52:39.254897', '51', 'U5 | hard | Cost-push inflation is caused ', 1, '[{\"added\": {}}]', 8, 1),
(62, '2025-12-27 15:53:51.662168', '52', 'U5 | hard | Which method of calculating GD', 1, '[{\"added\": {}}]', 8, 1),
(63, '2025-12-28 08:42:05.142818', '53', 'U1 | easy | Which layer of the TCP/IP mode', 1, '[{\"added\": {}}]', 8, 1),
(64, '2025-12-28 08:45:28.248507', '54', 'U1 | easy | Which Java stream class is use', 1, '[{\"added\": {}}]', 8, 1),
(65, '2025-12-28 08:46:26.950278', '55', 'U2 | easy | What is the size of an IPv4 ad', 1, '[{\"added\": {}}]', 8, 1),
(66, '2025-12-28 08:47:25.780066', '56', 'U2 | easy | Which stream allows you to wri', 1, '[{\"added\": {}}]', 8, 1),
(67, '2025-12-28 08:48:27.111129', '57', 'U1 | easy | The close() method of a stream', 1, '[{\"added\": {}}]', 8, 1),
(68, '2025-12-28 08:49:49.226199', '58', 'U2 | medium | The InetAddress.getByName() me', 1, '[{\"added\": {}}]', 8, 1),
(69, '2025-12-28 08:53:50.299302', '59', 'U3 | medium | Which method checks if an Inet', 1, '[{\"added\": {}}]', 8, 1),
(70, '2025-12-28 08:54:45.369127', '60', 'U4 | medium | Which class is used to represe', 1, '[{\"added\": {}}]', 8, 1),
(71, '2025-12-28 08:56:05.369385', '61', 'U3 | medium | Which method of URLConnection ', 1, '[{\"added\": {}}]', 8, 1),
(72, '2025-12-28 08:57:07.770727', '62', 'U3 | medium | Which part of the URL http://e', 1, '[{\"added\": {}}]', 8, 1),
(73, '2025-12-28 08:59:32.111478', '63', 'U4 | hard | Which method of ServerSocket r', 1, '[{\"added\": {}}]', 8, 1),
(74, '2025-12-28 09:00:37.510363', '64', 'U5 | hard | UDP is preferred over TCP for ', 1, '[{\"added\": {}}]', 8, 1),
(75, '2025-12-28 09:01:38.684775', '65', 'U5 | hard | Which class is used to join a ', 1, '[{\"added\": {}}]', 8, 1),
(76, '2025-12-28 09:02:44.489958', '66', 'U5 | hard | Which method is used to set th', 1, '[{\"added\": {}}]', 8, 1),
(77, '2025-12-28 09:04:01.319505', '67', 'U5 | hard | In JSSE (Java Secure Socket Ex', 1, '[{\"added\": {}}]', 8, 1),
(78, '2025-12-28 09:07:31.106392', '68', 'U1 | easy | Which model does Java use for ', 1, '[{\"added\": {}}]', 8, 1),
(79, '2025-12-28 09:08:58.887281', '69', 'U1 | easy | Which method of ActionListener', 1, '[{\"added\": {}}]', 8, 1),
(80, '2025-12-28 09:10:06.021601', '70', 'U2 | easy | Which Swing component is used ', 1, '[{\"added\": {}}]', 8, 1),
(81, '2025-12-28 09:11:35.680915', '71', 'U2 | easy | JButton is a subclass of which', 1, '[{\"added\": {}}]', 8, 1),
(82, '2025-12-28 09:12:41.758808', '72', 'U2 | easy | Which layout manager is used b', 1, '[{\"added\": {}}]', 8, 1),
(83, '2025-12-28 09:13:52.516040', '73', 'U3 | medium | Which method is used to load a', 1, '[{\"added\": {}}]', 8, 1),
(84, '2025-12-28 09:15:07.855541', '74', 'U3 | medium | Which interface is used to exe', 1, '[{\"added\": {}}]', 8, 1),
(85, '2025-12-28 09:17:20.408939', '75', 'U4 | medium | Which servlet method handles a', 1, '[{\"added\": {}}]', 8, 1),
(86, '2025-12-28 09:22:04.851735', '76', 'U4 | medium | Which object is used to store ', 1, '[{\"added\": {}}]', 8, 1),
(87, '2025-12-28 09:23:18.190040', '77', 'U4 | medium | Which JSP implicit object is e', 1, '[{\"added\": {}}]', 8, 1),
(88, '2025-12-28 09:24:28.636819', '78', 'U4 | hard | To make a Java Bean \"persisten', 1, '[{\"added\": {}}]', 8, 1),
(89, '2025-12-28 09:25:29.356314', '79', 'U5 | hard | Which class is the base class ', 1, '[{\"added\": {}}]', 8, 1),
(90, '2025-12-28 09:26:29.043117', '80', 'U6 | hard | Which RMI component is respons', 1, '[{\"added\": {}}]', 8, 1),
(91, '2025-12-28 09:27:33.502841', '81', 'U6 | hard | In Java Beans, a \"Bound Proper', 1, '[{\"added\": {}}]', 8, 1),
(92, '2025-12-28 09:28:31.710838', '82', 'U5 | hard | Which method of the Naming cla', 1, '[{\"added\": {}}]', 8, 1),
(93, '2025-12-28 09:49:14.394178', '3', 'U1 | easy | Communication in distributed s', 2, '[{\"changed\": {\"fields\": [\"Is common\"]}}]', 8, 1),
(94, '2025-12-28 09:49:28.730234', '4', 'U1 | easy | Which is an example of a distr', 2, '[{\"changed\": {\"fields\": [\"Is common\"]}}]', 8, 1),
(95, '2025-12-28 09:49:48.484984', '5', 'U1 | easy | Transparency in distributed sy', 2, '[{\"changed\": {\"fields\": [\"Is common\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'evaluation', 'attempt'),
(8, 'evaluation', 'question'),
(7, 'evaluation', 'subject'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-12-23 14:39:09.427193'),
(2, 'auth', '0001_initial', '2025-12-23 14:39:10.375831'),
(3, 'admin', '0001_initial', '2025-12-23 14:39:10.600016'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-12-23 14:39:10.614771'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-12-23 14:39:10.634280'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-12-23 14:39:10.745182'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-12-23 14:39:10.849593'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-12-23 14:39:10.877528'),
(9, 'auth', '0004_alter_user_username_opts', '2025-12-23 14:39:10.897589'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-12-23 14:39:11.001019'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-12-23 14:39:11.006950'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-12-23 14:39:11.023545'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-12-23 14:39:11.052015'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-12-23 14:39:11.078051'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-12-23 14:39:11.108203'),
(16, 'auth', '0011_update_proxy_permissions', '2025-12-23 14:39:11.125770'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-12-23 14:39:11.150638'),
(18, 'evaluation', '0001_initial', '2025-12-23 14:39:11.544004'),
(19, 'sessions', '0001_initial', '2025-12-23 14:39:11.606823'),
(20, 'evaluation', '0002_remove_attempt_common_score_and_more', '2026-01-08 11:55:32.311463');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9dcdc96ne6v4howvu7fmk5sy5a2i0rpn', '.eJxVjDEOgzAMAP_iuYrikATC2L1vQI5tGtoKJAJT1b9XSAztene6Nwy0b2XYq67DJNADwuWXZeKnzoeQB833xfAyb-uUzZGY01ZzW0Rf17P9GxSqBXpovaJjJYcxB-tdF9SydV1O0jUuekESS56djexbGkkih9SMqEkQI8HnC9G-N7Q:1vY3rU:SqYv9XTlJzA8EEDa1VIEvmeBvd0XXDiwxoXkzqwoGXs', '2026-01-06 14:59:44.586988');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_attempt`
--

CREATE TABLE `evaluation_attempt` (
  `id` bigint(20) NOT NULL,
  `total_score` int(11) NOT NULL,
  `unit_breakdown` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`unit_breakdown`)),
  `preparedness_score` double NOT NULL,
  `improvement_rate` double NOT NULL,
  `trend` varchar(20) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `time_taken` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_attempt`
--

INSERT INTO `evaluation_attempt` (`id`, `total_score`, `unit_breakdown`, `preparedness_score`, `improvement_rate`, `trend`, `timestamp`, `student_id`, `subject_id`, `time_taken`) VALUES
(1, 0, '{\"1\": 0.0}', 0, 0, 'Stable', '2025-12-27 14:39:10.266474', 1, 1, 0),
(2, 0, '{\"1\": 0.0, \"2\": 0.0}', 0, 0, 'Stable', '2025-12-27 16:11:28.933483', 1, 2, 0),
(3, 0, '{\"1\": 0.0, \"2\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:28:58.971539', 1, 6, 0),
(4, 0, '{\"1\": 0.0, \"2\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:30:06.657596', 1, 3, 0),
(5, 0, '{\"2\": 0.0, \"1\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:32:52.327547', 1, 3, 0),
(6, 0, '{\"1\": 0.0, \"2\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:33:13.871855', 1, 2, 0),
(7, 0, '{\"2\": 0.0, \"1\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:33:37.959125', 1, 2, 0),
(8, 0, '{\"2\": 0.0, \"1\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:34:02.467638', 1, 6, 0),
(9, 0, '{\"2\": 0.0, \"1\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:50:38.749131', 1, 1, 0),
(10, 0, '{\"1\": 0.0, \"2\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:51:25.519754', 1, 2, 0),
(11, 0, '{\"2\": 0.0, \"1\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:51:49.598103', 1, 2, 0),
(12, 0, '{\"2\": 0.0, \"1\": 0.0}', 0, 0, 'Stable', '2025-12-28 09:59:39.002521', 1, 2, 0),
(13, 0, '{}', 0, 0, 'Stable', '2025-12-28 10:41:09.993623', 1, 1, 0),
(14, 0, '{}', 0, 0, 'Stable', '2025-12-28 10:41:21.331687', 1, 1, 0),
(15, 10, '{}', 12.5, 0, 'Stable', '2025-12-28 10:49:43.998652', 1, 4, 0),
(16, 23, '{}', 28.75, 4.6, 'Improving', '2025-12-28 13:02:35.615715', 1, 1, 0),
(17, 17, '{}', 21.25, 0, 'Stable', '2025-12-31 16:36:01.008454', 3, 1, 0),
(18, 17, '{\"1\": 28.6, \"2\": 5.9, \"3\": 33.3, \"4\": 10.0, \"5\": 20.0, \"6\": 0.0, \"7\": 41.7, \"8\": 14.3}', 21.25, 0, 'Stable', '2026-01-01 11:24:09.691028', 3, 2, 0),
(19, 12, '{\"1\": 13.3, \"2\": 27.3, \"3\": 10.0, \"4\": 8.3, \"5\": 12.5, \"6\": 16.7}', 15, 0, 'Stable', '2026-01-01 13:08:06.204561', 3, 3, 0),
(20, 11, '{\"1\": 6.7, \"2\": 27.3, \"3\": 10.0, \"4\": 16.7, \"5\": 12.5, \"6\": 12.5}', 13.75, -1, 'Declining', '2026-01-01 13:13:29.958719', 3, 3, 0),
(21, 15, '{\"1\": 20.0, \"2\": 18.2, \"3\": 30.0, \"4\": 16.7, \"5\": 12.5, \"6\": 16.7}', 18.75, 1.5, 'Improving', '2026-01-03 12:38:08.129802', 3, 3, 0),
(22, 19, '{\"0\": 30.0, \"1\": 10.0, \"2\": 10.0, \"3\": 16.7, \"4\": 28.6, \"5\": 28.6, \"6\": 25.0, \"7\": 16.7, \"8\": 50.0}', 23.75, 0, 'Stable', '2026-01-03 13:52:27.910974', 3, 4, 0),
(23, 19, '{\"1\": 20.0, \"2\": 25.0, \"3\": 46.2, \"4\": 20.0, \"5\": 7.7, \"6\": 11.1, \"7\": 37.5}', 23.75, 0, 'Stable', '2026-01-04 04:34:23.912379', 4, 1, 0),
(24, 12, '{}', 15, 0.4, 'Stable', '2026-01-18 11:57:35.495272', 3, 3, 187),
(25, 10, '{}', 12.5, 0, 'Stable', '2026-01-18 12:30:16.200010', 3, 6, 121),
(26, 17, '{}', 21.25, 7, 'Improving', '2026-01-18 12:35:46.002527', 3, 6, 246),
(27, 28, '{}', 35, 9, 'Improving', '2026-01-18 13:12:00.923929', 3, 6, 2421),
(28, 4, '{}', 5, -0.7, 'Declining', '2026-01-18 13:41:55.599175', 3, 6, 4215),
(29, 4, '{}', 5, -2.5, 'Declining', '2026-01-18 13:42:58.435732', 3, 6, 4278),
(30, 4, '{}', 5, -2.66, 'Declining', '2026-01-18 13:48:08.074688', 3, 6, 4588),
(31, 8, '{}', 10, -2, 'Declining', '2026-01-18 13:55:37.024922', 3, 6, 5037),
(32, 25, '{}', 31.25, 6, 'Improving', '2026-01-18 14:01:26.822225', 3, 4, 315);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_question`
--

CREATE TABLE `evaluation_question` (
  `id` bigint(20) NOT NULL,
  `unit_number` int(11) NOT NULL,
  `question_text` longtext NOT NULL,
  `option_a` varchar(200) NOT NULL,
  `option_b` varchar(200) NOT NULL,
  `option_c` varchar(200) NOT NULL,
  `option_d` varchar(200) NOT NULL,
  `correct_option` varchar(1) NOT NULL,
  `difficulty` varchar(10) NOT NULL,
  `is_common` tinyint(1) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_question`
--

INSERT INTO `evaluation_question` (`id`, `unit_number`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `difficulty`, `is_common`, `subject_id`) VALUES
(1, 0, 'Which of the following is an Operating System?', 'Chrome', 'Windows', 'Java', 'Oracle', 'B', 'Easy', 1, 4),
(2, 0, '1 Terabyte (TB) is equal to:', '1024 bits', '1024 MB', '1024 GB', '1000 KB', 'C', 'Easy', 1, 4),
(3, 0, 'HTML stands for:', 'Hyper Text Management', 'Hyper Text Markup Language', 'High Tech Markup', 'Home Tool', 'B', 'Easy', 1, 4),
(4, 0, 'Who is known as the father of Computer Science?', 'Bill Gates', 'Alan Turing', 'Charles Babbage', 'Steve Jobs', 'B', 'Easy', 1, 4),
(5, 0, 'What is the brain of the computer?', 'Monitor', 'CPU', 'UPS', 'Keyboard', 'B', 'Easy', 1, 4),
(6, 0, 'Which language is used for styling web pages?', 'HTML', 'CSS', 'PHP', 'SQL', 'B', 'Easy', 1, 4),
(7, 0, 'A collection of 8 bits is called a:', 'Nibble', 'Byte', 'Word', 'Kilobyte', 'B', 'Easy', 1, 4),
(8, 0, 'Which of the following is an input device?', 'Printer', 'Monitor', 'Scanner', 'Speaker', 'C', 'Easy', 1, 4),
(9, 0, 'HTTP operates at which layer of the OSI model?', 'Transport', 'Network', 'Application', 'Physical', 'C', 'Easy', 1, 4),
(10, 0, 'Which data structure follows LIFO?', 'Queue', 'Stack', 'Tree', 'Array', 'B', 'Easy', 1, 4),
(11, 0, 'What is the full form of SQL?', 'Structured Query Language', 'Simple Query', 'System Logic', 'Standard List', 'A', 'Easy', 1, 4),
(12, 0, 'Which is NOT a programming language?', 'Python', 'C++', 'Google', 'Java', 'C', 'Easy', 1, 4),
(13, 0, 'The process of finding errors in software is:', 'Compiling', 'Debugging', 'Running', 'Scanning', 'B', 'Easy', 1, 4),
(14, 0, 'Which protocol is used to send emails?', 'HTTP', 'FTP', 'SMTP', 'SSH', 'C', 'Easy', 1, 4),
(15, 0, 'What is the decimal equivalent of binary 1010?', '8', '10', '12', '15', 'B', 'Easy', 1, 4),
(16, 0, 'In networking, what does LAN stand for?', 'Local Area Network', 'Large Area', 'Logic Access', 'Link Area', 'A', 'Easy', 1, 4),
(17, 0, 'Which of the following is an Open Source OS?', 'Windows', 'macOS', 'Linux', 'iOS', 'C', 'Easy', 1, 4),
(18, 0, 'A URL is a:', 'Type of hardware', 'Web address', 'Software', 'Programming tool', 'B', 'Easy', 1, 4),
(19, 0, 'What is the main purpose of a Firewall?', 'Speed up internet', 'Security/Filtering', 'Data storage', 'Printing', 'B', 'Easy', 1, 4),
(20, 0, 'RAM stands for:', 'Random Access Memory', 'Read Access', 'Run Access', 'Real Access', 'A', 'Easy', 1, 4),
(21, 1, 'Which OSI layer handles hardware MAC addressing?', 'Physical', 'Data Link', 'Network', 'Transport', 'B', 'Easy', 0, 4),
(22, 1, 'Which layer provides end-to-end reliable communication?', 'Network', 'Transport', 'Session', 'Data Link', 'B', 'Easy', 0, 4),
(23, 2, 'Java byte streams are subclasses of:', 'Reader/Writer', 'InputStream/OutputStream', 'File/Path', 'Socket/Server', 'B', 'Easy', 0, 4),
(24, 2, 'Which class is best for reading primitive Java data types?', 'FileReader', 'DataInputStream', 'BufferedReader', 'ObjectInputStream', 'B', 'Easy', 0, 4),
(25, 1, 'The TCP/IP model consists of how many layers?', '7', '4', '5', '3', 'B', 'Easy', 0, 4),
(26, 1, 'Which protocol is considered connectionless?', 'TCP', 'UDP', 'HTTP', 'FTP', 'B', 'Easy', 0, 4),
(27, 2, 'Which method is used to clear a buffer and send data?', 'close()', 'flush()', 'write()', 'clear()', 'B', 'Easy', 0, 4),
(28, 2, 'Character streams in Java use how many bits?', '8', '16', '32', '64', 'B', 'Easy', 0, 4),
(29, 1, 'ICMP belongs to which layer?', 'Transport', 'Internet/Network', 'Data Link', 'Application', 'B', 'Easy', 0, 4),
(30, 2, 'Which class is used to write text to a file efficiently?', 'FileOutputStream', 'BufferedWriter', 'DataOutputStream', 'PipedOutputStream', 'B', 'Easy', 0, 4),
(31, 1, 'IPv4 address size is:', '16 bits', '32 bits', '64 bits', '128 bits', 'B', 'Easy', 0, 4),
(32, 1, 'A Repeater operates at which layer?', 'Physical', 'Data Link', 'Network', 'Transport', 'A', 'Easy', 0, 4),
(33, 2, 'Which method is used to read a line of text?', 'read()', 'readLine()', 'getLine()', 'input()', 'B', 'Easy', 0, 4),
(34, 2, 'Standard Input (System.in) is an instance of:', 'FileReader', 'InputStream', 'BufferedReader', 'Scanner', 'B', 'Easy', 0, 4),
(35, 1, 'Which layer handles encryption and compression?', 'Application', 'Presentation', 'Session', 'Transport', 'B', 'Easy', 0, 4),
(36, 1, 'Port numbers are handled by which layer?', 'Network', 'Transport', 'Session', 'Physical', 'B', 'Easy', 0, 4),
(37, 2, 'Which stream allows you to read objects?', 'ObjectInputStream', 'DataInputStream', 'FileInputStream', 'BufferedInputStream', 'A', 'Easy', 0, 4),
(38, 2, 'To convert bytes to characters, we use:', 'InputStreamReader', 'OutputStreamWriter', 'FileReader', 'StringReader', 'A', 'Easy', 0, 4),
(39, 1, 'Maximum value of a port number is:', '1024', '32768', '65535', '255', 'C', 'Easy', 0, 4),
(40, 2, 'The available() method returns:', 'Total bytes', 'Bytes available without blocking', 'Buffer size', 'File path', 'B', 'Easy', 0, 4),
(41, 3, 'Which method returns the IP address of the local host?', 'getByName()', 'getLocalHost()', 'getAddress()', 'getHostName()', 'B', 'Medium', 0, 4),
(42, 3, 'InetAddress.getByName() can accept:', 'Hostname only', 'IP only', 'Both Hostname and IP', 'MAC address', 'C', 'Medium', 0, 4),
(43, 4, 'The getProtocol() method of URL class returns:', 'The host', 'The protocol (e.g. http)', 'The port', 'The file', 'B', 'Medium', 0, 4),
(44, 4, 'To perform a POST request, which method is used?', 'setDoOutput(true)', 'setDoInput(true)', 'connect()', 'openStream()', 'A', 'Medium', 0, 4),
(45, 5, 'Which method of ServerSocket waits for a client?', 'listen()', 'accept()', 'connect()', 'bind()', 'B', 'Medium', 0, 4),
(46, 5, 'Default port for HTTPS is:', '80', '21', '443', '25', 'C', 'Medium', 0, 4),
(47, 3, 'Which address range is Class C?', '1-126', '128-191', '192-223', '224-239', 'C', 'Medium', 0, 4),
(48, 4, 'MalformedURLException is thrown by which class constructor?', 'Socket', 'URL', 'InetAddress', 'DatagramPacket', 'B', 'Medium', 0, 4),
(49, 5, 'To get the input stream from a Socket, we use:', 'getInputStream()', 'getReader()', 'openStream()', 'read()', 'A', 'Medium', 0, 4),
(50, 3, 'Loopback address is:', '127.0.0.1', '192.168.1.1', '0.0.0.0', '255.255.255.255', 'A', 'Medium', 0, 4),
(51, 4, 'Which class handles URL encoding/decoding?', 'URLEncoder', 'URLDecoder', 'Both A and B', 'URI', 'C', 'Medium', 0, 4),
(52, 5, 'Socket method to set timeout is:', 'setTimeout()', 'setSoTimeout()', 'setWait()', 'setBlock()', 'B', 'Medium', 0, 4),
(53, 3, 'IsMulticastAddress() returns true for Class:', 'A', 'B', 'C', 'D', 'D', 'Medium', 0, 4),
(54, 4, 'A URLConnection is created using:', 'new URLConnection()', 'url.openConnection()', 'Socket.connect()', 'Http.get()', 'B', 'Medium', 0, 4),
(55, 5, 'Which port range is reserved for well-known services?', '0-1023', '1024-49151', '49152-65535', '0-255', 'A', 'Medium', 0, 4),
(56, 3, 'What does getHostAddress() return?', 'Hostname string', 'Dotted decimal IP string', 'Byte array', 'MAC address', 'B', 'Medium', 0, 4),
(57, 4, 'Which method returns the query part of a URL?', 'getPath()', 'getQuery()', 'getRef()', 'getFile()', 'B', 'Medium', 0, 4),
(58, 5, 'The Three-way Handshake is used by:', 'UDP', 'TCP', 'IP', 'ICMP', 'B', 'Medium', 0, 4),
(59, 5, 'To get the local port a socket is bound to:', 'getPort()', 'getLocalPort()', 'getRemotePort()', 'getBindPort()', 'B', 'Medium', 0, 4),
(60, 4, 'Default port for FTP is:', '21', '23', '25', '80', 'A', 'Medium', 0, 4),
(61, 6, 'Which class is used to send a UDP packet?', 'DatagramSocket', 'Socket', 'MulticastSocket', 'ServerSocket', 'A', 'Hard', 0, 4),
(62, 6, 'DatagramPacket constructor for receiving requires:', 'Byte array and length', 'IP and Port', 'Socket object', 'URL', 'A', 'Hard', 0, 4),
(63, 7, 'Multicast IP addresses belong to Class:', 'C', 'D', 'E', 'A', 'B', 'Hard', 0, 4),
(64, 7, 'Method used to join a multicast group:', 'joinGroup()', 'addGroup()', 'connectGroup()', 'bind()', 'A', 'Hard', 0, 4),
(65, 8, 'JSSE stands for:', 'Java Standard Security', 'Java Secure Socket Extension', 'Java System Security', 'Java Socket Encryption', 'B', 'Hard', 0, 4),
(66, 6, 'UDP provides which of the following?', 'Flow control', 'Error recovery', 'Best-effort delivery', 'Ordered delivery', 'C', 'Hard', 0, 4),
(67, 6, 'To find the length of data in a DatagramPacket:', 'getSize()', 'getLength()', 'getData().length', 'capacity()', 'B', 'Hard', 0, 4),
(68, 7, 'Default TTL (Time-To-Live) for multicast is usually:', '1', '10', '64', '128', 'A', 'Hard', 0, 4),
(69, 8, 'SSLServerSocketFactory is used to create:', 'Secure Client Sockets', 'Secure Server Sockets', 'UDP Sockets', 'Database connections', 'B', 'Hard', 0, 4),
(70, 6, 'Which exception is common in UDP if packet exceeds buffer?', 'SocketException', 'IOException', 'BufferOverflowException', 'DataException', 'B', 'Hard', 0, 4),
(71, 7, 'MulticastSocket is a subclass of:', 'Socket', 'DatagramSocket', 'ServerSocket', 'InetAddress', 'B', 'Hard', 0, 4),
(72, 8, 'Port 1099 is the default for:', 'HTTP', 'RMI Registry', 'MySQL', 'FTP', 'B', 'Hard', 0, 4),
(73, 6, 'The receive() method of DatagramSocket is:', 'Non-blocking', 'Blocking', 'Asynchronous', 'Static', 'B', 'Hard', 0, 4),
(74, 7, 'To leave a multicast group, we call:', 'leaveGroup()', 'exitGroup()', 'close()', 'disconnect()', 'A', 'Hard', 0, 4),
(75, 8, 'Which class is the engine for SSL/TLS in Java?', 'SSLContext', 'SSLEngine', 'SSLSocket', 'SSLConfig', 'B', 'Hard', 0, 4),
(76, 6, 'To get the sender address from a DatagramPacket:', 'getAddress()', 'getSender()', 'getSocket()', 'getIP()', 'A', 'Hard', 0, 4),
(77, 7, 'Multicast uses which protocol at the Transport layer?', 'TCP', 'UDP', 'SCTP', 'IP', 'B', 'Hard', 0, 4),
(78, 8, 'In JSSE, TrustManager is used to:', 'Verify credentials', 'Encrypt data', 'Route packets', 'Manage ports', 'A', 'Hard', 0, 4),
(79, 6, 'UDP is better than TCP for:', 'File transfer', 'Web browsing', 'Video streaming', 'SSH', 'C', 'Hard', 0, 4),
(80, 8, 'RMI over SSL requires:', 'SslRMIClientSocketFactory', 'HttpsConnection', 'DatagramSocket', 'InetAddress', 'A', 'Hard', 0, 4),
(81, 1, 'Economics is a science of scarcity and choice. Who gave this definition?', 'Adam Smith', 'Alfred Marshall', 'Lionel Robbins', 'Samuelson', 'C', 'Easy', 1, 2),
(82, 2, 'The relationship between price and quantity demanded is usually:', 'Direct', 'Inverse', 'Linear', 'No relation', 'B', 'Easy', 1, 2),
(83, 2, 'Which of the following is a substitute for Tea?', 'Sugar', 'Milk', 'Coffee', 'Salt', 'C', 'Easy', 1, 2),
(84, 3, 'Which of the following is a factor of production?', 'Land', 'Labour', 'Capital', 'All of the above', 'D', 'Easy', 1, 2),
(85, 3, 'In the short run, at least one factor of production is:', 'Variable', 'Fixed', 'Zero', 'Infinite', 'B', 'Medium', 1, 2),
(86, 4, 'Total Cost (TC) is calculated as:', 'TFC + TVC', 'TFC - TVC', 'TFC * TVC', 'TFC / TVC', 'A', 'Medium', 1, 2),
(87, 4, 'What is the cost of the next best alternative forgone?', 'Sunk Cost', 'Opportunity Cost', 'Fixed Cost', 'Social Cost', 'B', 'Medium', 1, 2),
(88, 5, 'A market with a single seller and no close substitutes is:', 'Monopoly', 'Oligopoly', 'Duopoly', 'Perfect Competition', 'A', 'Medium', 1, 2),
(89, 5, 'In which market is a firm a \"Price Taker\"?', 'Monopoly', 'Perfect Competition', 'Oligopoly', 'Monopolistic', 'B', 'Medium', 1, 2),
(90, 6, 'Macroeconomics deals with:', 'Individual prices', 'National Income', 'A single firm', 'Household demand', 'B', 'Hard', 1, 2),
(91, 7, 'GDP stands for:', 'Gross Domestic Product', 'Gross Daily Production', 'General Domestic Price', 'Gross Demand Product', 'A', 'Hard', 1, 2),
(92, 7, 'Which of the following is excluded from National Income?', 'Wages', 'Rent', 'Transfer Payments', 'Profits', 'C', 'Hard', 1, 2),
(93, 8, 'A persistent rise in the general price level is called:', 'Deflation', 'Stagflation', 'Inflation', 'Recession', 'C', 'Hard', 1, 2),
(94, 8, 'Who is responsible for Monetary Policy in Nepal?', 'Ministry of Finance', 'Nepal Rastra Bank', 'Commercial Banks', 'Supreme Court', 'B', 'Hard', 1, 2),
(95, 2, 'When Total Utility is maximum, Marginal Utility is:', 'Positive', 'Zero', 'Negative', 'Infinite', 'B', 'Easy', 1, 2),
(96, 4, 'Average Fixed Cost (AFC) curve is a:', 'U-shape', 'Vertical line', 'Rectangular Hyperbola', 'Horizontal line', 'C', 'Medium', 1, 2),
(97, 5, 'Product differentiation is the main feature of:', 'Perfect Competition', 'Monopoly', 'Monopolistic Competition', 'None', 'C', 'Medium', 1, 2),
(98, 7, 'Disposable Income equals Personal Income minus:', 'Indirect Taxes', 'Direct Taxes', 'Subsidies', 'Savings', 'B', 'Hard', 1, 2),
(99, 8, 'The phase of business cycle where economic activity is at its peak:', 'Recession', 'Boom', 'Trough', 'Recovery', 'B', 'Hard', 1, 2),
(100, 3, 'Isoquant curve shows combinations of two inputs that produce:', 'Different output', 'Same output', 'Zero output', 'Maximum profit', 'B', 'Medium', 1, 2),
(101, 1, 'Wealth definition of economics was given by:', 'Adam Smith', 'Marshall', 'Robbins', 'Keynes', 'A', 'Easy', 0, 2),
(102, 1, 'Microeconomics is also known as:', 'Income Theory', 'Price Theory', 'Employment Theory', 'Trade Theory', 'B', 'Easy', 0, 2),
(103, 2, 'If price of a good falls, its quantity demanded:', 'Falls', 'Rises', 'Remains constant', 'Becomes zero', 'B', 'Easy', 0, 2),
(104, 2, 'Demand for luxury goods like diamonds is usually:', 'Inelastic', 'Elastic', 'Perfectly Inelastic', 'Unitary', 'B', 'Easy', 0, 2),
(105, 2, 'The Law of Supply shows a direct relation between price and:', 'Demand', 'Cost', 'Quantity Supplied', 'Technology', 'C', 'Easy', 0, 2),
(106, 2, 'When Marginal Utility is negative, Total Utility:', 'Increases', 'Decreases', 'Is maximum', 'Is zero', 'B', 'Easy', 0, 2),
(107, 1, 'Who defined economics as a \"Science of Welfare\"?', 'Adam Smith', 'Alfred Marshall', 'Lionel Robbins', 'Samuelson', 'B', 'Easy', 0, 2),
(108, 2, 'An Indifference Curve is convex to the origin due to:', 'Diminishing MRS', 'Increasing MRS', 'Constant prices', 'Fixed income', 'A', 'Easy', 0, 2),
(109, 2, 'Cross elasticity for substitute goods is always:', 'Positive', 'Negative', 'Zero', 'Infinite', 'A', 'Easy', 0, 2),
(110, 2, 'If the demand curve is a horizontal line, elasticity is:', 'Zero', 'Unitary', 'Infinite', 'Less than one', 'C', 'Easy', 0, 2),
(111, 1, 'The central problem of choice in economics arises due to:', 'Abundance', 'Scarcity', 'Government', 'Money', 'B', 'Easy', 0, 2),
(112, 2, 'Giffen goods are exceptions to the:', 'Law of Supply', 'Law of Demand', 'Law of Variable Proportions', 'Law of Returns', 'B', 'Easy', 0, 2),
(113, 2, 'The point where demand and supply curves intersect is called:', 'Deficit', 'Surplus', 'Equilibrium', 'Kink', 'C', 'Easy', 0, 2),
(114, 2, 'Utility is a ______ concept.', 'Physical', 'Subjective', 'Legal', 'Fixed', 'B', 'Easy', 0, 2),
(115, 1, 'Which branch of economics studies the behavior of a single firm?', 'Macroeconomics', 'Microeconomics', 'International Economics', 'Public Finance', 'B', 'Easy', 0, 2),
(116, 2, 'When MU is zero, TU is:', 'Minimum', 'Maximum', 'Zero', 'Negative', 'B', 'Easy', 0, 2),
(117, 2, 'Shift in demand curve to the left means:', 'Increase in demand', 'Decrease in demand', 'Extension', 'Contraction', 'B', 'Easy', 0, 2),
(118, 1, 'Normative Economics deals with:', 'Facts', 'What is', 'What ought to be', 'Statistics', 'C', 'Easy', 0, 2),
(119, 2, 'A consumer is in equilibrium when MRS equals:', 'Price Ratio', 'Marginal Cost', 'Total Revenue', 'Zero', 'A', 'Easy', 0, 2),
(120, 2, 'Complementary goods are used:', 'Separately', 'Together', 'One after another', 'Never', 'B', 'Easy', 0, 2),
(121, 3, 'The Law of Variable Proportions operates in the:', 'Short Run', 'Long Run', 'Very Long Run', 'Market Period', 'A', 'Medium', 0, 2),
(122, 3, 'At the point of Producer Equilibrium, the Isoquant is tangent to:', 'Demand Curve', 'Isocost Line', 'Supply Curve', 'Utility Curve', 'B', 'Medium', 0, 2),
(123, 4, 'The U-shape of the AC curve is due to:', 'Law of Demand', 'Law of Returns', 'Fixed Costs', 'Taxes', 'B', 'Medium', 0, 2),
(124, 4, 'Marginal Cost (MC) is the change in TC due to one extra unit of:', 'Price', 'Input', 'Output', 'Time', 'C', 'Medium', 0, 2),
(125, 5, 'Which market has only TWO sellers?', 'Monopoly', 'Duopoly', 'Oligopoly', 'Monopsony', 'B', 'Medium', 0, 2),
(126, 5, 'The \"Kinked Demand Curve\" is found in:', 'Perfect Competition', 'Oligopoly', 'Monopoly', 'Monopolistic', 'C', 'Medium', 0, 2),
(127, 3, 'Returns to Scale relate to the:', 'Short Run', 'Long Run', 'Market Period', 'Secular Period', 'B', 'Medium', 0, 2),
(128, 4, 'Explicit costs are also known as:', 'Out-of-pocket costs', 'Implicit costs', 'Sunk costs', 'Fixed costs', 'A', 'Medium', 0, 2),
(129, 5, 'A \"Natural Monopoly\" arises from:', 'Huge economies of scale', 'Government law', 'Patent', 'Cartel', 'A', 'Medium', 0, 2),
(130, 5, 'Selling the same product at different prices is:', 'Price Leadership', 'Price Discrimination', 'Price Ceiling', 'Dumping', 'B', 'Medium', 0, 2),
(131, 3, 'Stage II of production ends where:', 'MP is zero', 'MP is maximum', 'AP is zero', 'TP is zero', 'A', 'Medium', 0, 2),
(132, 4, 'When MC = AC, the AC curve is:', 'Rising', 'Falling', 'At its minimum', 'At its maximum', 'C', 'Medium', 0, 2),
(133, 5, 'Homogeneous products are a feature of:', 'Perfect Competition', 'Monopoly', 'Oligopoly', 'Monopolistic', 'A', 'Medium', 0, 2),
(134, 4, 'Break-even point is where:', 'TR = TC', 'TR > TC', 'MR = MC', 'P = AVC', 'A', 'Medium', 0, 2),
(135, 5, 'The demand curve for a Monopolist is:', 'Horizontal', 'Vertical', 'Downward sloping', 'Upward sloping', 'C', 'Medium', 0, 2),
(136, 3, 'Internal Economies are enjoyed by:', 'A specific firm', 'The whole industry', 'The country', 'The world', 'A', 'Medium', 0, 2),
(137, 4, 'Short-run Total Cost includes:', 'TFC + TVC', 'AC + MC', 'TR - TC', 'Price + Rent', 'A', 'Medium', 0, 2),
(138, 5, 'A market with a single BUYER is called:', 'Monopoly', 'Monopsony', 'Oligopoly', 'Duopoly', 'B', 'Medium', 0, 2),
(139, 4, 'Shutdown point occurs when Price falls below:', 'ATC', 'AVC', 'AFC', 'MC', 'B', 'Medium', 0, 2),
(140, 3, 'In the Long Run, all factors are:', 'Fixed', 'Variable', 'Constant', 'Substitutes', 'B', 'Medium', 0, 2),
(141, 7, 'GDP at factor cost equals GDP at market price minus:', 'Depreciation', 'Net Indirect Taxes', 'NFIA', 'Subsidies', 'B', 'Hard', 0, 2),
(142, 7, 'National Income ($NNP_{FC}$) is calculated as:', 'GNP - Taxes', 'NNP at MP - Net Indirect Taxes', 'GDP + NFIA', 'Personal Income - Savings', 'B', 'Hard', 0, 2),
(143, 8, 'Cost-push inflation occurs due to an increase in:', 'Money supply', 'Government spending', 'Wages/Raw material prices', 'Consumer demand', 'C', 'Hard', 0, 2),
(144, 8, 'The Investment Multiplier ($k$) is equal to:', '1 / MPS', '1 / MPC', 'MPC / MPS', '1 - MPC', 'A', 'Hard', 0, 2),
(145, 8, 'Fiscal Policy includes the use of:', 'Interest rates', 'Taxes and Expenditure', 'Exchange rates', 'Cash Reserve Ratio', 'B', 'Hard', 0, 2),
(146, 7, 'Real GDP is adjusted for:', 'Inflation', 'Population', 'Taxation', 'Exports', 'A', 'Hard', 0, 2),
(147, 8, 'The phase of the business cycle following a \"Peak\" is:', 'Expansion', 'Recession', 'Recovery', 'Trough', 'B', 'Hard', 0, 2),
(148, 7, 'Which of the following is an example of an \"Injection\" in the circular flow?', 'Savings', 'Taxes', 'Investment', 'Imports', 'C', 'Hard', 0, 2),
(149, 8, 'Stagflation is defined as:', 'High growth + high inflation', 'High inflation + high unemployment', 'Low inflation', 'Zero growth', 'B', 'Hard', 0, 2),
(150, 8, 'A \"Deficit Budget\" is one where:', 'Revenue > Expenditure', 'Expenditure > Revenue', 'Revenue = Expenditure', 'Exports = Imports', 'B', 'Hard', 0, 2),
(151, 7, 'Net Factor Income from Abroad (NFIA) is the difference between:', 'GNP and GDP', 'NNP and GDP', 'Export and Import', 'Tax and Subsidy', 'A', 'Hard', 0, 2),
(152, 8, 'The primary tool used by Central Banks to control money supply is:', 'Bank Rate', 'Income Tax', 'Defense spending', 'Tariffs', 'A', 'Hard', 0, 2),
(153, 7, 'The \"Value Added\" method is used to calculate:', 'Total Utility', 'National Income', 'Marginal Cost', 'Elasticity', 'B', 'Hard', 0, 2),
(154, 8, 'If the Marginal Propensity to Consume (MPC) is 0.8, the multiplier is:', '2', '4', '5', '10', 'C', 'Hard', 0, 2),
(155, 8, 'During inflation, the government should ideally:', 'Increase spending', 'Decrease taxes', 'Increase taxes and reduce spending', 'Print more money', 'C', 'Hard', 0, 2),
(156, 7, 'Which component is NOT part of the Expenditure method for GDP?', 'Consumption', 'Investment', 'Wages', 'Net Exports', 'C', 'Hard', 0, 2),
(157, 8, 'Open Market Operations (OMO) involve the sale/purchase of:', 'Goods', 'Foreign currency', 'Government Securities', 'Gold', 'C', 'Hard', 0, 2),
(158, 7, 'Personal Disposable Income is what remains after paying:', 'Indirect Tax', 'Direct Tax', 'Rent', 'Interest', 'B', 'Hard', 0, 2),
(159, 8, 'A sustained decrease in the general price level is:', 'Inflation', 'Deflation', 'Hyperinflation', 'Reflation', 'B', 'Hard', 0, 2),
(160, 7, 'National Income ($Y$) in a four-sector economy is:', 'C + I + G', 'C + S', 'C + I + G + (X - M)', 'C + I', 'C', 'Hard', 0, 2),
(161, 1, 'Which package is used for Java Swing components?', 'java.awt', 'javax.swing', 'java.io', 'java.sql', 'B', 'Easy', 1, 3),
(162, 1, 'Which Swing component is used to enter a single line of text?', 'JButton', 'JLabel', 'JTextField', 'JTextArea', 'C', 'Easy', 1, 3),
(163, 2, 'The delegation event model uses which two entities?', 'Client and Server', 'Source and Listener', 'Input and Output', 'Class and Object', 'B', 'Easy', 1, 3),
(164, 2, 'Which interface is used to handle button clicks?', 'MouseListener', 'KeyListener', 'ActionListener', 'WindowListener', 'C', 'Easy', 1, 3),
(165, 3, 'JDBC stands for:', 'Java Direct Connectivity', 'Java Database Connectivity', 'Java Data Control', 'Java Database Class', 'B', 'Medium', 1, 3),
(166, 3, 'Which method is used to execute a SELECT query in JDBC?', 'executeUpdate()', 'executeQuery()', 'execute()', 'runQuery()', 'B', 'Medium', 1, 3),
(167, 4, 'Servlets are used to create:', 'Static web pages', 'Dynamic web pages', 'Desktop applications', 'Database drivers', 'B', 'Medium', 1, 3),
(168, 4, 'Which method is the starting point of a Servlet lifecycle?', 'service()', 'init()', 'doGet()', 'destroy()', 'B', 'Medium', 1, 3),
(169, 5, 'JSP stands for:', 'Java Standard Pages', 'JavaServer Pages', 'Java Simple Pages', 'Java System Pages', 'B', 'Medium', 1, 3),
(170, 5, 'Which JSP tag is used for declarations?', '<% %>', '<%= %>', '<%! %>', '<%@ %>', 'C', 'Medium', 1, 3),
(171, 6, 'RMI stands for:', 'Remote Method Invocation', 'Remote Memory Interface', 'Random Method Instance', 'Remote Message Invocation', 'A', 'Hard', 1, 3),
(172, 6, 'A Java Bean must implement which interface for persistence?', 'Remote', 'Runnable', 'Serializable', 'Cloneable', 'C', 'Hard', 1, 3),
(173, 1, 'Which layout manager is default for JFrame content pane?', 'FlowLayout', 'GridLayout', 'BorderLayout', 'CardLayout', 'C', 'Easy', 1, 3),
(174, 3, 'Which JDBC interface is used to call stored procedures?', 'Statement', 'PreparedStatement', 'CallableStatement', 'ResultSet', 'C', 'Medium', 1, 3),
(175, 4, 'Which HTTP method is considered non-idempotent and used for form submission?', 'GET', 'POST', 'HEAD', 'OPTIONS', 'B', 'Medium', 1, 3),
(176, 5, 'JSP implicit object for output is:', 'request', 'response', 'out', 'session', 'C', 'Medium', 1, 3),
(177, 6, 'In RMI, the proxy object on the client side is called:', 'Skeleton', 'Stub', 'Registry', 'Proxy', 'B', 'Hard', 1, 3),
(178, 2, 'Which method is called when a mouse button is clicked?', 'mouseEntered()', 'mouseReleased()', 'mouseClicked()', 'mousePressed()', 'C', 'Easy', 1, 3),
(179, 6, 'Java Beans properties are typically accessed via:', 'Public variables', 'Constructor', 'Getter and Setter methods', 'SQL', 'C', 'Hard', 1, 3),
(180, 4, 'Which object is used to store user data across multiple web requests?', 'HttpServletRequest', 'HttpSession', 'ServletConfig', 'ServletContext', 'B', 'Medium', 1, 3),
(181, 1, 'Which Swing component is a top-level container?', 'JPanel', 'JButton', 'JFrame', 'JTextField', 'C', 'Easy', 0, 3),
(182, 1, 'Which layout manager arranges components in rows and columns?', 'BorderLayout', 'FlowLayout', 'GridLayout', 'BoxLayout', 'C', 'Easy', 0, 3),
(183, 2, 'Which method is used to register an action listener to a button?', 'addActionListener()', 'setActionListener()', 'initActionListener()', 'register()', 'A', 'Easy', 0, 3),
(184, 1, 'To create a push button in Swing, we use:', 'Button', 'JButton', 'ClickButton', 'JToggleButton', 'B', 'Easy', 0, 3),
(185, 1, 'Which component allows a user to select only one option from a group?', 'JCheckBox', 'JRadioButton', 'JList', 'JComboBox', 'B', 'Easy', 0, 3),
(186, 2, 'The ItemListener interface is used with which component?', 'JButton', 'JCheckBox', 'JTextField', 'JLabel', 'B', 'Easy', 0, 3),
(187, 1, 'Which method is used to set the text of a JLabel?', 'getText()', 'setText()', 'label()', 'show()', 'B', 'Easy', 0, 3),
(188, 2, 'Which event is generated when a window is closed?', 'ActionEvent', 'WindowEvent', 'MouseEvent', 'KeyEvent', 'B', 'Easy', 0, 3),
(189, 1, 'Default layout manager for a JPanel is:', 'BorderLayout', 'FlowLayout', 'GridLayout', 'CardLayout', 'B', 'Easy', 0, 3),
(190, 1, 'Which Swing component provides a multi-line area for displaying text?', 'JTextField', 'JTextArea', 'JLabel', 'JPasswordField', 'B', 'Easy', 0, 3),
(191, 2, 'KeyListener interface has how many methods?', '1', '2', '3', '4', 'C', 'Easy', 0, 3),
(192, 1, 'Which method makes a frame appear on the screen?', 'show(true)', 'setVisible(true)', 'display()', 'open()', 'B', 'Easy', 0, 3),
(193, 2, 'Which class provides empty implementations for listener interfaces?', 'Abstract classes', 'Adapter classes', 'Proxy classes', 'Wrapper classes', 'B', 'Easy', 0, 3),
(194, 1, 'JPasswordField displays which character by default for input?', 'Empty', 'Asterisk (*)', 'Bullet', 'Hash (#)', 'C', 'Easy', 0, 3),
(195, 2, 'Which method is used to find the source of an event?', 'getSource()', 'getId()', 'getOrigin()', 'getClass()', 'A', 'Easy', 0, 3),
(196, 1, 'Which component creates a drop-down list?', 'JList', 'JComboBox', 'JMenu', 'JPopup', 'B', 'Easy', 0, 3),
(197, 2, 'MouseMotionListener handles which two events?', 'Click and Press', 'Enter and Exit', 'Move and Drag', 'Scroll and Click', 'C', 'Easy', 0, 3),
(198, 1, 'Which package contains the ActionEvent class?', 'java.awt', 'java.awt.event', 'javax.swing.event', 'java.util', 'B', 'Easy', 0, 3),
(199, 1, 'To add a component to a JFrame, we use:', 'frame.add()', 'frame.insert()', 'frame.append()', 'frame.put()', 'A', 'Easy', 0, 3),
(200, 2, 'Which method of WindowListener is called when the X button is clicked?', 'windowClosed()', 'windowClosing()', 'windowDeactivated()', 'windowIconified()', 'B', 'Easy', 0, 3),
(201, 3, 'Which JDBC driver is known as the Native-API driver?', 'Type 1', 'Type 2', 'Type 3', 'Type 4', 'B', 'Medium', 0, 3),
(202, 3, 'Which method of Connection is used to create a simple statement object?', 'createStatement()', 'prepareStatement()', 'prepareCall()', 'newStatement()', 'A', 'Medium', 0, 3),
(203, 3, 'What is the return type of executeUpdate()?', 'ResultSet', 'Boolean', 'int (number of rows affected)', 'void', 'C', 'Medium', 0, 3),
(204, 4, 'The web.xml file is also known as:', 'Configuration file', 'Deployment Descriptor', 'Context file', 'Mapping file', 'B', 'Medium', 0, 3),
(205, 4, 'Which servlet interface method handles the actual logic of the request?', 'init()', 'destroy()', 'service()', 'config()', 'C', 'Medium', 0, 3),
(206, 4, 'Which method is used to redirect a user to another URL in a Servlet?', 'request.forward()', 'response.sendRedirect()', 'response.forward()', 'request.redirect()', 'B', 'Medium', 0, 3),
(207, 5, 'Which JSP directive is used to import a package?', 'page', 'include', 'taglib', 'forward', 'A', 'Medium', 0, 3),
(208, 5, 'What is the correct syntax for a JSP expression to print \"Hello\"?', '<% \"Hello\" %>', '<%= \"Hello\" %>', '<%! \"Hello\" %>', '<%@ \"Hello\" %>', 'B', 'Medium', 0, 3),
(209, 3, 'Which interface is used to navigate through database records?', 'Connection', 'Statement', 'ResultSet', 'RowSet', 'C', 'Medium', 0, 3),
(210, 3, 'Type 4 JDBC driver is written in:', 'C++', 'Assembly', 'Pure Java', 'C', 'C', 'Medium', 0, 3),
(211, 4, 'To get data from a form field in a Servlet, we use:', 'request.getParameter()', 'request.getAttribute()', 'response.getValue()', 'request.read()', 'A', 'Medium', 0, 3),
(212, 4, 'Which lifecycle method is used to release database connections in a Servlet?', 'init()', 'service()', 'destroy()', 'finalize()', 'C', 'Medium', 0, 3),
(213, 5, 'Which JSP implicit object represents the ServletConfig?', 'application', 'config', 'page', 'context', 'B', 'Medium', 0, 3),
(214, 5, 'The JSP <jsp:forward> action is used to:', 'Refresh page', 'Pass control to another resource', 'Include a file', 'Redirect the browser', 'B', 'Medium', 0, 3),
(215, 3, 'Which method moves the ResultSet cursor to the next row?', 'first()', 'last()', 'next()', 'previous()', 'C', 'Medium', 0, 3),
(216, 4, 'Default session timeout for an HttpSession is usually:', '10 mins', '30 mins', '60 mins', '24 hours', 'B', 'Medium', 0, 3),
(217, 5, 'Which scriptlet tag is used to write Java code in JSP?', '<% %>', '<%= %>', '<%@ %>', '<%! %>', 'A', 'Medium', 0, 3),
(218, 3, 'To load a JDBC driver class, we use:', 'DriverManager.load()', 'Class.forName()', 'new Driver()', 'Connection.load()', 'B', 'Medium', 0, 3),
(219, 4, 'GenericServlet class implements which interface?', 'Servlet', 'HttpServlet', 'HttpSession', 'Serializable', 'A', 'Medium', 0, 3),
(220, 4, 'Which method is used to set a session attribute?', 'request.set()', 'session.setAttribute()', 'session.putValue()', 'response.set()', 'B', 'Medium', 0, 3),
(221, 6, 'In RMI architecture, which layer is responsible for the actual network connection?', 'Stub/Skeleton layer', 'Remote Reference layer', 'Transport layer', 'Application layer', 'C', 'Hard', 0, 3),
(222, 6, 'Which tool is used to generate the stub for an RMI application?', 'javac', 'rmic', 'java', 'rmiregistry', 'B', 'Hard', 0, 3),
(223, 6, 'Which method of the Naming class is used to find a remote object by name?', 'bind()', 'rebind()', 'lookup()', 'list()', 'C', 'Hard', 0, 3),
(224, 6, 'In Java Beans, a property that notifies listeners when it changes is called:', 'Simple property', 'Indexed property', 'Bound property', 'Constrained property', 'C', 'Hard', 0, 3),
(225, 6, 'A Constrained property in Java Beans can be vetoed by a listener using which exception?', 'VetoException', 'PropertyVetoException', 'IllegalAccessException', 'ChangeException', 'B', 'Hard', 0, 3),
(226, 6, 'The process of analyzing a Java Bean at runtime to discover its properties is called:', 'Reflection', 'Introspection', 'Serialization', 'Abstraction', 'B', 'Hard', 0, 3),
(227, 6, 'Which class is used to get information about a Bean’s properties and methods?', 'BeanInfo', 'Introspector', 'PropertyDescriptor', 'BeanClass', 'B', 'Hard', 0, 3),
(228, 6, 'In RMI, what is the role of the rmiregistry?', 'To compile code', 'To store remote objects', 'To map names to remote object references', 'To handle security', 'C', 'Hard', 0, 3),
(229, 6, 'Remote objects must be exported using which class in RMI?', 'UnicastRemoteObject', 'RemoteServer', 'Naming', 'RemoteObject', 'A', 'Hard', 0, 3),
(230, 6, 'Which RMI component sits on the server side and passes calls to the implementation?', 'Stub', 'Skeleton', 'Registry', 'Dispatcher', 'B', 'Hard', 0, 3),
(231, 6, 'Java Beans must follow which naming convention for boolean getters?', 'get()', 'is()', 'has()', 'check()', 'B', 'Hard', 0, 3),
(232, 6, 'Which interface must all RMI remote interfaces extend?', 'java.io.Serializable', 'java.rmi.Remote', 'java.lang.Object', 'java.util.EventListener', 'B', 'Hard', 0, 3),
(233, 6, 'An indexed property in Java Beans represents:', 'A single value', 'An array or collection of values', 'A private variable', 'A database index', 'B', 'Hard', 0, 3),
(234, 6, 'The manifest file in a JAR for Beans must contain:', 'Java-Bean: True', 'Bean-Class: True', 'Main-Class: Name', 'Version: 1.0', 'A', 'Hard', 0, 3),
(235, 6, 'Which design pattern is primarily used for event notification in Java Beans?', 'Singleton', 'Observer', 'Factory', 'Decorator', 'B', 'Hard', 0, 3),
(236, 6, 'RMI uses which protocol for data transfer by default?', 'HTTP', 'JRMP (Java Remote Method Protocol)', 'FTP', 'SMTP', 'B', 'Hard', 0, 3),
(237, 6, 'What is the return type of the getPropertyDescriptors() method in BeanInfo?', 'String[]', 'PropertyDescriptor[]', 'Method[]', 'Object[]', 'B', 'Hard', 0, 3),
(238, 6, 'Which exception is thrown if a remote object cannot be found in the registry?', 'RemoteException', 'NotBoundException', 'AlreadyBoundException', 'AccessException', 'B', 'Hard', 0, 3),
(239, 6, 'The \"Design-time\" property of a Bean means it can be modified in:', 'A text editor', 'An IDE/Builder tool', 'The database', 'The OS', 'B', 'Hard', 0, 3),
(240, 6, 'What happens if a Java Bean is not Serializable?', 'It cannot be used in a GUI', 'It cannot be saved or transmitted over a network', 'It cannot have properties', 'It cannot be compiled', 'B', 'Hard', 0, 3),
(241, 1, 'A collection of independent computers that appears to its users as a single coherent system is:', 'Parallel System', 'Distributed System', 'Centralized System', 'Mainframe', 'B', 'Easy', 1, 1),
(242, 1, 'Which transparency hides the fact that a resource may be moved to another location while in use?', 'Access', 'Location', 'Migration', 'Relocation', 'C', 'Easy', 1, 1),
(243, 1, 'Middleware in a distributed system lies between:', 'Hardware and OS', 'OS and Applications', 'Client and Server', 'Memory and CPU', 'B', 'Easy', 1, 1),
(244, 2, 'In RPC, the process of packing parameters into a message is called:', 'Unmarshalling', 'Marshalling', 'Binding', 'Routing', 'B', 'Medium', 1, 1),
(245, 2, 'The proxy object on the client side in an RPC call is the:', 'Server Stub', 'Client Stub', 'Dispatcher', 'Handler', 'B', 'Medium', 1, 1),
(246, 3, 'Lamport’s logical clocks are used to define:', 'Physical time', 'Happened-before relationship', 'Network latency', 'CPU speed', 'B', 'Medium', 1, 1),
(247, 3, 'Which algorithm is used to elect a new coordinator after a crash?', 'Berkeley', 'Cristian', 'Bully Algorithm', 'Token Ring', 'C', 'Medium', 1, 1),
(248, 4, 'Which consistency model ensures all processes see the same order of all writes?', 'Eventual', 'Sequential Consistency', 'Causal', 'Weak', 'B', 'Medium', 1, 1),
(249, 4, 'The main purpose of replication in distributed systems is:', 'Increase complexity', 'Reliability and Performance', 'Reduce storage', 'Centralize data', 'B', 'Medium', 1, 1),
(250, 5, 'A system that can continue operating even in the presence of faults is:', 'Fault Tolerant', 'Fault Proof', 'Fault Resistant', 'Fault Silent', 'A', 'Hard', 1, 1),
(251, 5, 'In the Two-Phase Commit protocol, the first phase is:', 'Commit phase', 'Voting phase', 'Aborting phase', 'Recovery phase', 'B', 'Hard', 1, 1),
(252, 6, 'Which distributed file system was developed by Sun Microsystems?', 'NFS', 'AFS', 'GFS', 'NTFS', 'A', 'Hard', 1, 1),
(253, 7, 'Which security property ensures that a message has not been altered during transmission?', 'Confidentiality', 'Integrity', 'Availability', 'Authentication', 'B', 'Hard', 1, 1),
(254, 1, 'The ability of a system to handle a growing amount of work is called:', 'Reliability', 'Availability', 'Scalability', 'Transparency', 'C', 'Easy', 1, 1),
(255, 3, 'The Berkeley algorithm is used for:', 'Mutual Exclusion', 'Physical Clock Synchronization', 'Replication', 'Election', 'B', 'Medium', 1, 1),
(256, 5, 'Which fault type is the most difficult to handle where a node sends malicious data?', 'Crash Fault', 'Omission Fault', 'Byzantine Fault', 'Timing Fault', 'C', 'Hard', 1, 1),
(257, 2, 'Asynchronous communication means:', 'Sender waits for reply', 'Sender continues without waiting for reply', 'No message is sent', 'Communication is real-time', 'B', 'Medium', 1, 1),
(258, 4, 'Active replication involves:', 'Only primary processes request', 'All replicas process the request', 'Backup is idle', 'Data is not copied', 'B', 'Medium', 1, 1),
(259, 7, 'Non-repudiation in security means:', 'Message is secret', 'Sender cannot deny sending the message', 'Receiver is anonymous', 'Data is backed up', 'B', 'Hard', 1, 1),
(260, 3, 'In Mutual Exclusion, the Token Ring algorithm uses a:', 'Logical ring', 'Physical star', 'Central server', 'Random selection', 'A', 'Medium', 1, 1),
(261, 1, 'Which transparency hides differences in data representation and resource invocation?', 'Access', 'Location', 'Failure', 'Replication', 'A', 'Easy', 0, 1),
(262, 1, 'A \"Vertical Distribution\" in a multi-tier architecture refers to:', 'P2P network', 'Dividing application into layers (UI, Logic, Data)', 'Dividing data into chunks', 'Adding more RAM', 'B', 'Easy', 0, 1),
(263, 1, 'What is a \"Stateless\" server?', 'It remembers client history', 'It does not keep information about client state', 'It is always offline', 'It uses cookies', 'B', 'Easy', 0, 1),
(264, 2, 'The OSI model has how many layers?', '4', '5', '7', '8', 'C', 'Easy', 0, 1),
(265, 2, 'Which protocol is used for reliable, connection-oriented communication?', 'UDP', 'IP', 'TCP', 'ICMP', 'C', 'Easy', 0, 1),
(266, 1, 'In a Client-Server model, which entity provides the resource?', 'Client', 'Server', 'Stub', 'Middleware', 'B', 'Easy', 0, 1),
(267, 1, 'A Peer-to-Peer (P2P) system is highly:', 'Centralized', 'Decentralized', 'Unreliable', 'Slow', 'B', 'Easy', 0, 1),
(268, 2, 'Synchronous communication is also known as:', 'Blocking', 'Non-blocking', 'Persistent', 'Transient', 'A', 'Easy', 0, 1),
(269, 1, 'Transparency that hides that a resource is in a different physical location:', 'Location', 'Migration', 'Failure', 'Relocation', 'A', 'Easy', 0, 1),
(270, 1, 'A distributed system is \"Open\" if:', 'It is free to use', 'It offers services according to standard rules', 'Anyone can edit code', 'It has no security', 'B', 'Easy', 0, 1),
(271, 2, 'Which layer of OSI handles logical addressing?', 'Physical', 'Data Link', 'Network', 'Transport', 'C', 'Easy', 0, 1),
(272, 2, 'In RMI, what does the server register with to be found by the client?', 'Registry', 'Compiler', 'Database', 'Kernel', 'A', 'Easy', 0, 1),
(273, 1, 'Which goal ensures the system is available even if one node fails?', 'Scalability', 'Fault Tolerance', 'Efficiency', 'Openness', 'B', 'Easy', 0, 1),
(274, 2, 'Persistent communication means:', 'Message is discarded if not delivered', 'Message is stored in a buffer until delivered', 'Sender must be online', 'Receiver must be online', 'B', 'Easy', 0, 1),
(275, 1, 'What is a \"Single System Image\"?', 'A photo of the server', 'User perceives the cluster as one computer', 'One monitor for all CPUs', 'One OS for the entire world', 'B', 'Easy', 0, 1),
(276, 2, 'Which entity is responsible for unmarshalling on the server side?', 'Client Stub', 'Server Stub', 'Middleware', 'Network Driver', 'B', 'Easy', 0, 1),
(277, 1, 'Scalability in terms of \"Geography\" means:', 'Adding more users', 'Handling nodes far apart with low latency', 'Adding more disks', 'Moving to a new building', 'B', 'Easy', 0, 1),
(278, 2, 'The \"Transport Layer\" in OSI is responsible for:', 'Bit transmission', 'End-to-end communication', 'Routing', 'UI rendering', 'B', 'Easy', 0, 1),
(279, 1, 'Homogeneous distributed systems use:', 'Same OS and Hardware', 'Different OS', 'Different Networks', 'Mobile devices only', 'A', 'Easy', 0, 1),
(280, 2, 'The term \"Interoperability\" refers to:', 'Speed of network', 'Different systems working together', 'Number of users', 'Security level', 'B', 'Easy', 0, 1),
(281, 3, 'Which clock sync algorithm uses a central Time Server that polls clients?', 'Lamport', 'Cristian’s', 'Berkeley', 'Bully', 'C', 'Medium', 0, 1),
(282, 3, 'In Lamport’s Logical Clocks, if event A sends a message to event B:', 'C(A) > C(B)', 'C(A) < C(B)', 'C(A) = C(B)', 'C(A) = 0', 'B', 'Medium', 0, 1),
(283, 3, 'The Centralized Mutual Exclusion algorithm has a drawback of:', 'High message count', 'Single point of failure', 'Complex logic', 'Memory leaks', 'B', 'Medium', 0, 1),
(284, 3, 'Which election algorithm uses a logical circle for message passing?', 'Bully', 'Ring', 'Berkeley', 'Cristian', 'B', 'Medium', 0, 1),
(285, 4, 'Which consistency model is the weakest?', 'Strict', 'Sequential', 'Eventual', 'Causal', 'C', 'Medium', 0, 1),
(286, 4, 'Replication for \"Performance\" is used to:', 'Increase data size', 'Reduce latency by placing data near users', 'Make code run faster', 'Encrypt data', 'B', 'Medium', 0, 1),
(287, 4, 'In \"Primary-based\" replication, all write operations are performed at:', 'Any replica', 'A single primary node', 'All replicas at once', 'The client side', 'B', 'Medium', 0, 1),
(288, 5, 'What is \"Fail-Stop\" failure?', 'Server stops and others can detect it', 'Server sends wrong data', 'Server is slow', 'Server reboots randomly', 'A', 'Medium', 0, 1),
(289, 3, 'A \"Global State\" in a distributed system consists of:', 'Local states and messages in transit', 'Only the master’s state', 'The sum of all RAM', 'The hard drive data', 'A', 'Medium', 0, 1),
(290, 3, 'The \"Happened-before\" relation is denoted by:', '->', '=>', '>', '<', 'A', 'Medium', 0, 1),
(291, 4, 'A consistency model is a \"Contract\" between:', 'Client and Server', 'Developer and User', 'Data store and Processes', 'OS and Hardware', 'C', 'Medium', 0, 1),
(292, 4, 'Client-centric consistency models are used for:', 'Banking', 'Mobile users/Disconnected operation', 'Stock markets', 'Scientific computing', 'B', 'Medium', 0, 1),
(293, 5, 'Failure masking by replication involves:', 'Hiding the fault from the user', 'Deleting the faulty node', 'Restarting the system', 'Sending an error message', 'A', 'Medium', 0, 1),
(294, 3, 'In the Bully algorithm, the process with the ____ PID wins.', 'Lowest', 'Highest', 'Random', 'Prime', 'B', 'Medium', 0, 1),
(295, 4, 'Which consistency requires that all \"Write\" operations are seen in order?', 'Sequential', 'Strict', 'FIFO', 'Weak', 'A', 'Medium', 0, 1),
(296, 5, 'Process Resilience means:', 'Adding more CPUs', 'Organizing processes into groups to hide failures', 'Using faster networks', 'Writing bug-free code', 'B', 'Medium', 0, 1),
(297, 3, 'Clock drift rate is:', 'The speed of the network', 'The difference in time per unit of time', 'The physical size of the clock', 'The battery life', 'B', 'Medium', 0, 1),
(298, 5, 'A \"Crash failure\" means:', 'Server sends incorrect value', 'Server prematurely stops', 'Server is too fast', 'Server loses messages', 'B', 'Medium', 0, 1),
(299, 4, 'A \"Quorum\" in replication ensures:', 'Security', 'Consistency between read and write operations', 'Speed', 'Formatting', 'B', 'Medium', 0, 1),
(300, 3, 'In Ricart-Agrawala algorithm, a process enters Critical Section when:', 'It receives a token', 'It receives \"OK\" from all other processes', 'It asks the server', 'It is its turn', 'B', 'Medium', 0, 1),
(301, 6, 'In NFS, what is used to identify a file uniquely across the network?', 'IP Address', 'File Handle', 'File Path', 'Port Number', 'B', 'Hard', 0, 1),
(302, 6, 'NFS is designed to be:', 'Stateless', 'Stateful', 'Connection-oriented', 'Single-user', 'A', 'Hard', 0, 1),
(303, 6, 'What is \"Mounting\" in a distributed file system?', 'Deleting a file', 'Making a remote directory look like a local one', 'Formatting a drive', 'Copying a disk', 'B', 'Hard', 0, 1),
(304, 7, 'Which type of cryptography uses two different keys (Public and Private)?', 'Symmetric', 'Asymmetric', 'Hashing', 'Steganography', 'B', 'Hard', 0, 1),
(305, 7, 'A Key Distribution Center (KDC) is used to:', 'Store files', 'Distribute secret keys securely', 'Route traffic', 'Manage users', 'B', 'Hard', 0, 1),
(306, 5, 'In the \"Three-Phase Commit\", what is the extra phase added to 2PC?', 'Pre-Commit', 'Post-Commit', 'Ready', 'Vote', 'A', 'Hard', 0, 1),
(307, 6, 'AFS (Andrew File System) uses which mechanism to maintain consistency?', 'Polling', 'Callbacks', 'Multicasting', 'Broadcasting', 'B', 'Hard', 0, 1),
(308, 5, 'Checkpointing is used for:', 'System security', 'Recovery after a failure', 'Load balancing', 'Clock sync', 'B', 'Hard', 0, 1),
(309, 7, 'Symmetric encryption (like AES) is faster than Asymmetric but requires:', 'More memory', 'A secure way to share the single key', 'No keys', 'A central server', 'B', 'Hard', 0, 1),
(310, 5, 'In \"Stable Storage,\" what is guaranteed?', 'Data is never lost even after a crash', 'Data is fast', 'Data is encrypted', 'Data is portable', 'A', 'Hard', 0, 1),
(311, 6, 'The \"Virtual File System\" (VFS) layer allows:', 'Only one type of disk', 'Different file systems to coexist', 'No disk access', 'Cloud storage only', 'B', 'Hard', 0, 1),
(312, 7, '\"Authorization\" determines:', 'Who you are', 'What you are allowed to do', 'Network speed', 'If you are online', 'B', 'Hard', 0, 1),
(313, 5, 'Atomic Multicast ensures:', 'Message is delivered to all or none', 'Message is fast', 'Message is encrypted', 'Message is deleted', 'A', 'Hard', 0, 1),
(314, 6, 'Caching in DFS helps to:', 'Increase storage', 'Reduce network traffic and improve performance', 'Format the disk', 'Secure the files', 'B', 'Hard', 0, 1),
(315, 7, 'What is a \"Digital Certificate\"?', 'A scanned ID', 'A public key signed by a trusted authority (CA)', 'A software license', 'A login password', 'B', 'Hard', 0, 1),
(316, 5, 'Backward Recovery involves:', 'Moving from a failed state to a previous correct state', 'Predicting the future', 'Skipping the error', 'Rebooting the hardware', 'A', 'Hard', 0, 1),
(317, 6, 'Google File System (GFS) uses a single ____ node to manage metadata.', 'Slave', 'Master', 'Chunk', 'Client', 'B', 'Hard', 0, 1),
(318, 7, 'Firewalls protect a distributed system by:', 'Encrypting RAM', 'Filtering incoming and outgoing traffic', 'Speeding up the CPU', 'Backing up data', 'B', 'Hard', 0, 1),
(319, 5, 'Orphan process occurs when:', 'The child finishes before parent', 'The parent fails but child continues', 'Memory is full', 'Network is down', 'B', 'Hard', 0, 1),
(320, 6, 'The \"Lookup\" operation in a DFS:', 'Deletes a file', 'Maps a filename to its location/handle', 'Changes permissions', 'Renames a file', 'B', 'Hard', 0, 1),
(321, 1, 'Android is based on which kernel?', 'Linux', 'Windows', 'Unix', 'MacOS', 'A', 'Easy', 1, 6),
(322, 1, 'Which language is officially supported for Android development?', 'Swift', 'Kotlin', 'Ruby', 'PHP', 'B', 'Easy', 1, 6),
(323, 1, 'APK stands for:', 'Android Phone Kit', 'Android Package', 'Application Package', 'Android Package Kit', 'D', 'Easy', 1, 6),
(324, 2, 'Which file contains app permissions?', 'MainActivity.java', 'AndroidManifest.xml', 'build.gradle', 'layout.xml', 'B', 'Easy', 1, 6),
(325, 2, 'Which component is used to design UI?', 'Service', 'Content Provider', 'Activity', 'Broadcast Receiver', 'C', 'Easy', 1, 6),
(326, 3, 'Intent is used for:', 'Storing data', 'Database access', 'Component communication', 'UI rendering', 'C', 'Medium', 1, 6),
(327, 3, 'Which layout arranges elements vertically or horizontally?', 'FrameLayout', 'LinearLayout', 'TableLayout', 'GridLayout', 'B', 'Easy', 1, 6),
(328, 3, 'Which method is called when activity is created?', 'onStart()', 'onCreate()', 'onResume()', 'onDestroy()', 'B', 'Easy', 1, 6),
(329, 4, 'Service in Android runs in:', 'Foreground only', 'Background', 'UI thread only', 'Separate device', 'B', 'Medium', 1, 6),
(330, 4, 'BroadcastReceiver is used to:', 'Store data', 'Handle background services', 'Listen to system events', 'Design UI', 'C', 'Medium', 1, 6),
(331, 5, 'SQLite is:', 'Server-based DB', 'Cloud DB', 'Embedded database', 'NoSQL DB', 'C', 'Medium', 1, 6),
(332, 5, 'Which class is used to manage SQLite database?', 'SQLiteManager', 'SQLiteHelper', 'SQLiteOpenHelper', 'DBHelper', 'C', 'Medium', 1, 6),
(333, 6, 'Which sensor detects device rotation?', 'Proximity', 'Gyroscope', 'Light', 'GPS', 'B', 'Medium', 1, 6),
(334, 6, 'GPS is used for:', 'Audio playback', 'Location tracking', 'Data storage', 'UI design', 'B', 'Easy', 1, 6),
(335, 7, 'Which permission is required for internet access?', 'ACCESS_WIFI', 'INTERNET', 'NETWORK', 'WEB_ACCESS', 'B', 'Easy', 1, 6),
(336, 7, 'Firebase is mainly used for:', 'Offline storage', 'Backend services', 'UI design', 'OS control', 'B', 'Medium', 1, 6),
(337, 3, 'Explicit Intent is used to:', 'Call system apps', 'Communicate within app', 'Broadcast events', 'Access web', 'B', 'Medium', 1, 6),
(338, 4, 'Which thread handles UI operations?', 'Worker thread', 'Main thread', 'Service thread', 'Background thread', 'B', 'Medium', 1, 6),
(339, 5, 'CRUD stands for:', 'Create Read Update Delete', 'Copy Read Upload Delete', 'Create Remove Update Drop', 'Control Read Use Delete', 'A', 'Easy', 1, 6),
(340, 6, 'Which emulator is used for Android testing?', 'Xcode', 'AVD', 'VMware', 'BlueJ', 'B', 'Easy', 1, 6),
(341, 1, 'Android Studio is based on which IDE?', 'Eclipse', 'NetBeans', 'IntelliJ IDEA', 'VS Code', 'C', 'Easy', 0, 6),
(342, 1, 'Which file defines app name and icon?', 'styles.xml', 'AndroidManifest.xml', 'build.gradle', 'strings.xml', 'D', 'Easy', 0, 6),
(343, 2, 'Which unit is used for responsive UI?', 'px', 'dp', 'pt', 'mm', 'B', 'Easy', 0, 6),
(344, 2, 'Toast message is used for:', 'Long notifications', 'Temporary message', 'Database alert', 'Error log', 'B', 'Easy', 0, 6),
(345, 2, 'Which folder contains UI layouts?', 'java', 'values', 'layout', 'drawable', 'C', 'Easy', 0, 6),
(346, 1, 'Android apps run on:', 'Dalvik/ART', 'JVM only', 'CLR', 'NodeJS', 'A', 'Easy', 0, 6),
(347, 1, 'Which is NOT an Android component?', 'Activity', 'Service', 'Widget', 'Controller', 'D', 'Easy', 0, 6),
(348, 2, 'TextView is used to:', 'Input text', 'Display text', 'Store text', 'Encrypt text', 'B', 'Easy', 0, 6),
(349, 2, 'Button click is handled using:', 'Listener', 'Thread', 'Service', 'Intent', 'A', 'Easy', 0, 6),
(350, 1, 'Which OS is Android?', 'Proprietary', 'Open Source', 'Closed Source', 'Hybrid', 'B', 'Easy', 0, 6),
(351, 2, 'Which layout overlaps views?', 'LinearLayout', 'RelativeLayout', 'FrameLayout', 'TableLayout', 'C', 'Easy', 0, 6);
INSERT INTO `evaluation_question` (`id`, `unit_number`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `difficulty`, `is_common`, `subject_id`) VALUES
(352, 1, 'Minimum SDK version means:', 'Oldest supported Android version', 'Latest version', 'Device RAM', 'CPU speed', 'A', 'Easy', 0, 6),
(353, 2, 'ImageView is used to:', 'Display images', 'Edit images', 'Capture images', 'Store images', 'A', 'Easy', 0, 6),
(354, 1, 'Which build file manages dependencies?', 'settings.gradle', 'build.gradle', 'manifest.xml', 'config.xml', 'B', 'Easy', 0, 6),
(355, 2, 'Which view accepts user input?', 'TextView', 'EditText', 'ImageView', 'ListView', 'B', 'Easy', 0, 6),
(356, 1, 'Android apps are written mainly in:', 'C++', 'Java/Kotlin', 'Python', 'Swift', 'B', 'Easy', 0, 6),
(357, 2, 'Which folder stores images?', 'layout', 'drawable', 'values', 'menu', 'B', 'Easy', 0, 6),
(358, 1, 'ADB stands for:', 'Android Debug Bridge', 'Android Data Bridge', 'Application Debug Bridge', 'Android Device Bridge', 'A', 'Easy', 0, 6),
(359, 2, 'Which UI component shows a list?', 'ListView', 'TextView', 'Button', 'EditText', 'A', 'Easy', 0, 6),
(360, 1, 'Android supports which architecture?', 'MVC', 'MVVM', 'Both', 'None', 'C', 'Easy', 0, 6),
(361, 3, 'Which lifecycle method is called when activity becomes visible?', 'onCreate()', 'onStart()', 'onPause()', 'onDestroy()', 'B', 'Medium', 0, 6),
(362, 3, 'Implicit intent is used to:', 'Start internal activity', 'Call system apps', 'Start service', 'Access DB', 'B', 'Medium', 0, 6),
(363, 4, 'Service without UI is called:', 'Foreground service', 'Background service', 'Bound service', 'UI service', 'B', 'Medium', 0, 6),
(364, 4, 'Which component shares data between apps?', 'Activity', 'Service', 'Content Provider', 'Receiver', 'C', 'Medium', 0, 6),
(365, 5, 'SQLite runs on:', 'Server', 'Cloud', 'Client device', 'Web', 'C', 'Medium', 0, 6),
(366, 5, 'Which method inserts data into SQLite?', 'insert()', 'add()', 'push()', 'put()', 'A', 'Medium', 0, 6),
(367, 3, 'RecyclerView is better than ListView because:', 'Faster rendering', 'More memory', 'No adapter', 'No layout', 'A', 'Medium', 0, 6),
(368, 4, 'Bound service is connected using:', 'Intent', 'Binder', 'Thread', 'Receiver', 'B', 'Medium', 0, 6),
(369, 5, 'Cursor is used to:', 'Navigate result set', 'Store data', 'Update DB', 'Delete DB', 'A', 'Medium', 0, 6),
(370, 3, 'Fragment lifecycle is tied to:', 'Service', 'Activity', 'Application', 'Intent', 'B', 'Medium', 0, 6),
(371, 4, 'Which runs even if app is closed?', 'Activity', 'Service', 'Fragment', 'Layout', 'B', 'Medium', 0, 6),
(372, 5, 'Primary key in SQLite must be:', 'Unique', 'Nullable', 'Optional', 'Repeated', 'A', 'Medium', 0, 6),
(373, 3, 'Which method passes data between activities?', 'Intent Extras', 'SharedPref', 'SQLite', 'Service', 'A', 'Medium', 0, 6),
(374, 4, 'Broadcast can be sent using:', 'sendBroadcast()', 'sendIntent()', 'sendService()', 'sendUI()', 'A', 'Medium', 0, 6),
(375, 5, 'SharedPreferences store data in:', 'Tables', 'Key-value pairs', 'Files', 'Cloud', 'B', 'Medium', 0, 6),
(376, 3, 'Fragment improves:', 'UI reusability', 'Security', 'Network speed', 'Battery', 'A', 'Medium', 0, 6),
(377, 4, 'Foreground service requires:', 'Notification', 'Permission only', 'Activity', 'Database', 'A', 'Medium', 0, 6),
(378, 5, 'Which deletes SQLite data?', 'remove()', 'delete()', 'drop()', 'clear()', 'B', 'Medium', 0, 6),
(379, 3, 'onPause() is called when:', 'Activity ends', 'Partially visible', 'App starts', 'UI loads', 'B', 'Medium', 0, 6),
(380, 4, 'Content Provider URI identifies:', 'Table data', 'Component location', 'App ID', 'User', 'A', 'Medium', 0, 6),
(381, 6, 'SensorManager is used to:', 'Access sensors', 'Store data', 'Control UI', 'Manage services', 'A', 'Hard', 0, 6),
(382, 6, 'Which sensor measures acceleration?', 'Gyroscope', 'Accelerometer', 'Magnetometer', 'Proximity', 'B', 'Hard', 0, 6),
(383, 6, 'Location updates require:', 'GPS only', 'LocationManager', 'SQLite', 'Broadcast', 'B', 'Hard', 0, 6),
(384, 7, 'REST APIs usually communicate using:', 'SOAP', 'JSON', 'XML only', 'FTP', 'B', 'Hard', 0, 6),
(385, 7, 'Which library is used for networking?', 'Retrofit', 'SQLite', 'Room', 'Glide', 'A', 'Hard', 0, 6),
(386, 7, 'Firebase Realtime Database is:', 'SQL-based', 'NoSQL', 'File-based', 'Relational', 'B', 'Hard', 0, 6),
(387, 6, 'Which permission is needed for GPS?', 'ACCESS_FINE_LOCATION', 'INTERNET', 'LOCATION', 'MAP', 'A', 'Hard', 0, 6),
(388, 7, 'Push notifications use:', 'SMS', 'Firebase Cloud Messaging', 'Bluetooth', 'Socket', 'B', 'Hard', 0, 6),
(389, 6, 'Battery-efficient location uses:', 'GPS', 'Wi-Fi & Cell towers', 'Accelerometer', 'Camera', 'B', 'Hard', 0, 6),
(390, 7, 'JSON stands for:', 'Java Source Object Notation', 'JavaScript Object Notation', 'Java Serialized Object Network', 'None', 'B', 'Hard', 0, 6),
(391, 6, 'Which API tracks motion?', 'Sensor API', 'Location API', 'UI API', 'Media API', 'A', 'Hard', 0, 6),
(392, 7, 'Room database is:', 'Network DB', 'SQLite abstraction', 'Cloud DB', 'Server DB', 'B', 'Hard', 0, 6),
(393, 6, 'Geofencing is related to:', 'UI', 'Location boundary', 'Database', 'Security', 'B', 'Hard', 0, 6),
(394, 7, 'Which ensures background execution limits?', 'Doze Mode', 'SQLite', 'Intent', 'Layout', 'A', 'Hard', 0, 6),
(395, 6, 'Which sensor saves power?', 'GPS', 'Proximity', 'Camera', 'Microphone', 'B', 'Hard', 0, 6),
(396, 7, 'HTTP response code 200 means:', 'Error', 'Success', 'Redirect', 'Not Found', 'B', 'Hard', 0, 6),
(397, 6, 'LocationListener listens to:', 'Sensor changes', 'Location updates', 'UI events', 'DB changes', 'B', 'Hard', 0, 6),
(398, 7, 'Firebase Authentication supports:', 'Email, Phone, Google', 'Only Email', 'Only Phone', 'Only Admin', 'A', 'Hard', 0, 6),
(399, 6, 'Which handles long background tasks?', 'AsyncTask', 'Handler', 'Thread', 'Service', 'D', 'Hard', 0, 6),
(400, 7, 'MVVM improves:', 'Separation of concerns', 'Battery usage', 'Network speed', 'Security', 'A', 'Hard', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_subject`
--

CREATE TABLE `evaluation_subject` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_subject`
--

INSERT INTO `evaluation_subject` (`id`, `name`) VALUES
(1, 'Distributed Systems'),
(2, 'Applied Economics'),
(3, 'Advanced Java Programming'),
(4, 'Network Programming'),
(6, 'Mobile Programming');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `evaluation_attempt`
--
ALTER TABLE `evaluation_attempt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_attempt_student_id_cc5c04f2_fk_auth_user_id` (`student_id`),
  ADD KEY `evaluation_attempt_subject_id_a1b9edfd_fk_evaluation_subject_id` (`subject_id`);

--
-- Indexes for table `evaluation_question`
--
ALTER TABLE `evaluation_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_question_subject_id_ced0bc2e_fk_evaluation_subject_id` (`subject_id`);

--
-- Indexes for table `evaluation_subject`
--
ALTER TABLE `evaluation_subject`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `evaluation_attempt`
--
ALTER TABLE `evaluation_attempt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `evaluation_question`
--
ALTER TABLE `evaluation_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `evaluation_subject`
--
ALTER TABLE `evaluation_subject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `evaluation_attempt`
--
ALTER TABLE `evaluation_attempt`
  ADD CONSTRAINT `evaluation_attempt_student_id_cc5c04f2_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `evaluation_attempt_subject_id_a1b9edfd_fk_evaluation_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `evaluation_subject` (`id`);

--
-- Constraints for table `evaluation_question`
--
ALTER TABLE `evaluation_question`
  ADD CONSTRAINT `evaluation_question_subject_id_ced0bc2e_fk_evaluation_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `evaluation_subject` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
