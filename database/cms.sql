-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2022 at 10:00 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(200) NOT NULL,
  `link` text NOT NULL,
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '1=content, 2= list-page',
  `order_by` int(30) NOT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `link`, `type`, `order_by`, `is_root`, `parent_id`, `date_created`) VALUES
(6, 'UNI-Newsletter', 'index.php?page=list&c=uni-newsletter&cid=1679091c5a880faf6fb5e6087eb1b2dc', 1, 0, 1, 0, '2022-09-19 23:15:49'),
(7, 'FAQs', 'index.php?page=list&c=faqs&cid=8f14e45fceea167a5a36dedd4bea2543', 1, 2, 1, 0, '2022-09-19 23:16:20'),
(8, 'Projects', 'index.php?page=list&c=projects&cid=c9f0f895fb98ab9159f51fd0297e236d', 1, 1, 1, 0, '2022-09-19 23:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `content_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(30) NOT NULL,
  `title` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `author_id` int(30) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `link` text NOT NULL,
  `banner_img` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `title`, `category_id`, `author_id`, `meta_keywords`, `meta_description`, `link`, `banner_img`, `date_created`, `date_modified`) VALUES
(4, 'Sample Project', 8, 1, 'sample,project', 'This is a sample project. It is a project developed by Dominique Michael. Follow the link to download the source code.', '4_Sample-Project.html', '', '2022-09-19 23:43:55', '2022-09-19 23:43:55'),
(5, 'Project cms', 8, 1, 'project, two', 'Lets create a knowledgeable institution.Come on, join me and lets publish', '5_Project-cms.html', '1663620540_1607603820_1605604020_123065338-creative-dark-coding-background-with-text-programming-and-future-concept-3d-rendering.jpg', '2022-09-19 23:49:53', '2022-09-19 23:49:53'),
(6, 'The Mirror', 6, 1, 'mirror', 'Campus CornerGet to know what&#039;s trending with the university mirror.', '6_The-Mirror.html', '1663620960_1607579460_47446233-clean-noir-et-gradient-sombre-image-de-fond-abstrait-.jpg', '2022-09-19 23:56:59', '2022-09-19 23:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `banner_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `banner_img`) VALUES
(1, 'Content Management System', 'dominiquebakari64@gmail.com', '+254704461090', '2030  Kabianga, Kericho, Kenya, 20100', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` int(1) NOT NULL DEFAULT 3 COMMENT '1=admin,2=author3=subscriber',
  `avatar` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, '1607590140_avatar.jpg', '2022-11-18 10:57:04'),
(2, 'John', 'Smith', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 3, 'no-image-available.png', '2022-11-18 22:25:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
