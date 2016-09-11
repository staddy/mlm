--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
CREATE TABLE `balance_left_a` (
  `Id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `sourceid` int(11) NOT NULL,
  `h_number` varchar(2) NOT NULL,
  `side` varchar(6) NOT NULL,
  `type` varchar(1) NOT NULL,
  `payment_amount` double NOT NULL DEFAULT '0',
  `accounted` tinyint(1) NOT NULL,
  `createdtime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
-- я очистил таблицу, и эти добавил, чтобы удовлетворить поиску в usersawaitingbonuses
--

INSERT INTO `balance` (`Id`, `userid`, `sourceid`, `h_number`, `side`, `payment_amount`, `accounted`, `createdtime`) VALUES
(1, 85, 89, 'h1', 'right', 'a', 120, 0, '2016-09-03 00:00:00'),
(2, 85, 86, 'h1', 'left', 'b', 120, 0, '2016-09-03 00:00:00');
>>>>>>> 0e446b38206bc9094e824bf360d6186314bf522c

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
-- Таблица для статичных данных - таймаутов например
--

INSERT INTO `timeouts` (`nrpaydays`, `nryearstodel`) VALUES
(0, 2);


--
-- Table structure for table `levellimits`
-- Вот здесь полборка лимитов по каждому уровню (для 7+ лимит всегда 50, верно? 
-- так что это можно потом просто логически добавлять. типа if (level>7) then level:=7
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



--
-- Table structure for table `userlevels`
-- Таблица с уровнями всех пользователей - если у него есть хотя бы один человек на I-ом уровне, то заносится в таблицу
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





--
-- Structure for view `usersawaitingbonuses`
-- Вот эта штука в реальном времени постоянно прогоняет алгоритм отбора пользователей, которые должны что-то получить (суммирует все оплаты для человека)
-- Используется тот самый sql select, только немножко измененный
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
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliateuser`
--
ALTER TABLE `affiliateuser`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `balancer`
--
ALTER TABLE `balance`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `packages`
--

