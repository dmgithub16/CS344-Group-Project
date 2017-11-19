-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2017 at 08:17 PM
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
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `ID` varchar(45) NOT NULL,
  `Text` varchar(999) NOT NULL,
  `Type` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`ID`, `Text`, `Type`) VALUES
('001', 'Student Experience - Project includes opportunities for student involvement and/or will positively impact the student experience.', 'review'),
('002', 'Connection to Campus - Project directly addresses environmental sustainability on the WSU campus or in the capacity that on-campus activities directly influence environmental sustainability in the surrounding community.', 'review'),
('003', 'Feasibility and Institutional Support - Project is feasible and has support from appropriate campus individuals and entities. Individual students or student organizations must have the signature of a faculty or staff advisor who is committed to advising throughout project implementation.', 'review'),
('004', 'Appropriateness of Schedule and Budget Request - Project schedule and budget are reasonable and conform to established timelines, constraints and parameters.', 'review'),
('005', 'Accountability - Project includes mechanism for evaluation and follow-up. At a minimum, a project plan includes appropriate progress reports to the Sustainability Committee based on the duration of the project and a final report within 60 days following completion of the project.', 'review'),
('006', 'Innovation - Project is innovative in nature and does not include routine maintenance or code-compliant activities. Funding may support narrowing the gap between code-compliant and more sustainable alternatives.', 'review'),
('007', 'Environmental Benefits - Project demonstrates a reduction in WSU\'s carbon footprint or provides other environmental benefits such as water conservation, storm water management, biodiversity conservation, and waste minimization.', 'review'),
('008', 'Regional Connection - Project provides intellectual and emotional linkage with the unique landscape of the Driftless Area/ Mississippi River, as well as the cultural lifeways of this special place.', 'review'),
('009', 'Outreach and Education - Project considers interdisciplinary and experiential education and outreach opportunities and has included them as part of its implementation plan.', 'review'),
('010', 'Self Sufficiency - Project includes matching funds from sources beyond SGF or includes a plan for sustained funding.', 'review'),
('011', 'Potential for Broad Application - Project has potential to be scalable across the campus.', 'review'),
('012', ' Cost/Benefit Analysis (as appropriate) - Project proposal outlines project payback, lifecycle costs and savings, etc.', 'review');

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
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Name`, `Campus_affiliation`, `email`, `phone_primary`, `Status`) VALUES
('00001', 'test', 'test', 'test@winona.edu', '0000000000', 'student');

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
-- Indexes for table `question`
--
ALTER TABLE `question`
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
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`ID`),
  ADD CONSTRAINT `answer_ibfk_4` FOREIGN KEY (`Question_ID`) REFERENCES `question` (`ID`);

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
