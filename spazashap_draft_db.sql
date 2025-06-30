-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql305.infinityfree.com
-- Generation Time: Jun 30, 2025 at 02:55 AM
-- Server version: 11.4.7-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_39184830_spazashap_draft_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adminID` int(11) NOT NULL,
  `adminEmail` varchar(80) NOT NULL,
  `adminPassword` varchar(255) NOT NULL,
  `adminFirstName` varchar(20) NOT NULL,
  `adminLastName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminID`, `adminEmail`, `adminPassword`, `adminFirstName`, `adminLastName`) VALUES
(1, 'levannah@admin.com', '$2y$10$2PfMORUE9H1yJl13IlpVZuLhFACYty6/Ag/OQ3E8ilvAWbcEkz0a6', 'levAdmin', 'kitsAdmin');

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `buyerID` int(11) NOT NULL,
  `buyerEmail` varchar(80) NOT NULL,
  `buyerPassword` varchar(255) NOT NULL,
  `buyerFirstName` varchar(20) NOT NULL,
  `buyerLastName` varchar(20) NOT NULL,
  `buyerPhoneNumber` varchar(15) NOT NULL,
  `buyerAddress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`buyerID`, `buyerEmail`, `buyerPassword`, `buyerFirstName`, `buyerLastName`, `buyerPhoneNumber`, `buyerAddress`) VALUES
(1, 'levannah@buyer.com', '$2y$10$4x3Ufc.BTn3P40dCdpYUvO3VGV0XK24itYNUSirJ/zBv0E/D0WsF6', 'levannahBuyerTest', 'kitshoff', '0811111111', '11 lane loo la la la'),
(2, 'mathew@gmail.com', '$2y$10$8uXLvUuMUkyRExsEkVD5T.w1JxamRkPjf.wmXow76Cb/G/6hChgVe', 'M', 'S', '0986542341', '44 Hillbilly Crescent'),
(3, 'matt@gmail.com', '$2y$10$ZESeeQpo1pTXodtFne0Ka.3y2PZTbtoAaZvvl6rzLu/sEELzxTmSq', 'Matt', 'S', '3245236235', 'v25352'),
(4, 'levannahbuyer@test.com', '$2y$10$VG4jc2m5P1wiBR5fp8bUQ.uh375mVkqh9hbSTZPruc06WE5EoIdtC', 'Lev', 'BuyTest', '0214446666', 'Buzz Test Lane , Pinewood'),
(5, 'levbuy@test.com', '$2y$10$N8miwTTYPkoOXyg1XmPNWu7nWovRoj547xuwlqBfXwoBYS5g0LUAW', 'Lev', 'Buy', '(222)222 222', '22 Lane 22 Street, Protea Village'),
(6, 'ivan@buyer.com', '$2y$10$F8LJHZaLtSuqnvxRF6RpY.1FKC93IO6L/IbH9A6YkIc70eeYFD2Se', 'Ivan', 'Buyer', '1234445555', '123 Mary Lane, Veld Road');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `orderTotal` decimal(10,0) DEFAULT NULL,
  `orderStatus` enum('Cart','Pending','Placed','Paid') NOT NULL DEFAULT 'Cart',
  `buyerID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `orderDate`, `orderTotal`, `orderStatus`, `buyerID`) VALUES
(1, '2025-06-29', '627', 'Placed', 1),
(2, NULL, NULL, 'Cart', 4),
(6, '2025-06-29', '220', 'Paid', 6),
(5, '2025-06-29', '22', 'Placed', 5),
(7, '2025-06-30', '469', 'Paid', 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_order_time` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`orderID`, `productID`, `quantity`, `price_at_order_time`) VALUES
(1, 7, 1, '22.00'),
(1, 9, 1, '25.00'),
(1, 2, 1, '400.00'),
(1, 8, 1, '60.00'),
(2, 1, 1, '600.00'),
(2, 7, 2, '22.00'),
(2, 8, 1, '60.00'),
(3, 9, 1, '25.00'),
(4, 9, 1, '25.00'),
(5, 7, 1, '22.00'),
(1, 10, 1, '120.00'),
(6, 10, 1, '120.00'),
(7, 11, 1, '369.00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productDescription` text DEFAULT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImageSource` varchar(255) DEFAULT NULL,
  `productStockQuantity` int(11) NOT NULL,
  `sellerID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `productName`, `productDescription`, `productPrice`, `productImageSource`, `productStockQuantity`, `sellerID`, `categoryID`) VALUES
(1, 'Jean Jacket', 'good condition', '600', 'jean_jacket.jpg', 1, 1, 3),
(2, 'Dumbells 15kg set', '2x7.5kg trojan dumbells - good condition barely used', '400', '1748382839.jpg', 1, 1, 5),
(7, 'Pronutro Chocolate', 'Pronutro chocolate best kids breakkfast like the 2000s kids.', '22', 'pronutro.jpg', 2, 1, 6),
(8, 'Pronutro', 'Strawberry Pronutro 500g (OG Flavour)', '60', 'food1.png', 5, 2, 6),
(9, 'Pronutro', 'Porridge', '25', 'food1.png', 4, 3, 6),
(10, 'Blink182 one more time cd', 'One more time - Blink 182 cd for good times', '120', '599.jpg', 5, 1, 2),
(11, 'Old School Digital Camera', 'Blue Digital Camera - uses AA Batteries - good condition', '369', 'camera.png', 1, 4, 1),
(12, 'Old Digital Video Camera', 'Old Digital Video Camera - perfect for vintage video shoots', '555', 'vid-cam.png', 1, 4, 1),
(13, 'Crocs Shoes', 'Shoes - size 7', '200', '1751265295.png', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`categoryID`, `categoryName`) VALUES
(1, 'electronics'),
(2, 'media'),
(3, 'clothing_accessories'),
(4, 'personalcare_beauty'),
(5, 'fitness'),
(6, 'food_beverages'),
(7, 'kitchenware'),
(8, 'homedecor'),
(9, 'hardware_diy'),
(10, 'gardening_plants');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `sellerID` int(11) NOT NULL,
  `sellerEmail` varchar(80) NOT NULL,
  `sellerPassword` varchar(255) NOT NULL,
  `sellerFirstName` varchar(20) NOT NULL,
  `sellerLastName` varchar(20) NOT NULL,
  `sellerPhoneNumber` varchar(10) NOT NULL,
  `sellerAddress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`sellerID`, `sellerEmail`, `sellerPassword`, `sellerFirstName`, `sellerLastName`, `sellerPhoneNumber`, `sellerAddress`) VALUES
(1, 'levannah@seller.com', '$2y$10$OF.DHUuq0nC9NBt8VGTSVOqpXUQrI/toMH7xlshn35ffD8.XkCPUq', 'levannah', 'kitshoff', '0811111111', '11 same lane sa sa saaaaa'),
(2, 'mathew@gmail.com', '$2y$10$stOZyHcZD4b119c20DkR5OlfLG1ftnKy5U6wqcXtl/2Ab3j3WP8Ma', 'M', 'S', '0284128475', '44 SQL Injection Street'),
(3, 'matt@gmail.com', '$2y$10$BZI9SjIgDBKjHpHE50sdSOo7TVEeDrIRg8ZFeKgr6hMXvX56BH/Nu', 'Matt', 'S', '4363463463', '135dfhgdsfghsrr'),
(4, 'levi@seller.com', '$2y$10$PKHIkzZ9K3YhMpaILDDs2.rTdHRnruXuGcEb78ApvMsZPoiQfoGCK', 'Levis', 'Seller', '085 555 55', '90210 Avenue'),
(5, 'jelly@seller.com', '$2y$10$XrZ72/rOFQXbhP.X1Z17kuJhwNxdCXHa0GT7farWDcJS8K88jUf96', 'Jelly', 'Seller', '085 555 55', '90210 Avenue'),
(6, 'jealous@seller.com', '$2y$10$/rNtQC80nXN0pGevxPxe9uvxQwygmsUC6r2MQEhg1mINDyLYy30Gy', 'Jealous', 'Seller', '085 555 55', '90210 Avenue');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`buyerID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `buyerID` (`buyerID`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`orderID`,`productID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `sellerID` (`sellerID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`sellerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `buyerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `sellerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sellerID`) REFERENCES `sellers` (`sellerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `product_categories` (`categoryID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
