-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 10 يوليو 2020 الساعة 15:19
-- إصدار الخادم: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `postal`
--

-- --------------------------------------------------------

--
-- بنية الجدول `complaint`
--

DROP TABLE IF EXISTS `complaint`;
CREATE TABLE IF NOT EXISTS `complaint` (
  `oredrID` int(11) NOT NULL,
  `status` varchar(300) NOT NULL,
  KEY `oredrID` (`oredrID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- بنية الجدول `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `personID` int(11) NOT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `customer`
--

INSERT INTO `customer` (`personID`) VALUES
(1);

-- --------------------------------------------------------

--
-- بنية الجدول `order_customer`
--

DROP TABLE IF EXISTS `order_customer`;
CREATE TABLE IF NOT EXISTS `order_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `date` date NOT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerID` (`customerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- بنية الجدول `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `nationalAddress` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `person`
--

INSERT INTO `person` (`id`, `firstName`, `lastName`, `age`, `gender`, `phone`, `nationalAddress`) VALUES
(1, 'Areej', 'alsalmi', 23, 'female', '+966545134737', '67523187'),
(2, 'Reem', 'AL-roqi', 23, 'female', '+966509725723', '873649283'),
(3, 'reem', 'alsalmi', 23, 'female', '+9665243523', '218734912348'),
(4, 'reham', 'shoroq', 23, 'female', '+9668723475867', '23476872498');

-- --------------------------------------------------------

--
-- بنية الجدول `postalmessage`
--

DROP TABLE IF EXISTS `postalmessage`;
CREATE TABLE IF NOT EXISTS `postalmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `dateSending` date NOT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerID` (`customerID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `postalmessage`
--

INSERT INTO `postalmessage` (`id`, `title`, `description`, `content`, `dateSending`, `customerID`) VALUES
(1, 'first message', 'this is first message postal for me', 'content of this postal message', '2020-07-17', 1),
(2, 'second postal message', 'this is second postal message for me', 'content of this postal message', '2020-07-15', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `receiver`
--

DROP TABLE IF EXISTS `receiver`;
CREATE TABLE IF NOT EXISTS `receiver` (
  `personID` int(11) NOT NULL,
  `postalID` int(11) NOT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `receiver`
--

INSERT INTO `receiver` (`personID`, `postalID`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `remittance`
--

DROP TABLE IF EXISTS `remittance`;
CREATE TABLE IF NOT EXISTS `remittance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `reason` varchar(2000) NOT NULL,
  `date` date NOT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerID` (`customerID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `remittance`
--

INSERT INTO `remittance` (`id`, `value`, `reason`, `date`, `customerID`) VALUES
(1, 300, 'for business', '2020-07-17', 1),
(2, 400, 'for working', '2020-07-16', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `remittancereceiver`
--

DROP TABLE IF EXISTS `remittancereceiver`;
CREATE TABLE IF NOT EXISTS `remittancereceiver` (
  `remittanceID` int(11) NOT NULL,
  `receiverphone` varchar(300) NOT NULL,
  PRIMARY KEY (`remittanceID`,`receiverphone`),
  KEY `receiverphone` (`receiverphone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `remittancereceiver`
--

INSERT INTO `remittancereceiver` (`remittanceID`, `receiverphone`) VALUES
(1, '+9667834698276');

-- --------------------------------------------------------

--
-- بنية الجدول `remittancereceiverinfo`
--

DROP TABLE IF EXISTS `remittancereceiverinfo`;
CREATE TABLE IF NOT EXISTS `remittancereceiverinfo` (
  `receiverphone` varchar(300) NOT NULL,
  `receiveremail` varchar(400) NOT NULL,
  `reveivername` varchar(400) NOT NULL,
  `receiverlocation` varchar(1000) NOT NULL,
  PRIMARY KEY (`receiverphone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `remittancereceiverinfo`
--

INSERT INTO `remittancereceiverinfo` (`receiverphone`, `receiveremail`, `reveivername`, `receiverlocation`) VALUES
('+9667834698276', 'first@hotmail.com', 'first receiver', 'makka');

-- --------------------------------------------------------

--
-- بنية الجدول `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `date` date NOT NULL,
  `writerID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `writerID` (`writerID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- بنية الجدول `status_customer_postal`
--

DROP TABLE IF EXISTS `status_customer_postal`;
CREATE TABLE IF NOT EXISTS `status_customer_postal` (
  `postalID` int(11) NOT NULL,
  `statusID` int(11) NOT NULL,
  `supervisorID` int(11) NOT NULL,
  PRIMARY KEY (`postalID`,`statusID`,`supervisorID`),
  KEY `statusID` (`statusID`),
  KEY `supervisorID` (`supervisorID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `status_customer_postal`
--

INSERT INTO `status_customer_postal` (`postalID`, `statusID`, `supervisorID`) VALUES
(1, 1, 4),
(1, 2, 4);

-- --------------------------------------------------------

--
-- بنية الجدول `status_postal`
--

DROP TABLE IF EXISTS `status_postal`;
CREATE TABLE IF NOT EXISTS `status_postal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(3000) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `status_postal`
--

INSERT INTO `status_postal` (`id`, `content`, `date`) VALUES
(1, 'it\'s good', '2020-07-16'),
(2, 'it\'s received now', '2020-07-22');

-- --------------------------------------------------------

--
-- بنية الجدول `suggestion`
--

DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE IF NOT EXISTS `suggestion` (
  `oredrID` int(11) NOT NULL,
  KEY `oredrID` (`oredrID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- بنية الجدول `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE IF NOT EXISTS `supervisor` (
  `personID` int(11) NOT NULL,
  `workingTime` varchar(300) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `supervisor`
--

INSERT INTO `supervisor` (`personID`, `workingTime`, `salary`) VALUES
(4, 'morning', 200);

-- --------------------------------------------------------

--
-- بنية الجدول `writer`
--

DROP TABLE IF EXISTS `writer`;
CREATE TABLE IF NOT EXISTS `writer` (
  `personID` int(11) NOT NULL,
  `workingTime` varchar(300) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `writer`
--

INSERT INTO `writer` (`personID`, `workingTime`, `salary`) VALUES
(3, 'night', 300);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
