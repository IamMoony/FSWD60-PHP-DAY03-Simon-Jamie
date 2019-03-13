-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2019 at 01:58 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.15-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `AuthorID` int(11) NOT NULL,
  `AuthorName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`AuthorID`, `AuthorName`) VALUES
(1, 'Vincenzo the Great'),
(2, 'Jamie the Awsome'),
(3, 'Simon the Large'),
(4, 'Goran the Klavier');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BookID` int(11) NOT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `Title` text,
  `Price` int(11) DEFAULT NULL,
  `Descr` text,
  `Cover` text,
  `Pages` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Chapters` int(11) DEFAULT NULL,
  `Purchase_Date` datetime DEFAULT NULL,
  `fk_Publisher_ID` int(11) DEFAULT NULL,
  `fk_Sequence_ID` int(11) DEFAULT NULL,
  `fk_BookAuthorID` int(11) DEFAULT NULL,
  `fk_BookGenreID` int(11) DEFAULT NULL,
  `fk_BookLanguageID` int(11) DEFAULT NULL,
  `fk_BookRetailerID` int(11) DEFAULT NULL,
  `fk_ReadingTimesID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `ISBN`, `Title`, `Price`, `Descr`, `Cover`, `Pages`, `Rating`, `Chapters`, `Purchase_Date`, `fk_Publisher_ID`, `fk_Sequence_ID`, `fk_BookAuthorID`, `fk_BookGenreID`, `fk_BookLanguageID`, `fk_BookRetailerID`, `fk_ReadingTimesID`) VALUES
(1, 123456789, 'Twilight', 10, 'Still a better lovestory than twilight', 'not available', 200, 4, 10, '2019-03-18 00:00:00', 1, NULL, 4, 1, 1, 1, 2),
(2, 700603166, 'Jamies Adventure', 42, 'Jamie goes on a adventures adventure.', 'not available', 300, 10, 15, '2019-03-10 00:00:00', 3, NULL, 2, 2, 3, 1, 1),
(3, 400603166, 'VincenzoTheGreat', 20, 'Vincenzo and Marios adventure thorugh italy.', 'not available', 150, 7, 10, '2019-03-29 00:00:00', 4, NULL, 1, 3, 4, 2, 2),
(4, 837832682, 'Vienna the Great City', 50, 'All about our great city we live in. ', 'not available', 100, 10, 10, '2019-03-24 00:00:00', 2, NULL, 3, 4, 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookauthor`
--

CREATE TABLE `bookauthor` (
  `BookAuthorID` int(11) NOT NULL,
  `fk_AuthorID` int(11) DEFAULT NULL,
  `fk_BookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookauthor`
--

INSERT INTO `bookauthor` (`BookAuthorID`, `fk_AuthorID`, `fk_BookID`) VALUES
(1, 2, 2),
(2, 1, 3),
(3, 3, 4),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookgenre`
--

CREATE TABLE `bookgenre` (
  `BookGenreID` int(11) NOT NULL,
  `fk_BookID` int(11) DEFAULT NULL,
  `fk_GenreID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookgenre`
--

INSERT INTO `bookgenre` (`BookGenreID`, `fk_BookID`, `fk_GenreID`) VALUES
(1, 2, 2),
(2, 1, 1),
(3, 4, 4),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `booklanguage`
--

CREATE TABLE `booklanguage` (
  `BookLanguageID` int(11) NOT NULL,
  `fk_BookID` int(11) DEFAULT NULL,
  `fk_LanguageID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booklanguage`
--

INSERT INTO `booklanguage` (`BookLanguageID`, `fk_BookID`, `fk_LanguageID`) VALUES
(1, 4, 1),
(2, 1, 2),
(3, 3, 3),
(4, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bookretailer`
--

CREATE TABLE `bookretailer` (
  `BookRetailerID` int(11) NOT NULL,
  `fk_BookID` int(11) DEFAULT NULL,
  `fk_RetailerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookretailer`
--

INSERT INTO `bookretailer` (`BookRetailerID`, `fk_BookID`, `fk_RetailerID`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 3, 2),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `GenreID` int(11) NOT NULL,
  `GenreName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`GenreID`, `GenreName`) VALUES
(1, 'Romance'),
(2, 'Fantasy'),
(3, 'SciFI'),
(4, 'Historic Fantasy');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `LanguageID` int(11) NOT NULL,
  `LanguageName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`LanguageID`, `LanguageName`) VALUES
(1, 'French'),
(2, 'German'),
(3, 'English'),
(4, 'Russian');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `Publisher_ID` int(11) NOT NULL,
  `Publisher_Name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`Publisher_ID`, `Publisher_Name`) VALUES
(1, 'Simon & Schuster'),
(2, 'Frany Ferdinand'),
(3, 'Jamie Publishing'),
(4, 'Benjamin Franko Inc');

-- --------------------------------------------------------

--
-- Table structure for table `readingtimes`
--

CREATE TABLE `readingtimes` (
  `ReadingTimesID` int(11) NOT NULL,
  `StartRead` datetime DEFAULT NULL,
  `EndRead` datetime DEFAULT NULL,
  `EndPage` int(11) DEFAULT NULL,
  `fk_BookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `readingtimes`
--

INSERT INTO `readingtimes` (`ReadingTimesID`, `StartRead`, `EndRead`, `EndPage`, `fk_BookID`) VALUES
(1, '2018-12-11 00:00:00', '2019-04-17 00:00:00', 300, 2),
(2, '2018-04-03 00:00:00', '2019-03-05 00:00:00', 200, 4),
(3, '2019-03-19 00:00:00', '2019-03-22 00:00:00', 100, 2);

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

CREATE TABLE `retailer` (
  `RetailerID` int(11) NOT NULL,
  `RetailerName` text,
  `RetailerAddress` text,
  `RetailerPLZ` int(11) DEFAULT NULL,
  `RetailerCity` text,
  `RetailerCountry` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`RetailerID`, `RetailerName`, `RetailerAddress`, `RetailerPLZ`, `RetailerCity`, `RetailerCountry`) VALUES
(1, 'Amazon', 'Amazonstreet', 1140, 'Vienna', 'Austria'),
(2, 'Thalia', 'Thaliastreet', 1120, 'Vienna', 'Austria'),
(3, 'Mueller', 'Muellerstreet', 1220, 'Korneuburg', 'Austria'),
(4, 'Bookshop', 'Sesamestreet', 15555, 'New York', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `sequence`
--

CREATE TABLE `sequence` (
  `Sequence_ID` int(11) NOT NULL,
  `Sequence_Name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sequence`
--

INSERT INTO `sequence` (`Sequence_ID`, `Sequence_Name`) VALUES
(1, 'Twilight'),
(2, 'Jamies Advanture'),
(3, 'VincenzoTheGreat'),
(4, 'Vienna the Great City');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `fk_Publisher_ID` (`fk_Publisher_ID`),
  ADD KEY `fk_Sequence_ID` (`fk_Sequence_ID`),
  ADD KEY `book_ibfk_1` (`fk_BookAuthorID`),
  ADD KEY `book_ibfk_2` (`fk_BookGenreID`),
  ADD KEY `book_ibfk_3` (`fk_BookLanguageID`),
  ADD KEY `book_ibfk_4` (`fk_BookRetailerID`),
  ADD KEY `book_ibfk_5` (`fk_ReadingTimesID`);

--
-- Indexes for table `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD PRIMARY KEY (`BookAuthorID`),
  ADD KEY `fk_AuthorID` (`fk_AuthorID`) USING BTREE,
  ADD KEY `bookauthor_ibfk_3` (`fk_BookID`);

--
-- Indexes for table `bookgenre`
--
ALTER TABLE `bookgenre`
  ADD PRIMARY KEY (`BookGenreID`),
  ADD KEY `fk_GenreID` (`fk_GenreID`),
  ADD KEY `fk_BookID` (`fk_BookID`);

--
-- Indexes for table `booklanguage`
--
ALTER TABLE `booklanguage`
  ADD PRIMARY KEY (`BookLanguageID`),
  ADD KEY `fk_LanguageID` (`fk_LanguageID`),
  ADD KEY `fk_BookID` (`fk_BookID`);

--
-- Indexes for table `bookretailer`
--
ALTER TABLE `bookretailer`
  ADD PRIMARY KEY (`BookRetailerID`),
  ADD KEY `fk_RetailerID` (`fk_RetailerID`),
  ADD KEY `fk_BookID` (`fk_BookID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`GenreID`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`LanguageID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`Publisher_ID`);

--
-- Indexes for table `readingtimes`
--
ALTER TABLE `readingtimes`
  ADD PRIMARY KEY (`ReadingTimesID`),
  ADD KEY `fk_BookID` (`fk_BookID`);

--
-- Indexes for table `retailer`
--
ALTER TABLE `retailer`
  ADD PRIMARY KEY (`RetailerID`);

--
-- Indexes for table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`Sequence_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_BookAuthorID`) REFERENCES `bookauthor` (`BookAuthorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_BookGenreID`) REFERENCES `bookgenre` (`BookGenreID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`fk_BookLanguageID`) REFERENCES `booklanguage` (`BookLanguageID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_4` FOREIGN KEY (`fk_BookRetailerID`) REFERENCES `bookretailer` (`BookRetailerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_5` FOREIGN KEY (`fk_ReadingTimesID`) REFERENCES `readingtimes` (`ReadingTimesID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Publisher_ID` FOREIGN KEY (`fk_Publisher_ID`) REFERENCES `publisher` (`Publisher_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sequence_ID` FOREIGN KEY (`fk_Sequence_ID`) REFERENCES `sequence` (`Sequence_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD CONSTRAINT `bookauthor_ibfk_2` FOREIGN KEY (`fk_AuthorID`) REFERENCES `author` (`AuthorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bookauthor_ibfk_3` FOREIGN KEY (`fk_BookID`) REFERENCES `book` (`BookID`) ON UPDATE CASCADE;

--
-- Constraints for table `bookgenre`
--
ALTER TABLE `bookgenre`
  ADD CONSTRAINT `bookgenre_ibfk_2` FOREIGN KEY (`fk_GenreID`) REFERENCES `genre` (`GenreID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bookgenre_ibfk_3` FOREIGN KEY (`fk_BookID`) REFERENCES `book` (`BookID`) ON UPDATE CASCADE;

--
-- Constraints for table `booklanguage`
--
ALTER TABLE `booklanguage`
  ADD CONSTRAINT `booklanguage_ibfk_2` FOREIGN KEY (`fk_LanguageID`) REFERENCES `language` (`LanguageID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booklanguage_ibfk_3` FOREIGN KEY (`fk_BookID`) REFERENCES `book` (`BookID`) ON UPDATE CASCADE;

--
-- Constraints for table `bookretailer`
--
ALTER TABLE `bookretailer`
  ADD CONSTRAINT `bookretailer_ibfk_2` FOREIGN KEY (`fk_RetailerID`) REFERENCES `retailer` (`RetailerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bookretailer_ibfk_3` FOREIGN KEY (`fk_BookID`) REFERENCES `book` (`BookID`) ON UPDATE CASCADE;

--
-- Constraints for table `readingtimes`
--
ALTER TABLE `readingtimes`
  ADD CONSTRAINT `readingtimes_ibfk_1` FOREIGN KEY (`fk_BookID`) REFERENCES `book` (`BookID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
