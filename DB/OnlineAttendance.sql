-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 16, 2023 at 10:41 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlineattendance`
--
CREATE DATABASE `onlineattendance` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `onlineattendance`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2001 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sno`, `username`, `password`, `type`) VALUES
(2000, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `advancedtimetable`
--

CREATE TABLE IF NOT EXISTS `advancedtimetable` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `TimeFrom` time NOT NULL,
  `TimeTo` time NOT NULL,
  `subjectid` int(11) NOT NULL,
  `Instructorid` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `subjectid` (`subjectid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `advancedtimetable`
--

INSERT INTO `advancedtimetable` (`sno`, `Day`, `TimeFrom`, `TimeTo`, `subjectid`, `Instructorid`) VALUES
(1, 'Monday', '08:00:00', '09:00:00', 1, 5000),
(2, 'Monday', '09:00:00', '10:00:00', 2, 5001),
(3, 'Monday', '10:00:00', '11:00:00', 3, 5002),
(4, 'Monday', '11:00:00', '12:00:00', 4, 0),
(5, 'Monday', '12:00:00', '13:00:00', 5, 0),
(6, 'Monday', '13:00:00', '14:00:00', 1, 5000),
(7, 'Monday', '14:00:00', '15:00:00', 2, 5001),
(8, 'Monday', '15:00:00', '16:00:00', 3, 5002),
(9, 'Tuesday', '08:00:00', '09:00:00', 4, 0),
(10, 'Tuesday', '09:00:00', '10:00:00', 5, 0),
(11, 'Tuesday', '10:00:00', '11:00:00', 1, 5000),
(12, 'Tuesday', '11:00:00', '12:00:00', 2, 5001),
(13, 'Tuesday', '12:00:00', '13:00:00', 3, 5002),
(14, 'Tuesday', '13:00:00', '14:00:00', 4, 0),
(15, 'Tuesday', '14:00:00', '15:00:00', 5, 0),
(16, 'Tuesday', '15:00:00', '16:00:00', 1, 5000),
(17, 'Wednesday', '08:00:00', '09:00:00', 2, 5001),
(18, 'Wednesday', '09:00:00', '10:00:00', 3, 5002),
(19, 'Wednesday', '10:00:00', '11:00:00', 4, 0),
(20, 'Wednesday', '11:00:00', '12:00:00', 5, 0),
(21, 'Wednesday', '12:00:00', '13:00:00', 1, 5000),
(22, 'Wednesday', '13:00:00', '14:00:00', 2, 5001),
(23, 'Wednesday', '14:00:00', '15:00:00', 3, 5002),
(24, 'Wednesday', '15:00:00', '16:00:00', 4, 0),
(25, 'Thursday', '08:00:00', '09:00:00', 5, 0),
(26, 'Thursday', '09:00:00', '10:00:00', 1, 5000),
(27, 'Thursday', '10:00:00', '11:00:00', 2, 5001),
(28, 'Thursday', '11:00:00', '12:00:00', 3, 5002),
(29, 'Thursday', '12:00:00', '13:00:00', 4, 0),
(30, 'Thursday', '13:00:00', '14:00:00', 5, 0),
(31, 'Thursday', '14:00:00', '15:00:00', 1, 5000),
(32, 'Thursday', '15:00:00', '16:00:00', 2, 5001),
(33, 'Friday', '08:00:00', '09:00:00', 2, 5001),
(34, 'Friday', '09:00:00', '10:00:00', 3, 5002),
(35, 'Friday', '10:00:00', '11:00:00', 4, 0),
(36, 'Friday', '11:00:00', '12:00:00', 5, 0),
(37, 'Friday', '13:00:00', '14:00:00', 1, 5000),
(38, 'Friday', '13:00:00', '14:00:00', 2, 5001),
(39, 'Friday', '14:00:00', '15:00:00', 3, 5002),
(40, 'Friday', '15:00:00', '16:00:00', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `Attendanceid` int(11) NOT NULL AUTO_INCREMENT,
  `Studentid` int(250) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `Status` varchar(250) NOT NULL,
  `Time` time NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Attendanceid`),
  KEY `Studentid` (`Studentid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1009 ;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`Attendanceid`, `Studentid`, `subjectid`, `Status`, `Time`, `Date`) VALUES
(1000, 3000, 2, 'P', '00:00:01', '2013-03-07'),
(1001, 3000, 3, 'P', '11:50:20', '2013-03-07'),
(1002, 3000, 4, 'P', '15:30:26', '2013-03-07'),
(1003, 3000, 5, 'P', '16:48:49', '2013-03-07'),
(1004, 3002, 4, 'P', '17:36:00', '2013-03-07'),
(1005, 3001, 2, 'P', '18:14:06', '2013-03-07'),
(1006, 3001, 5, 'P', '18:16:08', '2013-03-07'),
(1007, 3001, 4, 'P', '18:28:23', '2013-03-07'),
(1008, 3001, 4, 'P', '15:14:54', '2013-03-08');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(250) NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `categoryname`) VALUES
(1, 'Workshops'),
(2, 'Guest Lecture'),
(3, 'Journals'),
(4, 'Certifications'),
(5, 'Webinars');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(250) NOT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseid`, `coursename`) VALUES
(1, 'B.E -  Civil'),
(2, 'B.E - Mech'),
(3, 'B.E -  CSE'),
(4, 'B.E - EEE'),
(5, 'B.E -  ECE'),
(6, 'B.E - E&I');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `gradeid` int(11) NOT NULL AUTO_INCREMENT,
  `Studentid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `Grade` varchar(250) NOT NULL,
  `Status` varchar(250) NOT NULL,
  PRIMARY KEY (`gradeid`),
  KEY `courseid` (`courseid`),
  KEY `subjectid` (`subjectid`),
  KEY `Studentid` (`Studentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`gradeid`, `Studentid`, `courseid`, `subjectid`, `Grade`, `Status`) VALUES
(1, 3000, 2, 1, 'A', 'very Good');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `Instructorid` int(11) NOT NULL AUTO_INCREMENT,
  `InstructorName` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `courseid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  PRIMARY KEY (`Instructorid`),
  KEY `courceid` (`courseid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5003 ;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`Instructorid`, `InstructorName`, `username`, `password`, `courseid`, `subjectid`) VALUES
(5000, 'baktha', 'baktha', 'baktha', 1, 1),
(5001, 'anchana', 'anchana', 'anchana', 1, 2),
(5002, 'samganesh', 'ganesh', 'ganesh', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_academicdetails`
--

CREATE TABLE IF NOT EXISTS `instructor_academicdetails` (
  `AcademicId` int(11) NOT NULL AUTO_INCREMENT,
  `Instructorid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `Percentage` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL,
  PRIMARY KEY (`AcademicId`),
  KEY `subjectid` (`subjectid`),
  KEY `courseid` (`courseid`),
  KEY `Instructorid` (`Instructorid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `instructor_academicdetails`
--

INSERT INTO `instructor_academicdetails` (`AcademicId`, `Instructorid`, `courseid`, `subjectid`, `Percentage`, `Year`, `RecordedDate`) VALUES
(1, 5000, 1, 1, 95, 1, '2023-12-16 00:30:05'),
(2, 5000, 1, 1, 90, 2, '2023-12-16 00:30:16');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_extracurricular`
--

CREATE TABLE IF NOT EXISTS `instructor_extracurricular` (
  `ExtraId` int(11) NOT NULL AUTO_INCREMENT,
  `Instructorid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Subject` varchar(250) DEFAULT NULL,
  `Venue` text,
  `Description` text,
  `AttendedDate` datetime DEFAULT NULL,
  `RecordedDate` datetime NOT NULL,
  PRIMARY KEY (`ExtraId`),
  KEY `Instructorid` (`Instructorid`),
  KEY `categoryid` (`categoryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `instructor_extracurricular`
--

INSERT INTO `instructor_extracurricular` (`ExtraId`, `Instructorid`, `categoryid`, `Name`, `Subject`, `Venue`, `Description`, `AttendedDate`, `RecordedDate`) VALUES
(1, 5000, 1, 'AI Training', 'AI', 'Chennai Public School, Perungudi', '', '2023-12-15 00:00:00', '2023-12-15 14:22:17'),
(2, 5000, 2, 'Cloud Computing', 'Cloud Computing', 'Chennai Public School, Perungudi', 'Taken Lecture for cloud computing for half a day.', '2023-12-15 00:00:00', '2023-12-15 14:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_feedbackdetails`
--

CREATE TABLE IF NOT EXISTS `instructor_feedbackdetails` (
  `FeedbackId` int(11) NOT NULL AUTO_INCREMENT,
  `Studentid` int(11) NOT NULL,
  `Instructorid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `Concept_Explanation` int(11) DEFAULT NULL,
  `Practical_Explanation` int(11) DEFAULT NULL,
  `Example_Explanation` int(11) DEFAULT NULL,
  `Feedback` text,
  `RecordedDate` datetime NOT NULL,
  PRIMARY KEY (`FeedbackId`),
  KEY `Instructorid` (`Instructorid`),
  KEY `Studentid` (`Studentid`),
  KEY `subjectid` (`subjectid`),
  KEY `Learning` (`Concept_Explanation`),
  KEY `Listening` (`Practical_Explanation`),
  KEY `Communication` (`Example_Explanation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `instructor_feedbackdetails`
--

INSERT INTO `instructor_feedbackdetails` (`FeedbackId`, `Studentid`, `Instructorid`, `subjectid`, `Concept_Explanation`, `Practical_Explanation`, `Example_Explanation`, `Feedback`, `RecordedDate`) VALUES
(2, 3000, 5000, 1, 1, 2, 1, 'Good', '2023-12-16 08:05:09');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_leavedetails`
--

CREATE TABLE IF NOT EXISTS `instructor_leavedetails` (
  `LeaveId` int(11) NOT NULL AUTO_INCREMENT,
  `Instructorid` int(11) NOT NULL,
  `leavetypeid` int(11) NOT NULL,
  `LeaveDate` datetime NOT NULL,
  `Reason` text,
  `Status` tinyint(1) NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `RecordedDate` datetime NOT NULL,
  PRIMARY KEY (`LeaveId`),
  KEY `Instructorid` (`Instructorid`),
  KEY `leavetypeid` (`leavetypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `instructor_leavedetails`
--

INSERT INTO `instructor_leavedetails` (`LeaveId`, `Instructorid`, `leavetypeid`, `LeaveDate`, `Reason`, `Status`, `UpdatedDate`, `RecordedDate`) VALUES
(2, 5000, 2, '2023-12-26 00:00:00', 'Not Feeling Well', 0, '2023-12-15 21:04:58', '2023-12-15 18:35:50'),
(3, 5000, 2, '2023-12-16 00:00:00', 'Not Well', 1, '2023-12-15 21:04:47', '2023-12-15 20:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `leavetype`
--

CREATE TABLE IF NOT EXISTS `leavetype` (
  `leavetypeid` int(11) NOT NULL AUTO_INCREMENT,
  `leavetypename` varchar(250) NOT NULL,
  PRIMARY KEY (`leavetypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `leavetype`
--

INSERT INTO `leavetype` (`leavetypeid`, `leavetypename`) VALUES
(1, 'Maternity Leave '),
(2, 'Sick Leave');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE IF NOT EXISTS `parents` (
  `parentid` int(11) NOT NULL AUTO_INCREMENT,
  `Parentname` varchar(250) NOT NULL,
  `Relationship` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `Studentid` int(11) NOT NULL,
  PRIMARY KEY (`parentid`),
  KEY `Studentid` (`Studentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4003 ;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`parentid`, `Parentname`, `Relationship`, `username`, `password`, `Studentid`) VALUES
(4000, 'kiruba', 'Father', 'vijay', 'vijay', 3000),
(4001, 'pavithra', 'mother', 'pavithra', 'pavithra', 3000),
(4002, 'arun', 'father', 'arun', 'arun', 3002);

-- --------------------------------------------------------

--
-- Table structure for table `ratingdetails`
--

CREATE TABLE IF NOT EXISTS `ratingdetails` (
  `ratingid` int(11) NOT NULL AUTO_INCREMENT,
  `ratingname` varchar(35) NOT NULL,
  `ratingstar` varchar(35) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`ratingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ratingdetails`
--

INSERT INTO `ratingdetails` (`ratingid`, `ratingname`, `ratingstar`, `rating`) VALUES
(1, 'Very Good', '*****', 10),
(2, 'Good', '****', 8),
(3, 'Average', '***', 6),
(4, 'Poor', '**', 4),
(5, 'Very Poor', '*', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `Studentid` int(11) NOT NULL AUTO_INCREMENT,
  `Studentname` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `courseid` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Emailid` varchar(250) NOT NULL,
  PRIMARY KEY (`Studentid`),
  KEY `courseid` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3003 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Studentid`, `Studentname`, `type`, `username`, `password`, `courseid`, `DOB`, `Emailid`) VALUES
(3000, 'jayakumar', 'student', 'jaya', 'jaya', 1, '2013-02-26', 'kirubakarans2009@gmail.com'),
(3001, 'senthil', 'Student', 'senthil', 'senthil', 6, '2013-03-12', 'senthil@gmail.com'),
(3002, 'sam', 'Student', 'sam', 'sam', 2, '2013-03-07', 'sam@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `student_feedbackdetails`
--

CREATE TABLE IF NOT EXISTS `student_feedbackdetails` (
  `FeedbackId` int(11) NOT NULL AUTO_INCREMENT,
  `Instructorid` int(11) NOT NULL,
  `Studentid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `Learning` int(11) DEFAULT NULL,
  `Listening` int(11) DEFAULT NULL,
  `Communication` int(11) DEFAULT NULL,
  `Answering` int(11) DEFAULT NULL,
  `Assignment` int(11) DEFAULT NULL,
  `OverallRating` int(11) DEFAULT NULL,
  `Feedback` text,
  `RecordedDate` datetime NOT NULL,
  PRIMARY KEY (`FeedbackId`),
  KEY `Instructorid` (`Instructorid`),
  KEY `Studentid` (`Studentid`),
  KEY `subjectid` (`subjectid`),
  KEY `Learning` (`Learning`),
  KEY `Listening` (`Listening`),
  KEY `Communication` (`Communication`),
  KEY `Answering` (`Answering`),
  KEY `Assignment` (`Assignment`),
  KEY `OverallRating` (`OverallRating`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `student_feedbackdetails`
--

INSERT INTO `student_feedbackdetails` (`FeedbackId`, `Instructorid`, `Studentid`, `subjectid`, `Learning`, `Listening`, `Communication`, `Answering`, `Assignment`, `OverallRating`, `Feedback`, `RecordedDate`) VALUES
(4, 5000, 3000, 1, 1, 2, 1, 1, 1, 2, 'Improve your self', '2023-12-16 02:52:17'),
(5, 5000, 3000, 1, 1, 2, 1, 1, 1, 2, 'Improve your self', '2023-12-16 02:52:17'),
(6, 5000, 3000, 1, 1, 2, 1, 1, 1, 2, 'Improve your self', '2023-12-16 02:52:17'),
(7, 5000, 3000, 1, 1, 2, 1, 1, 1, 2, 'Improve your self', '2023-12-16 02:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subjectid` int(11) NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(250) NOT NULL,
  PRIMARY KEY (`subjectid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subjectid`, `subjectname`) VALUES
(1, 'Maths'),
(2, 'English'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'Tamil');

-- --------------------------------------------------------

--
-- Table structure for table `timtable`
--

CREATE TABLE IF NOT EXISTS `timtable` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `12_1` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `12_1` (`12_1`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `timtable`
--

INSERT INTO `timtable` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `12_1`, `1_2`, `2_3`, `3_4`) VALUES
(1, 'Mon', 1, 2, 3, 4, 5, 1, 2, 3),
(2, 'Tue', 4, 5, 1, 2, 3, 4, 5, 1),
(3, 'wed', 2, 3, 4, 5, 1, 2, 3, 4),
(4, 'Thursday', 5, 1, 2, 3, 4, 5, 1, 2),
(5, 'Fri', 2, 3, 4, 5, 1, 2, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `yeardetails`
--

CREATE TABLE IF NOT EXISTS `yeardetails` (
  `yearid` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`yearid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `yeardetails`
--

INSERT INTO `yeardetails` (`yearid`, `year`) VALUES
(1, 2023),
(2, 2022),
(3, 2021),
(4, 2020);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `instructor_academicdetails`
--
ALTER TABLE `instructor_academicdetails`
  ADD CONSTRAINT `instructor_academicdetails_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_academicdetails_ibfk_2` FOREIGN KEY (`subjectid`) REFERENCES `subject` (`subjectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_academicdetails_ibfk_3` FOREIGN KEY (`Instructorid`) REFERENCES `instructor` (`Instructorid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor_extracurricular`
--
ALTER TABLE `instructor_extracurricular`
  ADD CONSTRAINT `instructor_extracurricular_ibfk_1` FOREIGN KEY (`Instructorid`) REFERENCES `instructor` (`Instructorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_extracurricular_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor_feedbackdetails`
--
ALTER TABLE `instructor_feedbackdetails`
  ADD CONSTRAINT `instructor_feedbackdetails_ibfk_1` FOREIGN KEY (`Studentid`) REFERENCES `student` (`Studentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_feedbackdetails_ibfk_2` FOREIGN KEY (`Instructorid`) REFERENCES `instructor` (`Instructorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_feedbackdetails_ibfk_3` FOREIGN KEY (`subjectid`) REFERENCES `subject` (`subjectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_feedbackdetails_ibfk_4` FOREIGN KEY (`Concept_Explanation`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_feedbackdetails_ibfk_5` FOREIGN KEY (`Practical_Explanation`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_feedbackdetails_ibfk_6` FOREIGN KEY (`Example_Explanation`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor_leavedetails`
--
ALTER TABLE `instructor_leavedetails`
  ADD CONSTRAINT `instructor_leavedetails_ibfk_1` FOREIGN KEY (`Instructorid`) REFERENCES `instructor` (`Instructorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_leavedetails_ibfk_2` FOREIGN KEY (`leavetypeid`) REFERENCES `leavetype` (`leavetypeid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_feedbackdetails`
--
ALTER TABLE `student_feedbackdetails`
  ADD CONSTRAINT `student_feedbackdetails_ibfk_1` FOREIGN KEY (`Instructorid`) REFERENCES `instructor` (`Instructorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_feedbackdetails_ibfk_2` FOREIGN KEY (`Studentid`) REFERENCES `student` (`Studentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_feedbackdetails_ibfk_3` FOREIGN KEY (`subjectid`) REFERENCES `subject` (`subjectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_feedbackdetails_ibfk_4` FOREIGN KEY (`Learning`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_feedbackdetails_ibfk_5` FOREIGN KEY (`Listening`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_feedbackdetails_ibfk_6` FOREIGN KEY (`Communication`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_feedbackdetails_ibfk_7` FOREIGN KEY (`Answering`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_feedbackdetails_ibfk_8` FOREIGN KEY (`Assignment`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_feedbackdetails_ibfk_9` FOREIGN KEY (`OverallRating`) REFERENCES `ratingdetails` (`ratingid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
