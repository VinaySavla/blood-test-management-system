-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2023 at 09:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bloodtmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(11) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `AdminuserName` varchar(20) NOT NULL,
  `MobileNumber` int(11) NOT NULL,
  `Email` varchar(120) NOT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `AdminuserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(2, 'Admin', 'admin', 1234567890, 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2021-04-19 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatients`
--

CREATE TABLE `tblpatients` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `GovtIssuedId` varchar(150) DEFAULT NULL,
  `GovtIssuedIdNo` varchar(150) DEFAULT NULL,
  `FullAddress` varchar(255) DEFAULT NULL,
  `State` varchar(200) DEFAULT NULL,
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpatients`
--

INSERT INTO `tblpatients` (`id`, `FullName`, `MobileNumber`, `DateOfBirth`, `GovtIssuedId`, `GovtIssuedIdNo`, `FullAddress`, `State`, `RegistrationDate`) VALUES
(1, 'Vinay Savla', 9979583723, '2002-09-27', 'PAN', 'NESPS7463N', '32/12, XYZ Society, ABC Road, Wadala West - 400031', 'GUJARAT', '2022-05-05 17:58:49'),
(2, 'Soham Pansare', 9782302842, '2003-09-29', 'Aadhar', '987998799889', 'Room Number X, Y Building, Z road, Thane ', 'MAHARASHTRA', '2022-12-17 08:00:02'),
(3, 'Satshil', 8645974351, '1960-02-29', 'Aadhar', '742364873648', 'ashdgbahjsdghjw', 'ARUNACHAL PRADESH', '2022-12-17 10:24:03'),
(4, 'ABC', 9876543219, '2004-04-13', 'Aadhar Card', '987412367895 ', 'Ghatkopar', 'MAHARASHTRA ', '2022-12-17 10:24:09'),
(5, 'XYZ', 8976637811, '1986-11-10', 'mh 14 dd 1434', '12345678', 'sai-shradha so.,Prem nagar ,tunga village powai,', 'MAHARASTRA', '2023-03-25 05:51:20');

-- --------------------------------------------------------

--
-- Table structure for table `tblphlebotomist`
--

CREATE TABLE `tblphlebotomist` (
  `id` int(11) NOT NULL,
  `EmpID` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(20) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblphlebotomist`
--

INSERT INTO `tblphlebotomist` (`id`, `EmpID`, `FullName`, `MobileNumber`, `RegDate`) VALUES
(6, '1', 'Soham Pansare', 9988776655, '2023-10-05 06:53:52'),
(7, '2', 'Satshil', 4455667788, '2023-10-05 06:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `tblreporttracking`
--

CREATE TABLE `tblreporttracking` (
  `id` int(11) NOT NULL,
  `OrderNumber` bigint(20) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `Status` varchar(120) DEFAULT NULL,
  `PostingTime` timestamp NULL DEFAULT current_timestamp(),
  `RemarkBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblreporttracking`
--

INSERT INTO `tblreporttracking` (`id`, `OrderNumber`, `Remark`, `Status`, `PostingTime`, `RemarkBy`) VALUES
(1, 678944493, 'Processing', 'Sent to Lab', '2022-12-17 08:02:24', 2),
(2, 668369933, 'Please download the attached report file', 'Delivered', '2022-12-17 12:37:36', 2),
(3, 898921496, 'Will reach shortly', 'On the Way for Collection', '2022-12-18 12:20:09', 2),
(4, 309227996, 'Thank You', 'Sample Collected', '2022-12-18 12:20:29', 2),
(5, 678944493, 'Positive', 'Delivered', '2022-12-22 07:05:31', 2),
(6, 898921496, 'Complete blood test within 2 days .its an urgent.', 'Sent to Lab', '2023-03-26 12:56:42', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbltestrecord`
--

CREATE TABLE `tbltestrecord` (
  `id` int(11) NOT NULL,
  `OrderNumber` bigint(20) DEFAULT NULL,
  `PatientMobileNumber` bigint(20) DEFAULT NULL,
  `TestType` varchar(100) DEFAULT NULL,
  `TestTimeSlot` varchar(120) DEFAULT NULL,
  `ReportStatus` varchar(100) DEFAULT NULL,
  `FinalReport` varchar(150) DEFAULT NULL,
  `ReportUploadTime` varchar(200) DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT current_timestamp(),
  `AssignedtoEmpId` varchar(150) DEFAULT NULL,
  `AssigntoName` varchar(180) DEFAULT NULL,
  `AssignedTime` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltestrecord`
--

INSERT INTO `tbltestrecord` (`id`, `OrderNumber`, `PatientMobileNumber`, `TestType`, `TestTimeSlot`, `ReportStatus`, `FinalReport`, `ReportUploadTime`, `RegistrationDate`, `AssignedtoEmpId`, `AssigntoName`, `AssignedTime`) VALUES
(1, 678944493, 9979583723, 'CBC', '2022-05-06T14:30', 'Delivered', '55b079e0a85dfd77fb25f1c10acc6a931671692730.pdf', '22-12-2022 12:35:30 PM', '2022-05-05 17:58:49', '1', 'Soham Pansare', '05-05-2022 11:30:20 PM'),
(2, 668369933, 9782302842, 'LipidPanel', '2022-12-18T14:30', 'Delivered', '7ded0fc886ed399535462e8267d3f20f1671280656.pdf', '17-12-2022 06:07:36 PM', '2022-12-17 08:00:02', '2', 'Satshil', '17-12-2022 01:34:21 PM'),
(3, 898921496, 8645974351, 'CBC', '2022-12-17T15:53', 'Sent to Lab', NULL, NULL, '2022-12-17 10:24:03', '1', 'Soham Pansare', '18-12-2022 05:49:30 PM'),
(4, 309227996, 9876543219, 'CBC', '2022-12-18T18:00', 'Sample Collected', NULL, NULL, '2022-12-17 10:24:09', '2', 'Satshil', '17-12-2022 06:05:01 PM'),
(5, 100120773, 9979583723, 'PCR', '2022-12-18T18:00', 'Assigned', NULL, NULL, '2022-12-18 12:21:57', '1', 'Soham Pansare', '18-12-2022 05:52:34 PM'),
(6, 826952157, 9876543219, 'LipidPanel', '2022-12-19T12:20', NULL, NULL, NULL, '2022-12-18 12:23:38', NULL, NULL, NULL),
(7, 657345243, 9979583723, 'CBC', '2022-12-22T16:00', NULL, NULL, NULL, '2022-12-22 07:01:38', NULL, NULL, NULL),
(8, 677592057, 9979583723, 'PCR', '2022-12-22T16:30', NULL, NULL, NULL, '2022-12-22 07:03:00', NULL, NULL, NULL),
(9, 265274036, 9782302842, 'CBC', '2023-01-02T10:00', NULL, NULL, NULL, '2023-01-01 13:34:58', NULL, NULL, NULL),
(10, 923064673, 9979583723, 'CBC', '2023-03-02T19:52', NULL, NULL, NULL, '2023-03-10 14:22:42', NULL, NULL, NULL),
(11, 498601376, 8976637811, 'PCR', '2023-03-25T15:24', 'Assigned', NULL, NULL, '2023-03-25 05:51:20', '2', 'Satshil', '25-03-2023 11:23:58 AM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatients`
--
ALTER TABLE `tblpatients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblphlebotomist`
--
ALTER TABLE `tblphlebotomist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblreporttracking`
--
ALTER TABLE `tblreporttracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestrecord`
--
ALTER TABLE `tbltestrecord`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpatients`
--
ALTER TABLE `tblpatients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblphlebotomist`
--
ALTER TABLE `tblphlebotomist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblreporttracking`
--
ALTER TABLE `tblreporttracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbltestrecord`
--
ALTER TABLE `tbltestrecord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
