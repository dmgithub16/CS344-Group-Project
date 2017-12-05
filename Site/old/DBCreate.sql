-- Code by "Kenny" Chung Ming Cheng
-- Design by Derek Morgan

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `user_id` varchar(45) NOT NULL,
  `rank` int(11) DEFAULT NULL COMMENT '1:Admin\n2:Reviewer\n3:Both',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_admin_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('00000',3,'2017-11-14');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advisor` (
  `a_name` varchar(100) NOT NULL,
  `email` varchar(320) DEFAULT NULL,
  `dept` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`a_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES ('Some Advisor A','someAdvisorA@winona.edu','Biology','0987654321'),('Some Advisor B','someAdvisorB@winona.edu','Math','0987654321');
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `user_id` varchar(45) NOT NULL,
  `question_id` varchar(45) NOT NULL,
  `project_id` varchar(45) NOT NULL,
  `answer` varchar(999) DEFAULT NULL,
  `comment` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`question_id`,`project_id`),
  KEY `fk_answer_user1_idx` (`user_id`),
  KEY `fk_answer_project1_idx` (`project_id`),
  KEY `fk_answer_question1` (`question_id`),
  CONSTRAINT `fk_answer_project1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES ('1','001','0001','exc1','Comments'),('1','001','0002','exc1','Comments'),('1','002','0001','exc1','Comments'),('1','002','0002','exc1','Comments'),('1','003','0001','exc1','Comments'),('1','003','0002','exc1','Comments'),('1','004','0001','exc1','Comments'),('1','004','0002','exc1','Comments'),('1','005','0001','exc1','Comments'),('1','005','0002','exc1','Comments'),('1','006','0001','exc1','Comments'),('1','006','0002','exc1','Comments'),('1','007','0001','exc1','Comments'),('1','007','0002','exc1','Comments'),('1','008','0001','exc1','Comments'),('1','008','0002','exc1','Comments'),('1','009','0001','exc1','Comments'),('1','009','0002','exc1','Comments'),('1','010','0001','exc1','Comments'),('1','010','0002','exc1','Comments'),('1','011','0001','exc1','Comments'),('1','011','0002','exc1','Comments'),('1','012','0001','exc1','Comments'),('1','012','0002','exc1','Comments'),('2','001','0001','exc1','1'),('2','002','0001','exc1','2'),('2','003','0001','exc1','3'),('2','004','0001','exc1','4'),('2','005','0001','exc1','5'),('2','006','0001','exc1','6'),('2','007','0001','exc1','7'),('2','008','0001','exc1','8'),('2','009','0001','exc1','9'),('2','010','0001','exc1','10'),('2','011','0001','exc1','11'),('2','012','0001','exc1','12');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `advisor_name` varchar(100) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `title` varchar(350) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_project_advisor1_idx` (`advisor_name`),
  KEY `fk_project_user1_idx` (`user_id`),
  CONSTRAINT `fk_project_advisor1` FOREIGN KEY (`advisor_name`) REFERENCES `advisor` (`a_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('0001','1','Some Advisor A','','Don\'t Be Frackin Greedy',1000,'A. Name',0),('0002','2','Some Advisor B','','Quit Killing Stuff!',1200,'A. Name',0),('0003','2','Some Advisor B','Lemur Lovers Of America','LemurGuard',500,'A. Name',0);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` varchar(45) NOT NULL,
  `text` varchar(999) DEFAULT NULL,
  `type` varchar(7) DEFAULT NULL COMMENT 'This is important, the types are project, budget, and review and they correlate to the different phases of our proposal lifecycle',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('001','Student Experience - Project includes opportunities for student involvement and/or will positively impact the student experience.','review'),('002','Connection to Campus - Project directly addresses environmental sustainability on the WSU campus or in the capacity that on-campus activities directly influence environmental sustainability in the surrounding community.','review'),('003','Feasibility and Institutional Support - Project is feasible and has support from appropriate campus individuals and entities. Individual students or student organizations must have the signature of a faculty or staff advisor who is committed to advising throughout project implementation.','review'),('004','Appropriateness of Schedule and Budget Request - Project schedule and budget are reasonable and conform to established timelines, constraints and parameters.','review'),('005','Accountability - Project includes mechanism for evaluation and follow-up. At a minimum, a project plan includes appropriate progress reports to the Sustainability Committee based on the duration of the project and a final report within 60 days following completion of the project.','review'),('006','Innovation - Project is innovative in nature and does not include routine maintenance or code-compliant activities. Funding may support narrowing the gap between code-compliant and more sustainable alternatives.','review'),('007','Environmental Benefits - Project demonstrates a reduction in WSU\'s carbon footprint or provides other environmental benefits such as water conservation, storm water management, biodiversity conservation, and waste minimization.','review'),('008','Regional Connection - Project provides intellectual and emotional linkage with the unique landscape of the Driftless Area/ Mississippi River, as well as the cultural lifeways of this special place.','review'),('009','Outreach and Education - Project considers interdisciplinary and experiential education and outreach opportunities and has included them as part of its implementation plan.','review'),('010','Self Sufficiency - Project includes matching funds from sources beyond SGF or includes a plan for sustained funding.','review'),('011','Potential for Broad Application - Project has potential to be scalable across the campus.','review'),('012',' Cost/Benefit Analysis (as appropriate) - Project proposal outlines project payback, lifecycle costs and savings, etc.','review');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `project_id` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `r_name` varchar(100) DEFAULT NULL,
  `affiliation` tinyint(4) DEFAULT NULL,
  `comments` varchar(999) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `fk_review_project1_idx` (`project_id`),
  KEY `fk_review_user1_idx` (`user_id`),
  CONSTRAINT `fk_review_project1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('0001','1','TestNameA',0,'blah blah blah',1),('0001','2','TestNameB',0,'blah blah blah \r\n',1),('0002','1','TestNameA',0,'',1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(45) NOT NULL,
  `u_name` varchar(100) DEFAULT NULL,
  `campus_affiliation` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_primary` varchar(45) DEFAULT NULL,
  `status` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('00000','test','test','test@winona.edu','0000000000','student'),('1','TestNameA','student','TestNameA@winona.edu','1234567890',''),('2','TestNameB','student','TestNameB@winona.edu','1234567890',''),('3','TestNameC','student','TestNameC@winona.edu','1234567890','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-28 12:20:07
