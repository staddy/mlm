-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2016 at 09:49 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mlm`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliateuser`
--

DROP TABLE IF EXISTS `affiliateuser`;
CREATE TABLE `affiliateuser` (
  `Id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `referedby` varchar(15) NOT NULL DEFAULT 'none',
  `ref_h` varchar(4) NOT NULL DEFAULT 'none',
  `ref_side` varchar(5) NOT NULL DEFAULT 'none',
  `ipaddress` int(10) UNSIGNED NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `active` int(11) NOT NULL,
  `doj` date NOT NULL,
  `country` text NOT NULL,
  `tamount` double NOT NULL DEFAULT '0',
  `payment` varchar(10) NOT NULL,
  `signupcode` text NOT NULL,
  `level` int(1) NOT NULL DEFAULT '2',
  `pcktaken` int(10) NOT NULL DEFAULT '0',
  `launch` int(1) NOT NULL DEFAULT '0',
  `expiry` date NOT NULL DEFAULT '2199-12-31',
  `bankname` varchar(250) NOT NULL DEFAULT 'Not Available',
  `accountname` varchar(250) NOT NULL DEFAULT 'Not Available',
  `accountno` double NOT NULL DEFAULT '0',
  `accounttype` int(11) NOT NULL DEFAULT '0',
  `ifsccode` varchar(100) NOT NULL DEFAULT 'Not Available',
  `getpayment` int(11) NOT NULL DEFAULT '1',
  `renew` int(1) NOT NULL DEFAULT '0',
  `h_balance` int(10) NOT NULL DEFAULT '0',
  `real_balance` int(10) NOT NULL DEFAULT '0',
  `h1_left` varchar(15) NOT NULL DEFAULT 'none',
  `h1_right` varchar(15) NOT NULL DEFAULT 'none',
  `h2_left` varchar(15) NOT NULL DEFAULT 'none',
  `h2_right` varchar(15) NOT NULL DEFAULT 'none',
  `h3_left` varchar(15) NOT NULL DEFAULT 'none',
  `h3_right` varchar(15) NOT NULL DEFAULT 'none',
  `h1_active` int(11) NOT NULL DEFAULT '0',
  `h2_active` int(11) NOT NULL DEFAULT '0',
  `h3_active` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `affiliateuser`
--

INSERT INTO `affiliateuser` (`Id`, `username`, `password`, `fname`, `address`, `email`, `referedby`, `ref_h`, `ref_side`, `ipaddress`, `mobile`, `active`, `doj`, `country`, `tamount`, `payment`, `signupcode`, `level`, `pcktaken`, `launch`, `expiry`, `bankname`, `accountname`, `accountno`, `accounttype`, `ifsccode`, `getpayment`, `renew`, `h_balance`, `real_balance`, `h1_left`, `h1_right`, `h2_left`, `h2_right`, `h3_left`, `h3_right`, `h1_active`, `h2_active`, `h3_active`) VALUES
(85, 'adminadmin', '123123123', 'Full Admin Name', 'Address OF Company Or Individual', 'EmailofAdmin@Domain.com', 'none', 'none', 'none', 0, 0, 1, '0000-00-00', 'Country', 1265, '', '0', 1, 1, 0, '0000-00-00', 'Not Available', 'Not Available', 0, 0, 'Not Available', 1, 0, 0, 0, 'Sumitsinghal', 'tkekeketkekeke', 'none', 'none', 'none', 'none', 1, 0, 0),
(86, 'Sumitsinghal', '123456789', 'sumit singhal', 'France Address', 'singhal.techie@gmail.com', 'adminadmin', 'h1', 'left', 0, 9999999999, 1, '2015-09-19', 'India', 0, '', '1284892893', 2, 17, 0, '2018-06-14', 'Not Available', 'Not Available', 0, 0, 'Not Available', 1, 1, 0, 0, 'flupkeflupke', 'totototot', 'none', 'none', 'none', 'none', 1, 0, 0),
(87, 'flupkeflupke', '$2y$10$1gyRrrMDA8zl1yME33m2teT0GqAOxFmZcDzUqYBtkN7T8VUezWTAG', 'flupkeflupke', 'flupkeflupke', 'flupkeflupke@mail.ru', 'Sumitsinghal', 'h1', 'left', 0, 999999999, 1, '2016-09-03', 'Andorra', 0, '', '1326531913', 3, 17, 0, '2019-05-30', 'Not Available', 'Not Available', 0, 0, 'Not Available', 1, 0, 0, 0, 'ssssssss', 'none', 'none', 'none', 'none', 'none', 1, 0, 0),
(88, 'totototot', '$2y$10$1ZdZmLUDEqX37C7/Rpqt0u1JZuA9f4Gw68kUTVSh2ilpCeVYYUJzK', 'totototot', 'totototot', 'totototot@mail.ru', 'Sumitsinghal', 'h1', 'right', 0, 2222222, 1, '2016-09-03', 'Austria', 0, '', '1118355059', 3, 17, 0, '2019-05-30', 'Not Available', 'Not Available', 0, 0, 'Not Available', 1, 0, 0, 0, 'none', 'none', 'none', 'none', 'none', 'none', 1, 0, 0),
(89, 'tkekeketkekeke', '$2y$10$LXFGLISV2iEPdjiDuWFz5.FtDkVzQkusqNU94jrDCi.ou3Zy3.u2.', 'tkekeke', 'tkekeke', 'tkekeke@aa.com', 'adminadmin', 'h1', 'right', 0, 9163578960, 1, '2016-09-03', 'Belarus', 0, '', '1111476045', 2, 17, 0, '2019-05-30', 'Not Available', 'Not Available', 0, 0, 'Not Available', 1, 0, 0, 0, 'none', 'none', 'none', 'none', 'none', 'none', 1, 0, 0),
(90, 'ssssssss', '$2y$10$6vqNlLF7AQ73W00WvHJoxOUtzOABWwXs3MeQSBG7jySc09BG06dB6', 'ssssssss', 'ssssssss', 'ssssssss@aol.com', 'flupkeflupke', 'h1', 'left', 0, 123, 1, '2016-09-03', 'Bahrain', 0, '', '1204123777', 4, 17, 0, '2019-05-30', 'Not Available', 'Not Available', 0, 0, 'Not Available', 1, 0, 0, 0, 'none', 'none', 'none', 'none', 'none', 'none', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `bannerid` double NOT NULL,
  `bannerdesc` varchar(100) NOT NULL,
  `bannerhtml` text NOT NULL,
  `banneractive` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `code` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `comment`) VALUES
(1, 'US Dollar', 'USD', ''),
(2, 'Australian Dollar', 'AUD', ''),
(3, 'Brazilian Real', 'BRL', ''),
(4, 'Canadian Dollar', 'CAD', ''),
(5, 'Czech Koruna', 'CZK', ''),
(6, 'Danish Krone', 'DKK', ''),
(7, 'Euro', 'EUR', ''),
(8, 'Thai Baht', 'THB', ''),
(9, 'Hong Kong Dollar', 'HKD', ''),
(10, 'Hungarian Forint', 'HUF', ''),
(11, 'Israeli New Sheqel', 'ILS', ''),
(12, 'Japanese Yen', 'JPY', ''),
(13, 'Malaysian Ringgit', 'MYR', ''),
(14, 'Mexican Peso', 'MXN', ''),
(15, 'Norwegian Krone', 'NOK', ''),
(16, 'New Zealand Dollar', 'NZD', ''),
(17, 'Philippine Peso', 'PHP', ''),
(18, 'Polish Zloty ', 'PLN', ''),
(19, 'Pound Sterling', 'GBP', ''),
(20, 'Russian Ruble', 'RUB', ''),
(21, 'Singapore Dollar', 'SGD', ''),
(22, 'Swedish Krona', 'SEK', ''),
(23, 'Swiss Franc', 'CHF', ''),
(24, 'Taiwan New Dollar', 'TWD', ''),
(26, 'Turkish Lira', 'TRY', '');

-- --------------------------------------------------------

--
-- Table structure for table `emailtext`
--

DROP TABLE IF EXISTS `emailtext`;
CREATE TABLE `emailtext` (
  `id` int(6) NOT NULL,
  `code` varchar(50) NOT NULL,
  `etext` text NOT NULL,
  `emailactive` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emailtext`
--

INSERT INTO `emailtext` (`id`, `code`, `etext`, `emailactive`) VALUES
(1, 'SIGNUP', 'This email is the confirmation for your order you have just signed up. Thank you for your interest. Our team welcomes you to our website. \n\nRegards\nTeam Skyey Technologies', 1),
(2, 'FORGOTPASSWORD', 'Hi, \nYou have requested a password on our website and therefore we have sent the password on this email. If you haven''t do it please ignore the email.\n\nRegards\nTeam Skyey Technologies', 1),
(5, 'NEWMEMBER', 'You have got new order, bingo!', 1),
(6, 'NEWMEMBER', 'You have got new order, bingo!', 1),
(7, 'SIGNUP', 'This email is the confirmation for your order you have just signed up. Thank you for your interest. Our team welcomes you to our website. \r\n\r\nRegards\r\nTeam Skyey Technologies', 1),
(8, 'NEWMEMBER', 'You have got new order, bingo!', 1),
(9, 'SIGNUP', 'This email is the confirmation for your order you have just signed up. Thank you for your interest. Our team welcomes you to our website. \r\n\r\nRegards\r\nTeam Skyey Technologies', 1),
(10, 'NEWMEMBER', 'You have got new order, bingo!', 1),
(11, 'SIGNUP', 'This email is the confirmation for your order you have just signed up. Thank you for your interest. Our team welcomes you to our website. \r\n\r\nRegards\r\nTeam Skyey Technologies', 1);

-- --------------------------------------------------------

--
-- Table structure for table `levellimits`
--

DROP TABLE IF EXISTS `levellimits`;
CREATE TABLE `levellimits` (
  `level` int(11) NOT NULL,
  `limit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levellimits`
--

INSERT INTO `levellimits` (`level`, `limit`) VALUES
(1, 1000),
(2, 2000),
(3, 4000),
(4, 8000),
(5, 16000),
(6, 32000),
(7, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `posteddate` date NOT NULL,
  `valid` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `currency` text NOT NULL,
  `details` text NOT NULL,
  `tax` double NOT NULL DEFAULT '0',
  `mpay` double NOT NULL DEFAULT '0',
  `sbonus` double DEFAULT '0',
  `cdate` date NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `level1` double NOT NULL DEFAULT '0',
  `level2` double NOT NULL DEFAULT '0',
  `level3` double NOT NULL DEFAULT '0',
  `level4` double NOT NULL DEFAULT '0',
  `level5` double NOT NULL DEFAULT '0',
  `level6` double NOT NULL DEFAULT '0',
  `level7` double NOT NULL DEFAULT '0',
  `level8` double NOT NULL DEFAULT '0',
  `level9` double NOT NULL DEFAULT '0',
  `level10` double NOT NULL DEFAULT '0',
  `level11` double NOT NULL DEFAULT '0',
  `level12` double NOT NULL DEFAULT '0',
  `level13` double NOT NULL DEFAULT '0',
  `level14` double NOT NULL DEFAULT '0',
  `level15` double NOT NULL DEFAULT '0',
  `level16` double NOT NULL DEFAULT '0',
  `level17` double NOT NULL DEFAULT '0',
  `level18` double NOT NULL DEFAULT '0',
  `level19` double NOT NULL DEFAULT '0',
  `level20` double NOT NULL DEFAULT '0',
  `gateway` int(1) NOT NULL DEFAULT '3',
  `validity` int(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `price`, `currency`, `details`, `tax`, `mpay`, `sbonus`, `cdate`, `active`, `level1`, `level2`, `level3`, `level4`, `level5`, `level6`, `level7`, `level8`, `level9`, `level10`, `level11`, `level12`, `level13`, `level14`, `level15`, `level16`, `level17`, `level18`, `level19`, `level20`, `gateway`, `validity`) VALUES
(17, 'Trial', 5, 'USD', 'Trial Package', 0, 50, 1, '2015-09-19', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 999);

-- --------------------------------------------------------

--
-- Table structure for table `paymentgateway`
--

DROP TABLE IF EXISTS `paymentgateway`;
CREATE TABLE `paymentgateway` (
  `id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymentgateway`
--

INSERT INTO `paymentgateway` (`id`, `Name`, `status`, `comment`, `date`) VALUES
(1, 'PayPal', 0, 0, '0000-00-00'),
(2, 'Cash On Delivery', 0, 0, '0000-00-00'),
(3, 'Payza', 0, 0, '0000-00-00'),
(4, 'SolidTrustPay', 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(6) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `payment_amount` double NOT NULL DEFAULT '0',
  `payment_status` int(1) NOT NULL DEFAULT '0',
  `itemid` varchar(25) NOT NULL,
  `createdtime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
CREATE TABLE `balance` (
  `Id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `sourceid` int(11) NOT NULL,
  `h_number` varchar(2) NOT NULL,
  `side` varchar(6) NOT NULL,
  `payment_amount` double NOT NULL DEFAULT '0',
  `accounted` tinyint(1) NOT NULL,
  `createdtime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`Id`, `userid`, `sourceid`, `h_number`, `side`, `payment_amount`, `accounted`, `createdtime`) VALUES
(1, 85, 89, 'h1', 'right', 120, 0, '2016-09-03 00:00:00'),
(2, 85, 86, 'h1', 'left', 120, 0, '2016-09-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `paypalpayments`
--

DROP TABLE IF EXISTS `paypalpayments`;
CREATE TABLE `paypalpayments` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `transacid` text NOT NULL,
  `price` double DEFAULT '0',
  `currency` text NOT NULL,
  `date` date NOT NULL,
  `cod` int(1) NOT NULL DEFAULT '0',
  `renew` int(1) NOT NULL DEFAULT '0',
  `renacid` int(9) NOT NULL COMMENT 'Package choosen at renew time, id of package',
  `pckid` double NOT NULL,
  `gateway` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paypalpayments`
--

INSERT INTO `paypalpayments` (`id`, `orderid`, `transacid`, `price`, `currency`, `date`, `cod`, `renew`, `renacid`, `pckid`, `gateway`) VALUES
(55, 86, 'C.O.D', 0, '', '2015-09-22', 1, 0, 0, 0, ''),
(56, 86, 'C.O.D', 0, '', '2015-09-22', 1, 0, 0, 0, ''),
(57, 86, 'C.O.D', 0, '', '2015-09-22', 1, 0, 0, 0, ''),
(58, 86, 'C.O.D', 0, '', '2015-09-22', 1, 0, 0, 0, ''),
(59, 86, 'C.O.D', 5, 'USD', '2015-09-22', 1, 0, 0, 0, ''),
(60, 86, 'C.O.D', 5, 'USD', '2015-09-22', 1, 0, 0, 0, ''),
(61, 86, 'C.O.D', 5, 'USD', '2015-09-22', 1, 0, 0, 17, 'C.O.D'),
(62, 86, 'C.O.D', 5, 'USD', '2015-09-22', 1, 0, 0, 17, 'C.O.D'),
(63, 86, 'C.O.D', 5, 'USD', '2015-09-22', 1, 0, 0, 17, 'C.O.D'),
(64, 86, 'C.O.D', 5, 'USD', '2015-09-22', 1, 0, 0, 17, 'C.O.D'),
(65, 86, 'C.O.D', 5, 'USD', '2015-09-22', 1, 0, 0, 17, 'C.O.D'),
(66, 86, 'C.O.D', 5, 'USD', '2015-09-22', 1, 1, 0, 0, ''),
(67, 86, 'C.O.D', 5, 'USD', '2015-09-23', 1, 1, 0, 0, ''),
(68, 86, 'C.O.D', 5, 'USD', '2015-09-23', 1, 1, 17, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `email` varchar(100) NOT NULL DEFAULT 'Enter Your E-Mail Address',
  `sno` int(9) NOT NULL,
  `wlink` varchar(100) NOT NULL DEFAULT 'www.yourwebsite.com',
  `invoicedetails` text NOT NULL,
  `coname` text NOT NULL,
  `fblink` text NOT NULL,
  `twitterlink` text NOT NULL,
  `paypalid` text NOT NULL,
  `maintain` int(1) NOT NULL DEFAULT '0',
  `alwdpayment` int(11) NOT NULL DEFAULT '0' COMMENT 'user will get payment via paypal or via payment in bank account.',
  `minmobile` double NOT NULL,
  `maxmobile` double NOT NULL,
  `footer` varchar(50) NOT NULL,
  `header` varchar(50) NOT NULL,
  `payzaid` varchar(128) NOT NULL DEFAULT 'Not Available',
  `solidtrustid` varchar(128) NOT NULL DEFAULT 'Not Available',
  `solidbutton` varchar(128) NOT NULL DEFAULT 'Not Available'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`email`, `sno`, `wlink`, `invoicedetails`, `coname`, `fblink`, `twitterlink`, `paypalid`, `maintain`, `alwdpayment`, `minmobile`, `maxmobile`, `footer`, `header`, `payzaid`, `solidtrustid`, `solidbutton`) VALUES
('admin@admin.com', 0, 'www.skyey.in', 'Paharganj, India', 'Skyey Technologies', 'https://fb.com/SkyeyIndia', 'https://twitter.com/SkyeyIndia', 'play4s-facilitator@yahoo.co.in', 0, 1, 0, 0, 'Powered By - Skyey Technlogies | Made With Love :)', 'Header', 'Payza', 'Solid', 'Button');

-- --------------------------------------------------------

--
-- Table structure for table `timeouts`
--

DROP TABLE IF EXISTS `timeouts`;
CREATE TABLE `timeouts` (
  `nrpaydays` int(11) NOT NULL,
  `nryearstodel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeouts`
--

INSERT INTO `timeouts` (`nrpaydays`, `nryearstodel`) VALUES
(0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `userlevels`
--

DROP TABLE IF EXISTS `userlevels`;
CREATE TABLE `userlevels` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `obtained` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlevels`
--

INSERT INTO `userlevels` (`id`, `userid`, `level`, `obtained`) VALUES
(1, 85, 1, 0),
(2, 85, 2, 0),
(3, 85, 3, 0),
(4, 86, 1, 0),
(5, 86, 2, 0),
(6, 87, 1, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `usersawaitingbonuses`
--
DROP VIEW IF EXISTS `usersawaitingbonuses`;
CREATE TABLE `usersawaitingbonuses` (
`userid` int(11)
,`ToAccount` double
);

-- --------------------------------------------------------

--
-- Structure for view `usersawaitingbonuses`
--
DROP TABLE IF EXISTS `usersawaitingbonuses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersawaitingbonuses`  AS  select `pb`.`userid` AS `userid`,sum(`pb`.`payment_amount`) AS `ToAccount` from `balance` `pb` where ((`pb`.`accounted` = '0') and ((select `ul`.`obtained` from `userlevels` `ul` where ((`ul`.`userid` = `pb`.`userid`) and (`ul`.`level` = ((select `afus`.`level` from `affiliateuser` `afus` where (`afus`.`Id` = `pb`.`sourceid`)) - (select `afus`.`level` from `affiliateuser` `afus` where (`afus`.`Id` = `pb`.`userid`)))))) < 1000000) and ((to_days(curtime()) - to_days(`pb`.`createdtime`)) >= (select `timeouts`.`nrpaydays` from `timeouts`))) group by `pb`.`userid` having ((select count(0) from `balance` where ((lcase(`balance`.`side`) like 'l%') and (`balance`.`userid` = `pb`.`userid`))) = (select count(0) from `balance` where ((lcase(`balance`.`side`) like 'r%') and (`balance`.`userid` = `pb`.`userid`)))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliateuser`
--
ALTER TABLE `affiliateuser`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `Id` (`Id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`bannerid`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `currency` ADD FULLTEXT KEY `code` (`code`);

--
-- Indexes for table `emailtext`
--
ALTER TABLE `emailtext`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levellimits`
--
ALTER TABLE `levellimits`
  ADD PRIMARY KEY (`level`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentgateway`
--
ALTER TABLE `paymentgateway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `paypalpayments`
--
ALTER TABLE `paypalpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `userlevels`
--
ALTER TABLE `userlevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level` (`level`),
  ADD KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliateuser`
--
ALTER TABLE `affiliateuser`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `bannerid` double NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `emailtext`
--
ALTER TABLE `emailtext`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `paymentgateway`
--
ALTER TABLE `paymentgateway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `paypalpayments`
--
ALTER TABLE `paypalpayments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `userlevels`
--
ALTER TABLE `userlevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `userlevels`
--
ALTER TABLE `userlevels`
  ADD CONSTRAINT `userlevels_ibfk_1` FOREIGN KEY (`level`) REFERENCES `levellimits` (`level`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
