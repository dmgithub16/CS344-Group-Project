-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2017 at 10:49 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9
--By: Chung Ming Cheng
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbv3`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `User_ID` varchar(45) NOT NULL,
  `Rank` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `Name` varchar(100) NOT NULL,
  `Email` varchar(320) NOT NULL,
  `Dept` varchar(45) NOT NULL,
  `Phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `User_ID` varchar(45) NOT NULL,
  `Question_ID` varchar(45) NOT NULL,
  `Project_ID` varchar(45) NOT NULL,
  `Answer` varchar(999) NOT NULL,
  `Comment` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ID` varchar(45) NOT NULL,
  `User_ID` varchar(45) NOT NULL,
  `Advisor_Name` varchar(100) NOT NULL,
  `Group_Name` varchar(100) NOT NULL,
  `Title` varchar(350) NOT NULL,
  `Amount` double NOT NULL,
  `Contact_Name` varchar(100) NOT NULL,
  `Phone_Secndary` varchar(10) NOT NULL,
  `Group` varchar(100) NOT NULL,
  `Completed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queston`
--

CREATE TABLE `queston` (
  `ID` varchar(45) NOT NULL,
  `Text` varchar(999) NOT NULL,
  `Type` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Project_ID` varchar(45) NOT NULL,
  `User_ID` varchar(45) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Affiliation` tinyint(4) NOT NULL,
  `Comments` varchar(999) NOT NULL,
  `Completed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` varchar(45) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Campus_affiliation` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_primary` varchar(45) NOT NULL,
  `Status` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `User_ID` (`User_ID`),
  ADD UNIQUE KEY `Question_ID` (`Question_ID`),
  ADD UNIQUE KEY `Project_ID` (`Project_ID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Advisor_Name` (`Advisor_Name`);

--
-- Indexes for table `queston`
--
ALTER TABLE `queston`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Project_ID`),
  ADD UNIQUE KEY `User_ID` (`User_ID`),
  ADD KEY `Project_ID` (`Project_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Question_ID`) REFERENCES `queston` (`ID`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`ID`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`Advisor_Name`) REFERENCES `advisor` (`Name`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
