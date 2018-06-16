-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 04:54 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_saad_helal_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_ID` int(11) NOT NULL,
  `car_type` varchar(30) NOT NULL,
  `car_model` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_ID`, `car_type`, `car_model`) VALUES
(1, 'SUV', 'Jeep Cherokee'),
(2, 'SUV', 'Audi Q7'),
(3, 'Sport', 'Ferrari F40'),
(4, 'Sport', 'Lamborghini Aventador'),
(5, 'Economy', 'Citroën C1'),
(6, 'Economy', 'Volkswagen Golf'),
(7, 'Minivan', 'Toyota Sienna'),
(8, 'Minivan', 'Chrysler Pacifica'),
(9, 'Hatchback', 'Mazda3'),
(10, 'Hatchback', 'Hyundai Accent');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_ID`, `customer_name`) VALUES
(1, 'saad Helal'),
(2, 'Joesef Walker'),
(3, 'Alex Hardo'),
(4, 'John Dow'),
(5, 'Jane Smith'),
(6, 'Sara Berger'),
(7, 'Andrea Roschek'),
(8, 'Sam Ford'),
(9, 'Yousef Khattab'),
(10, 'Samer Ahmad');

-- --------------------------------------------------------

--
-- Table structure for table `pick_up`
--

CREATE TABLE `pick_up` (
  `rent_ID` int(11) NOT NULL,
  `start_location` varchar(30) NOT NULL,
  `date_of_renting` date NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `FK_car_ID` int(11) NOT NULL,
  `fk_customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pick_up`
--

INSERT INTO `pick_up` (`rent_ID`, `start_location`, `date_of_renting`, `invoice_number`, `FK_car_ID`, `fk_customer_ID`) VALUES
(1, 'vienna-thaliastrasse', '2018-06-03', 111, 3, 3),
(2, 'vienna-meidling', '2018-03-01', 123, 1, 1),
(3, 'vienna-Johnstrasse', '2018-04-24', 111, 2, 2),
(4, 'borgenland-eisenstadt', '2018-06-13', 112, 3, 5),
(5, 'burgenland-rechnitz', '2018-06-21', 113, 8, 6),
(6, 'viennakeisermülle', '2018-06-17', 114, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `return_ID` int(11) NOT NULL,
  `additional_charges` int(11) NOT NULL,
  `date_of_returning` date NOT NULL,
  `return_location` varchar(30) NOT NULL,
  `fk_customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return`
--

INSERT INTO `return` (`return_ID`, `additional_charges`, `date_of_returning`, `return_location`, `fk_customer_ID`) VALUES
(1, 0, '2018-06-15', 'vienna-meidling', 3),
(2, 25, '2018-07-19', 'vienna-johnstrasse', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `pick_up`
--
ALTER TABLE `pick_up`
  ADD PRIMARY KEY (`rent_ID`),
  ADD KEY `FK_car_ID` (`FK_car_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`return_ID`),
  ADD KEY `customer_ID` (`fk_customer_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pick_up`
--
ALTER TABLE `pick_up`
  MODIFY `rent_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `return`
--
ALTER TABLE `return`
  MODIFY `return_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pick_up`
--
ALTER TABLE `pick_up`
  ADD CONSTRAINT `pick_up_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `pick_up_ibfk_2` FOREIGN KEY (`FK_car_ID`) REFERENCES `car` (`car_ID`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `return_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
