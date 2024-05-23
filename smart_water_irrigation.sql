-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2020 at 08:47 AM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `smart_water_irrigation`
--

-- --------------------------------------------------------

--
-- Table structure for table `cropsugg`
--

CREATE TABLE IF NOT EXISTS `cropsugg` (
`id` int(100) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `templow` varchar(100) NOT NULL,
  `temphigh` varchar(100) NOT NULL,
  `humiditylow` varchar(100) NOT NULL,
  `humidityhigh` varchar(100) NOT NULL,
  `soillow` varchar(100) NOT NULL,
  `soilhigh` varchar(100) NOT NULL,
  `phlow` varchar(100) NOT NULL,
  `phhigh` varchar(100) NOT NULL,
  `sugg` varchar(1000) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cropsugg`
--

INSERT INTO `cropsugg` (`id`, `cname`, `templow`, `temphigh`, `humiditylow`, `humidityhigh`, `soillow`, `soilhigh`, `phlow`, `phhigh`, `sugg`) VALUES
(1, 'jawar', '15', '30', '20', '35', '10', '15', '2', '9', 'The Jowar does not need much water it‘s not depend on rainfall. Therefore, it is not showing correlation between rainfall and production of Kharif Jowar.'),
(2, 'SugarCane', '10', '20', '0', '1', '8', '15', '0', '8', 'As a grass, the number one nutrient necessary when fertilizing sugarcane is nitrogen.'),
(3, 'Cotton', '11', '29', '10', '25', '7', '36', '1', '2', 'ypical cotton row spacing ranges from 30- to 40-inch rows. Narrower row spacing can lead to earlier canopy closure, increased photosynthesis, and an earlier-maturing crop. When moving production to a narrower row, seeding rate should be decreased.'),
(4, 'wheat', '15', '30', '12', '20', '10', '12', '1', '8', 'Temperature, moisture availability, and plant nutrition all affect grain weight. Using crop-protection products such as fungicide and adequate fertilizer during the growing season can protect maximum yield, providing weather is conducive to wheat production.'),
(5, 'Tomato', '10', '20', '20', '30', '10', '25', '122', '125', 'Use water 1000 ltrs with ABC');

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE IF NOT EXISTS `farmer` (
`id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `contact` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `gender` varchar(256) NOT NULL,
  `temp` varchar(100) NOT NULL,
  `hum` varchar(100) NOT NULL,
  `soilmoist` varchar(100) NOT NULL,
  `ph` varchar(100) NOT NULL,
  `motorstatus` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`id`, `name`, `email`, `contact`, `password`, `gender`, `temp`, `hum`, `soilmoist`, `ph`, `motorstatus`) VALUES
(2, 'komal', 'komal@123.com', '7777333333', 'fgbfg', 'Female', '0', '0', '0', '0', '0'),
(3, 'shinu', 'shinu@gmail.com', '7888888888', 'shinu123', 'Male', '0', '0', '0', '0', '0'),
(4, 'raja', 'raja@gmail.com', '7777778888', 'raja123', 'Male', '0', '0', '0', '0', '0'),
(5, 'rani', 'rani@gmail.com', '7655555555', 'rani123', 'Female', '0', '0', '0', '0', '0'),
(6, 'raka', 'raka@gmail.com', '8767777777', 'raka123', 'Male', '13', '14', '10', '4', '0'),
(7, 'sam', 'sam@gmail.com', '8765778888', 'sam123', 'Male', '0', '0', '0', '0', '0'),
(8, 'yogita', 'yogita@gmail.com', '8686860000', '123456', 'Female', '26.00', '54.00', '2.25', '12.5', '0'),
(9, 'rohan', 'rohan@gmail.com', '8798888888', 'rohan123', 'Male', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `fersugg`
--

CREATE TABLE IF NOT EXISTS `fersugg` (
`id` int(100) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `sugg` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fersugg`
--

INSERT INTO `fersugg` (`id`, `cname`, `sugg`) VALUES
(1, 'Tomato', 'ABC'),
(2, 'Grapes', 'PQR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cropsugg`
--
ALTER TABLE `cropsugg`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fersugg`
--
ALTER TABLE `fersugg`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cropsugg`
--
ALTER TABLE `cropsugg`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `farmer`
--
ALTER TABLE `farmer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `fersugg`
--
ALTER TABLE `fersugg`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
