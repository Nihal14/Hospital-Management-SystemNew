-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2023 at 10:16 AM
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
-- Database: `hospitalms`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `patientinfo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `patientinfo` (IN `PatientInfo` INT)   BEGIN
    SELECT fname,lname FROM patreg ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admintb`
--

DROP TABLE IF EXISTS `admintb`;
CREATE TABLE `admintb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admintb`
--

INSERT INTO `admintb` (`username`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `appointmenttb`
--

DROP TABLE IF EXISTS `appointmenttb`;
CREATE TABLE `appointmenttb` (
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `doctor` varchar(30) NOT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `docFees` int(5) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `userStatus` int(5) NOT NULL,
  `doctorStatus` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointmenttb`
--

INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `doc_id`, `docFees`, `appdate`, `apptime`, `userStatus`, `doctorStatus`) VALUES
(19, 23, 'HARISH', 'KANNUR', 'Male', 'harishkannur@gmail.com', '9876543211', 'abraham', 1, 444, '2023-01-27', '14:00:00', 1, 0),
(20, 24, 'RAJA', 'ADYAR', 'Male', 'raja@yahoo.com', '7896543211', 'Saithejas', 5, 1000, '2023-01-31', '16:00:00', 1, 1),
(24, 25, 'DEEPIKA', 'AGARWAL', 'Female', 'deepag@outlook.com', '8796785678', 'sarala', 6, 550, '2023-02-01', '10:00:00', 1, 1),
(21, 26, 'ALICE', 'VALANCIA', 'Female', 'alice121@gmail.com', '6785949399', 'alicia', 2, 300, '2023-01-29', '08:00:00', 1, 1),
(20, 27, 'RAJA', 'ADYAR', 'Male', 'raja@yahoo.com', '7896543211', 'anuj', 3, 370, '2023-01-28', '14:00:00', 1, 1),
(20, 28, 'RAJA', 'VALACHIL', 'Male', 'raja@yahoo.com', '7896543211', 'pushparaj', NULL, 671, '2023-01-29', '14:00:00', 1, 1),
(19, 33, 'HARISH', 'KANNUR', 'Male', 'harishkannur@gmail.com', '9876543211', 'manish', NULL, 300, '2023-02-11', '16:00:00', 1, 1),
(19, 42, 'HARISH', 'KANNUR', 'Male', 'harishkannur@gmail.com', '9876543211', 'Saithejas', NULL, 1000, '2023-02-08', '12:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(10) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `contact`, `message`) VALUES
('Nihal', 'nihal@gmail.com', '7856453533', 'Please Can you give is there 3 units of blood in your blood bank ? Urgent\r\n'),
('Anu', 'anu@gmail.com', '9999656448', 'Can you please provide the contact of general doctor ?');

-- --------------------------------------------------------

--
-- Table structure for table `doctb`
--

DROP TABLE IF EXISTS `doctb`;
CREATE TABLE `doctb` (
  `doctor_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `doctorname` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctb`
--

INSERT INTO `doctb` (`doctor_id`, `username`, `password`, `doctorname`, `email`, `spec`, `docFees`) VALUES
(1, 'abraham', '12345678', 'Dr Abraham T', 'abrhm@sanjeevani.com', 'Gastroenterologist', 444),
(2, 'alicia', '12345678', 'Dr Alicia D', 'alicia@sanjeevani.com', 'Oncologist', 300),
(3, 'anuj', '12345678', 'Dr Anuj  K', 'anuj@sanjeevani.com', 'Pediatrician', 370),
(5, 'Saithejas', '12345678', 'Dr Sai  Thejas', 'saithejas@sanjeevani.com', 'Neurologist', 1000),
(6, 'sarala', '12345678', 'Dr Sarala', 'sarala@sanjeevani.com', 'Gynecologist', 550),
(7, 'manish', '12345678', 'Dr Manish', 'manish@sanjeevani.com', 'Cardiologist', 300),
(8, 'yaj', '12345678', 'Dr Yajnesh', 'yaj@sanjeevani.com', 'General', 547);

-- --------------------------------------------------------

--
-- Table structure for table `patreg`
--

DROP TABLE IF EXISTS `patreg`;
CREATE TABLE `patreg` (
  `pid` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cpassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patreg`
--

INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`) VALUES
(19, 'HARISH', 'KANNUR', 'Male', 'harishkannur@gmail.com', '9876543211', '12345678', '12345678'),
(20, 'RAJA', 'VALACHIL', 'Male', 'raja@yahoo.com', '7896543211', '12345678', '12345678'),
(21, 'ALICE', 'VALANCIA', 'Female', 'alice121@gmail.com', '6785949399', '12345678', '12345678'),
(23, 'AZAR', 'VALACHIL', 'Male', 'azar21@gmail.com', '8978675438', '12345678', '12345678'),
(24, 'DEEPIKA', 'S', 'Female', 'deepika11@gmail.com', '8796785678', '12345678', '12345678'),
(25, 'RAMANAN', 'IYYER', 'Male', 'raman@gmail.com', '9876577556', '12345678', '12345678'),
(26, 'ANISH', 'A', 'Male', 'ani@gamil.com', '8657488939', '12345678', '12345678'),
(66, 'TARUN', 'ACC', 'Male', 'tarunjp@gmail.com', '2345678900', '12345678', '12345678'),
(100, 'VDVX', 'HFDGFS', 'Male', 'a@a', '12435ghfgd', '12345678', '12345678'),
(101, 'ANUJ', 'K', 'Male', 'anuj@gmail.com', '9786754656', '123456', '123456');

--
-- Triggers `patreg`
--
DROP TRIGGER IF EXISTS `lname uppercase`;
DELIMITER $$
CREATE TRIGGER `lname uppercase` BEFORE INSERT ON `patreg` FOR EACH ROW set new.lname=upper(new.lname)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `to uppercase`;
DELIMITER $$
CREATE TRIGGER `to uppercase` BEFORE INSERT ON `patreg` FOR EACH ROW set new.fname=upper(new.fname)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `updateTrigflname`;
DELIMITER $$
CREATE TRIGGER `updateTrigflname` BEFORE UPDATE ON `patreg` FOR EACH ROW set new.lname=upper(new.lname)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `updateTrigfname`;
DELIMITER $$
CREATE TRIGGER `updateTrigfname` BEFORE UPDATE ON `patreg` FOR EACH ROW set new.fname=upper(new.fname)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prestb`
--

DROP TABLE IF EXISTS `prestb`;
CREATE TABLE `prestb` (
  `did` int(11) DEFAULT NULL,
  `doctor` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `disease` varchar(250) NOT NULL,
  `allergy` varchar(250) NOT NULL,
  `prescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prestb`
--

INSERT INTO `prestb` (`did`, `doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `apptime`, `disease`, `allergy`, `prescription`) VALUES
(1, 'abraham', 19, 23, 'HARISH', 'KANNUR', '2023-01-27', '14:00:00', ' Gastroesophageal reflux disease ', 'No', 'Drug Name: Omeprazole\nDosage: 20 mg\nRoute of Administration: Oral\nFrequency: Once daily\nDuration: 4 weeks\n\nSpecial Instructions: Take the medication before a meal, preferably in the morning. Do not crush or chew the tablets. Drink plenty of water with the medication to help prevent irritation of the esophagus. If you experience any unusual symptoms or side effects, contact your healthcare provider immediately.'),
(6, 'sarala', 24, 25, 'DEEPIKA', 'AGARWAL', '2023-02-01', '10:00:00', 'Genital herpes', 'Penicillin', 'Drug Name: Acyclovir\r\nDosage: 400 mg\r\nRoute of Administration: Oral\r\nFrequency: Three times a day\r\nDuration: 5 days\r\n\r\nSpecial Instructions: Take the medication with food to reduce stomach upset. If you experience any allergic reaction such as hives, rash, or difficulty breathing, stop taking the medication and contact your healthcare provider immediately.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admintb`
--
ALTER TABLE `admintb`
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `pid` (`pid`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Indexes for table `doctb`
--
ALTER TABLE `doctb`
  ADD PRIMARY KEY (`doctor_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `patreg`
--
ALTER TABLE `patreg`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `prestb`
--
ALTER TABLE `prestb`
  ADD PRIMARY KEY (`pid`,`ID`),
  ADD KEY `ID` (`ID`),
  ADD KEY `did` (`did`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `doctb`
--
ALTER TABLE `doctb`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patreg`
--
ALTER TABLE `patreg`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  ADD CONSTRAINT `appointmenttb_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patreg` (`pid`),
  ADD CONSTRAINT `appointmenttb_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctb` (`doctor_id`),
  ADD CONSTRAINT `fk` FOREIGN KEY (`pid`) REFERENCES `patreg` (`pid`) ON DELETE CASCADE;

--
-- Constraints for table `prestb`
--
ALTER TABLE `prestb`
  ADD CONSTRAINT `prestb_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patreg` (`pid`),
  ADD CONSTRAINT `prestb_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `appointmenttb` (`ID`),
  ADD CONSTRAINT `prestb_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `patreg` (`pid`),
  ADD CONSTRAINT `prestb_ibfk_4` FOREIGN KEY (`did`) REFERENCES `doctb` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
