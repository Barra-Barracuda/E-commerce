-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2016-09-09 14:01:09
-- 服务器版本： 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chika_store`
--

-- --------------------------------------------------------

--
-- 表的结构 `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Sony'),
(5, 'LG'),
(6, 'Cloth Brand'),
(7, 'IKEA');

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) NOT NULL,
  `product_title` varchar(300) NOT NULL,
  `product_image` text NOT NULL,
  `qty` int(100) NOT NULL,
  `price` int(100) NOT NULL,
  `total_amount` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Ladies Wear'),
(3, 'mens Wears'),
(4, 'Kids Wear'),
(5, 'Furnitures'),
(6, 'Home Appliances'),
(7, 'Mobile Phone'),
(1, 'Electronics');

-- --------------------------------------------------------

--
-- 表的结构 `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(300) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 7, 2, 'Samsung Dous 2', 5000, 'Samsung Dous 2 sgh', 'samsung mobile.jpg', 'samsung mobile electronics'),
(2, 7, 3, 'iPhone 5s', 25000, 'iphone 5s', 'iphone mobile.jpg', 'mobile iphone apple'),
(3, 1, 3, 'iPad', 30000, 'ipad apple brand', 'ipad.jpg', 'apple ipad tablet'),
(4, 7, 3, 'iPhone 6s', 32000, 'Apple iPhone', 'iphone 6s.jpg', 'iphone apple mobile'),
(5, 1, 2, 'iPad 2', 10000, 'samsung ipad', 'ipad 2.jpg', 'ipad tablet samsung'),
(6, 1, 1, 'Hp Laptop series', 35000, 'Hp Red and Black combination Laptop', 'hp.jpg', 'hp laptop'),
(7, 1, 1, 'Laptop Pavillion', 50000, 'Laptop Hp Pavillion', 'Laptop Pavillion.jpg', 'Laptop Hp Pavillion'),
(8, 7, 4, 'Sony', 40000, 'Sony Mobile', 'sony mobile.jpg', 'sony mobile'),
(9, 7, 3, 'iPhone New', 12000, 'iphone', 'white iphone.jpg', 'iphone apple mobile'),
(10, 2, 6, 'Red Ladies dress', 1000, 'red dress for girls', 'red dress.jpg', 'red dress'),
(11, 2, 6, 'Blue Heave dress', 1200, 'Blue dress', 'blue dress.jpg', 'blue dress cloths'),
(12, 2, 6, 'Ladies Casual Cloths', 1500, 'ladies casual summer two colors pleted', 'casual cloths.jpg', 'girl dress cloths casual'),
(13, 2, 6, 'SpringAutumnDress', 1200, 'girls dress', 'SpringAutumnDress.jpg', 'girl dress'),
(14, 2, 6, 'Casual Dress', 1400, 'girl dress', 'girl dress1.jpg', 'girl dress'),
(15, 3, 6, 'Formal Look', 1500, 'girl dress', 'Formal Look.jpg', 'Formal Look'),
(16, 2, 6, 'ladies wear', 1000, 'ladies wear dress', 'ladies wear.jpg', 'ladies wear'),
(17, 3, 6, 'party wear dress', 1500, 'Awesome men\'s party wear dress', 'party wear dress.jpg', 'Awesome men\'s party wear dress'),
(18, 3, 6, 'best menswear', 2000, 'best menswear Melbourne Australia', 'best menswear Melbourne Australia.jpg', 'best menswear Melbourne Australia'),
(19, 3, 6, 'Men Knitted Wear', 1500, 'Men Knitted Wear', 'Men Knitted Wear.jpg', 'Men Knitted Wear'),
(20, 3, 6, 'Men\'s Blazers & Sports Coats', 1200, 'Men\'s Blazers & Sports Coats', 'Sports Coats.jpg', 'Men\'s Blazers & Sports Coats'),
(21, 3, 6, 'western mens wear brocade', 3000, 'Staggering cream indo western mens wear brocade', 'western mens wear brocade.jpg', 'Staggering cream indo western mens wear brocade'),
(22, 4, 6, 'cute Girls long sleeve cotton Dresses', 800, 'cute Girls long sleeve cotton Dresses', 'cute Girls long sleeve cotton Dresses.jpg', 'cute Girls long sleeve cotton Dresses'),
(23, 4, 6, 'Designer Dresses For Kids', 1000, 'Designer Dresses For Kids', 'Designer Dresses For Kids.jpg', 'Designer Dresses For Kids'),
(24, 4, 6, 'little girl long sleeve dresses', 1400, 'little girl long sleeve dresses', 'little girl long sleeve dresses.jpg', 'little girl long sleeve dresses'),
(25, 5, 7, 'Sweet wooden furniture', 10000, 'Sweet wooden furniture', 'Sweet wooden furniture.jpg', 'Sweet wooden furniture');

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(300) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(2, 'demo', 'demo', 'demo@qq.com', 'biscuits', '15915855255', 'ssdf', 'sdfsdfasf'),
(3, 'De', 'DEe', '123@qq.com', '73edd2d3e7e7069d1f131cf80317314d', '15915855255', 'sdfsdfsdf', 'sdfsdf'),
(4, 'DE', 'DE', '243@qq.com', 'e807f1fcf82d132f9bb018ca6738a19f', '13545555555', '123123', '456456'),
(5, 'De', 'Dee', 'sdf@qq.com', 'e807f1fcf82d132f9bb018ca6738a19f', '15356464877', '12345646', '45645646456'),
(6, 'ABC', 'ABC', 'abc@qq.com', '73edd2d3e7e7069d1f131cf80317314d', '15915855255', 'fsdfasf', 'sdasdfasdfsdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
