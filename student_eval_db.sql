-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2025 at 04:55 PM
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
(1, 'pbkdf2_sha256$1200000$OLuSu6Wnw31iyK5xlnDOJ9$eMiaO0ZOsOMEzs9UFYnHzDIh019/THpm5h7K6nUsNug=', '2025-12-26 08:20:54.390169', 1, 'admin', '', '', '', 1, 1, '2025-12-23 14:40:36.744552');

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
(62, '2025-12-27 15:53:51.662168', '52', 'U5 | hard | Which method of calculating GD', 1, '[{\"added\": {}}]', 8, 1);

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
(19, 'sessions', '0001_initial', '2025-12-23 14:39:11.606823');

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
('9dcdc96ne6v4howvu7fmk5sy5a2i0rpn', '.eJxVjDEOgzAMAP_iuYrikATC2L1vQI5tGtoKJAJT1b9XSAztene6Nwy0b2XYq67DJNADwuWXZeKnzoeQB833xfAyb-uUzZGY01ZzW0Rf17P9GxSqBXpovaJjJYcxB-tdF9SydV1O0jUuekESS56djexbGkkih9SMqEkQI8HnC9G-N7Q:1vY3rU:SqYv9XTlJzA8EEDa1VIEvmeBvd0XXDiwxoXkzqwoGXs', '2026-01-06 14:59:44.586988'),
('wv5swc7eymcg1nxupfz1f407r3p638qj', '.eJxVjDEOwjAMRe-SGUXEaSHuyM4ZIsc2tEATqWknxN1RpA6w_vf-e5tI2zrGreoSJzGDcebwuyXip-YG5EH5XiyXvC5Tsk2xO632WkRfl939C4xUx_b2igDB912PwEEJJUBAJECXlAOcUHp1nuUmTomdpkQeEvgzuY5blMs8lxwrl0XNcPx8AdCUPkI:1vZVSP:cw_zpQukfbQcyiwOodVnVArxISsJMkfblnM8DFBz1yo', '2026-01-10 14:39:49.108719');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_attempt`
--

CREATE TABLE `evaluation_attempt` (
  `id` bigint(20) NOT NULL,
  `common_score` int(11) NOT NULL,
  `level_score` int(11) NOT NULL,
  `total_score` int(11) NOT NULL,
  `unit_breakdown` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`unit_breakdown`)),
  `preparedness_score` double NOT NULL,
  `improvement_rate` double NOT NULL,
  `trend` varchar(20) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_attempt`
--

INSERT INTO `evaluation_attempt` (`id`, `common_score`, `level_score`, `total_score`, `unit_breakdown`, `preparedness_score`, `improvement_rate`, `trend`, `timestamp`, `student_id`, `subject_id`) VALUES
(1, 0, 0, 0, '{\"1\": 0.0}', 0, 0, 'Stable', '2025-12-27 14:39:10.266474', 1, 1);

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
(3, 1, 'Communication in distributed systems occurs through:', 'Shared memory', 'Network messages', 'CPU', 'Cache', 'b', 'easy', 1, 1),
(4, 1, 'Which is an example of a distributed system?', 'Calculator', 'Standalone PC', 'Internet', 'Printer', 'c', 'easy', 1, 1),
(5, 1, 'Transparency in distributed systems means:', 'System is slow', 'Hidden system complexity', 'No security', 'No communication', 'b', 'easy', 1, 1),
(6, 1, 'A distributed system consists of:', 'Single computer', 'Multiple independent computers', 'One server', 'One client', 'b', 'easy', 1, 1),
(7, 1, 'The main goal of distributed systems is:', 'Data loss', 'Resource sharing', 'System failure', 'Program isolation', 'b', 'easy', 1, 1),
(8, 1, 'Which Android version introduced the Material Design language?', 'Gingerbread', 'Froyo', 'Lollipop', 'Eclair', 'c', 'easy', 0, 6),
(9, 1, 'Which file defines the visual structure of an Android User Interface?', '.java', '.xml', '.class', '.dex', 'b', 'easy', 0, 6),
(10, 1, 'Which of the following is the compiled Android code file?', '.java', '.exe', '.dex', '.obj', 'c', 'easy', 0, 6),
(11, 2, 'The R.java file is automatically generated by which tool?', 'aapt', 'abd', 'dvm', 'jdk', 'a', 'easy', 0, 6),
(12, 2, 'Which directory contains the string resources in an Android project?', 'res/layout', 'res/values', 'res/drawable', 'res/menu', 'b', 'easy', 0, 6),
(13, 3, 'Which layout displays items in a single column or single row?', 'LinearLayout', 'RelativeLayout', 'FrameLayout', 'ConstraintLayout', 'a', 'medium', 0, 6),
(14, 3, 'Which attribute is used to give weight/importance to a view inside a LinearLayout?', 'android:layout_weight', 'android:gravity', 'android:padding', 'android:layout_gravity', 'a', 'medium', 0, 6),
(15, 4, 'Which intent is used to open a web browser to a specific URL?', 'Explicit Intent', 'Implicit Intent', 'Internal Intent', 'Fixed Intent', 'b', 'medium', 0, 6),
(16, 4, 'The setContentView() method is usually called inside which lifecycle method?', 'onStart()', 'onCreate()', 'onResume()', 'onRestart()', 'b', 'medium', 0, 6),
(17, 4, 'Which widget is used to display a list of scrollable items provided by an Adapter?', 'ScrollView', 'ListView', 'GridView', 'TextView', 'b', 'medium', 0, 6),
(18, 5, 'Which method of SharedPreferences.Editor is used to save changes asynchronously?', 'apply()', 'commit()', 'save()', 'put()', 'a', 'hard', 0, 6),
(19, 6, 'Which SQL clause is used to filter results in a query() method?', 'GROUP BY', 'ORDER BY', 'WHERE', 'HAVING', 'c', 'hard', 0, 6),
(20, 7, 'A Service that is started by an Activity but continues to run even if the Activity is destroyed is called a:', 'Started Service', 'Bound Service', 'Intent Service', 'Foreground Service', 'a', 'hard', 0, 6),
(21, 7, 'Which method is used to send a custom broadcast message?', 'sendBroadcast(intent)', 'startBroadcast(intent)', 'registerReceiver()', 'transmit()', 'a', 'hard', 0, 6),
(22, 7, 'To access data from another application’s database, we use:', 'SQLiteOpenHelper', 'ContentResolver', 'SharedPreference', 'FileSystem', 'b', 'hard', 0, 6),
(23, 1, 'Which goal of Distributed Systems aims to hide the failure and recovery of a resource?', 'Openness', 'Fault Transparency', 'Scalability', 'Efficiency', 'b', 'easy', 0, 1),
(24, 1, 'In a layered architecture, which layer is responsible for the actual application logic?', 'User Interface layer', 'Processing layer', 'Data layer', 'Network layer', 'b', 'easy', 0, 1),
(25, 2, 'A \"Proxy\" in RPC is another name for the:', 'Client Stub', 'Server Stub', 'Dispatcher', 'Handler', 'a', 'easy', 0, 1),
(26, 2, 'Which communication model allows a sender to continue without waiting for a reply?', 'Asynchronous', 'Synchronous', 'Persistent', 'Transient', 'a', 'easy', 0, 1),
(27, 2, 'The \'Middleware\' in a distributed system lies between:', 'OS and Hardware', 'Applications and OS', 'Client and Server', 'Network and OS', 'b', 'easy', 0, 1),
(28, 3, 'In Lamport’s Logical Clock, if event A happens before event B, then:', 'C(A) < C(B)', 'C(A) > C(B)', 'C(A) = C(B)', 'C(A) = 0', 'a', 'medium', 0, 1),
(29, 3, 'Which election algorithm is based on the highest process ID (PID)?', 'Bully Algorithm', 'Ring Algorithm', 'Wireless Algorithm', 'Token Algorithm', 'a', 'medium', 0, 1),
(30, 4, 'In Mutual Exclusion, which algorithm requires a \"Token\" to enter the critical section?', 'Token Ring', 'Centralized', 'Distributed (Ricart-Agrawala)', 'Bully', 'a', 'medium', 0, 1),
(31, 4, 'Which consistency model requires that a \'write\' is seen by all processes before the next \'read\'?', 'Strict Consistency', 'Weak Consistency', 'Eventual Consistency', 'Client-centric', 'a', 'medium', 0, 1),
(32, 4, 'Which replication protocol uses a single primary node to coordinate all writes?', 'Primary-based protocol', 'Quorum-based protocol', 'Peer-to-peer protocol', 'Active replication', 'a', 'medium', 0, 1),
(33, 5, 'Which type of redundancy involves running multiple copies of a process simultaneously?', 'Active Replication', 'Passive Replication', 'Checkpointing', 'Rollback', 'a', 'hard', 0, 1),
(34, 5, 'A \"K-fault tolerant\" system can survive \'K\' faults if it has how many components (for fail-silent faults)?', 'K', 'K+1', '2K+1', '3K', 'b', 'hard', 0, 1),
(35, 6, 'In NFS (Network File System), what is used to identify a file uniquely?', 'File Handle', 'IP Address', 'Port Number', 'Sequence Number', 'a', 'hard', 0, 1),
(36, 6, 'Which security property ensures that only authorized parties can read a message?', 'Confidentiality', 'Integrity', 'Availability', 'Authentication', 'a', 'hard', 0, 1),
(37, 7, '\"Stateful\" file servers are better for:', 'Performance and locking', 'Simplicity', 'Reliability during crashes', 'Statelessness', 'a', 'hard', 0, 1),
(38, 1, 'Which definition of economics was given by Adam Smith?', 'Science of Wealth', 'Science of Welfare', 'Science of Scarcity', 'Science of Choice', 'a', 'easy', 0, 2),
(39, 1, 'If Demand curve is a horizontal straight line, elasticity is:', 'Perfectly Elastic', 'Perfectly Inelastic', 'Unitary', 'Inelastic', 'a', 'easy', 0, 2),
(40, 2, 'Which of the following is a determinant of supply?', 'Consumer Income', 'Cost of Production', 'Tastes', 'Fashion', 'b', 'easy', 0, 2),
(41, 2, 'Consumer Surplus is the difference between:', 'Willingness to pay and Actual price', 'TR and TC', 'Price and Utility', 'Supply and Demand', 'a', 'easy', 0, 2),
(42, 2, 'The slope of the Indifference Curve is called:', 'Marginal Rate of Substitution', 'Marginal Utility', 'Price Ratio', 'Opportunity Cost', 'a', 'easy', 0, 2),
(43, 3, 'Which law explains that adding more of a variable factor to a fixed factor eventually reduces output?', 'Law of Variable Proportions', 'Law of Returns to Scale', 'Law of Demand', 'Law of Supply', 'a', 'medium', 0, 2),
(44, 4, 'Economies of scale occur when:', 'Long-run average cost decreases', 'Short-run cost increases', 'Output decreases', 'Price increases', 'a', 'medium', 0, 2),
(45, 3, 'In which market does a firm face a downward-sloping demand curve?', 'Perfect Competition', 'Monopoly', 'Both A and B', 'Neither', 'b', 'medium', 0, 2),
(46, 3, 'A \"Natural Monopoly\" is usually the result of:', 'Huge economies of scale', 'Government license', 'Control over raw materials', 'Cartels', 'a', 'medium', 0, 2),
(47, 4, 'Selling the same product at different prices to different customers is:', 'Price Discrimination', 'Price Leadership', 'Dumping', 'Skimming', 'a', 'medium', 0, 2),
(48, 5, 'NNP fc (Net National Product at Factor Cost) is also known as:', 'National Income', 'Personal Income', 'Disposable Income', 'Gross Income', 'a', 'hard', 0, 2),
(49, 5, 'Which of the following is an \"Injection\" into the circular flow of income?', 'Savings', 'Taxes', 'Imports', 'Investment', 'd', 'hard', 0, 2),
(50, 5, 'The \"Paradox of Thrift\" suggests that if everyone tries to save more:', 'Total savings in the economy may fall', 'Economy grows faster', 'Prices fall', 'Investment doubles', 'a', 'hard', 0, 2),
(51, 5, 'Cost-push inflation is caused by:', 'Increase in wages or raw material prices', 'Increase in money supply', 'Increase in money supply', 'Decrease in taxes', 'a', 'hard', 0, 2),
(52, 5, 'Which method of calculating GDP adds up all the values added at each stage of production?', 'Product Method', 'Income Method', 'Expenditure Method', 'Value Method', 'a', 'hard', 0, 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `evaluation_attempt`
--
ALTER TABLE `evaluation_attempt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `evaluation_question`
--
ALTER TABLE `evaluation_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
