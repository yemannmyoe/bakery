-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2023 at 03:33 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(15, 'buns', 'buns', '2022-12-07 08:14:18', '2022-12-07 08:14:18'),
(16, 'danish', 'danish', '2022-12-07 08:14:40', '2022-12-07 08:14:40'),
(17, 'sandwiches', 'sandwiches', '2022-12-07 08:15:07', '2022-12-07 08:15:07'),
(18, 'slice cakes', 'slice-cakes', '2022-12-07 08:15:55', '2022-12-07 08:15:55'),
(19, 'dry cakes', 'dry-cakes', '2022-12-07 08:16:12', '2022-12-07 08:16:12'),
(20, 'whole cakes', 'whole-cakes', '2022-12-07 08:16:38', '2022-12-07 08:16:38'),
(21, 'drinks', 'drinks', '2022-12-07 08:17:23', '2022-12-07 08:17:23'),
(23, 'brownies', 'brownies', '2022-12-07 08:20:35', '2022-12-07 08:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
(6, 'OFF100%', 'percent', '50.00', '3000.00', '2023-02-17 00:27:50', '2023-02-17 00:27:50', '2023-02-23'),
(7, 'OFF100', 'percent', '100.00', '3000.00', '2023-02-17 00:41:57', '2023-02-17 00:41:57', '2023-02-21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '15,17,19,20', 4, '2022-11-29 05:26:47', '2022-12-07 09:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Welcome To SNK', 'subtitle test', '7000', 'http://127.0.0.1:8000', '1670430052.png', '0', '2022-12-07 09:50:52', '2022-12-07 09:50:52'),
(2, 'Welcome To SNK', 'subtitle test', '7000', 'http://127.0.0.1:8000', '1670430056.png', '1', '2022-12-07 09:50:56', '2022-12-07 09:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2022_10_19_065156_create_sessions_table', 1),
(10, '2022_10_31_064904_create_categories_table', 1),
(11, '2022_10_31_065038_create_products_table', 1),
(12, '2022_11_02_053049_create_shoppingcart_table', 1),
(13, '2022_11_12_045741_create_home_sliders_table', 1),
(14, '2022_11_17_080029_create_home_categories_table', 1),
(15, '2022_11_17_151623_create_sales_table', 1),
(16, '2022_11_26_034336_create_coupons_table', 1),
(17, '2022_11_28_152852_add_expiry_date_to_coupons_table', 1),
(22, '2022_11_29_041131_create_orders_table', 2),
(23, '2022_11_29_041210_create_order_items_table', 2),
(24, '2022_11_29_041300_create_shippings_table', 2),
(25, '2022_11_29_041443_create_transactions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `status` enum('ordered','delivered','cancelled') NOT NULL DEFAULT 'ordered',
  `is_shipping_differnt` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_differnt`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
(9, 1, '10000.00', '500.00', '0.00', '10000.00', 'test first', 'test last', '2323232', 'test@gmail.com', 'no 19', 'rashford', 'Yangon', 'erer', 'Myanmar', '232323', 'ordered', 0, '2022-11-30 08:42:30', '2022-11-30 08:42:30', NULL, NULL),
(10, 1, '17800.00', '0.00', '0.00', '17800.00', 'Test User', 'Test ', '09876556781', 'test@gmail.com', 'No.89', 'Zarago.St', 'Yangon', 'Dagon', 'Myanmar', '1232121', 'ordered', 0, '2022-12-01 22:18:37', '2022-12-01 22:18:37', NULL, NULL),
(11, 2, '7000.00', '0.00', '0.00', '7000.00', 'User', 'Two', '09765654432', 'user2@gmail.com', 'No.15', 'Tarmwe.St', 'Yangon', 'Tarmwe', 'Myanmar', '12132', 'cancelled', 0, '2022-12-02 00:28:32', '2022-12-02 00:28:32', NULL, NULL),
(12, 2, '8900.00', '0.00', '0.00', '8900.00', 'User ', 'Two', '98721813', 'ddd@gmail.com', 'No.2', 'Zambia.St', 'Yangon', 'Sanchaung', 'Myanmar', '999999', 'cancelled', 0, '2022-12-02 00:42:00', '2022-12-02 23:39:56', '2022-12-02', '2022-12-03'),
(13, 1, '5800.00', '0.00', '0.00', '5800.00', 'Sandi ', 'Kyaw', '09423242536', 'sandi@gmail.com', ' 48/A, May Darwi Rd.', 'Bet 31st & 32nd St', 'Mandalay', 'Pabedan', 'Myanmar', '121232', 'delivered', 0, '2022-12-07 08:51:17', '2022-12-07 08:52:15', '2022-12-07', NULL),
(14, 1, '17000.00', '1000.00', '0.00', '17000.00', 'Lorena Stracke', 'Willms', '5425464806000', 'your.email+fakedata97770@gmail.com', '6472 Leonard Branch', 'Javierville', 'North Rodrick', '258 Kshlerin Skyway', 'Bouvet Island (Bouvetoya)', '478', 'ordered', 0, '2023-01-05 01:21:50', '2023-01-05 01:21:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(11, 29, 13, '2900.00', 2, '2022-12-07 08:51:17', '2022-12-07 08:51:17'),
(12, 44, 14, '6000.00', 3, '2023-01-05 01:21:50', '2023-01-05 01:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) NOT NULL,
  `SKU` varchar(255) NOT NULL,
  `stock_status` enum('instock','outofstock') NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`) VALUES
(27, 'Cheese Bun', 'cheese-bun', '<p><strong><em>Goodness of cheese in a bun</em></strong></p>', '<p><em><strong>Goodness of cheese in a bun</strong></em></p>', '3700.00', '3200.00', 'SNK001', 'instock', 1, 30, '1670424811.jpg', NULL, 15, '2022-12-07 08:23:31', '2022-12-07 08:23:31'),
(28, 'Cranberry Buns', 'cranberry-buns', '<p><strong><em>Cranberry is rich in dietary fiber and anti-oxidants</em></strong></p>', '<p><em><strong>Cranberry is rich in dietary fiber and anti-oxidants</strong></em></p>', '3500.00', '3000.00', 'SNK002', 'instock', 1, 10, '1670425051.png', NULL, 15, '2022-12-07 08:27:31', '2022-12-07 08:27:31'),
(29, 'Mushroom Cheese Sausage', 'mushroom-cheese-sausage', '<p><em>Chicken Sausage, Cheddar Cheese, Button Mushroom, M</em>ayonnaise</p>', '<p><strong><em>Chicken Sausage, Cheddar Cheese, Button Mushroom, Mayonnaise</em></strong></p>', '2900.00', '2650.00', 'SNK003', 'instock', 1, 9, '1670425293.png', NULL, 15, '2022-12-07 08:31:33', '2022-12-07 08:31:33'),
(30, 'Chocolate Croissant', 'chocolate-croissant', '<p>Milk Chocolate, Molten Lava Filling</p>', '<p>Milk Chocolate, Molten Lava Filling</p>', '2800.00', '2500.00', 'SNK004', 'instock', 1, 30, '1670425518.jpg', NULL, 16, '2022-12-07 08:35:18', '2022-12-07 08:35:18'),
(31, 'Blueberry Danish', 'blueberry-danish', '<p><strong><em>Fresh blueberries atop a sweet danish pastry</em></strong></p>', '<p>Fresh blueberries atop a sweet danish pastry</p>', '2800.00', '2600.00', 'SNK009', 'instock', 1, 10, '1670425646.jpg', NULL, 16, '2022-12-07 08:37:26', '2022-12-07 08:37:26'),
(32, 'Tuna puff', 'tuna-puff', '<p><strong><em>Seasoned tuna encased in a flaky puff pastry.</em></strong></p>', '<p><strong><em>Seasoned tuna encased in a flaky puff pastry.</em></strong></p>', '2000.00', '1700.00', 'SNK232', 'instock', 1, 20, '1670425750.jpg', NULL, 16, '2022-12-07 08:39:10', '2022-12-07 08:39:10'),
(33, 'Macha Blush (Slice)', 'macha-blush-slice', '<p><strong>For those who loves <em>MACHA</em></strong></p>', '<p><strong>For those who loves <em>MACHA</em></strong></p>', '4900.00', '4700.00', 'SNK222', 'instock', 1, 20, '1670425895.png', NULL, 18, '2022-12-07 08:41:35', '2022-12-07 08:41:35'),
(34, 'Chantilly Empire (Slice)', 'chantilly-empire-slice', '<p><em><strong>Fluffy, light and fruity, this is bound to start a party in your mouth!</strong></em></p>', '<p><em><strong>Fluffy, light and fruity, this is bound to start a party in your mouth!</strong></em></p>', '4900.00', '4300.00', 'SNK70', 'instock', 1, 8, '1670426147.png', NULL, 18, '2022-12-07 08:45:48', '2022-12-07 08:45:48'),
(35, 'Rainbow Bliss ', 'rainbow-bliss', '<p><em><strong>Rainbow Bliss Slice</strong></em></p>', '<p><em><strong>Rainbow Bliss Slice</strong></em></p>', '4900.00', '4200.00', 'SNK033', 'instock', 1, 20, '1670426261.jpg', NULL, 18, '2022-12-07 08:47:41', '2022-12-07 08:47:41'),
(36, 'Black Forest Dream', 'black-forest-dream', '<p>2 Days Preorder Only</p>', '<p>2 Days Preorder Only</p>', '35000.00', '31000.00', 'SNK730', 'instock', 1, 10, '1670426670.jpg', NULL, 20, '2022-12-07 08:54:30', '2022-12-07 08:54:30'),
(37, 'Tiramisu', 'tiramisu', '<p><strong><em>A timeless classic reinvented with a surprising twist. One taste and you&rsquo;ll be wowed!</em></strong></p>', '<p><strong><em>A timeless classic reinvented with a surprising twist. One taste and you&rsquo;ll be wowed!</em></strong></p>', '28000.00', '23000.00', 'SNK20', 'instock', 1, 5, '1670426892.jpg', NULL, 20, '2022-12-07 08:58:12', '2022-12-07 08:58:12'),
(38, 'Chantilly Empire ', 'chantilly-empire', '<p><em><strong>fruity cake</strong></em></p>', '<p><em><strong>fruity cake</strong></em></p>', '37000.00', '34000.00', 'SWK120', 'instock', 1, 20, '1670427066.jpg', NULL, 20, '2022-12-07 09:01:06', '2022-12-07 09:01:06'),
(39, 'Crater Cheese Honey Cake', 'crater-cheese-honey-cake', '<p>Caramelised cheese atop a light honey sponge cake</p>', '<p>Caramelised cheese atop a light honey sponge cake</p>', '4200.00', '3900.00', 'SNK999', 'instock', 1, 8, '1670427790.jpg', NULL, 19, '2022-12-07 09:13:10', '2022-12-07 09:13:10'),
(40, 'Blueberry Muffin', 'blueberry-muffin', '<p>blueberry muffin</p>', '<p>blueberry muffin</p>', '3000.00', '2500.00', 'MUF12', 'instock', 1, 8, '1670427965.jpg', NULL, 19, '2022-12-07 09:16:05', '2022-12-07 09:16:05'),
(41, 'Green Tea Muffin', 'green-tea-muffin', '<p>Greentea muffin</p>', '<p>Greentea muffin</p>', '3000.00', '2500.00', 'MUF13', 'instock', 1, 8, '1670428085.jpg', NULL, 19, '2022-12-07 09:18:05', '2022-12-07 09:18:05'),
(44, 'Double Choco Frappuccino', 'double-choco-frappuccino', '<p class=\"product_title entry-title\"><em><strong>Double Choco Frappuccino</strong></em></p>', '<p class=\"product_title entry-title\"><em><strong>Double Choco Frappuccino</strong></em></p>', '6000.00', '5800.00', 'SD1', 'instock', 1, 10, '1670428935.jpg', NULL, 21, '2022-12-07 09:32:15', '2022-12-07 09:32:15'),
(45, 'Milk', 'milk', '<p>iced milk</p>', '<p>iced milk</p>', '2500.00', '0.00', 'SD2', 'instock', 1, 90, '1670429061.png', NULL, 21, '2022-12-07 09:34:21', '2022-12-07 09:34:21'),
(46, 'Coco Berry', 'coco-berry', '<p>soft drink&nbsp;</p>', '<p>soft drink</p>', '3000.00', '0.00', 'SD3', 'instock', 1, 20, '1670429232.jpg', NULL, 21, '2022-12-07 09:37:12', '2022-12-07 09:37:12'),
(47, 'Smoked Chicken Sandwich', 'smoked-chicken-sandwich', '<p class=\"product_title entry-title\"><em><strong>Smoked Chicken Sandwich</strong></em></p>', '<p><em><strong>Smoked Chicken Sandwich</strong></em></p>', '4500.00', '4200.00', 'SW1', 'instock', 1, 20, '1670429618.jpg', NULL, 17, '2022-12-07 09:43:38', '2022-12-07 09:43:38'),
(48, 'Bacon & Egg Sandwich (Hot)', 'bacon-egg-sandwich-hot', '<p class=\"product_title entry-title\"><em><strong>Bacon & Egg Sandwich (Hot) </strong></em></p>', '<p><em><strong>Bacon & Egg Sandwich (Hot)</strong></em></p>', '4500.00', '4200.00', 'SW2', 'instock', 1, 20, '1670429689.jpg', NULL, 17, '2022-12-07 09:44:49', '2022-12-07 09:44:49'),
(49, 'Ham & Cheese Sandwich (Cold)', 'ham-cheese-sandwich-cold', '<p class=\"product_title entry-title\">Ham &amp; Cheese Sandwich (Cold)</p>', '<p class=\"product_title entry-title\">Ham &amp; Cheese Sandwich (Cold)</p>', '4200.00', '4000.00', 'SW9', 'instock', 1, 20, '1670429800.jpg', NULL, 17, '2022-12-07 09:46:40', '2022-12-07 09:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2022-12-08 12:08:45', 0, '2022-11-29 05:38:45', '2022-12-07 09:53:59');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lTXuHZdtXEmkNnYMHO68xfHad3qz8E1MBFq2oaDr', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZXlKRDFDUG14bGZ0cnc1Q2ZHV1RWVjNlZ0FRZW83dm9TM3k4bzFiaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0L2NvY28tYmVycnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjQ6ImNhcnQiO2E6MTp7czo0OiJjYXJ0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YToxOntzOjMyOiI4ZTVhNDRiN2U4MTU4ODM5YjAyMDNlZDdiOWYyMTQ0YiI7TzozMjoiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0iOjk6e3M6NToicm93SWQiO3M6MzI6IjhlNWE0NGI3ZTgxNTg4MzliMDIwM2VkN2I5ZjIxNDRiIjtzOjI6ImlkIjtpOjI4O3M6MzoicXR5IjtpOjg7czo0OiJuYW1lIjtzOjE0OiJDcmFuYmVycnkgQnVucyI7czo1OiJwcmljZSI7ZDozNTAwO3M6Nzoib3B0aW9ucyI7TzozOToiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW1PcHRpb25zIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6NDk6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBhc3NvY2lhdGVkTW9kZWwiO3M6MTg6IkFwcFxNb2RlbHNcUHJvZHVjdCI7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAHRheFJhdGUiO2k6MjE7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGlzU2F2ZWQiO2I6MDt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6ODoiY2hlY2tvdXQiO2E6NDp7czo4OiJkaXNjb3VudCI7ZDoyODAwMDtzOjg6InN1YnRvdGFsIjtkOjA7czozOiJ0YXgiO2k6MDtzOjU6InRvdGFsIjtkOjA7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1OiJ1dHlwZSI7czozOiJBRE0iO3M6NjoiY291cG9uIjthOjQ6e3M6NDoiY29kZSI7czo2OiJPRkYxMDAiO3M6NDoidHlwZSI7czo3OiJwZXJjZW50IjtzOjU6InZhbHVlIjtzOjY6IjEwMC4wMCI7czoxMDoiY2FydF92YWx1ZSI7czo3OiIzMDAwLjAwIjt9fQ==', 1676619372);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(6, 1, 9, 'cod', 'pending', '2022-11-30 08:42:30', '2022-11-30 08:42:30'),
(7, 1, 10, 'cod', 'pending', '2022-12-01 22:18:37', '2022-12-01 22:18:37'),
(8, 2, 11, 'cod', 'pending', '2022-12-02 00:28:32', '2022-12-02 00:28:32'),
(9, 2, 12, 'cod', 'pending', '2022-12-02 00:42:00', '2022-12-02 00:42:00'),
(10, 1, 13, 'cod', 'pending', '2022-12-07 08:51:17', '2022-12-07 08:51:17'),
(11, 1, 14, 'cod', 'pending', '2023-01-05 01:21:50', '2023-01-05 01:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `utype` varchar(255) NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'sandi', 'sandi@gmail.com', NULL, '$2y$10$fA6TlPiJ8cF0FotHyjk0XupMZp0XVmFKaxLSgXBUkFIpO6v7o/B2S', NULL, NULL, NULL, NULL, NULL, NULL, 'ADM', '2022-11-28 22:55:52', '2022-11-28 22:55:52'),
(2, 'user2', 'u@u.com', NULL, '$2y$10$iJ.5SMy9GUHWV3SEA2IeTerOPaVtjeeRjgU3ksqlO6nnmoi6AMPLW', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-12-01 23:16:17', '2022-12-01 23:16:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
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
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
