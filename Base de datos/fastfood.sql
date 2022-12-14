-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 05:05 PM
-- Server version: 10.4.24-MariaDB-log
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CocaCola', '2022-11-20 22:02:44', NULL),
(2, 'Jumex', '2022-11-20 22:02:44', NULL),
(3, 'Boing', '2022-11-20 22:02:44', NULL),
(4, 'Pepsi', '2022-11-20 22:02:44', NULL),
(5, 'Ciel', '2022-11-20 22:02:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', '2022-11-14 23:48:30', '2022-11-14 23:48:30'),
(2, 'Lunch', '2022-11-14 23:49:43', '2022-11-14 23:49:43'),
(3, 'Dinner', '2022-11-14 23:49:50', '2022-11-14 23:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `drinks`
--

CREATE TABLE `drinks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flavor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drinks`
--

INSERT INTO `drinks` (`id`, `name`, `price`, `description`, `image`, `quantity`, `size`, `flavor`, `created_at`, `updated_at`, `type_id`, `brand_id`) VALUES
(4, 'Boing Fresa', 18, 'The rich boing juice now in strawberry flavor', 'https://ibb.co/d49jbwD', 40, '354ml', 'Strawberry', '2022-11-15 05:46:34', '2022-11-15 05:46:34', 2, 3),
(5, 'Boing Guayaba', 18, 'The rich boing juice now with guava flavor', 'https://ibb.co/k3pXKXQ', 20, '354ml', 'Guava', '2022-11-15 05:48:03', '2022-11-15 05:48:03', 2, 3),
(6, 'Ciel natural', 15, 'Natural ciel water', 'https://ibb.co/zhk7ksj', 50, '355ml', 'Natural', '2022-11-15 05:49:41', '2022-11-15 05:49:41', 3, 5),
(7, 'Ciel coco frambuesa', 17, 'Coconut and raspberry flavored agua ciel, unique in the country for its special flavor.', 'https://ibb.co/wpXz4Z5', 42, '1L', 'Coconut raspberry', '2022-11-15 05:51:31', '2022-11-15 05:51:31', 3, 5),
(8, 'Jumex guayaba', 15, 'Delicious guava flavored jumex for any meal', 'https://ibb.co/hMk4zkR', 28, '335ml', 'Guava', '2022-11-15 05:53:48', '2022-11-15 05:53:48', 2, 2),
(9, 'Jumex mango', 16, 'Rich mango flavored jumex for any meal', 'https://ibb.co/RYck6T5', 12, '335ml', 'Mango', '2022-11-15 05:55:15', '2022-11-15 05:55:15', 2, 2),
(11, 'Boing mango', 18, 'Boing juice with rich mango flavor', '4PyIcbR8773KOgJ2.png', 33, '354ml', 'Mango', '2022-11-15 05:59:08', '2022-11-21 02:16:50', 2, 3),
(13, 'cerveza', 72, 'CXervez natural', 'qY7g8BaHt4IrKpTU.png', 1, '500ml', 'Manzana', '2022-12-14 21:47:41', '2022-12-14 21:47:41', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `drink_orders`
--

CREATE TABLE `drink_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `drink_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `job_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `last_name`, `phone`, `email`, `password`, `created_at`, `updated_at`, `job_id`) VALUES
(1, 'Andres', 'Cardenas', '4486587432', 'andres12e@gmail.com', 'andres13vo2vm', '2022-11-11 13:25:55', '2022-11-11 13:25:55', 3),
(2, 'Valeria', 'Zuñiga', '4496873210', 'valezu763ga@gmail.com', 'valerianiv39852', '2022-11-11 13:26:59', '2022-11-11 13:26:59', 3),
(3, 'Adrian', 'Jimenez', '4497459130', 'andresJ12@gmail.com', 'anM23i4vyb', '2022-11-11 16:21:28', '2022-11-11 16:21:28', 3),
(4, 'David', 'Rocha', '4497612094', 'darocha981@outlook.com', 'daro1398ucn1', '2022-11-11 16:22:24', '2022-11-11 16:22:24', 3),
(5, 'Georgina', 'Ramirez', '4490834323', 'gegoram234@outlook.es', 'gego12d861v2', '2022-11-11 16:23:07', '2022-11-11 16:23:07', 3),
(6, 'Ileana', 'Salas', '4497924531', 'ile34salas12@outlook.com', 'ilesai136cv1', '2022-11-11 16:24:59', '2022-11-11 16:24:59', 1),
(7, 'Alondra', 'Najera', '4499086457', 'alojera2348@gmail.com', 'aloqiu3v2', '2022-11-11 16:25:54', '2022-11-11 16:25:54', 2);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `calories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `price`, `calories`, `description`, `image`, `created_at`, `updated_at`, `category_id`, `type_id`) VALUES
(1, 'Burguer', 50, '295', 'Simple hamburger with a single meat patty with basic ingredients', 'https://ibb.co/cxX6ts6', '2022-11-15 07:05:15', '2022-12-14 21:44:03', 2, 2),
(2, 'Burguer 2', 60, '778', 'Double hamburger, containing two juicy beef patties with the basic ingredients', 'https://ibb.co/5M0D5pv', '2022-11-15 07:11:01', '2022-11-15 07:11:01', 2, 2),
(3, 'Burguer 3', 70, '1070', 'Triple burger, has three juicy, delicious beef patties with the basic ingredients', 'https://ibb.co/x5F8Gw4', '2022-11-15 07:15:28', '2022-11-15 07:15:28', 2, 2),
(4, 'Salad', 45, '350', 'Rich salad, for those who are not meat lovers.', 'https://ibb.co/j5Q54TZ', '2022-11-15 07:17:15', '2022-11-15 07:17:15', 2, 1),
(5, 'Hot Dog', 35, '300', 'Simple hot dog with basic ingredients ideal for those looking for a stable meal.', 'https://ibb.co/ZT9fRpp', '2022-11-15 07:21:58', '2022-11-15 07:21:58', 2, 2),
(6, 'Pizza Pepperoni', 120, '300', 'Simple hot dog with basic ingredients ideal for those looking for a stable meal.', 'https://ibb.co/zsw3t1t', '2022-11-15 08:21:41', '2022-11-15 08:21:41', 2, 2),
(7, 'Sandwichnumero2', 75, '352', '123132123', 'ABk4LugZIKZffUcT.jpg', '2022-11-15 08:28:35', '2022-11-21 00:34:03', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `food_orders`
--

CREATE TABLE `food_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `food_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '2022-11-11 13:25:28', '2022-11-11 13:25:28'),
(2, 'Receptionist', '2022-11-11 13:25:35', '2022-11-11 13:25:35'),
(3, 'Waiter', '2022-11-11 13:25:40', '2022-11-11 13:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(129, '2014_10_12_000000_create_users_table', 1),
(130, '2014_10_12_100000_create_password_resets_table', 1),
(131, '2019_08_19_000000_create_failed_jobs_table', 1),
(132, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(133, '2022_11_01_182427_create_employees_table', 1),
(134, '2022_11_01_182613_create_food_table', 1),
(135, '2022_11_01_182712_create_drinks_table', 1),
(136, '2022_11_01_182846_create_orders_table', 1),
(137, '2022_11_01_182954_create_jobs_table', 1),
(138, '2022_11_01_183033_create_categories_table', 1),
(139, '2022_11_01_183122_create_brands_table', 1),
(140, '2022_11_01_183214_create_type_drinks_table', 1),
(141, '2022_11_01_183248_create_type_foods_table', 1),
(142, '2022_11_01_183537_create_food_orders_table', 1),
(143, '2022_11_01_183659_create_drink_orders_table', 1),
(144, '2022_11_04_003314_update_employees_table', 1),
(145, '2022_11_04_004420_update_orders_table', 1),
(146, '2022_11_04_004955_update_drinks_table', 1),
(147, '2022_11_04_010448_update_foods_table', 1),
(148, '2022_11_09_132057_update_food_orders_table', 1),
(149, '2022_11_09_132240_update_drink_orders_table', 1),
(150, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(151, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(152, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(153, '2016_06_01_000004_create_oauth_clients_table', 2),
(154, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('015f06449049261e9f2b45727d8e1a8556ba279e1d716a4bffab2dad0092ba16aa11c745f36173b7', 13, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:49:20', '2022-12-08 23:49:20', '2023-12-08 17:49:20'),
('02d399edfad65342a9e460d1976ea050e9b207e934ddc47613bc06a1864ca6b6244e0a1348f9df9d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:39:00', '2022-12-10 02:39:00', '2023-12-09 20:39:00'),
('042306abfa8291fcc0a872c3079ddf93e03d79cb480c5b31107373c24e9d9f852f3b5dd66db84a50', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:10', '2022-12-09 00:03:10', '2023-12-08 18:03:10'),
('05ecbd9219c3486c5b9e08520a1516f65f632152d61e98fef2db77477ac822834af5ffc7c45f3eec', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:44', '2022-12-09 01:30:44', '2023-12-08 19:30:44'),
('063f2988e81bed54f3e4419d436d5706c1442a20d6137e4abdbb8618a51bd5ddd944ede8a95e17b5', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 03:07:41', '2022-12-10 03:07:41', '2023-12-09 21:07:41'),
('06d4d1b583cca79a6559fd5e99e85ddd7d5c7114654cbff46590c714110fe52b8cbb28b543f827d5', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:40:16', '2022-12-12 01:40:16', '2023-12-11 19:40:16'),
('0753e11ec73be3a1ed45733225ab87cb85bbf58e1fe0237f6f9de1c4db53a0e0ace77f93e0e4b593', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:10', '2022-12-09 01:31:10', '2023-12-08 19:31:10'),
('09e25397558ed40b9fde80eb01538129ab408c4cac43829a609ebb167d2096999e621356984dad7d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 12:15:50', '2022-12-10 12:15:50', '2023-12-10 06:15:50'),
('0a224c1c4f2c7758311f977b6d1c8e47716dc428ef0e0a3cb2338349600ae8d0ab0a9d49e10993b4', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 00:55:11', '2022-12-12 00:55:11', '2023-12-11 18:55:11'),
('0af034e1069283293d70f1b15cccef0f6dfd7eb16f4a239b1e56b361117c4bc61d1bcd2fd39ebd34', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:46', '2022-12-09 01:30:46', '2023-12-08 19:30:46'),
('0b2bceadfc42496336e54acf682c214686f9891e9b89e0483c4f584cf72314676226e756b49e1227', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 07:24:00', '2022-12-10 07:24:00', '2023-12-10 01:24:00'),
('0b840c15cf66aade9d657b2582f37276881068a70ea46ee6993ba425f317f0674a04bb763a8c7f60', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:30', '2022-12-09 00:03:30', '2023-12-08 18:03:30'),
('0e4d6fc660926a24490ab2dee66b1ed413afad068327f91a65232589e0f78c23f9e39285b084de2b', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:50:58', '2022-12-08 23:50:58', '2023-12-08 17:50:58'),
('11f738d8759db1cbdf058fb24b4d4dbfc9a29f7fa20b802eb3276b63cba6c57723acfde99f16c657', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:44', '2022-12-08 23:52:44', '2023-12-08 17:52:44'),
('12c864158ae2161c286caaf0d75a1fbf48c434760353dee3f89f3eb244e0dcd279a1ee315447fd1d', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:38', '2022-12-09 00:04:38', '2023-12-08 18:04:38'),
('1308ea211658609ee7e65e8908e8d6da83850d281f4eba96802713025b30331c4b33c73ba29fafb7', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:09', '2022-12-09 01:31:09', '2023-12-08 19:31:09'),
('14556bb5f1701b2337aa106d8c033fac6059d7c670e6af9b0ed7ae808722b02dd1564912eb3f76dc', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:06', '2022-12-09 00:03:06', '2023-12-08 18:03:06'),
('14ac912677f88b19093977c8cbb981135437ec23127de59282390859b727228914636301e4df5e09', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:21:59', '2022-12-09 00:21:59', '2023-12-08 18:21:59'),
('16c2bb3ae20890f2eb66ef7c4831537e8e99013c10ae9ade24501632b7d9b4a528909275557c1326', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 21:43:14', '2022-12-14 21:43:14', '2023-12-14 15:43:14'),
('1849aa30fb392d6d7e2f9fbd5245032cf647adf689b7bea7cbc652f55c811c84405e4f7fd2a64005', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:30', '2022-12-09 00:03:30', '2023-12-08 18:03:30'),
('1aedac22d1b354d7f54d6cdef0fe21a02ca590f6c2fa8d80dbcbd53e05da99dd4da5b45b1a70dcbe', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:07:46', '2022-12-12 01:07:46', '2023-12-11 19:07:46'),
('1bcff47758b14b4e91fdd542845918db230bf6177e82242a3a3caf9d572852f42fbd1fb5009ac799', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:45:41', '2022-12-10 05:45:41', '2023-12-09 23:45:41'),
('1d1f926ee1bdf981ebc07bba970e28f31ad2e46800cae990794b6f08d5e9f3559c1f6b44272f5f86', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:12', '2022-12-09 01:31:12', '2023-12-08 19:31:12'),
('1dde48b268ac58d6b6e15ff8aa47b5a867e6b3f4b8dfc4db3b90db4fec3273623bef4372df842cb2', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:57', '2022-12-09 01:30:57', '2023-12-08 19:30:57'),
('201b1113d231792c8ee878db5d98f5d951a822c22995caef0106f7285dfb022ccbfc8a4143f58e67', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:48', '2022-12-08 23:52:48', '2023-12-08 17:52:48'),
('204ab94e647df4029fa0b8146b5dadae9816e1a777956dcbede6aa5d49755f18bcd02dbe4b7ab8cd', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:13:39', '2022-12-12 01:13:39', '2023-12-11 19:13:39'),
('22702a9637d66f0ca8f77e9c676b0064ce2cd188d8ef7b2562390522bb8736130f208a54ab5fa0d4', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:10', '2022-12-09 01:31:10', '2023-12-08 19:31:10'),
('22731cbc23f16f952c2f44d2faf6353afbc95e915b8314d33fcecdf0141bbcc05ebeb5bedf2176b1', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:35:00', '2022-12-10 05:35:00', '2023-12-09 23:35:00'),
('23c9ebac23ed1f91d008fb30730f39921d830c3aa89212f647d83a7781bf4f7bf017c3d4e42d6684', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 03:28:59', '2022-12-10 03:28:59', '2023-12-09 21:28:59'),
('253124ad378e7c7610f7e21323799e1b4fae8842ed2e96dc190649809b4e11fa2c60f7ba34de1d5c', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:30', '2022-12-09 00:03:30', '2023-12-08 18:03:30'),
('2669f0116ef4a3fb8d58d19169dea26298ba153c6fe92742833ff8d9a78e37d95b33916b9be26f91', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:38', '2022-12-09 00:04:38', '2023-12-08 18:04:38'),
('268eef2b3d4e366daaf209bddd0cea82da1a4ebd00c566650441ebf023ef3a32067d3d6c5d5a63d1', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:21:11', '2022-12-09 00:21:11', '2023-12-08 18:21:11'),
('26fc2ab238970dce7e1b1557330c229de36f9a543937983513ac97dcf47357fe9a631398ddf8a62b', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:44', '2022-12-09 00:05:44', '2023-12-08 18:05:44'),
('27fd7ca4ff5722ba0bf9af1d4f0594ea2b7d7cfbe4a89fc144bae47fe4c0424cbe591fd2ea3e7d3b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:47:19', '2022-12-10 05:47:19', '2023-12-09 23:47:19'),
('2b0523eb401e30b923ecb429c2fb61770bf4c109b5e0a1a7e9b8a09cac195667d9813b95aa43c25c', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:09', '2022-12-09 01:31:09', '2023-12-08 19:31:09'),
('2c26909fe2b87538734834a9623ae68b344fcdb0133225d9588f1c37c3c07d4d6f2b1d485eba1712', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:30:34', '2022-12-09 00:30:34', '2023-12-08 18:30:34'),
('2d969e5842624aca73c7d619d03cfc7a3f8ca19dd63e9455c4250f88cb219f572bba6fba8d0f63b9', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:26', '2022-12-09 00:05:26', '2023-12-08 18:05:26'),
('2da5456ff0d8def973bbaeac1aeca987c9c45cdcdf2bc196271e629511d463e5f300f347d3651c29', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:02:58', '2022-12-09 00:02:58', '2023-12-08 18:02:58'),
('2eea15bf61a39bd2a258651d07245b452fbb4192ac8f7f7ffa9f3035fc99306c291a2066aaedbe01', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 01:52:56', '2022-12-10 01:52:56', '2023-12-09 19:52:56'),
('2f26987acc67f871e348775c6c9d78f69d3307041eef83398334294eacce57316913a621924ce47c', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:08:35', '2022-12-10 02:08:35', '2023-12-09 20:08:35'),
('2f57056a6a4157185bed0ef64f685fa617c313a94e1007a7255670ca6e680c4625e9455480761ae2', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:46', '2022-12-09 01:30:46', '2023-12-08 19:30:46'),
('2f6564816a457d0bd4b36cc21bec98e8d7b321f1c1a943cbfcae99d47edd51f324f2b06bfce5b50b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:45', '2022-12-09 01:30:45', '2023-12-08 19:30:45'),
('2fcf84e429e8c52257379d75cfd49adfb10b129fda943df1f4822f90b211c3c9016dae5be175623a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 01:50:34', '2022-12-10 01:50:34', '2023-12-09 19:50:34'),
('302ec4c823017505c7a003270100e2b95f0b679f66c33479c3d6b0a421130d0451645f6ace5ebf7c', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 00:25:09', '2022-12-12 00:25:09', '2023-12-11 18:25:09'),
('31a608d6a47e92f1cccc2e32be3f427bb00a4be876013d40a345e0cd903e52092ad58f07f0044eed', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:11', '2022-12-09 01:31:11', '2023-12-08 19:31:11'),
('322d12b775a6c9f0d6acb1f1e427319428fd5602a6730ef68332ca6ebf99f6389a25fda2db1e5a36', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:46', '2022-12-09 01:30:46', '2023-12-08 19:30:46'),
('34f390a70296360c930a4704719fea07461380e94b842fb2da047857838a3f118eadd181629d6594', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:47', '2022-12-09 01:30:47', '2023-12-08 19:30:47'),
('3736693cf1ae86189287bf2ddf072522c6ad82c8d0a7e939135b86b2adac63f06f9e6e3d62c7ced0', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:10', '2022-12-09 01:31:10', '2023-12-08 19:31:10'),
('378b36f44791b7ad7c471c387f6fd80b36c31b5b831a95b9d7d5b2b7475b864e02e0e847f8e862f1', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:41', '2022-12-08 23:52:41', '2023-12-08 17:52:41'),
('38755ea4a7cfaa87ad227110217eea7e01067645a206862471dc63f017934b4b657bba38bcd5420e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:19:37', '2022-12-12 01:19:37', '2023-12-11 19:19:37'),
('3931aa105e0c8290cfb297d899bf874f85e69bfa257d1a6754336214da1bab82c3002d9e1b6a932f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:12', '2022-12-09 01:31:12', '2023-12-08 19:31:12'),
('39a5b5c1f3d732fefb3eb43df6ca73673bf2e54b924ec242d4d84e7e6f6867ac17f28c0e9265f47c', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:19:03', '2022-12-09 00:19:03', '2023-12-08 18:19:03'),
('3af76c7f9be1d5df03e3a5f40bb784bdbad8732c7e024adb05ca751501b47247c4480c88355c68f5', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:44', '2022-12-09 00:05:44', '2023-12-08 18:05:44'),
('3bc56fa4ee7add822f35c406e27263de273dcfa74f9056989f77cc8c8a9dec6a656e91041327e31e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:11', '2022-12-09 01:32:11', '2023-12-08 19:32:11'),
('3c77d93ae9857e39127d4a9fa88ac92dbf92beae557ad0412427d0916c60157d11e20448b0b3bb0d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:45', '2022-12-09 01:30:46', '2023-12-08 19:30:45'),
('3cd6e343a9ce2dc4a1385d8855908e7b0ba3b98a8cc0e9153eb2519be8fc414633656f7bf8e2f722', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:47', '2022-12-08 23:52:48', '2023-12-08 17:52:47'),
('3e454371dda5b7cadc90030d7d32d9832ed38d954283d9e906a36ffa6ca0e697e8bbbb9c51dddf1b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:11', '2022-12-09 01:31:11', '2023-12-08 19:31:11'),
('3e8b73816e268b8637bf47246979987708431273ff5af9af1724d9cc8cf3d39e83b4bb93fcf57bef', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:11', '2022-12-09 00:03:11', '2023-12-08 18:03:11'),
('3f12ab320a6c2602744121dbc666e1bcd85d2a6e7fa424677cfb896c6962d386783aaeb23d888a92', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:11', '2022-12-09 01:30:11', '2023-12-08 19:30:11'),
('4091af41fe499d0bac27227066e715f80412e16037db5b3c0a4a9a8a301d960574818753eba4804b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:45', '2022-12-09 01:30:45', '2023-12-08 19:30:45'),
('417337b4f02b8e7ed688408447af54639f4aede59f070d9251e3648a27872bf10dbe04af32547618', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:54:28', '2022-12-10 05:54:28', '2023-12-09 23:54:28'),
('428fb595b59053f2bbbb2d7117d2799d4838595c3ffcf517f0f392ccce6f2baf137b44b997ae86e6', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:48:38', '2022-12-10 05:48:38', '2023-12-09 23:48:38'),
('433a582b8a9baff030a6eaf125cf625f9b1d95ca2ea8ecf0faae6a0be58c73b4db4dfe30cfcbd033', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:43', '2022-12-09 01:30:43', '2023-12-08 19:30:43'),
('43f967faaa34ee7cedc3365f96d913b84476d4d03bdec511e8bba7d365d66f2b766b55ffbf336f3a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:56:39', '2022-12-09 01:56:39', '2023-12-08 19:56:39'),
('4465832d9d0a42788774ae44c4cef1e17d27f514e16fc579335f1efda7a46dfeb4656a4f77135bbd', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:10', '2022-12-09 01:31:10', '2023-12-08 19:31:10'),
('453b96749c31edfb0a48d53689e7b5df970acba382e29498bfff63ddcf1ae0ee3742a546a9ec68ba', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 07:17:44', '2022-12-10 07:17:44', '2023-12-10 01:17:44'),
('4903660713a3749ff4c261c587df97ce70cbeaf72339dace6552500b7b87e41874fd0f648051d2e3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 07:10:40', '2022-12-10 07:10:40', '2023-12-10 01:10:40'),
('495a1aad662a746f88bf613f60fd93d1e5fd0a9859eb64bc48886401001e66313e9702753e19e4d2', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:12', '2022-12-09 01:32:12', '2023-12-08 19:32:12'),
('4975ef3347490444ce73b29325da2888190d0d93ae736605d98ab9ce229a3b01a1486b700fc47ee2', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:45', '2022-12-09 01:30:45', '2023-12-08 19:30:45'),
('4a1499c893104b793e6686ba768eb2c21a4da2794c1bdf656496f903c0378f649d1bfc97300d6f95', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 03:07:24', '2022-12-10 03:07:24', '2023-12-09 21:07:24'),
('4ae78ad312fb3dda0968c6d56e37ea31cd77fd4063ba218c0857518b94b8a2ac7b193c88d6962e6a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:18:48', '2022-12-12 01:18:48', '2023-12-11 19:18:48'),
('50fac94d7c72d906ff935e6c4684826208a92a6edf066f6a3a849ab0ed210f9abb1f71968f746772', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:50:58', '2022-12-08 23:50:58', '2023-12-08 17:50:58'),
('519ce8513270f8049856927b5f7bf0e8dd9dc84b0ac7eaa1fc13c01555e89cf1865f832cf7598b67', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:42', '2022-12-09 00:05:42', '2023-12-08 18:05:42'),
('52ae38534b4548ac781caac1302d5738991f0382d787191d2d9688e8ca264710741bb410cbbc3a20', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:43', '2022-12-09 00:05:43', '2023-12-08 18:05:43'),
('530dcbd047d60dc3325ea590084afe1c460d55e4727dea5b2a3665a53e6e98c4b5e670205cdd5313', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:10', '2022-12-09 00:03:10', '2023-12-08 18:03:10'),
('53a5345788d0ab0e667a012254c011bb61f0c7b1df39483fa30f3d287a45a53bcb2977beeeaa7d55', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 02:06:10', '2022-12-09 02:06:10', '2023-12-08 20:06:10'),
('55208113c2d71e2416b8280c05f30f8454df0e68d0a5e38d4233a26912137faf0a5680a6df19b83a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:11', '2022-12-09 01:31:11', '2023-12-08 19:31:11'),
('561480688f8ae611c8987866ef9dd329cba3695ed02de7c41b22cac5f616282121b1ae8882e8ca30', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:42', '2022-12-09 00:05:42', '2023-12-08 18:05:42'),
('56d9df4c5d721b8fb12e5bc25e095050e7e9762b7dee0b09da628fce0739da8079c824bb152ef11e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:34:27', '2022-12-12 01:34:28', '2023-12-11 19:34:27'),
('56fa5c79e226dd1863abfb6a896d374265ebd0ffac45fa636681aff568f26cb992aefa599e1b4f2e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 07:17:27', '2022-12-10 07:17:27', '2023-12-10 01:17:27'),
('5ab325725896a6b271c844e5a43ff134461d3b4ab00a412f669f6a32fbd56016d8f09cabef9a7c4b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:46:35', '2022-12-10 05:46:35', '2023-12-09 23:46:35'),
('5cda0d980ff74b5d869c80b5bdb7bc26a4bacae0a535b9d2dd5b063d9bfa8381ad1dc80c2d34bbc0', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:44', '2022-12-08 23:52:44', '2023-12-08 17:52:44'),
('5d2d76ffb4460024884dcf144cbe3135d4787a382b52c7daf1720d06e35c5f2b29ba1dd22304f1ed', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:16:08', '2022-12-12 01:16:08', '2023-12-11 19:16:08'),
('5fe43d259189d14b9021f9fd23069ddf3cc1154b32fcd799a7bac76e8e6507bc4b5925fe7959ebf4', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:27:09', '2022-12-08 23:27:09', '2023-12-08 17:27:09'),
('60f7bde8ada35ccb7badf1f4f076facfd2ca848ee24a5e834c6853129c32b1b321e726befc0388fd', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:29:49', '2022-12-10 02:29:49', '2023-12-09 20:29:49'),
('62d3ad1751cbadfd4d9d6828ace78f82985aa61b6bd83cb20ca2908b398c45c766000f2c01ef74fe', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 06:16:42', '2022-12-10 06:16:42', '2023-12-10 00:16:42'),
('645dd648f235be8f83bb0e5f707ba7c786a4ab694bb5273ea3f3d4a80af59ab6a2fa41fc8e8123bb', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:14:40', '2022-12-09 00:14:40', '2023-12-08 18:14:40'),
('66faecb71207e67e22e22f9b2d5198b3daa40ec73fcc324319cd04a7c0938123b781a0eb9d9c8fc9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:40:51', '2022-12-12 01:40:51', '2023-12-11 19:40:51'),
('672b8a2979026ad47ecb0c3a8c29d7415140312cf27fb518bf5ff67ec45e058886559f48fa51f542', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 02:24:55', '2022-12-12 02:24:55', '2023-12-11 20:24:55'),
('67a66748244543407595f4e8bc57c1c66c71bf11f73bf0e25f823c34933a1c549ad214e95839cfb2', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:29', '2022-12-09 00:03:29', '2023-12-08 18:03:29'),
('6800cf529a7eca25b0b570e0f6e5f3c32177bc16b408db691c0e232d08afc7d09c7743ce936eac1e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 07:16:06', '2022-12-10 07:16:06', '2023-12-10 01:16:06'),
('697620f0b84b1f054445e91baa0b8a87b9a8f0c93ce9af6d09bff013d82ca828f57319a99d39fca1', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:54', '2022-12-08 23:52:54', '2023-12-08 17:52:54'),
('6ac85f7402e34ca3cb60953dfe07c42738147cb49d42f76035a245c01bfa7c6709a7f480cf561a7f', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:06:09', '2022-12-09 00:06:09', '2023-12-08 18:06:09'),
('6b33dfcb372fb427ec6f53dd09208d0c1c78e60445bfb304dcc0c11a88a6ba5584171892c8d443fb', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:41', '2022-12-09 00:05:41', '2023-12-08 18:05:41'),
('6ba5314c867151d6a89904af80f62a644064f1cea2708f1cf81f54900ef88463c3944b17837b5467', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:27:02', '2022-12-12 01:27:02', '2023-12-11 19:27:02'),
('6bab20ff30abeac15af8dd4a003a58ff617976eac09ba3be22cfe013156d7234b322da7846d0306f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:05:54', '2022-12-10 02:05:54', '2023-12-09 20:05:54'),
('6bdb2985af7d1c48798ff1709ece518cb38ff03aecd8b4536d647baf7a6c6985c8139bed1c537b84', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:39', '2022-12-09 00:04:39', '2023-12-08 18:04:39'),
('6cea5f6ded0922923b0302a4ac8296ff9fd48a6139b5f57c6a2ee425ed4450f69dbd6874c4cd214f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:26', '2022-12-09 01:30:26', '2023-12-08 19:30:26'),
('7296e5a741546f80edf9747090a1314d5d79e57d415ce515d3aee7decc84fc00428fb67e05bf2227', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:10', '2022-12-09 01:32:10', '2023-12-08 19:32:10'),
('734f0795f1e5c6db5f23b8f44112831311477255934d4d7d279ba6f280cd4f41300550d704245645', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:50:46', '2022-12-08 23:50:46', '2023-12-08 17:50:46'),
('73558e6024df6fa96130521747489f4b725878d4ac5b6acfd2e678132cb4d0b545ed124b984ad14f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:17:00', '2022-12-12 01:17:00', '2023-12-11 19:17:00'),
('73f90f97b68042e0e8cb4f275f3b0b7c1d5fed5247cec02f4b7222d912af1084bea5c721dbe9dacf', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:50:58', '2022-12-08 23:50:58', '2023-12-08 17:50:58'),
('74d2b0453c7f1568a9cdf9fa9112ec76e15a9195eceed22a8f2c6477ec834a3ef6cda56296b5b005', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:39', '2022-12-09 00:04:39', '2023-12-08 18:04:39'),
('75d69621fed7d2c1e45a9db438cd2743ceb489e32a6166a955327e8794ae274b67fdcf3e74fbf0bf', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:38', '2022-12-09 00:04:38', '2023-12-08 18:04:38'),
('77313797463851c895efb6f6da735e08533a5dfb1e49f2e47ebe7d343a459e970e5299f803b899fb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:00:03', '2022-12-10 02:00:03', '2023-12-09 20:00:03'),
('78d6f00e30b8e172b8dd36b4b61bdcd97c0b882c4854250f2ecf26540e3e9c1715f7bb3e976d1733', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:10', '2022-12-09 01:31:10', '2023-12-08 19:31:10'),
('79179ffd5d274d6b3b8b4769123a6182c2d1b62d619a82492b8e4584bf00a2bba906feb9745bcb15', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:39', '2022-12-09 00:04:39', '2023-12-08 18:04:39'),
('798bf199d757f1123a0c69f250ea43cb1589030a5b5a35365bbb58239458c65457f5091dfe19b3e9', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:42', '2022-12-09 00:05:42', '2023-12-08 18:05:42'),
('79fcd2d1ec95877a3b6ad2f7f68f1c8bfbf828aff370ade84b42a6f51e809d30dac459eb8ff8c48a', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:10', '2022-12-09 00:03:10', '2023-12-08 18:03:10'),
('7a0da6a25aa2e4170b5f644286e46e073573c85c7a34377b5230652b06937a57836d5a443a0ca4b4', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:36', '2022-12-09 00:05:36', '2023-12-08 18:05:36'),
('7c36ce0225573fff1c69755f27f139b33878552784dc03ea3a95f765357f57a43a8c62d51831918f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 00:35:41', '2022-12-12 00:35:41', '2023-12-11 18:35:41'),
('7d88d2c01153fea1beed7d2825ae95ae48e3278039de90dfb7d20d07240d1a5b26510d3e510b4df9', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:17:06', '2022-12-09 01:17:06', '2023-12-08 19:17:06'),
('7ec87c3d47fb76d549b3b50952cefae7429c732e3ab279ecf0cc8c2c06e9143aaeb4de69d77e2b66', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:47:58', '2022-12-12 01:47:58', '2023-12-11 19:47:58'),
('7edbb85005063615846b08e8be4d04952db286b836783bd33af7e6e318f4cbc1adeb798b49ee42ee', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:24', '2022-12-09 00:04:24', '2023-12-08 18:04:24'),
('8030ed6f2b40551e687df9606268915f8b4c44bdf5c18cbbd197e7b7de6d0bc42aeb1bdcfcd50bd3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:11', '2022-12-09 01:32:11', '2023-12-08 19:32:11'),
('816357bf7b7973d3c6a90550167886dc6138bdfd6675aaf3edcb49cbf5f5b9771ae4e8e88c4d1587', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:48', '2022-12-08 23:52:48', '2023-12-08 17:52:48'),
('816d5781cc1e54f84162410a78338f6770bcb4e8fa2f260dc7671d27f474df900181ef06de6e1444', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 03:21:46', '2022-12-10 03:21:46', '2023-12-09 21:21:46'),
('82247302fc783d2d27ba798a44270a6acb6f43c8c56f230ebcccea58694dbfc72d8dcbba0ddc046a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 06:40:05', '2022-12-10 06:40:05', '2023-12-10 00:40:05'),
('83a304b8094d9b2e6e6f4a82725c4020683be91cb98b4ec986665b426e59e402c8a6d96d343b1c61', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 00:36:29', '2022-12-12 00:36:29', '2023-12-11 18:36:29'),
('83b7f4004b50933a6a445dd284cb4d179977ee70fddfa355e9e417c508b74d875fa3dd7bc92f517b', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:46', '2022-12-08 23:52:46', '2023-12-08 17:52:46'),
('83d6b139df0d53b1ccfb95cea1da728f5e8adc187ed97369881d03d6f443d9973a7b65da88696c24', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:44', '2022-12-09 01:30:44', '2023-12-08 19:30:44'),
('84445fe0293da85e3a6da859ed89f9b3d55e9e166cea0ada4b09da5a27fa741a884681cb2196ba07', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:44', '2022-12-09 01:30:44', '2023-12-08 19:30:44'),
('844c6f81d1a372b5e609ac438c04cb335b7be7f26cc874df8ec2ba8732c205f48aab92a94a59198a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 03:08:22', '2022-12-10 03:08:22', '2023-12-09 21:08:22'),
('845f234b95d6ebc041ab1ff9b7415d1cf26daa51c363a23c9460b1336fbab9b730d03bbc0dbc2a2a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:12', '2022-12-09 01:31:12', '2023-12-08 19:31:12'),
('853bf6cc2bab665d0281033ccf5aa6c6373ff9839b1eb9908c3e3fc452178f7bdfeace1df85b6756', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:51:49', '2022-12-09 01:51:49', '2023-12-08 19:51:49'),
('85cfb4f7b0d62647d3b7e149979aae010d44e17a53b5f3b638e2999cf7e4d4882e77a21a4cfb345e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:45', '2022-12-09 01:30:45', '2023-12-08 19:30:45'),
('8aec2fb8a1f417470a51ffeb6c60089a4912174522f495cbb2ce9341d630135e13cbba61610223c0', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:42', '2022-12-09 00:05:42', '2023-12-08 18:05:42'),
('902ea8fbaf892425ed11face5c4c875ac37bfde0485b61a3a3a8f533949a82d3addee6b38f1270e8', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:43', '2022-12-09 00:05:43', '2023-12-08 18:05:43'),
('90d9a548d9f5adb30db6c1c653d0d1c619a5a118b0788d7a7938276b84d0e94221f73ca5036e6e40', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:43', '2022-12-09 00:05:43', '2023-12-08 18:05:43'),
('913b4c20eb4bacc24564465e5d58cf4768b1009df6e7e090fff547db6854d44f17fb3e79bfcd445c', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:39:36', '2022-12-10 05:39:36', '2023-12-09 23:39:36'),
('92b6b2a78d17e99e02536e68377644bcf3f23051dec78d0eb983ca6cff876d7735e71f50780d2e5b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:27:59', '2022-12-10 02:27:59', '2023-12-09 20:27:59'),
('92ed51e31b4159082fb6b8329827e5055817df0b167aaaaff4dae4aa456d120a34fe4702bd814769', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:11', '2022-12-09 01:32:11', '2023-12-08 19:32:11'),
('92fcb8808155db9b2712306faa5ab7ea440403a27b82a82d976618d2f80490a934a67e69ac9abeab', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:33:37', '2022-12-09 01:33:37', '2023-12-08 19:33:37'),
('9302f68fc7d9dc8b67f2b99bf9bb6a8ab9759f8a0c879179ad59258cd1fb366a8816980c5ae21256', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:11', '2022-12-09 01:32:11', '2023-12-08 19:32:11'),
('95f7f731d5d1f4db40ff0410e9bcc6adcf3a59e4986818e3d7164addfdbd969d92bd84ab8b7439b8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 00:59:18', '2022-12-10 00:59:18', '2023-12-09 18:59:18'),
('961782a6a718b6186dd3d0670613e346a51ea35c8fb0b593b8c3a5146eb827f6c47428c4826d8ccf', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:27:25', '2022-12-08 23:27:25', '2023-12-08 17:27:25'),
('9705ee2d14141308eb243329e90539bb1dc0aac7884e47b6d632f4ec25218199b82dd1f50d8dd640', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:11', '2022-12-09 01:32:11', '2023-12-08 19:32:11'),
('9994a65c173210f7f93afe136986369297fec1ecddc701a36a52b784b4cad5dc2ff2997a312052b0', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:30:44', '2022-12-10 02:30:44', '2023-12-09 20:30:44'),
('9be3ab9dd51032b873a5eace04fef46ad529ca4cee838cb8f8dcc0143b208087e730a7703f812f8d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:44', '2022-12-09 01:30:44', '2023-12-08 19:30:44'),
('9de0f5bea6c6e570842ce35d1b24e429a3aa8749d43091fff38aa54a2ac7df51c722878a4892cae0', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:45', '2022-12-09 01:30:45', '2023-12-08 19:30:45'),
('9ec3766a906ec4edcaee0a3e13ebd237b3a5bda7bfce795c629f3c22b7d5e9ddd7ac5d2e8193e3b5', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:12', '2022-12-09 01:32:12', '2023-12-08 19:32:12'),
('9f93cce9da45801f514c7c3edc431e10f4e4b353ffe483200accd4b4e441abe375b81d7e6a57a042', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:29:52', '2022-12-09 00:29:52', '2023-12-08 18:29:52'),
('a143875bb0a36d53982965e16b2b9f209bc57a7c97080deb53035e556c4f10ff902d4d4493580098', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:43', '2022-12-09 00:05:43', '2023-12-08 18:05:43'),
('a3bcc3a565b8bd53fc781361955309367d4d3e4afe1d17a87095cba96a3d1b703a7ff5e0921513ad', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:43', '2022-12-09 00:05:44', '2023-12-08 18:05:43'),
('a5c23707d2f03a42b9e490f32df273a16bdeeda00801aa3f577483908ab623a5a3a933fb98d37385', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:09', '2022-12-09 01:31:09', '2023-12-08 19:31:09'),
('a638b643fca7dac4ad085b32e48501e24d075ff6ab28d39474f7fda1873e2d1cad26922d45703c47', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:24:05', '2022-12-12 01:24:05', '2023-12-11 19:24:05'),
('a8659d091a4218af04a4bbe0eec4477e64c06f949f2146bc9a83e0d8cb28e1257130c43eab3defa8', 12, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:45:44', '2022-12-08 23:45:44', '2023-12-08 17:45:44'),
('a86a48917d8ffa86c2bd7c0f0793bc116d25756a631060452a1b57d71b314013d8ae8e7b65a9d692', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:38', '2022-12-09 00:04:38', '2023-12-08 18:04:38'),
('a8851f2a2bdfe9592408f7dc16e683ac16b58c05a55fd66e5ddb3c32cc75269fed53f482f4cdb7eb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:59', '2022-12-09 01:30:59', '2023-12-08 19:30:59'),
('a99f670563b9b3962f0bd74cb6d47fa64ca5e9a3c4c9060dfeb6a66f07d6405a59d8c02aea5218f7', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:12', '2022-12-09 01:32:12', '2023-12-08 19:32:12'),
('a9a1e16ffd3bca1b40dd8bc6150c0ef09738c8a4767b0c0a5ad6832f70fbbd1f0e03c68d294d75ab', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:11', '2022-12-09 01:31:11', '2023-12-08 19:31:11'),
('a9d121feb80a6af5ff6797fe7e1586011f6e86be3c4717d5f26be4cf43974b9a50dd1da477558c1e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:10', '2022-12-09 01:32:10', '2023-12-08 19:32:10'),
('ab6ef227984928d362c42ec05ee68103c8f9cafbeecdfdb4d94183c38df9c79248d05aae167a0080', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 02:27:07', '2022-12-12 02:27:07', '2023-12-11 20:27:07'),
('acb46043f088db2fc0439c9f2f6cb4835efd2098f31dd85bda0d8dcecf946c45dff98e5c64a0d321', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:10', '2022-12-09 01:31:10', '2023-12-08 19:31:10'),
('ad34228fa9c1a81d24d427f4548340190c267339061cae03e3b169b545f0dcccc246a59b9bb2d9aa', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:29', '2022-12-09 00:03:29', '2023-12-08 18:03:29'),
('addfdf22e23a9339821c05ddb1d5693cb5501e0d6566c642c5082d74b6a270d93884ddf162b42b62', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:08:37', '2022-12-09 00:08:37', '2023-12-08 18:08:37'),
('af4b5fdb3ff7f655db063767865d4ceff35fdf192215c49d398aefbdde11dd1e449ed15518a7d91b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 12:01:03', '2022-12-10 12:01:03', '2023-12-10 06:01:03'),
('af69e0cf16bb60891f1905035c60748f87a95e68d179a42037a2c134171168d698083ab6c0654338', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:48', '2022-12-08 23:52:48', '2023-12-08 17:52:48'),
('af6c17499ae430d11f7d51407be029f79442cc5ec9105796a30d8de1975f8bebf118c90ab65d1efd', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:44', '2022-12-09 01:30:44', '2023-12-08 19:30:44'),
('b09a10555ebe976af3fa707741ef568bd4778264f4906cce90c62e72441bed29e6509f5299413399', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:12', '2022-12-09 01:31:12', '2023-12-08 19:31:12'),
('b2f40389478188d92400839f34386cb96f4e0189aed3416958ad4af6d5b9e77dcaea9e13f20edb17', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:14:30', '2022-12-12 01:14:30', '2023-12-11 19:14:30'),
('b39953c5897409edcf1b12d616366846ec75e6e9cb8ba41149139f545e8d655ae88f8eb2d2a92c81', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 07:01:47', '2022-12-10 07:01:47', '2023-12-10 01:01:47'),
('b63cdc28014c835dded3b65b3e2eaec0ce0044455303c57c844eb56d8df628a495c7a523750ca992', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:10', '2022-12-09 01:31:11', '2023-12-08 19:31:10'),
('b6aa4f9b47e9e4641f6b86e1bcfcadaef4fadcd6491b8d1e4966270b4fcbde3dcf1d2712937b4608', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 06:01:07', '2022-12-10 06:01:07', '2023-12-10 00:01:07'),
('b8439ba3bbeb2b877e5c205dd7c193ad905c9d6752f5efc484fa089e92fa20be44615ed49680c089', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:49:23', '2022-12-09 01:49:23', '2023-12-08 19:49:23'),
('b90b2fa53fc45047097f6820c4e8748116c8aedcf247b75742b7503ef9367a6eb3f119884159ca32', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:00', '2022-12-09 01:31:00', '2023-12-08 19:31:00'),
('b9dd0741566ec8b10f653c4c5ec7e39d8fc127b3a562ed68b3e11e3268a7bd40920cbd0adcc30aed', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:23:31', '2022-12-12 01:23:31', '2023-12-11 19:23:31'),
('ba11ba0e1dec14d33e486d3ecf38dc8181b726574091a7579955e3b92201a5167a527bdc67692f9d', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:39', '2022-12-09 00:04:39', '2023-12-08 18:04:39'),
('ba73b5658dc3fad029b140cb3872931b7b2edc100637ced8770b0c8dc62b7bb98d7e3859628a29ce', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:47', '2022-12-09 01:30:47', '2023-12-08 19:30:47'),
('bbc1aad811abdef6ea898fce72fdf4934da93bb641d9b397c490e9a2d3e91479b85afba4658fffbf', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:10', '2022-12-09 01:32:10', '2023-12-08 19:32:10'),
('bc5aa429310a535735a0cb9666a184c48ac0f80752ccdf908c5e05768b8ac771e2f01eda83399bab', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:16:02', '2022-12-09 00:16:02', '2023-12-08 18:16:02'),
('bcbc5f47c1125d15f9b1cc000d6ba998605133eeb6c2dcce0d76a21d11fd88b538dc98ef7eace8da', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 12:00:49', '2022-12-10 12:00:49', '2023-12-10 06:00:49'),
('bcf26b52a69ca1a7d2b20cc68085140626cc23c0cec6996abcf9e8bb0a3608fbc09b46bad4f66a9d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:28:28', '2022-12-10 02:28:28', '2023-12-09 20:28:28'),
('bdda2c0410d882a30df33d2bf3f239a9dca1d26ad9656bdb85bdb26a8d74d810dc4dbd5f0783a5a0', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:47', '2022-12-08 23:52:47', '2023-12-08 17:52:47'),
('be64f721abb9f3937cb706f08f6dacb3b439940e6ce9f1d201cd856d9c576af71277031d023bb10a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:18:16', '2022-12-10 02:18:16', '2023-12-09 20:18:16'),
('c23149fcdcdc05110a3d18c43f595b70fd8efb4e4b39e1cb52376219ffaaa954dd8eb86d8e8155a8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:55:26', '2022-12-10 05:55:26', '2023-12-09 23:55:26'),
('c2c91929cd6df8f1b404dc24b7683d7d467c25a89bb67a4ec1bca83125853e7b72582c394551af47', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 00:40:47', '2022-12-12 00:40:47', '2023-12-11 18:40:47'),
('c6199f497adf237d2f1e637fb950c0cdb23ab370e0d052e87ae799a946da20ede6bf067b557e9c1c', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:22:10', '2022-12-09 00:22:10', '2023-12-08 18:22:10'),
('c75e5e4816ef3a807517d0ed95fd92f88258102eb92d838d69c96325b9e35a5e8e93642916c1e3ba', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 02:05:48', '2022-12-09 02:05:49', '2023-12-08 20:05:48'),
('c790f66663d856b48eb132a3b3210accadf9f4500d1a7418f2d039a6248129ee39e96e4c107e835f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:17:48', '2022-12-12 01:17:48', '2023-12-11 19:17:48'),
('ca384fe3ca9de3a667011c2d4a44acccfd7788a18b328b273cdfa36140965ff5d24520c940f7b0f4', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:05', '2022-12-09 00:03:05', '2023-12-08 18:03:05'),
('ca611849451395486874683697c6e9697d54db7bd00c8a38cc591b911482b32ed34c895d87f9a17f', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:10', '2022-12-09 00:03:10', '2023-12-08 18:03:10'),
('cb0a6bdb693f1978ece6d720e574fffebb0e2993831070077c352c34ca6fcc3946fea9d895f26ff7', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:42', '2022-12-09 00:05:42', '2023-12-08 18:05:42'),
('cd211d6b3893f7114987ddc6bd0f1408690d7552944a420c5df349a4c7786903a0a0a173f1e19637', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:12', '2022-12-09 01:32:12', '2023-12-08 19:32:12'),
('cf1c0d3a4137fdd4322afcf441a112ac0aaf4ede9542abb3d17281e41d5d5015a3a7c145cdd62284', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:42:19', '2022-12-12 01:42:19', '2023-12-11 19:42:19'),
('d18ff8a181bd91108aa8c01aa2015bbb5f861ba0ef7221358cb1899107c2352be09cdd9f63cbe8df', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:28:44', '2022-12-12 01:28:44', '2023-12-11 19:28:44'),
('d3d5bfcf67e086e6815c8cb844cdaa3260f69555bd56688e4e0fb828c8bf83ff77f8d7221af397bb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 06:01:32', '2022-12-10 06:01:32', '2023-12-10 00:01:32'),
('d4b0eb45477225dd750ed0acfb0d2a0006616f770688ff2470c26c3e1e7046a3075002c8ce7a505e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:09', '2022-12-09 01:31:09', '2023-12-08 19:31:09'),
('d4fa424de69bea1d4c6a0950f70eb01fa08154c0a196812de15b78e4bc7710e69831f86fe4e971ad', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:05:43', '2022-12-09 00:05:43', '2023-12-08 18:05:43'),
('d534eb4b9ad0f4832d5fd5bb3d6eff101bed43ea85655b3ecfdd23e94521b420a13285c9cc6bebe1', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:11', '2022-12-09 01:32:12', '2023-12-08 19:32:11'),
('d6966352a638cb7cb193612b7ba07f0c7c43f253418d25714d9299e8ce3e8a88bd5cfc83a9f2131f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:44', '2022-12-09 01:30:44', '2023-12-08 19:30:44'),
('d75d5a8590d005f8d4cecef50ba4d0b7f86befe59644f8b5ceb992e59647c77d85a6f8aadb459ec1', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 07:17:27', '2022-12-10 07:17:27', '2023-12-10 01:17:27'),
('d84ccb229d320e86bab416c154440d228f4af4763555ce427920445ed84c91f95500c4e90b90bdf8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:38:56', '2022-12-10 05:38:56', '2023-12-09 23:38:56'),
('d87fe6a35c1c96199048de8ca2ed48a87cd26e100f713d6cb5021f1176855691967e87ca9d23391c', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:37', '2022-12-09 00:04:37', '2023-12-08 18:04:37'),
('d8c80a42cba8e2fc1938d946fb131a7da0ac97a264ba942f3075cc96446660d94f2c2bfeb78d0d97', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:48', '2022-12-08 23:52:48', '2023-12-08 17:52:48'),
('da986585b07a516e3c6bfa4eaf958602b8f40277f872dd47cbaebd7ad510c1d79afe005888ee24c8', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:53', '2022-12-08 23:52:53', '2023-12-08 17:52:53'),
('dc2a085a79c3c370367776ab780ab4e4a7a48d2cb1df7d958859557777fcefe75cbc610e012cfdf9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:25:40', '2022-12-12 01:25:40', '2023-12-11 19:25:40'),
('dd6bf790b6234f6ec1cc6ffc419d75700f3c1b709abbcd9bf4ba164d606df1b8d414e8783e049791', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 12:13:19', '2022-12-10 12:13:19', '2023-12-10 06:13:19'),
('dda39fb66805f723b76dd318788b3bc1d65f77e01935342a107dbde2dcdcda0a0e72f7672c9d1cef', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 00:39:33', '2022-12-12 00:39:33', '2023-12-11 18:39:33'),
('ddde8c03d180cd10fd1f2297eecefb7dce42d716b81ad2f9582e8fd69e13bbe8321c3f5f9c2e5f8a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:44', '2022-12-09 01:30:44', '2023-12-08 19:30:44'),
('dee321d5afcf0a8948ea9305da8f6dba0e6a0e0fdcf6479247e0fcb7162882f432d1093ae95e5c0e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:44', '2022-12-09 01:30:45', '2023-12-08 19:30:44'),
('dfebc505e25dff4386b0f323532027a06924806b0b86150b5212240cd5fba5d0bdaff69aa420aebe', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:47', '2022-12-08 23:52:47', '2023-12-08 17:52:47'),
('e00fa99f4635326343f936bb2cb9e424f21eed892728de28768fe45ac1e46caa88caca69163ab29e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:35:37', '2022-12-09 01:35:37', '2023-12-08 19:35:37'),
('e25882dd70471f874f0531ff063fc8f8e892cffbcea01641ab35864dc6a5aea5742353cf201a721f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 01:50:34', '2022-12-10 01:50:34', '2023-12-09 19:50:34'),
('e3378800f888e68ebe8a7db7fbafd9fd20ebc983d1ea254f5d4b03d2d978d238d6757f020f411715', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:47', '2022-12-08 23:52:47', '2023-12-08 17:52:47'),
('e4f40aaed2af31a3c76743d3bd31a8f8394863b5290f8d764fe3e6706c7bb95b1f064745b1794d27', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 00:58:50', '2022-12-10 00:58:50', '2023-12-09 18:58:50'),
('e6120e3fc40fb0aebba7264d70ce56ee5a3e4fad04340fd1104d72dfcb92655ecabac74d4708fd53', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 12:01:16', '2022-12-10 12:01:16', '2023-12-10 06:01:16'),
('e7a6de69d8e727270a241c822ba30192dce213dc36511ecb66252afedcf802c2559d6dacd9477656', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:12', '2022-12-09 01:32:12', '2023-12-08 19:32:12'),
('e8eccc40ea43eafc42083e2ac14a79fbbb9c6141d945d832988cf9186b4e4eb7b2549a5af6e39b61', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:12', '2022-12-09 01:31:12', '2023-12-08 19:31:12'),
('e912159734348c3ae058fd9a8a70ab0504193c3353d455e57ec9d5caa6d4a4de5796fb239ae35e67', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 06:40:47', '2022-12-10 06:40:48', '2023-12-10 00:40:47'),
('e96240f32698548a47b482b65a40da6ab633e745724f8d2215fac4aeccaf11bc465ac4321103578b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:41:36', '2022-12-12 01:41:36', '2023-12-11 19:41:36'),
('eb10492aa207bfcc4e54cc445b450c22482461f83eea9c47d1971e6e316ed3eb3e11a7e768553e69', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:03', '2022-12-09 00:03:03', '2023-12-08 18:03:03'),
('ebda10c0b539613aebf19438827d8316d30ebf5416e6ccdd92e3d7804169a7f449421d4a89915252', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:04:39', '2022-12-09 00:04:39', '2023-12-08 18:04:39'),
('ee17209e865b24c4d51a22e6a70146a740cf983cc950fa24db11a0045ca3080ac519d602afcbc801', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:43', '2022-12-09 01:30:43', '2023-12-08 19:30:43'),
('ef6e6655e18fbe2f383aedf7a908bd1e21eeaf7827ee6bf6f75f099241c4fe431b2b4c8326c027a9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 06:27:38', '2022-12-10 06:27:38', '2023-12-10 00:27:38'),
('f13ec6d934d84755f0f41de83036a8ebb05519d09fe48debe2f00eb5f34cbe9e541919a64ad7f0e5', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:59', '2022-12-09 01:30:59', '2023-12-08 19:30:59'),
('f167af763b92abf8add403c391ab1adc7982f3d7e946f016dec534e6fb398864c2efd0ccfc514b8c', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:11', '2022-12-09 01:31:11', '2023-12-08 19:31:11'),
('f259918c40238d1d07df175d456b42d1fa3ca3dbd91138bfe792ed1a4dd20c3417eb8636460cfde2', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:32:11', '2022-12-09 01:32:11', '2023-12-08 19:32:11'),
('f51de0c82061fcd09e3533a6d6951d3cc29864d8022fab61641b1b0c0bf37aeaa19acb2125f9b20a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:23', '2022-12-09 01:30:23', '2023-12-08 19:30:23'),
('f5309c669027d078119305cb33c49ad96953f1f381d9b1abc1a799805048addc1884ab9a755985fb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 07:05:08', '2022-12-10 07:05:08', '2023-12-10 01:05:08'),
('f5d31806809f9debdf19373fc2e259ca57fe7968d14bfab60e5c65cd7a71cd541307b5fc6ec844df', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:12', '2022-12-09 01:31:12', '2023-12-08 19:31:12'),
('f6c119c510aa8aa8c68158b04a8e75ff99be1e6ac012b8897b3f30329f4fe30527e828d68d308c88', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:31:11', '2022-12-09 01:31:11', '2023-12-08 19:31:11'),
('f7f8369725ead3e4ec07f113839343efe1315381da42050523ffeaba03a04ee1a244e7b5f449fc74', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 06:24:56', '2022-12-10 06:24:56', '2023-12-10 00:24:56'),
('f8ca8e53d2a1e1dc7d74bc835ad74ccca52a8744a13df432a68395d17eb84eaa20f4a7e51880d34b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 02:18:45', '2022-12-10 02:18:45', '2023-12-09 20:18:45'),
('f9a3754163d44eed5ec85205194f2cf62d4a3bdeafa3d5642b4067ec6e371f713009382c37b437bd', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 01:44:25', '2022-12-12 01:44:25', '2023-12-11 19:44:25'),
('fc25686e8b460583573356fa3dcbdf8b346da39aebf114610a750129d2b2a0a2d68b3287bcc79025', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 06:03:31', '2022-12-10 06:03:31', '2023-12-10 00:03:31'),
('fc30b31e383cf53de8e2b496cad59551389a19894b34d3f2d47039e0ab3e82038cee8b77fed092a6', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:50:56', '2022-12-08 23:50:57', '2023-12-08 17:50:56'),
('fd7818d12f58204d473b74ae60f76c9423e467687842cbe60491e2ec0dfd616636e737775cf6cf50', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:03:11', '2022-12-09 00:03:11', '2023-12-08 18:03:11'),
('fdcc419e842ee00c1f5a20f23c83853c9dc203f06e7a1c1dd18da1d2ef2c747d48459fb0bbfde5fb', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 00:09:09', '2022-12-09 00:09:09', '2023-12-08 18:09:09'),
('feb7bce79c8e0e102c11d7aec52296156124ddd154ba2272c2039667f4b5bfd909113d9bb00b74ff', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 23:52:47', '2022-12-08 23:52:47', '2023-12-08 17:52:47'),
('fef7f2166c12005e4ad9795c4db4c711cd1a8a5747bede13482980147dacc131239cb025f97617fa', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-09 01:30:45', '2022-12-09 01:30:45', '2023-12-08 19:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'WdEWHNGHeU5aKGrnSPu7dPpgzegjj37usQRdmQVH', NULL, 'http://localhost', 1, 0, 0, '2022-12-08 23:10:53', '2022-12-08 23:10:53'),
(2, NULL, 'Laravel Password Grant Client', 'bdZTjvPOcGCEpzVihyq0uVPWlXCLMrc7dolaPwx9', 'users', 'http://localhost', 0, 1, 0, '2022-12-08 23:10:53', '2022-12-08 23:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-12-08 23:10:53', '2022-12-08 23:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `price`, `date`, `created_at`, `updated_at`, `employee_id`, `user_id`) VALUES
(2, 12, '2022-11-21', '2022-11-21 14:14:32', '2022-11-21 14:14:32', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_drinks`
--

CREATE TABLE `type_drinks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_drinks`
--

INSERT INTO `type_drinks` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Juice', '2022-11-12 19:14:40', '2022-11-12 19:14:40'),
(3, 'Water', '2022-11-12 19:14:59', '2022-11-12 19:14:59');

-- --------------------------------------------------------

--
-- Table structure for table `type_foods`
--

CREATE TABLE `type_foods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_foods`
--

INSERT INTO `type_foods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Vegetarian', '2022-11-15 00:34:44', '2022-11-15 00:34:44'),
(2, 'Non-vegetarian', '2022-11-15 00:35:06', '2022-11-15 00:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `phone`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Marco', 'Garcia', '4493249454', 'marcogarcia@gmail.com', '1qazxsw2', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(2, 'Raquel', 'Medina', '4496473869', 'raquel2345@gmail.com', 'raquel2314', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(3, 'Blanca', 'Ochoa', '4498567324', 'blanca8a@gmail.com', 'blanca348a', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(4, 'Paola', 'Mendoza', '4494263048', 'paolaM351@gmail.com', 'paola34MP', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(5, 'Luz', 'Moreno', '4492242701', 'luzMo45@outlook.com', 'luzMo123tc', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(6, 'Maria', 'Marquez', '4491175648', 'mariamar235@hotmail.com', 'mair187634f', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(7, 'Patricia', 'Gomez', '4498759032', 'paty2354@gmail.com', 'paty183cw7fb', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(8, 'Juan', 'Ochoa', '4491163621', 'juanochoa234f2@gmail.com', 'juan1i3ufb', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(9, 'Teresa', 'Garcia', '4497098456', 'jteregar643@outlook.es', 'tere21viubq', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(10, 'Ramiro', 'Romo', '4495468371', 'ramirin24vR@outlook.com', 'ramrom23vcu2t3v', '2022-11-20 22:42:28', '0000-00-00 00:00:00'),
(11, 'marco', 'garcia', '4493249454', 'marco@gmail.com', '$2y$10$bj0WinWeVmlu..lpPc8c/ONlQRvg3MttDlXDkk7QFFRm4C7Yhl.Du', '2022-12-08 23:27:09', '2022-12-08 23:27:09'),
(12, 'marco', 'garcia', '4493249454', 'marcoochoa2412@gmail.com', '$2y$10$YXALKnZ9UYVhVOsB8URYAOx5.jWBx2gEvrYGq1iJS.1bEA7Aj0Dj2', '2022-12-08 23:45:44', '2022-12-08 23:45:44'),
(13, 'Prueba', 'prueba', '4493249353', 'marcoochoa24@gmail.com', '$2y$10$8psTHySfykOFMtbDCez1.ONbDUgYRtKDaX/GhF.lZoUMiDmY/ZZfG', '2022-12-08 23:49:20', '2022-12-08 23:49:20'),
(14, 'prueba2', 'prueba2', '4493249353', 'prueba@gmail.com', '$2y$10$b.32FCAyvuDEUtxS3PqLUeDkUBnZsTKJShDtqBpcAcVlsmzThQony', '2022-12-08 23:50:46', '2022-12-08 23:50:46'),
(15, 'prueba3', 'prueba3', '4493249453', 'prueba3@gmail.com', '$2y$10$g85Z9DtHeA.i1bVN0AucFO9ctKAN5DScpCzpup0PtWqWTBVRK3l0G', '2022-12-09 00:04:24', '2022-12-09 00:04:24'),
(16, 'prueba4', 'prueba4', '4493249454', 'prueba4@gmail.com', '$2y$10$FiAt3AxzU4nK3lGqpJPLxuXQNbBTAIhMuD8/6F1chhRUHR3klAL8m', '2022-12-09 00:21:59', '2022-12-09 00:21:59'),
(17, 'Marco', 'Marco', '4493249454', 'marcoprueba@gmail.com', '$2y$10$lV.DRZms/GTG6L3hA7JHee6y4ZFp8dZh/uIbaqBZABV0UTR76LwLm', '2022-12-09 01:30:11', '2022-12-09 01:30:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drinks`
--
ALTER TABLE `drinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drinks_type_id_foreign` (`type_id`),
  ADD KEY `drinks_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `drink_orders`
--
ALTER TABLE `drink_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drink_orders_drink_id_foreign` (`drink_id`),
  ADD KEY `drink_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`),
  ADD KEY `employees_job_id_foreign` (`job_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foods_category_id_foreign` (`category_id`),
  ADD KEY `foods_type_id_foreign` (`type_id`);

--
-- Indexes for table `food_orders`
--
ALTER TABLE `food_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_orders_food_id_foreign` (`food_id`),
  ADD KEY `food_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_employee_id_foreign` (`employee_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `type_drinks`
--
ALTER TABLE `type_drinks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_foods`
--
ALTER TABLE `type_foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drinks`
--
ALTER TABLE `drinks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `drink_orders`
--
ALTER TABLE `drink_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `food_orders`
--
ALTER TABLE `food_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_drinks`
--
ALTER TABLE `type_drinks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_foods`
--
ALTER TABLE `type_foods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drinks`
--
ALTER TABLE `drinks`
  ADD CONSTRAINT `drinks_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drinks_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `type_drinks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drink_orders`
--
ALTER TABLE `drink_orders`
  ADD CONSTRAINT `drink_orders_drink_id_foreign` FOREIGN KEY (`drink_id`) REFERENCES `drinks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drink_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `foods_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `type_foods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `food_orders`
--
ALTER TABLE `food_orders`
  ADD CONSTRAINT `food_orders_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `food_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
