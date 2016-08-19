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
-- Database: `diseases`
--

-- --------------------------------------------------------

--
-- Table structure for table `heart_attack`
--

CREATE TABLE `heart_attack` (
  `ID` int(11) NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `Score` int(11) NOT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `Onset` varchar(255) DEFAULT NULL,
  `Pattern` varchar(255) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Severity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `heart_attack`
--

INSERT INTO `heart_attack` (`ID`, `Symptom`, `Score`, `Site`, `Onset`, `Pattern`, `Duration`, `Severity`) VALUES
(1, 'Pain', 10, 'chest', 'acute', 'continuous', 'hours', 'high'),
(2, 'Breathlessness', 9, '', 'acute', '', 'hours', ''),
(3, 'decreased heart rate', 8, '', '', '', '', ''),
(4, 'Vomiting', 8, '', '', '', '', ''),
(5, 'fainting', 8, '', '', '', '', ''),
(6, 'pallor', 8, '', '', '', '', ''),
(7, 'Cold ', 6, 'peripheries', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kidney_stone`
--

CREATE TABLE `kidney_stone` (
  `ID` int(11) NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `Score` int(11) NOT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `Onset` varchar(255) DEFAULT NULL,
  `Pattern` varchar(255) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Severity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kidney_stone`
--

INSERT INTO `kidney_stone` (`ID`, `Symptom`, `Score`, `Site`, `Onset`, `Pattern`, `Duration`, `Severity`) VALUES
(1, 'pain', 8, 'loin', 'acute', 'intermittent', 'hours', 'high'),
(2, 'pain', 6, 'back', 'acute', 'continuous', 'hours', 'mild'),
(3, 'Blood in urine', 8, '', '', '', '', ''),
(4, 'Pallor', 5, '', '', '', '', ''),
(5, 'Sweating', 5, '', '', '', '', ''),
(6, 'Vomiting', 5, '', '', '', '', ''),
(7, 'Increase in urinary frequency', 8, '', '', '', '', ''),
(8, 'Difficulty in passing urine', 8, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `malaria`
--

CREATE TABLE `malaria` (
  `ID` int(11) NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `Score` int(11) NOT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `Onset` varchar(255) DEFAULT NULL,
  `Pattern` varchar(255) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Severity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `malaria`
--

INSERT INTO `malaria` (`ID`, `Symptom`, `Score`, `Site`, `Onset`, `Pattern`, `Duration`, `Severity`) VALUES
(3, 'Fever', 9, '', 'insidious', 'intermittent', 'hours', 'severe'),
(4, 'Rigor', 9, '', '', '', '', ''),
(5, 'Chill', 9, '', '', '', '', ''),
(6, 'Sweating', 9, '', '', '', '', ''),
(7, 'Weakness', 7, '', 'insidious', '', 'weeks', 'moderate'),
(8, 'Headache', 7, '', 'insidious', '', 'weeks', 'moderate'),
(9, 'Vomiting', 5, '', '', '', '', ''),
(10, 'cough', 5, '', '', '', 'weeks', 'moderate'),
(11, 'diarrhoea', 5, '', '', '', '', 'mild'),
(12, 'Confusion', 3, '', '', '', '', ''),
(13, 'seizures', 2, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `measles`
--

CREATE TABLE `measles` (
  `ID` int(11) NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `Score` int(11) NOT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `Onset` varchar(255) DEFAULT NULL,
  `Pattern` varchar(255) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Severity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measles`
--

INSERT INTO `measles` (`ID`, `Symptom`, `Score`, `Site`, `Onset`, `Pattern`, `Duration`, `Severity`) VALUES
(1, 'Cough', 8, '', 'acute', '', 'days', 'moderate'),
(2, 'Runny nose', 8, '', 'acute', '', 'days', 'moderate'),
(3, 'Difficulty breathing', 8, '', 'acute', '', 'days', 'moderate'),
(4, 'Conjunctivitis', 8, '', 'acute', '', 'days', 'moderate'),
(5, 'Increased respiration', 8, '', 'acute', '', 'days', 'moderate'),
(6, 'spot', 10, 'mouth', '', '', 'days', ''),
(7, 'Rash', 10, 'face', 'gradual', '', 'days', ''),
(8, 'pain', 4, 'Ear', 'gradual', '', 'days', 'moderate'),
(9, 'weakness', 3, '', 'gradual', '', 'days', 'moderate');

-- --------------------------------------------------------

--
-- Table structure for table `meningitis`
--

CREATE TABLE `meningitis` (
  `ID` int(11) NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `Score` int(11) NOT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `Onset` varchar(255) DEFAULT NULL,
  `Pattern` varchar(255) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Severity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meningitis`
--

INSERT INTO `meningitis` (`ID`, `Symptom`, `Score`, `Site`, `Onset`, `Pattern`, `Duration`, `Severity`) VALUES
(1, 'Headache', 10, '', 'acute', '', 'days', 'high'),
(2, 'drowsiness', 8, '', '', '', '', ''),
(3, 'Fever', 9, '', 'acute', 'continuous', 'Weeks', 'high'),
(4, 'stiffness', 9, 'neck', '', '', '', ''),
(5, 'unconsciousness', 9, '', '', '', '', ''),
(6, 'rash', 9, '', '', '', '', ''),
(7, 'photophobia', 8, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pneumonia`
--

CREATE TABLE `pneumonia` (
  `ID` int(11) NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `Score` int(11) NOT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `Onset` varchar(255) DEFAULT NULL,
  `Pattern` varchar(255) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Severity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pneumonia`
--

INSERT INTO `pneumonia` (`ID`, `Symptom`, `Score`, `Site`, `Onset`, `Pattern`, `Duration`, `Severity`) VALUES
(1, 'Fever', 9, '', 'acute', 'continuous', 'days', 'high'),
(2, 'Rigor', 7, '', '', '', '', ''),
(3, 'Cough', 9, '', 'acute', '', '', ''),
(4, 'Pain', 6, 'chest', 'acute', '', 'days', 'mild'),
(5, 'Increase in breathing', 9, '', 'acute', '', '', ''),
(6, 'Malaise', 5, '', '', '', '', ''),
(7, 'Confusion', 7, '', '', '', '', ''),
(8, 'Loss of appetite', 5, '', '', '', '', ''),
(9, 'Headache', 6, '', 'acute', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `ID` int(11) NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `Score` int(11) NOT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `Onset` varchar(255) DEFAULT NULL,
  `Pattern` varchar(255) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Severity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`ID`, `Symptom`, `Score`, `Site`, `Onset`, `Pattern`, `Duration`, `Severity`) VALUES
(1, 'pain', 10, 'chest', 'acute', 'continuous', 'hours', 'high'),
(2, 'breathless', 9, '', 'acute', '', 'hours', ''),
(3, 'decreas heart rate', 8, '', '', '', '', ''),
(4, 'guy de maupas', 8, '', '', '', '', ''),
(5, 'faint', 8, '', '', '', '', ''),
(6, 'pallor', 8, '', '', '', '', ''),
(7, 'cold', 6, 'peripheries', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `heart_attack`
--
ALTER TABLE `heart_attack`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kidney_stone`
--
ALTER TABLE `kidney_stone`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `malaria`
--
ALTER TABLE `malaria`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `measles`
--
ALTER TABLE `measles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `meningitis`
--
ALTER TABLE `meningitis`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pneumonia`
--
ALTER TABLE `pneumonia`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `heart_attack`
--
ALTER TABLE `heart_attack`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `kidney_stone`
--
ALTER TABLE `kidney_stone`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `malaria`
--
ALTER TABLE `malaria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `measles`
--
ALTER TABLE `measles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `meningitis`
--
ALTER TABLE `meningitis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pneumonia`
--
ALTER TABLE `pneumonia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
