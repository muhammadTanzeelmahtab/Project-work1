-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2023 at 09:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Categoryid` int(11) NOT NULL,
  `Cname` varchar(225) NOT NULL,
  `Cimg` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Categoryid`, `Cname`, `Cimg`) VALUES
(2, 'Gift', '../MainLayout/assets/images/pencil.jpg'),
(3, 'Stationary', '../MainLayout/assets/images/Pencils_hb.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bill` bigint(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Orderid` int(11) NOT NULL,
  `Productid` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `invoiceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Productid` int(11) NOT NULL,
  `Pname` varchar(225) NOT NULL,
  `Prodprice` decimal(10,2) NOT NULL,
  `Pdescription` varchar(225) NOT NULL,
  `Pimg` varchar(500) NOT NULL,
  `Pcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Productid`, `Pname`, `Prodprice`, `Pdescription`, `Pimg`, `Pcategory`) VALUES
(2, 'Pencil', '200.00', 'Pencil', '../MainLayout/assets/images/pencil.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `returnback`
--

CREATE TABLE `returnback` (
  `returnid` int(11) NOT NULL,
  `retName` varchar(225) NOT NULL,
  `retemail` varchar(225) NOT NULL,
  `retphonenum` varchar(225) NOT NULL,
  `retorder` int(11) NOT NULL,
  `retreason` varchar(225) NOT NULL,
  `retuser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User` int(11) NOT NULL,
  `Username` varchar(225) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `Password` varchar(225) NOT NULL,
  `Role` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User`, `Username`, `Email`, `Password`, `Role`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$FBY5grMpEsG83hcTS8tk0.rdFKz.Tq9rvesEGUvpuFr1w35QIPh3C', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Categoryid`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceid`),
  ADD KEY `fk_invuser` (`userid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Orderid`),
  ADD KEY `fk_opid` (`Productid`),
  ADD KEY `fk_invoice` (`invoiceid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Productid`),
  ADD KEY `fk_pcategory` (`Pcategory`);

--
-- Indexes for table `returnback`
--
ALTER TABLE `returnback`
  ADD PRIMARY KEY (`returnid`),
  ADD KEY `fk_returnorder` (`retorder`),
  ADD KEY `fk_retuser` (`retuser`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Orderid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `returnback`
--
ALTER TABLE `returnback`
  MODIFY `returnid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_invuser` FOREIGN KEY (`userid`) REFERENCES `user` (`User`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_invoice` FOREIGN KEY (`invoiceid`) REFERENCES `invoice` (`invoiceid`),
  ADD CONSTRAINT `fk_opid` FOREIGN KEY (`Productid`) REFERENCES `products` (`Productid`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_pcategory` FOREIGN KEY (`Pcategory`) REFERENCES `category` (`Categoryid`);

--
-- Constraints for table `returnback`
--
ALTER TABLE `returnback`
  ADD CONSTRAINT `fk_returnorder` FOREIGN KEY (`retorder`) REFERENCES `orders` (`Orderid`),
  ADD CONSTRAINT `fk_retuser` FOREIGN KEY (`retuser`) REFERENCES `user` (`User`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
