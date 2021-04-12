-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 12 2021 г., 14:48
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `code`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Мобильные телефоны', 'mobiles', 'В этом разделе вы найдёте самые популярные мобильные телефонамы по отличным ценам!', 'categories/JvGxbN6mluUubNX5IbD33u1mB2xbRG7p0SCzp59B.jpg', NULL, '2021-03-03 16:57:00'),
(2, 'Портативная техника', 'portable', 'Раздел портативной техники', 'categories/i7tZr6XUYWrzonUSscJbynRRGlDvaR8Ohp4U9s2R.jpg', NULL, '2021-03-02 15:30:57'),
(3, 'Бытовая техника', 'technics', 'Раздел с бытовой техникой', 'categories/XomsX8XKETDB4RaUPxqN0muKQTRT26ZIY83afEbt.jpg', NULL, '2021-03-02 15:31:06');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2014_10_12_000000_create_users_table', 1),
(7, '2021_02_27_145354_create_products_table', 1),
(11, '2021_02_27_145719_create_categories_table', 2),
(12, '2021_02_28_113404_create_orders_table', 2),
(15, '2021_02_28_141342_create_order_product_table', 3),
(18, '2021_02_28_184501_update_order_product_table', 4),
(19, '2014_10_12_100000_create_password_resets_table', 5),
(21, '2021_03_01_203357_update_users_table', 6),
(23, '2021_03_01_214135_update_orders_table', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `status`, `name`, `phone`, `created_at`, `updated_at`, `user_id`) VALUES
(3, 0, NULL, NULL, '2021-02-28 12:48:19', '2021-02-28 12:48:19', NULL),
(4, 0, NULL, NULL, '2021-02-28 12:55:23', '2021-02-28 12:55:23', NULL),
(5, 0, NULL, NULL, '2021-02-28 15:17:06', '2021-02-28 15:17:06', NULL),
(6, 0, NULL, NULL, '2021-02-28 20:02:38', '2021-02-28 20:02:38', NULL),
(7, 1, 'dilavar', '+7(905)021-86-20', '2021-03-01 07:45:33', '2021-03-01 08:10:51', NULL),
(8, 1, 'test', 'test', '2021-03-01 08:10:56', '2021-03-01 08:59:19', NULL),
(9, 0, NULL, NULL, '2021-03-01 09:04:55', '2021-03-01 09:04:55', NULL),
(10, 0, NULL, NULL, '2021-03-01 09:56:11', '2021-03-01 09:56:11', NULL),
(11, 0, NULL, NULL, '2021-03-01 18:01:10', '2021-03-01 18:01:10', NULL),
(12, 0, NULL, NULL, '2021-03-01 18:31:50', '2021-03-01 18:31:50', NULL),
(13, 0, NULL, NULL, '2021-03-01 18:46:20', '2021-03-01 18:46:20', 1),
(14, 0, NULL, NULL, '2021-03-01 18:56:44', '2021-03-01 18:56:44', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `count`, `created_at`, `updated_at`) VALUES
(10, 6, 1, 2, '2021-02-28 20:11:14', '2021-02-28 20:29:25'),
(12, 7, 1, 3, '2021-03-01 07:45:33', '2021-03-01 07:48:50'),
(13, 7, 3, 1, '2021-03-01 07:48:58', '2021-03-01 07:48:58'),
(14, 8, 1, 1, '2021-03-01 08:10:56', '2021-03-01 08:10:56'),
(17, 10, 2, 1, '2021-03-01 09:56:11', '2021-03-01 09:56:17'),
(18, 11, 1, 1, '2021-03-01 18:01:10', '2021-03-01 18:01:10'),
(19, 12, 2, 1, '2021-03-01 18:31:50', '2021-03-01 18:31:50'),
(20, 13, 1, 2, '2021-03-01 18:46:20', '2021-03-01 18:54:57'),
(21, 13, 5, 1, '2021-03-01 18:55:39', '2021-03-01 18:55:39');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `category_id`, `image`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 'iPhone X 64GB', 'iphone_x_64', 1, NULL, 'Отличный продвинутый телефон с памятью на 64 gb', 71990, NULL, NULL),
(2, 'iPhone X 256GB', 'iphone_x_256', 1, NULL, 'Отличный продвинутый телефон с памятью на 256 gb', 89990, NULL, '2021-03-02 13:15:21'),
(3, 'HTC One S', 'htc_one_s', 1, NULL, 'Зачем платить за лишнее. Легендарный HTC One S', 12490, NULL, NULL),
(4, 'iPhone 5SE', 'iphone_5se', 1, NULL, 'Отличный классический iPhone', 17221, NULL, NULL),
(5, 'Наушники Beats Audio', 'beats_audio', 2, NULL, 'Отличный звук от Dr. Dre', 20221, NULL, NULL),
(6, 'Камера GoPro', 'gopro', 2, NULL, 'Снимай самые яркие моменты с помощью этой камеры', 12000, NULL, NULL),
(7, 'Камера Panasonic HC-V770', 'panasonic_hc-v770', 2, NULL, 'Для серьёзной видео съемки нужна серьёзная камера. Panasonic HC-V770 для этих целей лучший выбор!', 27900, NULL, NULL),
(8, 'Кофемашина DeLongi', 'delongi', 3, NULL, 'Хорошее утро начинается с хорошего кофе!', 25200, NULL, NULL),
(9, 'Холодильник Haier', 'haier', 3, NULL, 'Для большой семьи большой холодильник!', 40200, NULL, NULL),
(10, 'Блендер Moulinex', 'moulinex', 3, NULL, 'Для самых смелых идей', 4200, NULL, NULL),
(11, 'Мясорубка Bosch', 'bosch', 3, NULL, 'Любите домашние котлеты. Вам определенно стоит посмотреть на эту мясорубку!', 9200, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `is_admin`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 1, 'DZ', 'd.z.2021@inbox.ru', NULL, '$2y$10$Y45YBzormXuArmzulZ/MVO3uO38Eq6XNey.v7OQPMPH.FQmDvtT9i', NULL, '2021-03-01 17:42:20', '2021-03-01 17:42:20');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
