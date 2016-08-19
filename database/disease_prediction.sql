-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 18, 2016 at 04:05 PM
-- Server version: 5.7.13-0ubuntu0.16.04.2
-- PHP Version: 7.0.8-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `disease_prediction`
--

-- --------------------------------------------------------

--
-- Table structure for table `symptoms_attribute`
--

CREATE TABLE `symptoms_attribute` (
  `ID` int(11) NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `Site` enum('required','optional','not_required') NOT NULL,
  `Onset` enum('required','optional','not_required') NOT NULL,
  `Pattern` enum('required','optional','not_required') NOT NULL,
  `Duration` enum('required','optional','not_required') NOT NULL,
  `Severity` enum('required','optional','not_required') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `symptoms_attribute`
--

INSERT INTO `symptoms_attribute` (`ID`, `Symptom`, `Site`, `Onset`, `Pattern`, `Duration`, `Severity`) VALUES
(8, 'blood in urine', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(9, 'breathlessness', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(10, 'chills', 'not_required', 'optional', 'optional', 'required', 'optional'),
(11, 'cold', 'not_required', 'optional', 'optional', 'required', 'optional'),
(12, 'confusion', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(13, 'conjunctivitis', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(14, 'cough', 'not_required', 'optional', 'optional', 'required', 'required'),
(15, 'decreased heart rate', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(16, 'diarrhoea', 'not_required', 'optional', 'optional', 'required', 'required'),
(17, 'difficulty breathing', 'not_required', 'optional', 'optional', 'required', 'optional'),
(18, 'difficulty in passing urine', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(19, 'drowsiness', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(20, 'fainting', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(21, 'fever', 'not_required', 'optional', 'required', 'required', 'required'),
(22, 'headache', 'not_required', 'optional', 'optional', 'required', 'required'),
(23, 'increase in breathing', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(24, 'increase in urinary frequency', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(25, 'increased respiration', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(26, 'loss of appetite', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(27, 'malaise', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(28, 'pain', 'required', 'required', 'required', 'required', 'required'),
(29, 'pallor', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(30, 'photophobia', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(31, 'rash', 'required', 'optional', 'optional', 'required', 'not_required'),
(32, 'rigor', 'not_required', 'optional', 'optional', 'required', 'optional'),
(33, 'runny nose', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(34, 'seizures', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(35, 'spot', 'required', 'optional', 'optional', 'required', 'not_required'),
(36, 'stiffness', 'required', 'optional', 'optional', 'required', 'not_required'),
(37, 'sweating', 'not_required', 'optional', 'optional', 'required', 'optional'),
(38, 'unconsciousness', 'not_required', 'optional', 'optional', 'required', 'not_required'),
(39, 'vomiting', 'not_required', 'optional', 'optional', 'required', 'optional'),
(40, 'weakness', 'not_required', 'optional', 'optional', 'required', 'optional');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `symptoms_attribute`
--
ALTER TABLE `symptoms_attribute`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `symptoms_attribute`
--
ALTER TABLE `symptoms_attribute`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
