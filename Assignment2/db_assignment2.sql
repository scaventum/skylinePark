-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 13, 2017 at 11:59 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_assignment2`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE IF NOT EXISTS `balance` (
  `TransNO` varchar(50) NOT NULL,
  `CarPlateNO` varchar(50) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `TransTime` datetime NOT NULL,
  PRIMARY KEY (`TransNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`TransNO`, `CarPlateNO`, `Amount`, `TransTime`) VALUES
('R20170914000001', 'R34GTR', 1.50, '2017-09-14 09:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `tr_refund`
--

CREATE TABLE IF NOT EXISTS `tr_refund` (
  `RefundNO` varchar(50) NOT NULL,
  `TicketNO` varchar(50) NOT NULL,
  `TransTime` datetime NOT NULL,
  `ActFinishTime` datetime NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`RefundNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_refund`
--

INSERT INTO `tr_refund` (`RefundNO`, `TicketNO`, `TransTime`, `ActFinishTime`, `Amount`) VALUES
('R20170914000001', '20170914000001', '2017-09-14 09:54:50', '2017-09-14 10:31:32', 1.50);

-- --------------------------------------------------------

--
-- Table structure for table `tr_ticket`
--

CREATE TABLE IF NOT EXISTS `tr_ticket` (
  `TicketNO` varchar(50) NOT NULL,
  `CarPlateNO` varchar(50) NOT NULL,
  `StartTime` datetime NOT NULL,
  `FinishTime` datetime NOT NULL,
  `Fee` decimal(10,2) NOT NULL,
  `TransTime` datetime NOT NULL,
  PRIMARY KEY (`TicketNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_ticket`
--

INSERT INTO `tr_ticket` (`TicketNO`, `CarPlateNO`, `StartTime`, `FinishTime`, `Fee`, `TransTime`) VALUES
('20170914000001', 'R34GTR', '2017-09-14 09:46:32', '2017-09-14 11:31:32', 2.63, '2017-09-14 09:54:08');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
