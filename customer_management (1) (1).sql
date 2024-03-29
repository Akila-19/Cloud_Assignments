-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 01, 2023 at 06:08 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customer_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email`, `mobile_number`) VALUES
('C01', 'Akila', 'Vasan', 'akila@gmail.com', '+1234567889'),
('C02', 'Anu', 'Guna', 'anu@gmail.com', '+2345623489'),
('C03', 'Gopi', 'Veeranki', 'gopi@gmail.com', '+34560089'),
('C04', 'Abhishek', 'U S', 'abi@gmail.com', '+1234007889');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` varchar(255) NOT NULL,
  `order_description` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `order_description`, `order_date`, `order_status`, `customer_id`) VALUES
('ORD1', 'confirmed', '23-04-2023', 'Delivered', 'C01'),
('ORD2', 'Shipped', '01-10-2023', 'Out-For-Delivery', 'C02'),
('ORD3', 'confirmed', '27-10-2023', 'Packing', 'C04'),
('ORD4', 'Shipped', '23-10-2023', 'Out-For-Delivery', 'C03');

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `payment_id` varchar(255) NOT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_detail`
--

INSERT INTO `payment_detail` (`payment_id`, `payment_status`, `price`, `customer_id`, `order_id`) VALUES
('P01', 'Completed', '$24.50', 'C01', 'ORD1'),
('P02', 'InProgress', '$79.99', 'C02', 'ORD2'),
('P03', 'Completed', '$59.75', 'C04', 'ORD3'),
('P04', 'Cash on Delivery', '$1499.99', 'C03', 'ORD4');

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `product_id` varchar(255) NOT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` (`product_id`, `product_description`, `price`, `brand_name`, `customer_id`, `order_id`) VALUES
('PROD01', 'Bueno Chocolate', '$24.50', 'Nestle', 'C01', 'ORD1'),
('PROD02', 'Blanket', '$79.99', 'HUdson Bay', 'C02', 'ORD2'),
('PROD03', 'Airpods', '$59.75', 'JBL', 'C04', 'ORD3'),
('PROD04', 'Iphone', '$1499.99', 'Apple', 'C03', 'ORD4');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_detail`
--

CREATE TABLE `vendor_detail` (
  `vendor_id` varchar(255) NOT NULL,
  `vendor_description` varchar(255) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor_detail`
--

INSERT INTO `vendor_detail` (`vendor_id`, `vendor_description`, `vendor_name`, `item_name`, `product_id`) VALUES
('VEN01', 'wholesale', 'John Deo', 'Electrical Appliances', 'PROD03'),
('VEN02', 'wholesale', 'John', 'Bed and Blanket', 'PROD02'),
('VEN03', 'Retail', 'HanSeo Jun', 'Iphone Pro Max 17', 'PROD04'),
('VEN04', 'wholesale', 'Min ho', 'Chocolates', 'PROD01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `vendor_detail`
--
ALTER TABLE `vendor_detail`
  ADD PRIMARY KEY (`vendor_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD CONSTRAINT `payment_detail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `payment_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`order_id`);

--
-- Constraints for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `product_detail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `product_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`order_id`);

--
-- Constraints for table `vendor_detail`
--
ALTER TABLE `vendor_detail`
  ADD CONSTRAINT `vendor_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_detail` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
