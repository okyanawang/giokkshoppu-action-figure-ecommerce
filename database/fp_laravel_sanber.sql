-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2022 at 03:44 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fp_laravel_sanber`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'Doll', 'None', 'None', NULL, NULL),
(2, 'MODEROID', 'None', 'None', NULL, NULL),
(3, 'Play Arts Kai', 'None', 'None', NULL, NULL),
(4, 'Soft Vinyl', 'None', 'None', NULL, NULL),
(5, 'Goods', 'None', 'None', NULL, NULL),
(6, 'Accessories', 'None', 'None', NULL, NULL),
(7, 'Action Figures', 'None', 'None', NULL, NULL),
(8, 'Bring Arts', 'None', 'None', NULL, NULL),
(9, 'Pop Up Parade', 'None', 'None', NULL, NULL),
(10, 'Deformed Figure', 'None', 'None', NULL, NULL),
(11, 'Manga', 'None', 'None', NULL, NULL),
(12, 'CD/DVD', 'None', 'None', NULL, NULL),
(13, 'Model Kit', 'None', 'None', NULL, NULL),
(14, 'Figma', 'None', 'None', NULL, NULL),
(15, 'Japanese Light Novel', 'None', 'None', NULL, NULL),
(16, 'Prize Figure', 'None', 'None', NULL, NULL),
(17, 'PVC Figure', 'None', 'None', NULL, NULL),
(18, 'Scale Figure', 'None', 'None', NULL, NULL),
(19, 'Nendoroid', 'None', 'None', NULL, NULL),
(20, 'Banner', 'None', 'None', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(29, '2014_10_12_000000_create_users_table', 1),
(30, '2014_10_12_100000_create_password_resets_table', 1),
(31, '2019_08_19_000000_create_failed_jobs_table', 1),
(32, '2022_01_26_150411_create_categories_table', 1),
(33, '2022_01_26_151418_create_products_table', 1),
(34, '2022_01_26_151434_create_orders_table', 1),
(35, '2022_01_26_154633_create_orders_detail_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `amount`, `shipping_address`, `order_address`, `order_date`, `status`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'none', 'none', '2022-01-01', 'unclear', 1, NULL, NULL),
(2, 13710000, 'Serma Abdullah street 189 Pacul, Bojonegoro, East Java, Indonesia 62114', 'Serma Abdullah street 189 Pacul, Bojonegoro, East Java, Indonesia 62114', '2022-01-31', 'clear', 2, NULL, NULL),
(3, 0, 'none', 'none', '2022-01-01', 'unclear', 2, NULL, NULL),
(4, 0, 'none', 'none', '2022-01-01', 'unclear', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `orders_id` bigint(20) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `users_id`, `orders_id`, `products_id`, `name`, `price`, `total_price`, `quantity`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'PVC 1/7 Ganyu: Plenilune Gaze Ver. (With Exclusive Bonus)', 2140000, 6420000, 3, 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pvc-17-ganyu-plenilune-gaze-ver/thumbnail/pvc-17-ganyu-plenilune-gaze-ver.jpg', NULL, NULL),
(2, 1, 1, 3, 'Pop Up Parade Chika Fujiwara', 470000, 940000, 2, 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pop-up-parade-chika-fujiwara/thumbnail/pop-up-parade-chika-fujiwara.jpg', NULL, NULL),
(3, 1, 1, 4, 'figma Karyl', 1090000, 2180000, 2, 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/figma-karyl/thumbnail/figma-karyl.jpg', NULL, NULL),
(6, 2, 2, 9, 'PVC Jinguji Tamamo', 2120000, 4240000, 2, 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pvc-jinguji-tamamo/thumbnail/pvc-jinguji-tamamo.jpg', NULL, NULL),
(7, 2, 2, 2, 'PVC 1/7 Ganyu: Plenilune Gaze Ver. (With Exclusive Bonus)', 2140000, 4280000, 2, 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pvc-17-ganyu-plenilune-gaze-ver/thumbnail/pvc-17-ganyu-plenilune-gaze-ver.jpg', NULL, NULL),
(8, 2, 2, 8, 'PVC 1/7 Minami Nanami', 1730000, 5190000, 3, 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pvc-17-minami-nanami/thumbnail/pvc-17-minami-nanami.jpg', NULL, NULL),
(9, 2, 3, 11, 'ConoFig Kocho Shinobu', 770000, 770000, 1, 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/conofig-kocho-shinobu/thumbnail/conofig-kocho-shinobu.jpg', NULL, NULL),
(11, 4, 4, 1, 'Coreful Albedo: Knit Dress Ver.', 350000, 350000, 1, 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/coreful-albedo-overlord-knit-dres-ver/thumbnail/coreful-albedo-overlord-knit-dres-ver.jpeg', NULL, NULL);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `weight`, `description`, `image`, `stock`, `categories_id`, `created_at`, `updated_at`) VALUES
(1, 'Coreful Albedo: Knit Dress Ver.', 350000, 200, 'MISB and original from Japan Material: ABS,PVC', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/coreful-albedo-overlord-knit-dres-ver/thumbnail/coreful-albedo-overlord-knit-dres-ver.jpeg', 90, 16, NULL, '2022-01-31 05:41:49'),
(2, 'PVC 1/7 Ganyu: Plenilune Gaze Ver. (With Exclusive Bonus)', 2140000, 250, 'MISB and original from Japan Material: ABS,PVC Height: 1/7 H=220mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pvc-17-ganyu-plenilune-gaze-ver/thumbnail/pvc-17-ganyu-plenilune-gaze-ver.jpg', 100, 17, NULL, NULL),
(3, 'Pop Up Parade Chika Fujiwara', 470000, 200, 'MISB and original from Japan Material: ABS,PVC Height: H=170mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pop-up-parade-chika-fujiwara/thumbnail/pop-up-parade-chika-fujiwara.jpg', 100, 9, NULL, NULL),
(4, 'figma Karyl', 1090000, 200, 'MISB and original from Japan Material ABS,PVC Height H=140mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/figma-karyl/thumbnail/figma-karyl.jpg', 100, 14, NULL, NULL),
(5, 'Ichiban Kuji Nakano Nino: One Piece Dress Ver.', 1020000, 200, 'MISB and original from Japan Material: ABS,PVC Height: in Scale H=180mm (7.02in)', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/ichiban-kuji-nakano-nino-one-piece-dress-ver/thumbnail/ichiban-kuji-nakano-nino-one-piece-dress-ver.jpeg', 100, 16, NULL, NULL),
(6, 'Ichiban Kuji Nakano Itsuki: One Piece Dress Ver.', 900000, 200, 'MISB and original from Japan Material: ABS,PVC Height: in Scale H=180mm (7.02in)', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/ichiban-kuji-nakano-itsuki-one-piece-dress-ver/thumbnail/ichiban-kuji-nakano-itsuki-one-piece-dress-ver.jpeg', 100, 16, NULL, NULL),
(8, 'PVC 1/7 Minami Nanami', 1730000, 200, 'MISB and original from Japan Material: ABS,PVC Height: 1/7 in Scale H=275mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pvc-17-minami-nanami/thumbnail/pvc-17-minami-nanami.jpg', 100, 20, NULL, NULL),
(9, 'PVC Jinguji Tamamo', 2120000, 200, 'MISB and original from Japan Material: ABS,PVC Height: H=225mm (8.85in)', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pvc-jinguji-tamamo/thumbnail/pvc-jinguji-tamamo.jpg', 100, 20, NULL, NULL),
(10, 'Mini Figure Tedeza Rize', 330000, 200, 'MISB and original from Japan Material: ABS,PVC Height: H=65mm (2.54in)', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/mini-figure-tedeza-rize/thumbnail/mini-figure-tedeza-rize.jpg', 100, 20, NULL, NULL),
(11, 'ConoFig Kocho Shinobu', 770000, 200, 'MISB and original from Japan Material: ABS,PVC Height: H=150mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/conofig-kocho-shinobu/thumbnail/conofig-kocho-shinobu.jpg', 100, 20, NULL, NULL),
(12, 'Pop Up Parade Ritsuka Fujimaru: Carnival Ver.', 470000, 200, 'MISB and original from Japan Material ABS,PVC Height H=175mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/pop-up-parade-ritsuka-fujimaru-carnival-ver/thumbnail/pop-up-parade-ritsuka-fujimaru-carnival-ver.jpg', 100, 9, '2022-01-31 05:39:30', '2022-01-31 05:39:30'),
(13, 'Harmonia humming Rem', 2650000, 100, 'MISB and original from Japan Material: ABS,PVC Height: 230mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/harmonia-humming-rem/thumbnail/harmonia-humming-rem.jpg', 100, 1, '2022-01-31 07:09:37', '2022-01-31 07:09:37'),
(14, 'MODEROID Power Loader', 970000, 400, 'MISB and original from Japan Material: ABS, PVC Height: H=240mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/moderoid-power-loader/thumbnail/moderoid-power-loader.jpg', 100, 2, '2022-01-31 07:10:37', '2022-01-31 07:10:37'),
(15, 'Play Arts Kai Rufus Shinra', 2130000, 400, 'MISB and original from Japan Material: ABS,PVC Height: H=267mm (10.41in)', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/play-arts-kai-rufus-shinra/thumbnail/play-arts-kai-rufus-shinra.jpeg', 100, 3, '2022-01-31 07:13:07', '2022-01-31 07:13:07'),
(16, 'Chocot The Quintessential Quintuplets ∬ Nino', 360000, 100, 'MISB and original from Japan Material: ABS,PVC Height: H=70mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/chocot-the-quintessential-quintuplets-nino/thumbnail/chocot-the-quintessential-quintuplets-nino.jpg', 100, 4, '2022-01-31 07:13:51', '2022-01-31 07:13:51'),
(17, 'Liyue City Character Acrylic Stand Yunjin', 160000, 90, 'Official Genshin Impact Merchandise, Height H=156mmx100mm', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/liyue-city-character-acrylic-stand-yunjin/thumbnail/liyue-city-character-acrylic-stand-yunjin.jpg', 100, 5, '2022-01-31 07:14:31', '2022-01-31 07:14:31'),
(18, 'SHF S.H.Figuarts Kugisaki Nobara', 700000, 200, 'MISB and original from Japan Material: ABS, PVC Height: Approx. H=135mm (5.27in)', 'https://shumi.sgp1.cdn.digitaloceanspaces.com/items/shf-shfiguarts-kugisaki-nobara/thumbnail/shf-shfiguarts-kugisaki-nobara.jpeg', 100, 7, '2022-01-31 07:15:44', '2022-01-31 07:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `role`, `email`, `email_verified_at`, `password`, `address`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jasmine Magat', 'customer', 'jasminemagat@gmail.com', NULL, '$2y$10$oo3mckBWq0K9LgClCFBwGuzcQkb.gfI1vcW93UlHFB2ymRMPTTqei', 'Manila', '019241922', NULL, '2022-01-30 06:38:18', '2022-01-30 06:38:18'),
(2, 'Jasmine', 'Admin', 'jasmine@gmail.com', NULL, '$2y$10$6Jvce/gq2b4gsxfntoqEOOgA9Ga1GjUYydJrE1FPBYs/VPECcd882', 'Manila', '0971213454', NULL, '2022-01-30 12:49:01', '2022-01-30 12:49:01'),
(4, 'Karyl', 'customer', 'karyl@gmail.com', NULL, '$2y$10$z5ZL6jAB1ZW4DRG.GaJpwOfseEt9JGnm9CCR3sqx8A6hBr.T5irJq', 'Fukuoka', '1293879', NULL, '2022-01-31 05:47:18', '2022-01-31 05:47:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_users_id_foreign` (`users_id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_detail_orders_id_foreign` (`orders_id`),
  ADD KEY `orders_detail_products_id_foreign` (`products_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_categories_id_foreign` (`categories_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_orders_id_foreign` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orders_detail_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
