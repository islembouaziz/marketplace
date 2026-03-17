-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2026 at 02:03 PM
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
-- Database: `marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`) VALUES
(1, 'Viande', 'images/bouchers/logo_viande.webp'),
(2, 'Électronique', 'images/electronic/logo_electronic.webp'),
(3, 'Fleurs', 'images/fleurs/logo_fleurs.webp'),
(4, 'Food', 'images/food/logo_food.webp'),
(5, 'Fresh Produit', 'fresh_produit/icon.jpg'),
(6, 'Maison', 'maison/icon.png'),
(7, 'Pharmacie', 'pharmacie/icon.jpg'),
(8, 'Vetements', 'vetements/icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `image`, `shop_id`, `category_id`) VALUES
(1, 'Viande préparée', 20.00, 50, 'images/bouchers/viande_preparee.jpg', 1, 1),
(2, 'Viande rouge', 25.00, 40, 'images/bouchers/viande_rouge.webp', 1, 1),
(3, 'Volaille', 15.00, 30, 'images/bouchers/volaille.webp', 1, 1),
(4, 'Aspirateurs', 100.00, 20, 'images/electronic/aspirateurs.webp', 2, 2),
(5, 'Casque', 50.00, 40, 'images/electronic/casque.webp', 2, 2),
(6, 'Écouteurs', 30.00, 60, 'images/electronic/ecouteurs.webp', 2, 2),
(7, 'Ordinateurs', 500.00, 15, 'images/electronic/ordinateurs.webp', 2, 2),
(8, 'Smartphone', 400.00, 25, 'images/electronic/smartphone.webp', 2, 2),
(9, 'TV', 350.00, 10, 'images/electronic/tv.webp', 2, 2),
(10, 'Bouquets', 25.00, 60, 'images/fleurs/bouquets.webp', 3, 3),
(11, 'Fleurs pour cadeaux', 30.00, 50, 'images/fleurs/fleurs_cadeaux.webp', 3, 3),
(12, 'Plantes décoratives', 20.00, 40, 'images/fleurs/plantes_decoratives.webp', 3, 3),
(13, 'Glace', 5.00, 100, 'images/food/glace.webp', 4, 4),
(14, 'Donut', 3.00, 80, 'images/food/donut.webp', 4, 4),
(15, 'Gâteaux', 8.00, 50, 'images/food/gateaux.webp', 4, 4),
(16, 'Poulet KFC', 10.00, 60, 'images/food/chicken_kfc.jpg', 4, 4),
(17, 'Pizza', 10.00, 80, 'images/food/pizza.webp', 4, 4),
(18, 'Salade', 7.00, 70, 'images/food/salade.webp', 4, 4),
(19, 'Bananes', 2.50, 100, 'fresh_produit/my_farme/Bananes.webp', 5, 5),
(20, 'Tomates', 3.20, 50, 'fresh_produit/my_farme/Tomates.webp', 5, 5),
(21, 'Ustensiles de cuisine', 15.00, 20, 'maison/myhouse/Ustensiles_de_cuisine.webp', 6, 6),
(22, 'Rangement', 45.00, 10, 'maison/myhouse/rangement.webp', 6, 6),
(23, 'Doliprane', 5.50, 200, 'pharmacie/dolipranee.webp', 7, 7),
(24, 'Soins du corps', 12.00, 30, 'pharmacie/parapharmacie/Soins_du_corps.webp', 7, 7),
(25, 'Pantalon Femme', 49.90, 15, 'vetements/exist/femme/pantalon.webp', 8, 8),
(26, 'Costume Homme', 199.00, 5, 'vetements/exist/homme/costume.webp', 8, 8),
(27, 'Pommes', 1.80, 150, 'fresh_produit/my_farme/Pommes.webp', 5, 5),
(28, 'Carottes', 1.20, 80, 'fresh_produit/my_farme/Carottes.webp', 5, 5),
(29, 'Laitue', 0.90, 40, 'fresh_produit/my_farme/Laitue.webp', 5, 5),
(30, 'Meuble Salon', 299.00, 5, 'maison/myhouse/meuble.webp', 6, 6),
(31, 'Decoration Vase', 25.00, 15, 'maison/myhouse/decoration.webp', 6, 6),
(32, 'Hygiène Dentaire', 4.50, 60, 'pharmacie/parapharmacie/Hygiène_dentaire.webp', 7, 7),
(33, 'Solaire Protect', 18.00, 25, 'pharmacie/parapharmacie/Solaire.webp', 7, 7),
(34, 'Visage Crème', 22.50, 40, 'pharmacie/parapharmacie/Visage.webp', 7, 7),
(35, 'Pantalon Enfant', 29.90, 30, 'vetements/exist/enfant/pantalon.webp', 8, 8),
(36, 'Pull Enfant', 24.50, 20, 'vetements/exist/enfant/pull.webp', 8, 8),
(37, 'T-shirt Enfant', 15.00, 50, 'vetements/exist/enfant/t-shirt.webp', 8, 8),
(38, 'Chemise Femme', 39.00, 12, 'vetements/exist/femme/chemise.webp', 8, 8),
(39, 'Robe', 55.00, 8, 'vetements/exist/femme/robe.webp', 8, 8),
(40, 'T-shirt Femme', 19.90, 25, 'vetements/exist/femme/t-shirt.webp', 8, 8),
(41, 'Chemise Homme', 42.00, 15, 'vetements/exist/homme/chemise.webp', 8, 8),
(42, 'Jean Homme', 45.00, 20, 'vetements/exist/homme/jean.webp', 8, 8),
(43, 'Pull Homme', 35.00, 10, 'vetements/exist/homme/pull.webp', 8, 8),
(44, 'T-shirt Homme', 18.00, 40, 'vetements/exist/homme/t-shirt.webp', 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `category_id`, `logo`) VALUES
(1, 'Chahia', 1, 'images/bouchers/logo_chahia.webp'),
(2, 'Smart Shop', 2, 'images/electronic/logo_smartshop.webp'),
(3, 'Paradise', 3, 'images/fleurs/logo_paradise.webp'),
(4, 'KFC', 4, 'images/food/logo_kfc.png'),
(5, 'my_farme', 5, 'fresh_produit/icon.jpg'),
(6, 'myhouse', 6, 'maison/icon.png'),
(7, 'parapharmacie', 7, 'pharmacie/icon.jpg'),
(8, 'exist', 8, 'vetements/icon.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
