-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2018 at 03:31 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_sw_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL,
  `street` varchar(55) NOT NULL,
  `houseNumb` int(11) NOT NULL,
  `zip` int(11) NOT NULL,
  `city` varchar(55) NOT NULL,
  `country` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressId`, `street`, `houseNumb`, `zip`, `city`, `country`) VALUES
(1, 'Wood Duck Drive', 221, 49801, 'Iron Mountain', 'USA'),
(2, 'Geneva Street', 4989, 10016, 'New York', 'USA'),
(3, 'Chipmunk Lane', 1701, 4468, 'Old Town', 'USA'),
(4, 'Southside Lange', 864, 90017, 'Los Angeles', 'USA'),
(5, 'Kinney Street', 4239, 1056, 'Ludlow', 'USA'),
(6, 'Virginia Street', 1966, 60605, 'Chicago', 'USA'),
(7, 'Sycamore Lake Road', 538, 54911, 'Appleton', 'USA'),
(8, 'Broadcast Drive', 3885, 20004, 'Washington', 'USA'),
(9, 'Stark Hollow Road', 4642, 80759, 'Yuma', 'USA'),
(10, 'Bolman Court', 3915, 60963, 'Henning', 'USA'),
(11, 'Clinton Street', 4247, 72211, 'Little Rock', 'USA'),
(12, 'Lake Floyd Circle', 559, 19720, 'New Castle', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `authorId` int(11) NOT NULL,
  `firstName` varchar(55) NOT NULL,
  `lastName` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`authorId`, `firstName`, `lastName`) VALUES
(1, 'Tara', 'Westover'),
(2, 'Kristin', 'Hannah'),
(3, 'A. J.', 'Finn'),
(4, 'Curtis', 'Sittenfeld'),
(5, 'Leslie', 'Benzies'),
(6, 'Paul', 'Linford'),
(7, 'Frank', 'Sinatra'),
(8, 'Royal Philharmonic Orchestra', 'Elvis Presley'),
(9, 'James', 'L. Brooks'),
(10, 'Blake', 'Edwards');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `mediaId` int(11) NOT NULL,
  `ISBN_ASIN` bigint(20) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(55) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `publDate` date NOT NULL,
  `status` enum('available','unavailable') NOT NULL,
  `fk_authorId` int(11) DEFAULT NULL,
  `fk_publisherId` int(11) DEFAULT NULL,
  `genres` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`mediaId`, `ISBN_ASIN`, `title`, `type`, `img`, `description`, `publDate`, `status`, `fk_authorId`, `fk_publisherId`, `genres`) VALUES
(1, 9780399590504, 'Educated - A Memoir', 'book', 'https://images-na.ssl-images-amazon.com/images/I/41qgBxTjYxL._SX327_BO1,204,203,200_.jpg', 'An unforgettable memoir about a young girl who, kept out of school, leaves her survivalist family and goes on to earn a PhD from Cambridge University\r\n', '2018-02-20', 'available', 1, 1, 'Biographies'),
(2, 9780312577230, 'The Great Alone', 'book', 'https://images-na.ssl-images-amazon.com/images/I/511Dl74cE9L._SX328_BO1,204,203,200_.jpg', 'Thirteen-year-old Leni, a girl coming of age in a tumultuous time, caught in the riptide of her parents’ passionate, stormy relationship, dares to hope that a new land will lead to a better future for her family.', '2018-02-06', 'unavailable', 2, 2, 'Fiction'),
(3, 9780062678416, 'The Woman in the Window', 'book', 'https://images-na.ssl-images-amazon.com/images/I/51Ux5AQLB6L._SX329_BO1,204,203,200_.jpg', 'Anna Fox lives alone—a recluse in her New York City home, unable to venture outside. She spends her day drinking wine (maybe too much), watching old movies, recalling happier times . . . and spying on her neighbors.', '2018-01-02', 'available', 3, 3, 'Thriller'),
(4, 9780399591889, 'You Think It, I´ll Say It', 'book', 'https://images-na.ssl-images-amazon.com/images/I/41Z5NezZSTL._SX329_BO1,204,203,200_.jpg', 'A suburban mother of two fantasizes about the downfall of an old friend whose wholesome lifestyle empire may or may not be built on a lie.', '2018-04-24', 'unavailable', 4, 1, 'Fiction'),
(5, 3029685701168, 'GTA San Andreas', 'game', 'https://images-na.ssl-images-amazon.com/images/I/51U8mwJuGvL.jpg', 'In 1992, Carl \"CJ\" Johnson, a former gangbanger for the Los Santos-based Grove Street Families, returns home to Los Santos from Liberty City after learning of his mother´s murder in a drive-by shooting.', '2004-10-26', 'available', 5, 4, 'Action'),
(6, 2097813682226, 'Need for Speed Most Wanted', 'game', 'https://images-na.ssl-images-amazon.com/images/I/615S4BB8KML._AC_SX215_.jpg', 'Go up against the best street racers on the scene to earn respect and rise to the top of the Blacklist', '2006-03-14', 'unavailable', 6, 5, 'Racing'),
(7, 8036521583613, 'Come Fly with Me', 'music', 'https://images-na.ssl-images-amazon.com/images/I/81I3mWSU-aL._SL1500_.jpg', 'Sinatra´s first collaboration with arranger/conductor Billy May, Come Fly with Me was designed as a musical trip around the world. Sammy Cahn and Jimmy Van Heusen wrote the title track at Sinatra´s request.', '1958-01-06', 'available', 7, 6, 'Jazz'),
(8, 7388174171473, 'The Wonder of You: Elvis Presley with The Royal Philhar', 'music', 'https://images-na.ssl-images-amazon.com/images/I/712uwHgku8L._SX522_.jpg', 'The Wonder Of You: Elvis Presley With The Royal Philharmonic Orchestra presents the iconic artist´s unmistakable voice and most dramatic original performances augmented with lush new orchestral accompaniment. ', '2016-10-21', 'available', 8, 7, 'Rock'),
(9, 1034314196151, 'As Good As It Gets', 'movie', 'https://images-na.ssl-images-amazon.com/images/I/71Mec+eTUzL._RI_.jpg', 'Drama about a man with Obsessive compulsive disorder who falls for a woman and needs to learn how to pursue her despite his disorder.', '1997-01-01', 'unavailable', 9, 8, 'Comedy-Drama'),
(10, 3990985240917, 'Breakfast at Tiffany´s', 'movie', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/Breakfast_at_Tiffanys.jpg/215px-Breakfast_at_Tiffanys.jpg', 'A flighty young New York social butterfly becomes complicatedly smitten with a young man in her apartment building.', '1961-10-05', 'available', 10, 9, 'Comedy-Drama');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisherId` int(11) NOT NULL,
  `publName` varchar(100) NOT NULL,
  `publSize` enum('S','M','L') NOT NULL,
  `fk_addressId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisherId`, `publName`, `publSize`, `fk_addressId`) VALUES
(1, '<a href=\'../filter/filter_publMediaId1.php\'>Random House</a>', 'L', 1),
(2, 'Holtzbrinck Publishers', 'M', 2),
(3, 'William Morrow', 'S', 3),
(4, 'Rockstar', 'L', 4),
(5, 'Electronic Arts', 'L', 5),
(6, 'EMI 100', 'S', 6),
(7, 'Sony Legacy', 'L', 7),
(8, 'TriStar Pictures', 'M', 8),
(9, 'Paramount', 'L', 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(55) NOT NULL,
  `userEmail` varchar(55) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  `fk_mediaId` int(11) DEFAULT NULL,
  `rootUsr` enum('root','common') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userName`, `userEmail`, `userPass`, `fk_mediaId`, `rootUsr`) VALUES
(2, 'superuser', 'admin@root.com', '811f980c35f28a301ae80544e5a8cb10e72b8358dc474c8cf5559873292c518d', NULL, 'root'),
(3, 'test user', 'test@user.com', 'ae5deb822e0d71992900471a7199d0d95b8e7c9d05c40a8245a281fd2c1d6684', NULL, NULL),
(4, 'Elise Butler', 'elise@butler.com', '92e8756b248b46a7a26344f8681ec4d1eb0bf71b9ba417141a95a5be2dcc6ec4', NULL, NULL),
(5, 'Will Smith', 'will@smith.com', 'e25b9c68a9637b4e61979f9fe69b7af8d07244f3815596569d5af609b4dff142', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressId`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorId`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`mediaId`),
  ADD KEY `fk_authorId` (`fk_authorId`),
  ADD KEY `fk_publisherId` (`fk_publisherId`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherId`),
  ADD KEY `fk_addressId` (`fk_addressId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `fk_mediaId` (`fk_mediaId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `authorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `mediaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisherId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_authorId`) REFERENCES `author` (`authorId`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisherId`) REFERENCES `publisher` (`publisherId`);

--
-- Constraints for table `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`fk_addressId`) REFERENCES `address` (`addressId`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`fk_mediaId`) REFERENCES `media` (`mediaId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
