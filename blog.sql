-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2021 at 01:33 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloginfo`
--

CREATE TABLE `bloginfo` (
  `id` int(12) NOT NULL,
  `bannerTitle` varchar(100) NOT NULL,
  `bannerContent` varchar(250) NOT NULL,
  `theme` varchar(30) NOT NULL DEFAULT 'light-them'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(12) NOT NULL,
  `cName` varchar(50) NOT NULL,
  `cDiscription` longtext NOT NULL,
  `cImg` varchar(500) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `cName`, `cDiscription`, `cImg`) VALUES
(1, 'Bollywood', 'Post about Bollywood Celebrities.', 'bollywood.jpg'),
(2, 'Health', 'Health is wealth', 'health.jpg'),
(3, 'Lifestyle ', 'be good Life Style.', 'lifestyle-blogs.jpg'),
(4, 'DIY ', '', 'diy-blogs.jpg'),
(5, 'Fitness ', '', 'lifestyle-blogs.jpg'),
(6, 'Sports ', '', 'sports-blogs.jpg'),
(7, 'Food ', '', 'food-blogs.jpg'),
(8, 'Fashion ', '', 'fashion-blog.jpg'),
(9, 'Music', 'Every one like Song', 'music-blogs.jpg'),
(11, 'Politics', '', 'politics.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `disliked`
--

CREATE TABLE `disliked` (
  `did` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `liked`
--

CREATE TABLE `liked` (
  `lid` int(12) NOT NULL,
  `pid` int(12) NOT NULL,
  `uid` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `liked`
--

INSERT INTO `liked` (`lid`, `pid`, `uid`) VALUES
(3, 22, 21),
(5, 25, 21),
(6, 20, 21);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(12) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `cid` int(12) NOT NULL,
  `userId` int(12) NOT NULL,
  `pDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `image`, `cid`, `userId`, `pDate`) VALUES
(17, 'Fashion ', 'Fashion blogs are one of the most popular types of blogs on the internet. It???s a big industry with a huge global audience. Fashion bloggers get invited to major events, receive special perks, merchandise, and even business deals by top fashion brands.', 'fashion-blog.jpg', 8, 9, '2021-03-18 05:27:41'),
(18, 'Food Blog', 'Food blogs are another popular blog type. It attracts a lot of readers who are interested in recipes, ingredients, healthy eating, fine dining, and other food related stories.\r\nMany food bloggers just start with something as simple as their local restaurant reviews. However, as their blog grows so does their interests and target audience.', 'food-blogs.jpg', 7, 9, '2021-03-18 05:28:54'),
(19, 'Music Blogs', 'Music blogs has a wide audience who search for critiques on the best and trending music. Music lovers enjoy songs from different languages, cultures and norms.', 'music-blogs.jpg', 9, 9, '2021-03-18 05:30:47'),
(20, 'Lifestyle Blogs', 'Lifestyle blogs are the most popular type of blogs you can find online. They have a variety of readers, interested in topics ranging from culture, arts, local news, and politics. This gives the blogger a wide range of topics to cover, making it easier to plan their content strategy.', 'lifestyle-blogs.jpg', 3, 9, '2021-03-18 05:31:45'),
(21, 'Fitness Blogs', 'Fitness blogs has been a hot trend since they cover important topics like health and general fitness. People all over the world rely on the internet to seek advice on how to stay fit. It???s a great opportunity for fitness instructors to start a fitness blog and get clients online.', 'fitness-blog.jpg', 5, 9, '2021-03-18 05:32:29'),
(22, 'DIY Blogs', 'DIY blogs are very interesting and have a huge audience. It has multiple sub-types like arts and crafts, construction, wood-work, metal-work and more.\r\nThese interesting DIY activities would encourage visitors to try new stuff and share it with the trainer/blogger. DIY blogs may involve a lot of communication which is great for blogging.', 'diy-blogs.jpg', 1, 9, '2021-03-18 05:33:30'),
(23, 'Sports Blogs', 'Sports blogs are another interesting type of blogs online. Every country in the world has different sports and every sport has its own stars. Sports blogging may also include bloggers who are writing paid content for teams, athletes, and other organizations.', 'sports-blogs.jpg', 6, 9, '2021-03-18 05:34:38'),
(24, 'What is DIY', 'When it comes to DIY (Do It Yourself) there are a lot of blogs at our disposal with many unique ideas. DIY as the name says it encourages one to use their own hands and handcraft them.', 'diy-blog.jpg', 4, 9, '2021-03-18 05:41:59'),
(25, 'phone tapping ???admission??? by Gehlot govt tests Sachin Pilot???s patience ', 'As another political crisis takes shape in Rajasthan, Congress insiders say it is unlikely that Sonia, Rahul or Priyanka Gandhi will act ???decisively??? when electioneering is in full swing in poll-bound states. All eyes are now on Sachin Pilot. \r\nThe Rajasthan phone tapping case has renewed Sachin Pilot camp???s demand for the removal of Chief Minister Ashok Gehlot. This time around, the Sachin Pilot camp is armed with past precedence belonging to the Rajiv Gandhi legacy.', 'news1.jpg', 11, 9, '2021-03-18 08:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(500) NOT NULL DEFAULT 'default.png',
  `about` text NOT NULL DEFAULT 'I Am New User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `gender`, `rdate`, `profile`, `about`) VALUES
(1, 'pankaj', 'pankaj@gmail.com', '8isd', 'male', '2021-03-10 15:01:50', 'default.jpg', 'I Am New User'),
(4, 'Ravi', 'Ravi@gmail.com', 'klllk', 'male', '2021-03-13 10:05:40', 'default.jpg', 'I Am New User'),
(5, 'Shivani', 'shivani@gmail.com', 'fsfsd', 'female', '2021-03-13 10:17:22', 'default.jpg', 'I Am New User'),
(6, 'Gopal', 'gopal@gmail.com', 'dfsdf', 'male', '2021-03-13 10:23:10', 'default.jpg', 'I Am New User'),
(8, 'Rahul', 'rahul@gmail.com', 'rahul', 'male', '2021-03-13 16:06:15', 'default.jpg', 'I Am New User'),
(9, 'Pankaj Rathor', 'abc@gmail.com', 'abc', 'male', '2021-03-13 17:32:33', 'WhatsApp-Image-2021-03-16-at-5.37.52-PM.jpeg', 'I Am New User'),
(10, 'Pavan Rathor', 'pavan@gmail.com', 'pavan', 'male', '2021-03-14 06:49:50', 'IMG_20190823_174946718.jpg', 'I\'m legend'),
(11, 'Vikas Jat', 'vikas@gmail.com', 'ram', 'male', '2021-03-14 08:55:42', '', 'I am Vikas.'),
(12, 'Kali Rathor', 'kali@gmail.com', 'kali', 'female', '2021-03-14 09:07:43', 'IMG_20180401_183427.jpg', 'I am kali.'),
(20, 'Pankaj Rathor', 'prathor9669@gmail.com', 'vikas', 'Male', '2021-03-15 11:51:14', 'IMG-20180602-WA0043.jpg', ''),
(21, 'Pankaj Rathor', 'pankajrathore9424@gmail.com', '8827', 'Male', '2021-03-30 10:44:45', 'default.png', 'I\'m New User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloginfo`
--
ALTER TABLE `bloginfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `cName` (`cName`);

--
-- Indexes for table `disliked`
--
ALTER TABLE `disliked`
  ADD PRIMARY KEY (`did`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `liked`
--
ALTER TABLE `liked`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `liked_ibfk_1` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloginfo`
--
ALTER TABLE `bloginfo`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `disliked`
--
ALTER TABLE `disliked`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `liked`
--
ALTER TABLE `liked`
  MODIFY `lid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disliked`
--
ALTER TABLE `disliked`
  ADD CONSTRAINT `disliked_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disliked_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- Constraints for table `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
